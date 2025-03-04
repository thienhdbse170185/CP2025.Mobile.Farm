import 'dart:developer';
import 'dart:io';

import 'package:data_layer/data_layer.dart';
import 'package:data_layer/model/request/symptom/create_symptom/create_symptom_request.dart';
import 'package:data_layer/model/request/symptom/symptom/get_symptom_request.dart';
import 'package:data_layer/model/response/medical_symptom/medical_symptom_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/core/utils/date_util.dart';
import 'package:smart_farm/src/view/symptom/cage_option.dart';
import 'package:smart_farm/src/view/widgets/adaptive_safe_area.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/view/widgets/processing_button_widget.dart';
import 'package:smart_farm/src/view/widgets/qr_scanner.dart'
    show QRScannerWidget;
import 'package:smart_farm/src/viewmodel/cage/cage_cubit.dart';
import 'package:smart_farm/src/viewmodel/farming_batch/farming_batch_cubit.dart';
import 'package:smart_farm/src/viewmodel/growth_stage/growth_stage_cubit.dart';
import 'package:smart_farm/src/viewmodel/healthy/healthy_cubit.dart';
import 'package:smart_farm/src/viewmodel/symptom/symptom_cubit.dart';
import 'package:smart_farm/src/viewmodel/time/time_bloc.dart';
import 'package:smart_farm/src/viewmodel/upload_image/upload_image_cubit.dart';

class CreateSymptomWidget extends StatefulWidget {
  final String cageName;
  const CreateSymptomWidget({super.key, required this.cageName});

  @override
  State<CreateSymptomWidget> createState() => _CreateSymptomWidgetState();
}

class _CreateSymptomWidgetState extends State<CreateSymptomWidget> {
  final TextEditingController _noteController = TextEditingController();
  final List<File> _images = [];
  final List<GetSymptomRequest> _enteredSymptoms = [];
  final List<String> _symptomsName = [];
  final TextEditingController _affectedController = TextEditingController();
  final TextEditingController _farmingBatchController = TextEditingController();
  final TextEditingController _searchSymptomController =
      TextEditingController();

  FarmingBatchDto? _farmingBatch;
  List<SymptomDto> _symptoms = [];
  List<CageOption> _cages = [];
  UploadImageDto? _uploadedImage;

  String? _selectedCage;
  int? _affectedQuantity;
  String? _selectedCageId;
  bool _isLoading = false;
  bool _isProcessing = false;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isScanning = false;

  bool get _isCageSelected => _selectedCage != null;
  bool get _hasFarmingBatch => _farmingBatch != null;
  bool get _hasSymptoms => _symptomsName.isNotEmpty;
  bool get _hasValidQuantity {
    final quantity = int.tryParse(_affectedController.text) ?? 0;
    return quantity > 0 &&
        (_farmingBatch == null || quantity <= _farmingBatch!.quantity);
  }

  bool get _isFormValid =>
      _isCageSelected && _hasFarmingBatch && _hasSymptoms && _hasValidQuantity;

  @override
  void initState() {
    super.initState();
    _affectedController.text = '0';
    _selectedCage = widget.cageName.isNotEmpty ? widget.cageName : null;
    _fetchCages();
    context.read<SymptomCubit>().getSymptoms();
  }

  void _fetchCages() async {
    context.read<CageCubit>().getCagesByUserId();
  }

  String get formattedDate {
    return DateFormat('EEEE, dd/MM/yyyy', 'vi').format(DateTime.now());
  }

