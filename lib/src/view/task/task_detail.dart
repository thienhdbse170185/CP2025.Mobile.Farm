import 'dart:io';
import 'dart:developer';

import 'package:data_layer/model/entity/task/task.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/view/widgets/text_field_required.dart';
import 'package:smart_farm/src/viewmodel/bloc/task_bloc.dart'; // To handle file
import 'package:intl/intl.dart';

class TaskDetailWidget extends StatefulWidget {
  final String taskId;
  const TaskDetailWidget({super.key, required this.taskId});

  @override
  State<TaskDetailWidget> createState() => _TaskDetailWidgetState();
}

class _TaskDetailWidgetState extends State<TaskDetailWidget>
    with SingleTickerProviderStateMixin {
  // Task status
  String taskStatus = 'Đang thực hiện'; // Start directly at 'in progress'

  // For image upload
  File? _image;
  // Controller for log input
  TextEditingController logController = TextEditingController();

  // Tab controller
  late TabController _tabController;
  Task? task;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<TaskBloc>().add(TaskEvent.getTaskById(widget.taskId));
  }

  // Function to pick image
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  String formatDate(String? date) {
    if (date == null || date.isEmpty) {
      return "N/A"; // Return a default value if the date is null or empty
    }
    try {
      final DateTime parsedDate = DateTime.parse(date);
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      return formatter.format(parsedDate);
    } catch (e) {
      return "Invalid date"; // Return an error message if parsing fails
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskBloc, TaskState>(
      listener: (context, state) {
        state.maybeWhen(
          getTaskByIdSuccess: (task) async {
            // Handle task data
            await Future.delayed(const Duration(seconds: 1));
            LoadingDialog.hide(context);
            setState(() {
              this.task = task;
            });
            log("Lấy thông tin công việc thành công!");
          },
          getTaskByIdLoading: () {
            LoadingDialog.show(context, "Đang lấy thông tin công việc...");
            log("Đang lấy thông tin công việc...");
          },
          getTaskByIdFailure: (e) async {
            await Future.delayed(const Duration(seconds: 1));
            LoadingDialog.hide(context);
            log("Lấy thông tin công việc thất bại!");
          },
          orElse: () {},
        );
      },
      child: Scaffold(
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
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Thông tin'),
              Tab(text: 'Công việc'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            // Tab "Thông tin"
            _buildInfoTab(context),
            // Tab "Công việc"
            _buildWorkTab(context),
          ],
        ),
        bottomSheet: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: FilledButton(
            onPressed: () {
              setState(() {
                if (taskStatus == 'Đang thực hiện') {
                  taskStatus = 'Hoàn thành';
                }
              });
            },
            child:
                const Text('Xác nhận hoàn thành'), // Always confirm completion
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTab(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Refresh the task details
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task?.taskName ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Chip(
                        label: Text(
                            task?.status ?? ""), // Display current task status
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
            const SizedBox(height: 32),
            TextFieldRequired(
              label: 'Loại công việc',
              hintText: 'Loại công việc',
              content: task?.taskType.taskTypeName,
              prefixIcon: const Icon(Icons.work_outline),
            ),
            const SizedBox(height: 16),
            TextFieldRequired(
              label: 'Người được phân công',
              hintText: 'được phân công',
              content: task?.assignedToUser.fullName,
              prefixIcon: const Icon(Icons.person),
            ),
            const SizedBox(height: 16),
            TextFieldRequired(
              label: 'Ngày tạo',
              hintText: 'Ngày tạo',
              content: formatDate(task?.createdAt),
              prefixIcon: const Icon(Icons.date_range),
            ),
            // const SizedBox(height: 16),
            // const TextFieldRequired(
            //   label: 'Ước tính thời gian',
            //   hintText: 'Ước tính thời gian',
            //   content: '1 ngày',
            //   prefixIcon: Icon(Icons.access_time),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upload Image Section
          Row(
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
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '(Ảnh chụp phải rõ ràng,\n thấy được kết quả)',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                  ),
                ],
              ),
              SizedBox(
                width: 120,
                height: 120,
                child: DottedBorder(
                  color: Theme.of(context).colorScheme.outlineVariant,
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                            .outline,
                                      ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
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
        ),
      ],
    ),
  );
}
