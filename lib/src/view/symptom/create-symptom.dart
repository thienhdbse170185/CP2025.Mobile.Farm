import 'dart:developer';
import 'dart:io';

import 'package:data_layer/model/dto/farming_batch/farming_batch_dto.dart';
import 'package:data_layer/model/dto/symptom/symptom.dart';
import 'package:data_layer/model/request/symptom/create_symptom/create_symptom_request.dart';
import 'package:data_layer/model/request/symptom/symptom/get_symptom_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/view/symptom/cage_option.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/view/widgets/text_field_required.dart';
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
  final TextEditingController _symptomController = TextEditingController();
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
        symptoms: _enteredSymptoms.join(', '),
        status: 'Pending', // Replace with actual status
        affectedQuantity: int.parse(_affectedController.text),
        notes: _noteController.text,
        pictures: _images
            .map((image) => PictureSymptom(
                  image: "image.png",
                  dateCaptured: DateTime.now(),
                ))
            .toList(),
        medicalSymptomDetails: _enteredSymptoms);

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

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HealthyCubit, HealthyState>(
          listener: (context, state) {
            state.maybeWhen(
              createLoading: () {
                log("Đang tạo báo cáo...");
                LoadingDialog.show(context, "Đang tạo báo cáo...");
              },
              createSuccess: () {
                log("Tạo báo cáo thành công");
                LoadingDialog.hide(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tạo báo cáo thành công'),
                  ),
                );
              },
              createFailure: (error) {
                log("Tạo báo cáo thất bại: $error");
                LoadingDialog.hide(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tạo báo cáo thất bại: $error'),
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
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          appBarHeight: MediaQuery.of(context).size.height * 0.08,
          title: Column(
            children: [
              const Text('Đơn báo cáo triệu chứng'),
              Text(
                'Ngày báo cáo: $formattedDate',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
          centerTitle: true,
          leading: IconButton(
            icon: LinearIcons.arrowBackIcon,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: _buildForm(),
        bottomSheet: Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: FilledButton(
            onPressed: _submitForm,
            child: const Text('Gửi'),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 128),
      physics: const AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldRequired(
              label: 'Chuồng',
              isDisabled: false,
              isReadOnly: true,
              hintText: 'Chọn chuồng báo cáo',
              suffixIcon: const Icon(Icons.arrow_drop_down),
              onTap: _showCageSelectionSheet,
              controller: TextEditingController(
                  text: _selectedCage ?? 'Chọn chuồng báo cáo'),
            ),
            if (_farmingBatch != null)
              Column(
                children: [
                  const SizedBox(height: 16),
                  TextFieldRequired(
                    label: 'Vụ nuôi hiện tại',
                    hintText: 'Nhập vụ nuôi hiện tại',
                    isDisabled: true,
                    controller: _farmingBatchController,
                  ),
                ],
              ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      }
                      return _symptoms.where((SymptomDto suggestion) {
                        return suggestion.symptomName
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase());
                      }).map((e) => e.symptomName);
                    },
                    fieldViewBuilder: (BuildContext context,
                        TextEditingController fieldTextEditingController,
                        FocusNode fieldFocusNode,
                        VoidCallback onFieldSubmitted) {
                      return TextField(
                        controller: fieldTextEditingController,
                        focusNode: fieldFocusNode,
                        decoration: InputDecoration(
                          label: RichText(
                            text: TextSpan(
                              text: 'Nhập triệu chứng ',
                              style: DefaultTextStyle.of(context).style,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          hintText: 'Nhập triệu chứng',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          helperText:
                              'Ấn dấu + để thêm triệu chứng vào báo cáo',
                          suffixIcon: IconButton(
                            icon: LinearIcons.addCircleIcon,
                            onPressed: () {
                              setState(() {
                                if (_symptomController.text.isNotEmpty) {
                                  if (_enteredSymptoms
                                      .contains(_symptomController.text)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Triệu chứng đã tồn tại'),
                                      ),
                                    );
                                  } else {
                                    for (var symptom in _symptoms) {
                                      if (symptom.symptomName ==
                                          _symptomController.text) {
                                        _symptomsName.add(symptom.symptomName);
                                        _enteredSymptoms.add(GetSymptomRequest(
                                          symptomId: symptom.id,
                                          notes: _noteController.text,
                                        ));
                                      }
                                    }
                                  }
                                  _symptomController
                                      .clear(); // Clear the text after adding
                                }
                              });
                            },
                          ),
                        ),
                      );
                    },
                    onSelected: (String selected) {
                      _symptomController.text = selected;
                    },
                  ),
                ),
              ],
            ),
            if (_enteredSymptoms.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    '• Triệu chứng đã nhập: ',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _symptomsName.map((symptom) {
                      return Chip(
                        label: Text(symptom),
                        onDeleted: () {
                          setState(() {
                            _symptomsName.remove(symptom);
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            const SizedBox(height: 16),
            TextFieldRequired(
                controller: _affectedController,
                isDisabled: false,
                label: 'Số lượng con vật bị bệnh',
                hintText: 'Nhập số lượng'),
            const SizedBox(height: 24),
            TextField(
              controller: _noteController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Ghi chú',
                hintText: 'Nhập ghi chú',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text('Tập tin đính kèm',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 30),
            if (_images.isEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: _pickImageFromCamera,
                    child: Column(
                      children: [
                        LinearIcons.cameraIcon,
                        SizedBox(height: 8),
                        Text(
                          'Chụp ảnh',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: _pickImageFromGallery,
                    child: Column(
                      children: [
                        LinearIcons.folderAddIcon,
                        SizedBox(height: 8),
                        Text(
                          'Chọn tập tin',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _images.map((image) {
                return Stack(
                  children: [
                    Image.file(
                      image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(
                        icon:
                            const Icon(Icons.remove_circle, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _images.remove(image);
                          });
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            if (_images.isNotEmpty)
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Wrap(
                          children: <Widget>[
                            ListTile(
                              leading: LinearIcons.cameraIcon,
                              title: Text('Chụp ảnh'),
                              onTap: () {
                                Navigator.pop(context);
                                _pickImageFromCamera();
                              },
                            ),
                            ListTile(
                              leading: LinearIcons.folderAddIcon,
                              title: Text('Chọn tập tin'),
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
                },
                child: Column(
                  children: [
                    LinearIcons.folderAddIcon,
                    const SizedBox(height: 8),
                    Text(
                      'Thêm mục khác',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