  // Function to pick an image from the camera
  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  // Function to pick an image from the gallery
  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  void _submitForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận'),
          content: const Text(
              'Bạn có chắc chắn muốn tạo báo cáo triệu chứng này không?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context
                    .read<UploadImageCubit>()
                    .uploadImage(file: _images.first);
              },
              child: const Text('Xác nhận'),
            ),
          ],
        );
      },
    );
  }

  void _showCageSelectionSheet() {
    String searchQuery = '';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            List<CageOption> filterCages(List<CageOption> cages) {
              if (searchQuery.isEmpty) return cages;
              return cages
                  .where((cage) =>
                      cage.name
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase()) ||
                      cage.id.toLowerCase().contains(searchQuery.toLowerCase()))
                  .toList();
            }

            final filteredCages = filterCages(_cages);

            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  // Header
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              'Chọn chuồng báo cáo',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const Spacer(),
                            Text(
                              '${filteredCages.length} chuồng',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Tìm kiếm chuồng...',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                          ),
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  // Cage list
                  Expanded(
                    child: filteredCages.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.search_off,
                                    size: 64, color: Colors.grey[400]),
                                const SizedBox(height: 16),
                                Text(
                                  'Không tìm thấy chuồng phù hợp',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: filteredCages.length,
                            itemBuilder: (context, index) {
                              final cage = filteredCages[index];
                              final isSelected = _selectedCage == cage.name;

                              return Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(
                                    color: isSelected
                                        ? Theme.of(context).colorScheme.primary
                                        : Colors.grey[200]!,
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    context
                                        .read<FarmingBatchCubit>()
                                        .getFarmingBatchByCage(cage.id);
                                    setState(() {
                                      _selectedCage = cage.name;
                                      _selectedCageId = cage.id;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: LinearIcons.chickenIcon,
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cage.name,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              if (isSelected)
                                                Text(
                                                  'Đã chọn',
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        if (isSelected)
                                          Icon(
                                            Icons.check_circle,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showSymptomSelectionSheet() {
    String searchQuery = '';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            List<SymptomDto?> filterSymptoms(List<SymptomDto?> symptoms) {
              if (searchQuery.isEmpty) return [];
              return symptoms
                  .where((symptom) =>
                      symptom?.symptomName
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase()) ??
                      false)
                  .toList();
            }

            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Chọn triệu chứng',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              '${_symptomsName.length} đã chọn',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _searchSymptomController,
                          decoration: InputDecoration(
                            labelText: 'Tìm kiếm triệu chứng',
                            hintText: 'Khó thở, tiêu chảy,...',
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: searchQuery.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () {
                                      setState(() {
                                        searchQuery = '';
                                      });
                                      _searchSymptomController.clear();
                                    },
                                  )
                                : null,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                          ),
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                            });
                          },
                        ),
                        if (_symptomsName.isNotEmpty)
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16),
                                Text(
                                  'Đã chọn',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(color: Colors.grey.shade600),
                                ),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: _symptomsName.map((symptom) {
                                    return Chip(
                                      label: Text(symptom),
                                      deleteIcon:
                                          const Icon(Icons.close, size: 16),
                                      onDeleted: () {
                                        setState(() {
                                          _symptomsName.remove(symptom);
                                          _enteredSymptoms.removeWhere((s) =>
                                              _symptoms
                                                  .firstWhere((sym) =>
                                                      sym.symptomName ==
                                                      symptom)
                                                  .id ==
                                              s.symptomId);
                                        });
                                      },
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (searchQuery.isEmpty)
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.search,
                                          size: 64, color: Colors.grey[400]),
                                      const SizedBox(height: 16),
                                      Text(
                                        'Nhập từ khóa để tìm kiếm\ntriệu chứng',
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyle(color: Colors.grey[600]),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            else ...[
                              // Nhóm triệu chứng về hô hấp
                              _buildSymptomGroup(
                                'Triệu chứng hô hấp',
                                filterSymptoms([
                                  _findSymptom('Ho'),
                                  _findSymptom('Khó thở'),
                                  _findSymptom('Mũi chảy nước'),
                                ]),
                                setState,
                              ),

                              // Nhóm triệu chứng về tiêu hóa
                              _buildSymptomGroup(
                                'Triệu chứng tiêu hóa',
                                filterSymptoms([
                                  _findSymptom('Chán ăn'),
                                  _findSymptom('Tiêu chảy'),
                                  _findSymptom('Phân có màu trắng'),
                                  _findSymptom('Phân có màu xanh lá cây'),
                                ]),
                                setState,
                              ),

                              // Nhóm triệu chứng bên ngoài
                              _buildSymptomGroup(
                                'Triệu chứng bên ngoài',
                                filterSymptoms([
                                  _findSymptom('Lông rụng bất thường'),
                                  _findSymptom('Lông xù lên'),
                                  _findSymptom('Da chuyển màu tím'),
                                  _findSymptom('Sưng mặt'),
                                  _findSymptom('Mắt chảy nước'),
                                ]),
                                setState,
                              ),

                              // Nhóm triệu chứng về vận động
                              _buildSymptomGroup(
                                'Triệu chứng vận động',
                                filterSymptoms([
                                  _findSymptom('Co giật'),
                                  _findSymptom('Run cơ'),
                                  _findSymptom('Đầu lắc lư bất thường'),
                                  _findSymptom('Mệt mỏi hoặc lừ đừ'),
                                ]),
                                setState,
                              ),

                              // Nhóm triệu chứng khác
                              _buildSymptomGroup(
                                'Triệu chứng khác',
                                filterSymptoms([
                                  _findSymptom('Giảm cân'),
                                  _findSymptom('Sốt cao'),
                                  _findSymptom('Khát nước liên tục'),
                                  _findSymptom('Chảy máu nội tạng'),
                                ]),
                                setState,
                              ),

                              // Nhóm triệu chứng về sinh sản
                              _buildSymptomGroup(
                                'Triệu chứng sinh sản',
                                filterSymptoms([
                                  _findSymptom('Giảm năng suất đẻ trứng'),
                                  _findSymptom('Trứng vỏ mỏng hoặc biến dạng'),
                                ]),
                                setState,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, -1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Đóng'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              Navigator.pop(context);
                              this.setState(() {});
                            },
                            child: const Text('Xác nhận'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSymptomGroup(
      String title, List<SymptomDto?> symptoms, StateSetter setState) {
    symptoms = symptoms.where((s) => s != null).toList();

    if (symptoms.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: symptoms.map((symptom) {
                final isSelected = _symptomsName.contains(symptom!.symptomName);
                return FilterChip(
                  selected: isSelected,
                  label: Text(symptom.symptomName),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _symptomsName.add(symptom.symptomName);
                        _enteredSymptoms.add(GetSymptomRequest(
                          symptomId: symptom.id,
                          notes: _noteController.text,
                        ));
                      } else {
                        _symptomsName.remove(symptom.symptomName);
                        _enteredSymptoms
                            .removeWhere((s) => s.symptomId == symptom.id);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  SymptomDto? _findSymptom(String name) {
    try {
      return _symptoms.firstWhere((s) => s.symptomName == name);
    } catch (e) {
      return null;
    }
  }

  void _showQRScanner() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QRScannerWidget(
          title: 'Quét mã QR chuồng',
          instruction: 'Đặt mã QR vào khung hình để quét',
          helperText: 'Mã QR được dán trên chuồng',
          onScanned: (String qrCode) {
            log("QR Code: $qrCode");
            final cage = _cages.firstWhere(
              (cage) => cage.id == qrCode,
              orElse: () => CageOption(id: '', name: ''),
            );

            if (cage.id.isNotEmpty) {
              setState(() {
                _selectedCage = cage.name;
                _selectedCageId = cage.id;
              });
              context.read<FarmingBatchCubit>().getFarmingBatchByCage(cage.id);
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      Icon(Icons.error_outline, color: Colors.white),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                            'Không tìm thấy thông tin chuồng, hãy thử lại.'),
                      ),
                    ],
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Theme.of(context).colorScheme.error,
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height - 150,
                    left: 16,
                    right: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  dismissDirection: DismissDirection.horizontal,
                  action: SnackBarAction(
                    label: 'Đóng',
                    textColor: Colors.white,
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title,
      {bool isRequired = true, bool isCompleted = false}) {
    return Row(
      children: [
        if (isRequired)
          Icon(
            isCompleted ? Icons.check_circle : Icons.error_outline,
            color: isCompleted
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.error,
            size: 20,
          ),
        if (isRequired) const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!_isFormValid) ...[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Theme.of(context).colorScheme.error,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _getValidationMessage(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed:
                  _isProcessing ? null : (_isFormValid ? _submitForm : null),
              child: _isProcessing
                  ? ProcessingButtonWidget(loadingMessage: 'Đang xử lý...')
                  : const Text('Tạo báo cáo'),
            ),
          ),
        ],
      ),
    );
  }

  String _getValidationMessage() {
    if (!_isCageSelected) return 'Vui lòng chọn chuồng nuôi';
    if (!_hasFarmingBatch) return 'Không tìm thấy thông tin vụ nuôi';
    if (!_hasSymptoms) return 'Vui lòng chọn ít nhất một triệu chứng';
    if (!_hasValidQuantity) {
      if (int.tryParse(_affectedController.text) == 0) {
        return 'Vui lòng nhập số lượng con vật bị bệnh';
      }
      return 'Số lượng con vật bị bệnh không hợp lệ';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HealthyCubit, HealthyState>(
          listener: (context, state) {
            state.maybeWhen(
              createLoading: () {
                setState(() {
                  _isProcessing = true;
                });
              },
              createSuccess: (medicalSymptom) {
                setState(() {
                  _isProcessing = false;
                });
                log("Tạo báo cáo thành công");

                // Create MedicalSymptomDto from form data
                final symptom = MedicalSymptomResponse(
                  id: medicalSymptom.id, // Using cage name as temporary ID
                  farmingBatchId: medicalSymptom.farmingBatchId,
                  symtom: _symptomsName.join(', '),
                  status: medicalSymptom.status,
                  diagnosis: medicalSymptom.diagnosis,
                  nameAnimal: medicalSymptom.nameAnimal,
                  prescriptions: medicalSymptom.prescriptions,
                  affectedQuantity: medicalSymptom.affectedQuantity,
                  quantity: _farmingBatch?.quantity ?? 0,
                  notes: medicalSymptom.notes,
                  createAt: medicalSymptom.createAt,
                  pictures: medicalSymptom.pictures,
                  medicalSymptomDetails: medicalSymptom.medicalSymptomDetails,
                );

                // Navigate to success screen with created symptom
                context.go(RouteName.symptomSuccess, extra: {
                  'symptom': symptom,
                  'cageName': _selectedCage,
                });
              },
              createFailure: (error) {
                context
                    .read<UploadImageCubit>()
                    .deleteImage(id: _uploadedImage!.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error),
                  ),
                );
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<CageCubit, CageState>(
          listener: (context, state) {
            state.maybeWhen(
              loadByUserIdInProgress: () {
                log("Đang lấy thông tin chuồng...");
              },
              loadByUserIdSuccess: (cages) {
                setState(() {
                  _cages = cages
                      .map((cage) => CageOption(id: cage.id, name: cage.name))
                      .toList();
                });
              },
              loadByUserIdFailure: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Lỗi fetch chuồng: $error'),
                  ),
                );
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<FarmingBatchCubit, FarmingBatchState>(
          listener: (context, state) {
            state.maybeWhen(
              getFarmingBatchByCageInProgress: () {
                log("Đang lấy thông tin farming-batch...");
              },
              getFarmingBatchByCageSuccess: (farmingBatch) {
                log("Lấy thông tin farming-batch thành công");
                setState(() {
                  _farmingBatch = farmingBatch;
                  _farmingBatchController.text = farmingBatch.name;
                });
                context
                    .read<GrowthStageCubit>()
                    .getGrowthStageByCageId(_selectedCageId!);
              },
              getFarmingBatchByCageFailure: (error) {
                log("Lấy thông tin farming-batch thất bại: $error");
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<SymptomCubit, SymptomState>(
          listener: (context, state) {
            state.maybeWhen(
              getSymptomsInProgress: () {
                log("Đang lấy triệu chứng...");
              },
              getSymptomsSuccess: (symptoms) {
                log("Lấy triệu chứng thành công");
                setState(() {
                  _symptoms = symptoms;
                });
              },
              getSymptomsFailure: (error) {
                log("Lấy triệu chứng thất bại: $error");
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<GrowthStageCubit, GrowthStageState>(
            listener: (context, state) {
          state.maybeWhen(
            getGrowthStageByCageIdInProgress: () {
              log("Đang lấy thông tin growth-stage...");
            },
            getGrowthStageByCageIdSuccess: (growthStage) {
              log('Lấy thông tin growth-stage thành công');
              setState(() {
                _affectedQuantity =
                    _farmingBatch!.quantity - growthStage.affectQuantity;
              });
            },
            getGrowthStageByCageIdFailure: (error) {
              log('Lấy thông tin growth-stage thất bại: ${error.toString()}');
            },
            orElse: () {},
          );
        }),
        BlocListener<UploadImageCubit, UploadImageState>(
          listener: (context, state) {
            state.maybeWhen(
              uploadImageInProgress: () {
                setState(() {
                  _isProcessing = true;
                });
              },
              uploadImageSuccess: (imageDto) {
                setState(() {
                  _isProcessing = false;
                  _uploadedImage = imageDto;
                });
                final imagePath =
                    "https://imageservice.fjourney.site${imageDto.path}";
                final request = CreateSymptomRequest(
                  farmingBatchId: _farmingBatch?.id ?? '',
                  symptoms: _symptomsName.join(', '),
                  status: 'Pending',
                  affectedQuantity: int.parse(_affectedController.text),
                  notes: _noteController.text,
                  pictures: _images
                      .map((image) => PictureSymptom(
                            image: imagePath,
                            dateCaptured: TimeUtils.customNow(),
                          ))
                      .toList(),
                  medicalSymptomDetails: _enteredSymptoms,
                );

                context.read<HealthyCubit>().createSymptom(request);
              },
              uploadImageFailure: (error) {
                setState(() {
                  _isProcessing = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Lỗi upload ảnh: $error'),
                  ),
                );
              },
              deleteImageInProgress: () {
                setState(() {
                  _isProcessing = true;
                });
              },
              deleteImageSuccess: () {
                setState(() {
                  _isProcessing = false;
                });
              },
              deleteImageFailure: (error) {
                setState(() {
                  _isProcessing = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Lỗi xóa ảnh: $error'),
                  ),
                );
              },
              orElse: () {},
            );
          },
        )
      ],
      child: AdaptiveSafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: CustomAppBar(
            appBarHeight: 70,
            leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.arrow_back)),
            title: Column(children: [
              const Text('Tạo báo cáo triệu chứng'),
              Text(CustomDateUtils.formatDate(TimeUtils.customNow()),
                  style: Theme.of(context).textTheme.bodyMedium)
            ]),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Section 1: Cage Selection
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildSectionTitle(
                              'Thông tin cơ bản',
                              isCompleted: _isCageSelected && _hasFarmingBatch,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Material(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(12),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: _showQRScanner,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.qr_code_scanner,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Quét QR',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: _showCageSelectionSheet,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              LinearIcons.chickenIcon,
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Chuồng nuôi',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _selectedCage ?? 'Chọn chuồng báo cáo',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  size: 16, color: Colors.grey[600]),
                            ],
                          ),
                        ),
                      ),
                      if (_selectedCage == null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 16,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Bạn có thể quét mã QR trên chuồng để chọn nhanh',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (_farmingBatch != null) ...[
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.info_outline,
                                  color: Colors.blue[700], size: 20),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Vụ nuôi hiện tại',
                                      style: TextStyle(
                                        color: Colors.blue[700],
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _farmingBatch!.name,
                                      style: TextStyle(
                                        color: Colors.blue[900],
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Section 2: Symptoms and Quantity
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(
                        'Triệu chứng và số lượng',
                        isCompleted: _hasSymptoms && _hasValidQuantity,
                      ),
                      const SizedBox(height: 16),

                      // Triệu chứng đã chọn
                      if (_symptomsName.isNotEmpty) ...[
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey[200]!),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.medical_information_outlined,
                                    size: 20,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Triệu chứng đã chọn',
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: _symptomsName.map((symptom) {
                                  return Chip(
                                    label: Text(
                                      symptom,
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    deleteIcon:
                                        const Icon(Icons.close, size: 16),
                                    onDeleted: () {
                                      setState(() {
                                        _symptomsName.remove(symptom);
                                        _enteredSymptoms.removeWhere((s) =>
                                            _symptoms
                                                .firstWhere((sym) =>
                                                    sym.symptomName == symptom)
                                                .id ==
                                            s.symptomId);
                                      });
                                    },
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    side: BorderSide(color: Colors.grey[300]!),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],

                      // Nút thêm triệu chứng
                      InkWell(
                        onTap: _showSymptomSelectionSheet,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _symptomsName.isEmpty
                                    ? 'Thêm triệu chứng'
                                    : 'Thêm triệu chứng khác',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Số lượng con vật bị bệnh
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[200]!),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Số lượng con vật bị bệnh',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildQuantityButton(
                                  icon: Icons.remove,
                                  onPressed: () {
                                    final currentValue = int.tryParse(
                                            _affectedController.text) ??
                                        0;
                                    if (currentValue > 0) {
                                      setState(() {
                                        _affectedController.text =
                                            (currentValue - 1).toString();
                                      });
                                    }
                                  },
                                ),
                                Container(
                                  width: 80,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: TextField(
                                    controller: _affectedController,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                                _buildQuantityButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    final currentValue = int.tryParse(
                                            _affectedController.text) ??
                                        0;
                                    setState(() {
                                      _affectedController.text =
                                          (currentValue + 1).toString();
                                    });
                                  },
                                  isAdd: true,
                                ),
                              ],
                            ),
                            if (_farmingBatch != null) ...[
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    size: 16,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Số con hiện bình thường: ${_farmingBatch!.quantity} con.',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Checkbox(
                            value: _affectedController.text ==
                                _affectedQuantity.toString(),
                            onChanged: (_isCageSelected && _hasFarmingBatch)
                                ? (bool? value) {
                                    setState(() {
                                      if (value == true) {
                                        _affectedController.text =
                                            _affectedQuantity.toString();
                                      } else {
                                        _affectedController.text = '0';
                                      }
                                    });
                                  }
                                : null,
                          ),
                          const SizedBox(width: 4),
                          const Text('Cả đàn đều bị bệnh'),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Section 3: Notes and Images
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(
                        'Ghi chú và hình ảnh',
                        isRequired: false,
                        isCompleted: _images.isNotEmpty ||
                            _noteController.text.isNotEmpty,
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _noteController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Nhập ghi chú về tình trạng...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Hình ảnh đính kèm',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 12),
                      if (_images.isEmpty)
                        InkWell(
                          onTap: () => _showImagePickerOptions(context),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[300]!,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.add_photo_alternate_outlined,
                                    size: 40, color: Colors.grey[400]),
                                const SizedBox(height: 12),
                                Text(
                                  'Thêm hình ảnh',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: _images.length + 1,
                          itemBuilder: (context, index) {
                            if (index == _images.length) {
                              return InkWell(
                                onTap: () => _showImagePickerOptions(context),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey[300]!,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                      Icons.add_photo_alternate_outlined,
                                      color: Colors.grey[400]),
                                ),
                              );
                            }
                            return Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.file(
                                    _images[index],
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _images.removeAt(index);
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Colors.black54,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.close,
                                          size: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: _buildSubmitButton(),
        ),
      ),
    );
  }

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: LinearIcons.cameraIcon,
                title: const Text('Chụp ảnh'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromCamera();
                },
              ),
              ListTile(
                leading: LinearIcons.folderAddIcon,
                title: const Text('Chọn từ thư viện'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onPressed,
    bool isAdd = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isAdd ? Theme.of(context).colorScheme.primary : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: isAdd ? Colors.white : Colors.grey[700],
        ),
        iconSize: 24,
      ),
    );
  }
}
