import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';

class WarningConfirmationDialog extends StatefulWidget {
  final String title;
  final Widget content;
  final String secondaryButtonText;
  final String primaryButtonText;
  final VoidCallback onPrimaryButtonPressed;
  final VoidCallback onSecondaryButtonPressed;
  final bool isEmergency;
  final int countdownDuration;

  const WarningConfirmationDialog({
    super.key,
    required this.title,
    required this.content,
    required this.secondaryButtonText,
    required this.primaryButtonText,
    required this.onPrimaryButtonPressed,
    required this.onSecondaryButtonPressed,
    this.isEmergency = false,
    this.countdownDuration = 5,
  });

  @override
  State<WarningConfirmationDialog> createState() =>
      _WarningConfirmationDialogState();
}

class _WarningConfirmationDialogState extends State<WarningConfirmationDialog> {
  late bool isButtonDisabled;
  late int countdown;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    isButtonDisabled = widget.isEmergency;
    countdown = widget.countdownDuration;

    if (widget.isEmergency) {
      _startCountdown();
    }
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (countdown > 0) {
            countdown--;
          }
          if (countdown == 0) {
            isButtonDisabled = false;
            timer.cancel();
          }
        });
      }
    });
  }

  void _cancelCountdown() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      setState(() {
        isButtonDisabled = false;
        countdown = 0;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Giới hạn chiều rộng tối đa của nút primary
    final double screenWidth = MediaQuery.of(context).size.width;
    final double maxPrimaryWidth = screenWidth * 0.45;
    final double secondaryWidth =
        widget.isEmergency ? screenWidth * 0.25 : screenWidth * 0.3;
    final double primaryWidthBase =
        widget.isEmergency ? screenWidth * 0.38 : screenWidth * 0.32;
    final double primaryWidth =
        primaryWidthBase > maxPrimaryWidth ? maxPrimaryWidth : primaryWidthBase;

    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: Center(child: LinearIcons.warningAboutIcon),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            widget.content,
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: secondaryWidth,
                  child: GestureDetector(
                    onLongPress: widget.isEmergency ? _cancelCountdown : null,
                    child: OutlinedButton(
                      onPressed: widget.onSecondaryButtonPressed,
                      child: Text(widget.secondaryButtonText),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: primaryWidth,
                  child: FilledButton(
                    onPressed:
                        isButtonDisabled ? null : widget.onPrimaryButtonPressed,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: Text(
                        isButtonDisabled
                            ? '${widget.primaryButtonText} ($countdown)'
                            : widget.primaryButtonText,
                        key: ValueKey<int>(countdown),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Ví dụ sử dụng
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const WarningConfirmationDialog(
                    title: 'Xác nhận hành động',
                    content: Text('Bạn có chắc chắn muốn tiếp tục?'),
                    secondaryButtonText: 'Hủy',
                    primaryButtonText: 'Xác nhận',
                    onPrimaryButtonPressed: printConfirm,
                    onSecondaryButtonPressed: printCancel,
                    isEmergency: true,
                    countdownDuration: 5,
                  ),
                );
              },
              child: const Text('Hiển thị Dialog'),
            ),
          ),
        ),
      ),
    ),
  );
}

void printConfirm() => print('Xác nhận');
void printCancel() => print('Hủy');
