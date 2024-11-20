import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For image picking
import 'dart:io'; // To handle file

class TaskDetailWidget extends StatefulWidget {
  const TaskDetailWidget({super.key});

  @override
  State<TaskDetailWidget> createState() => _TaskDetailWidgetState();
}

class _TaskDetailWidgetState extends State<TaskDetailWidget> {
  // Task status
  String taskStatus = 'Đang chờ thực hiện'; // Initial status is 'pending'
  // For image upload
  File? _image;
  // For logging
  String log = '';
  // Controller for log input
  TextEditingController logController = TextEditingController();

  // Function to pick image
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        log += '\nImage uploaded: ${pickedFile.path}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết công việc'),
        actions: [
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: () {
              // Navigate to the edit screen
            },
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Refresh the task details
        },
        child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vệ sinh chuồng gà Trưởng Thành',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Chip(
                          label:
                              Text(taskStatus), // Display current task status
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Task Description
              Text(
                'Mô tả chi tiết',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                '''
          • Cách làm 1.
          • Cách làm 2.
          • Cách làm 3.
                ''',
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              // Conditionally show upload image and log when the task is in progress
              if (taskStatus == 'Đang thực hiện')
                // Upload Image Section
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(
                                  style: Theme.of(context).textTheme.titleLarge,
                                  children: [
                                const TextSpan(text: 'Ảnh kết quả '),
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .error))
                              ])),
                          const SizedBox(height: 8),
                          Text('(Ảnh chụp phải rõ ràng,\n thấy được kết quả)',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .outline)),
                        ],
                      ),
                      SizedBox(
                          width: 120,
                          height: 120,
                          child: DottedBorder(
                              color:
                                  Theme.of(context).colorScheme.outlineVariant,
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(12),
                              strokeWidth: 1,
                              child: InkWell(
                                onTap: () => _pickImage(),
                                child: SizedBox(
                                    width: 120,
                                    child: _image != null
                                        ? Image.file(
                                            File(_image!.path),
                                            fit: BoxFit.cover,
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(Icons.add),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Tải ảnh lên',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .outline),
                                              ),
                                            ],
                                          )),
                              )))
                    ],
                  ),
                ),
              if (taskStatus == 'Đang thực hiện')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Ghi chú',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 8),
                    // Log input TextField
                    TextField(
                      controller: logController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Ghi chú...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.outline),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              // Task Details
              _buildDetailRow(context, Icons.cleaning_services,
                  'Loại công việc', 'Vệ sinh'),
              _buildDetailRow(context, Icons.person, 'Người được phân công',
                  'Hoang Dang Bao Thien (K17 HCM)'),
              _buildDetailRow(context, Icons.person_outline, 'Người phân công',
                  'hauntse150603'),
              _buildDetailRow(
                  context, Icons.date_range, 'Ngày tạo', '12/11/2024'),
              _buildDetailRow(
                  context, Icons.access_time, 'Ước tính thời gian', '1 ngày'),
            ])),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: FilledButton(
          onPressed: () {
            setState(() {
              if (taskStatus == 'Đang chờ thực hiện') {
                taskStatus = 'Đang thực hiện'; // Change status to 'in progress'
                log += '\nTask started at: ${DateTime.now()}';
              } else if (taskStatus == 'Đang thực hiện') {
                taskStatus = 'Hoàn thành'; // Change status to 'completed'
                log += '\nTask completed at: ${DateTime.now()}';
              }
            });
          },
          child: Text(taskStatus == 'Đang chờ thực hiện'
              ? 'Xác nhận thực hiện' // Confirm start if pending
              : 'Xác nhận hoàn thành'), // Confirm completion if in progress
        ),
      ),
    );
  }

  Widget _buildDetailRow(
      BuildContext context, IconData icon, String label, String value) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.outline),
                const SizedBox(width: 8),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            )
          ],
        ));
  }
}
