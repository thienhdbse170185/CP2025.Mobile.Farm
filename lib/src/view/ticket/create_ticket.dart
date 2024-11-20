import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/view/widgets/text_field_required.dart';

class CreateTicketWidget extends StatefulWidget {
  const CreateTicketWidget({super.key});

  @override
  State<CreateTicketWidget> createState() => _CreateTicketWidgetState();
}

class _CreateTicketWidgetState extends State<CreateTicketWidget> {
  final TextEditingController _noteController = TextEditingController();
  final List<File> _images = [];
  late DateTime _selectedExpiryDate;
  final TextEditingController _expiryDateController = TextEditingController();

  // Function to pick multiple images
  Future<void> _pickImages() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();
    setState(() {
      _images.addAll(pickedFiles.map((file) => File(file.path)));
    });
  }

  _selectExpiryDate(BuildContext context) async {
    await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2024, 1),
            lastDate: DateTime(2030, 12))
        .then((selectedDate) {
      if (selectedDate != null) {
        setState(() {
          _selectedExpiryDate = selectedDate;
        });
        _expiryDateController
          ..text = DateFormat.yMMMd().format(_selectedExpiryDate)
          ..selection = TextSelection.fromPosition(TextPosition(
              offset: _expiryDateController.text.length,
              affinity: TextAffinity.upstream));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Báo cáo vấn đề'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(
                  shape: const StadiumBorder(
                      side: BorderSide(color: Colors.transparent)),
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  label: Text(
                    'Chuồng gà Trưởng Thành',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: Theme.of(context).primaryColor),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                ),
                const SizedBox(height: 16),
                DropdownMenu(
                  label: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        const TextSpan(text: 'Lý do báo cáo '),
                        TextSpan(
                            text: '*',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.error))
                      ],
                    ),
                  ),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 'Đèn bị hư', label: 'Đèn bị hư'),
                    DropdownMenuEntry(
                        value: 'Thiết bị cảm biến hư',
                        label: 'Thiết bị cảm biến hư'),
                    DropdownMenuEntry(value: 'Camera hư', label: 'Camera hư'),
                  ],
                  width: MediaQuery.of(context).size.width - 32,
                ),
                const SizedBox(height: 16),
                TextFieldRequired(
                  label: 'Thời gian xảy ra',
                  hintText: 'Chọn ngày giờ xảy ra',
                  suffixIcon: const Icon(Icons.calendar_month),
                  isDisabled: true,
                  onTap: () {
                    _selectExpiryDate(context);
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _noteController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Chi tiết',
                    hintText: 'Mô tả chi tiết vấn đề',
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
          child: FilledButton(onPressed: () {}, child: const Text('Gửi')),
        ));
  }
}
