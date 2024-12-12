import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For picking images
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/viewmodel/healthy/healthy_cubit.dart';
import 'package:data_layer/model/request/symptom/create_symptom/create_symptom_request.dart';

import 'package:smart_farm/src/view/widgets/text_field_required.dart'; // To handle files

class HealthReportWidget extends StatefulWidget {
  final String cageName; // Add this line
  const HealthReportWidget(
      {super.key, required this.cageName}); // Update this line

  @override
  State<HealthReportWidget> createState() => _HealthReportWidgetState();
}

class _HealthReportWidgetState extends State<HealthReportWidget> {
  final TextEditingController _noteController = TextEditingController();
  final List<File> _images = [];
  final TextEditingController _symptomController = TextEditingController();
  final List<String> _enteredSymptoms = []; // List to store entered symptoms
  final TextEditingController _affectedController = TextEditingController();

  // List of predefined symptoms for suggestions
  final List<String> _symptomSuggestions = [
    'Triệu chứng 1',
    'Triệu chứng 2',
    'Triệu chứng 3',
    'Ho',
    'Sốt cao',
    'Biếng ăn',
    'Phân lỏng'
  ];

  // Function to pick multiple images
  Future<void> _pickImages() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();
    setState(() {
      _images.addAll(pickedFiles.map((file) => File(file.path)));
    });
  }

  void _submitForm() {
    final request = CreateSymptomRequest(
      farmingBatchId:
          '5b98e892-3a3f-4b3e-b03e-8e127fd29c5a', // Replace with actual batch ID
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
    );

    context.read<HealthyCubit>().createSymptom(request);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HealthyCubit, HealthyState>(
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
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Báo cáo sức khỏe'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text(
                      'Chuồng: ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(width: 4),
                    Chip(
                      shape: const StadiumBorder(
                          side: BorderSide(color: Colors.transparent)),
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      label: Text(
                        widget.cageName, // Display the cage name
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                    ),
                  ]),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Autocomplete<String>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            if (textEditingValue.text.isEmpty) {
                              return const Iterable<String>.empty();
                            }
                            return _symptomSuggestions
                                .where((String suggestion) {
                              return suggestion.toLowerCase().contains(
                                  textEditingValue.text.toLowerCase());
                            });
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
                              ),
                            );
                          },
                          onSelected: (String selected) {
                            _symptomController.text = selected;
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
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
                                _enteredSymptoms.add(_symptomController.text);
                              }
                              _symptomController
                                  .clear(); // Clear the text after adding
                            }
                          });
                        },
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
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: _enteredSymptoms.map((symptom) {
                            return Chip(
                              label: Text(symptom),
                              onDeleted: () {
                                setState(() {
                                  _enteredSymptoms.remove(symptom);
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
                  const SizedBox(height: 16),
                  Text(
                    'Ảnh kèm theo',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _images.map((image) {
                      return Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.file(
                            image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _images.remove(image);
                                });
                              },
                              child: const CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.red,
                                child: Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: _pickImages,
                    icon: const Icon(Icons.add_a_photo),
                    label: const Text('Tải ảnh lên'),
                  ),
                ],
              ),
            ),
          ),
          bottomSheet: Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: FilledButton(
              onPressed: _submitForm,
              child: const Text('Gửi'),
            ),
          )),
    );
  }
}
