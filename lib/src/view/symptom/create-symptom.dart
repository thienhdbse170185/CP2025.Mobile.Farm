import 'dart:developer';
import 'dart:io';

import 'package:data_layer/model/dto/farming_batch/farming_batch_dto.dart';
import 'package:data_layer/model/dto/medical_symptom/medical_symptom.dart';
import 'package:data_layer/model/dto/symptom/symptom.dart';
import 'package:data_layer/model/request/symptom/create_symptom/create_symptom_request.dart';
import 'package:data_layer/model/request/symptom/symptom/get_symptom_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/view/symptom/cage_option.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/viewmodel/cage/cage_cubit.dart';
import 'package:smart_farm/src/viewmodel/farming_batch/farming_batch_cubit.dart';
import 'package:smart_farm/src/viewmodel/healthy/healthy_cubit.dart';
import 'package:smart_farm/src/viewmodel/symptom/symptom_cubit.dart';

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
  FarmingBatchDto? _farmingBatch;
  List<SymptomDto> _symptoms = [];

  List<CageOption> _cages = [];
  String? _selectedCage;

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

  // Function to pick multiple images
  // Future<void> _pickImages() async {
  //   final picker = ImagePicker();
  //   final pickedFiles = await picker.pickMultiImage();
  //   setState(() {
  //     _images.addAll(pickedFiles.map((file) => File(file.path)));
  //   });
  // }

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
    final request = CreateSymptomRequest(
      farmingBatchId: _farmingBatch?.id ?? '',
      prescriptionId: '95e72b29-6a93-4da9-b2d4-e5956c75622e',
      symptoms: _symptomsName.join(', '),
      status: 'Pending',
      affectedQuantity: int.parse(_affectedController.text),
      notes: _noteController.text,
      pictures: _images
          .map((image) => PictureSymptom(
                image: "image.png",
                dateCaptured: DateTime.now(),
              ))
          .toList(),
      medicalSymptomDetails: _enteredSymptoms,
    );

    context.read<HealthyCubit>().createSymptom(request);
  }

  void _showCageSelectionSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.5, // Adjust height
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Chọn chuồng báo cáo',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: _cages.map((CageOption cage) {
                    return Card.outlined(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: LinearIcons.chickenIcon,
                        title: Text(cage.name),
                        onTap: () {
                          context
                              .read<FarmingBatchCubit>()
                              .getFarmingBatchByCage(cage.id);
                          setState(() {
                            _selectedCage = cage.name;
                          });
                          Navigator.pop(context);
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
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
              if (searchQuery.isEmpty) return symptoms;
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
                          decoration: InputDecoration(
                            hintText: 'Tìm kiếm triệu chứng...',
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HealthyCubit, HealthyState>(
          listener: (context, state) {
            state.maybeWhen(
              createLoading: () {
                LoadingDialog.show(context, "Đang tạo báo cáo...");
              },
              createSuccess: () {
                log("Tạo báo cáo thành công");
                LoadingDialog.hide(context);

                // Create MedicalSymptomDto from form data
                final symptom = MedicalSymptomDto(
                  id: _selectedCage ?? '', // Using cage name as temporary ID
                  farmingBatchId: _farmingBatch?.id ?? '',
                  prescriptionId: '95e72b29-6a93-4da9-b2d4-e5956c75622e',
                  symtom: _symptomsName.join(', '),
                  status: 'Pending',
                  diagnosis: 'Pending',
                  nameAnimal: 'Pending',
                  prescriptions: [],
                  affectedQuantity: int.parse(_affectedController.text),
                  quantity: _farmingBatch?.quantity ?? 0,
                  notes: _noteController.text,
                  createAt: DateTime.now(),
                  pictures: _images
                      .map((image) => PictureSymptom(
                            image: "image.png",
                            dateCaptured: DateTime.now(),
                          ))
                      .toList(),
                  medicalSymptomDetails: [],
                );

                // Navigate to success screen with created symptom
                context.go(RouteName.symptomSuccess, extra: symptom);
              },
              createFailure: (error) {
                LoadingDialog.hide(context);
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
      ],
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: CustomAppBar(
          title: const Text('Tạo báo cáo triệu chứng'),
          leading: IconButton(
            icon: LinearIcons.arrowBackIcon,
            onPressed: () => context.pop(),
          ),
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
                    Text(
                      'Thông tin cơ bản',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
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
                    Text(
                      'Triệu chứng và số lượng',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      onPressed: _showSymptomSelectionSheet,
                      icon: LinearIcons.addCircleIcon,
                      label: const Text('Thêm triệu chứng'),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    if (_symptomsName.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _symptomsName.map((symptom) {
                          return Chip(
                            label: Text(symptom),
                            onDeleted: () {
                              setState(() {
                                _symptomsName.remove(symptom);
                                _enteredSymptoms.removeWhere((s) =>
                                    _symptoms
                                        .firstWhere(
                                            (sym) => sym.symptomName == symptom)
                                        .id ==
                                    s.symptomId);
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ],
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Số lượng con vật bị bệnh',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 140,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.grey[300]!),
                                  ),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.remove,
                                      color: Colors.grey[600], size: 18),
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
                              ),
                              SizedBox(
                                width: 64,
                                child: TextField(
                                  controller: _affectedController,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                              Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: Colors.grey[300]!),
                                  ),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    final currentValue = int.tryParse(
                                            _affectedController.text) ??
                                        0;
                                    setState(() {
                                      _affectedController.text =
                                          (currentValue + 1).toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
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
                    Text(
                      'Ghi chú và hình ảnh',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
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
                                child: Icon(Icons.add_photo_alternate_outlined,
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
        bottomNavigationBar: Container(
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
          child: FilledButton(
            onPressed: _submitForm,
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Tạo báo cáo'),
          ),
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
}
