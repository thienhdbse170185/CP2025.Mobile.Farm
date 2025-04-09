import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_farm/src/core/common/widgets/warning_confirm_dialog.dart';

class QRScannerWidget extends StatefulWidget {
  final String title;
  final String instruction;
  final String helperText;
  final Function(String) onScanned;

  const QRScannerWidget({
    super.key,
    this.title = 'Quét mã QR',
    this.instruction = 'Đặt mã QR vào khung hình để quét',
    this.helperText = 'Mã QR được dán trên chuồng',
    required this.onScanned,
  });

  @override
  State<QRScannerWidget> createState() => _QRScannerWidgetState();
}

class _QRScannerWidgetState extends State<QRScannerWidget>
    with SingleTickerProviderStateMixin {
  MobileScannerController controller = MobileScannerController(
    facing: CameraFacing.back,
  );
  bool isScanning = true;
  bool isFlashOn = false;
  double _currentZoom = 0.0;
  static const int _totalSteps = 4; // 5 mức (0-4)
  late AnimationController _animationController;
  late Animation<double> _animation;
  late ScaffoldMessengerState scaffoldMessenger;
  bool isDialogVisible = false;

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation =
        Tween<double>(begin: -50.0, end: 50.0).animate(_animationController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    scaffoldMessenger = ScaffoldMessenger.of(context);
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isDenied) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cần cấp quyền truy cập camera để quét mã QR'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.pop(context);
      }
    } else if (status.isGranted) {
      return;
    }
  }

  Future<void> _onZoomChanged(double value) async {
    try {
      final zoomValue = value / _totalSteps; // Chuyển đổi từ 0-4 thành 0-1
      setState(() {
        _currentZoom = value;
      });
      log("Zoom level: ${value.toInt()}, Zoom value: ${zoomValue.toStringAsFixed(2)}");
      await controller.setZoomScale(zoomValue);
    } catch (e) {
      _showWarningDialog('Không thể điều chỉnh zoom');
    }
  }

  void resetScanner() {
    setState(() {
      isScanning = true;
    });
    controller.start();
  }

  void _retryScanning() {
    setState(() {
      isScanning = true;
      isDialogVisible = false;
    });
    controller.start();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  void _showWarningDialog(String message) {
    setState(() {
      isDialogVisible = true;
      isScanning = false;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return WarningConfirmationDialog(
          title: 'Lỗi',
          content: Text(
            message,
            textAlign: TextAlign.center,
          ),
          secondaryButtonText: 'Thoát',
          primaryButtonText: 'Thử lại',
          onPrimaryButtonPressed: () {
            Navigator.of(context).pop();
            _retryScanning();
          },
          onSecondaryButtonPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        );
      },
    ).then((_) {
      setState(() {
        isDialogVisible = false;
      });
    });
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      try {
        final BarcodeCapture? barcodes =
            await controller.analyzeImage(image.path);
        if (barcodes != null) {
          final String code = barcodes.barcodes.first.rawValue ?? '';
          if (code.isNotEmpty) {
            widget.onScanned(code);
          } else {
            _showWarningDialog('Không thể đọc mã QR từ ảnh');
          }
        } else {
          _showWarningDialog('Không tìm thấy mã QR trong ảnh');
        }
      } catch (e) {
        _showWarningDialog('Có lỗi xảy ra khi đọc ảnh');
      }
    }
  }

  @override
  void dispose() {
    scaffoldMessenger.hideCurrentSnackBar();
    _animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: (capture) async {
              if (!isScanning || isDialogVisible) return;
              try {
                final List<Barcode> barcodes = capture.barcodes;
                if (barcodes.isNotEmpty) {
                  setState(() {
                    isScanning = false;
                  });

                  await Future.delayed(const Duration(seconds: 1));
                  if (!mounted) return;

                  final String code = barcodes.first.rawValue ?? '';
                  if (code.isNotEmpty) {
                    widget.onScanned(code);
                  } else {
                    _showWarningDialog('Không thể đọc mã QR');
                    await Future.delayed(const Duration(seconds: 2));
                    if (mounted) {
                      setState(() {
                        isScanning = true;
                      });
                    }
                  }
                }
              } catch (e) {
                setState(() {
                  isScanning = false;
                });

                _showWarningDialog(
                    e.toString().replaceFirst('Exception: ', ''));
                await Future.delayed(const Duration(seconds: 2));
                if (mounted) {
                  setState(() {
                    isScanning = true;
                  });
                }
              }
            },
            errorBuilder: (context, error, child) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Theme.of(context).colorScheme.error,
                      size: 64,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Lỗi camera: ${error.errorCode}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Đóng'),
                    ),
                  ],
                ),
              );
            },
          ),

          // Scanning Animation
          if (!isScanning)
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Positioned(
                  top: MediaQuery.of(context).size.height * 0.3 +
                      _animation.value,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.8),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

          // Overlay Shape
          Container(
            decoration: ShapeDecoration(
              shape: QrScannerOverlayShape(
                borderColor: Theme.of(context).colorScheme.primary,
                borderRadius: 24,
                borderLength: 32,
                borderWidth: 4,
                cutOutSize: MediaQuery.of(context).size.width * 0.7,
                overlayColor: Colors.black.withOpacity(0.8),
                cutOutBottomOffset: 160,
              ),
            ),
          ),

          // Header
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Camera Controls
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 240,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Flash Control
                      IconButton(
                        icon: Icon(
                          isFlashOn ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                          size: 24,
                        ),
                        onPressed: () {
                          setState(() {
                            isFlashOn = !isFlashOn;
                            controller.toggleTorch();
                          });
                        },
                      ),
                      Container(
                        width: 1,
                        height: 24,
                        color: Colors.white.withOpacity(0.2),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      // Gallery Picker
                      IconButton(
                        icon: const Icon(
                          Icons.image,
                          color: Colors.white,
                          size: 24,
                        ),
                        onPressed: _pickImage,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom Instructions
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 40,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.qr_code_scanner,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.instruction,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.helperText,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Zoom Slider
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 120,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.zoom_out, color: Colors.white, size: 20),
                  Expanded(
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 2,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white.withOpacity(0.3),
                        thumbColor: Colors.white,
                        overlayColor: Colors.white.withOpacity(0.1),
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 6,
                        ),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 12,
                        ),
                        tickMarkShape: const RoundSliderTickMarkShape(),
                        activeTickMarkColor: Colors.white,
                        inactiveTickMarkColor: Colors.white.withOpacity(0.3),
                      ),
                      child: Slider(
                        value: _currentZoom,
                        min: 0,
                        max: _totalSteps.toDouble(),
                        divisions: _totalSteps,
                        onChanged: _onZoomChanged,
                      ),
                    ),
                  ),
                  const Icon(Icons.zoom_in, color: Colors.white, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QrScannerOverlayShape extends ShapeBorder {
  final Color borderColor;
  final double borderWidth;
  final Color overlayColor;
  final double borderRadius;
  final double borderLength;
  final double cutOutSize;
  final double cutOutBottomOffset;

  const QrScannerOverlayShape({
    this.borderColor = Colors.white,
    this.borderWidth = 4.0,
    this.overlayColor = const Color(0x88000000),
    this.borderRadius = 24,
    this.borderLength = 32,
    this.cutOutSize = 250,
    this.cutOutBottomOffset = 0,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path getLeftTopPath(Rect rect) {
      return Path()
        ..moveTo(rect.left, rect.bottom)
        ..lineTo(rect.left, rect.top)
        ..lineTo(rect.right, rect.top);
    }

    return getLeftTopPath(rect)
      ..lineTo(
        rect.right,
        rect.bottom,
      )
      ..lineTo(
        rect.left,
        rect.bottom,
      )
      ..lineTo(
        rect.left,
        rect.top,
      );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final borderOffset = borderWidth / 2;
    final scanBorderLength = borderLength;
    final scanCutOutSize = cutOutSize;
    final centerOffset = borderOffset * 2;
    final frame = Rect.fromCenter(
      center: rect.center.translate(0, -cutOutBottomOffset),
      width: scanCutOutSize + centerOffset,
      height: scanCutOutSize + centerOffset,
    );

    // Draw overlay
    final backgroundPaint = Paint()
      ..color = overlayColor
      ..style = PaintingStyle.fill;

    final backgroundPath = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(rect)
      ..addRRect(
        RRect.fromRectAndRadius(
          frame,
          Radius.circular(borderRadius),
        ),
      );

    canvas.drawPath(backgroundPath, backgroundPaint);

    // Draw border
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final borderPath = Path();

    // Top left corner
    borderPath
      ..moveTo(frame.left - borderOffset, frame.top + scanBorderLength)
      ..lineTo(frame.left - borderOffset, frame.top - borderOffset)
      ..lineTo(frame.left + scanBorderLength, frame.top - borderOffset);

    // Top right corner
    borderPath
      ..moveTo(frame.right - scanBorderLength, frame.top - borderOffset)
      ..lineTo(frame.right + borderOffset, frame.top - borderOffset)
      ..lineTo(frame.right + borderOffset, frame.top + scanBorderLength);

    // Bottom right corner
    borderPath
      ..moveTo(frame.right + borderOffset, frame.bottom - scanBorderLength)
      ..lineTo(frame.right + borderOffset, frame.bottom + borderOffset)
      ..lineTo(frame.right - borderOffset, frame.bottom + borderOffset);

    // Bottom left corner
    borderPath
      ..moveTo(frame.left + scanBorderLength, frame.bottom + borderOffset)
      ..lineTo(frame.left - borderOffset, frame.bottom + borderOffset)
      ..lineTo(frame.left - borderOffset, frame.bottom - scanBorderLength);

    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  ShapeBorder scale(double t) {
    return QrScannerOverlayShape(
      borderColor: borderColor,
      borderWidth: borderWidth,
      overlayColor: overlayColor,
    );
  }
}
