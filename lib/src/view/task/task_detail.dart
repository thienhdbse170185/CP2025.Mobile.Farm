import 'dart:developer';
import 'dart:io';

import 'package:data_layer/data_layer.dart';
import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/constants/task_type_data_constant.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/view/widgets/text_field_required.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart'; // To handle file

// TODO: Làm thêm dựa vào taskType và các field
// của task trong DB, cập nhật UI cho phù hợp
class TaskDetailWidget extends StatefulWidget {
  final String taskId;
  const TaskDetailWidget({super.key, required this.taskId});
  // const TaskDetailWidget({super.key});

  @override
  State<TaskDetailWidget> createState() => _TaskDetailWidgetState();
}

class _TaskDetailWidgetState extends State<TaskDetailWidget>
    with SingleTickerProviderStateMixin {
  // Task status
  String taskStatus = 'Loading...'; // Start directly at 'in progress'

  // For image upload
  List<File> _images = [];

  // Controller for log input
  TextEditingController logController = TextEditingController();
  TextEditingController actualWeightController = TextEditingController();

  // Tab controller
  late TabController _tabController;
  TaskHaveCageName? task;

  // Assume this is the logged-in user ID
  String loggedInUserId = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<TaskBloc>().add(TaskEvent.getTaskById(widget.taskId));
  }

  // Function to pick multiple images
  Future<void> _pickImages() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();
    setState(() {
      _images = pickedFiles.map((pickedFile) => File(pickedFile.path)).toList();
    });
  }

  // Function to update task status
  void _updateTaskStatus() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận'),
          content: Text(taskStatus == 'Đang chờ'
              ? 'Bạn có chắc chắn muốn bắt đầu công việc này không?'
              : 'Bạn có chắc chắn muốn xác nhận hoàn thành công việc này không?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (taskStatus == 'Đang làm') {
                  if (task!.taskType.taskTypeId ==
                      TaskTypeDataConstant.feeding) {
                    int actualWeight = actualWeightController.text.isEmpty
                        ? 0
                        : int.parse(actualWeightController.text);
                    final log = DailyFoodUsageLogDto(
                        recommendedWeight: 45,
                        actualWeight: actualWeight,
                        notes: 'Hum nay là ngày đẹp truyệt zời',
                        logTime: DateTime.now(),
                        photo: '',
                        taskId: widget.taskId);
                    context.read<TaskBloc>().add(
                        TaskEvent.createDailyFoodUsageLog(
                            cageId: task!.cageId, log: log));
                  } else if (task!.taskType.taskTypeId ==
                      TaskTypeDataConstant.health) {
                    final log = HealthLogDto(
                        date: DateTime.now(),
                        notes: 'Hum nay là ngày đẹp truyệt zời',
                        photo: '',
                        taskId: widget.taskId);
                    context.read<TaskBloc>().add(TaskEvent.createHealthLog(
                        cageId: task!.cageId, log: log));
                  } else if (task!.taskType.taskTypeId ==
                      TaskTypeDataConstant.vaccin) {
                    final log = VaccinScheduleLogDto(
                      date: DateTime.now(),
                      notes: "Hum nay là ngày đẹp truyệt zời",
                      photo: "",
                      taskId: widget.taskId,
                    );
                    context.read<TaskBloc>().add(
                          TaskEvent.createVaccinScheduleLog(
                            cageId: task!.cageId,
                            log: log,
                          ),
                        );
                  } else {
                    context.read<TaskBloc>().add(TaskEvent.updateTask(
                        widget.taskId,
                        TaskStatusDataConstant.done.toLowerCase()));
                  }
                } else if (taskStatus == 'Chuẩn bị') {
                  context.read<TaskBloc>().add(TaskEvent.updateTask(
                      widget.taskId,
                      TaskStatusDataConstant.inprogress.toLowerCase()));
                }
              },
              child: const Text('Xác nhận'),
            ),
          ],
        );
      },
    );
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

  String getStatusText(String status) {
    switch (status) {
      case 'InProgress' || 'inprogress':
        return 'Đang làm';
      case 'Done' || 'done':
        return 'Đã hoàn thành';
      case 'Pending' || 'pending':
        return 'Chuẩn bị';
      case 'OverSchedules' || 'overschedules':
        return 'Đã quá hạn';
      default:
        return status;
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'InProgress' || 'inprogress':
        return Colors.yellow.shade200;
      case 'Done' || 'done':
        return Colors.green.shade200;
      case 'Pending' || 'pending':
        return Colors.grey.shade300;
      case 'OverSchedules' || 'overschedules':
        return Colors.red.shade200;
      default:
        return Colors.grey.shade300;
    }
  }

  Color getStatusTextColor(String status) {
    switch (status) {
      case 'InProgress' || 'inprogress':
        return Colors.black;
      case 'Done' || 'done':
        return Colors.white;
      case 'Pending' || 'pending':
        return Colors.black;
      case 'OverSchedules' || 'overschedules':
        return Colors.white;
      default:
        return Colors.black;
    }
  }

  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.lightBlue;
      default:
        return Colors.lightBlue; // Treat priorities greater than 3 as "Thấp"
    }
  }

  String getPriorityText(int priority) {
    switch (priority) {
      case 0:
        return 'N/A';
      case 1:
        return 'Cao';
      case 2:
        return 'Trung bình';
      case 3:
        return 'Thấp';
      default:
        return 'Thấp';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskBloc, TaskState>(
      listener: (context, state) {
        state.maybeWhen(
          getTaskByIdSuccess: (task, userId) async {
            // Handle task data
            LoadingDialog.hide(context);
            log(task.status);
            setState(() {
              this.task = task;
              taskStatus = getStatusText(task.status);
              loggedInUserId = userId;
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
          updateStatusTaskLoading: () {
            LoadingDialog.show(
                context, "Đang cập nhật trạng thái công việc...");
            log("Đang cập nhật trạng thái công việc...");
          },
          updateStatusTaskSuccess: () async {
            LoadingDialog.hide(context);
            log("Cập nhật trạng thái công việc thành công!");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Cập nhật trạng thái công việc thành công!')),
            );
            // Refresh the task details
            context.read<TaskBloc>().add(TaskEvent.getTaskById(widget.taskId));
          },
          updateStatusTaskFailure: (e) async {
            LoadingDialog.hide(context);
            log("Cập nhật trạng thái công việc thất bại!");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Cập nhật trạng thái công việc thất bại!')),
            );
          },
          createDailyFoodUsageLogLoading: () {
            LoadingDialog.show(context, "Đang tạo log cho ăn...");
            log("Đang tạo log cho ăn...");
          },
          createDailyFoodUsageLogSuccess: () async {
            LoadingDialog.hide(context);
            log("Tạo log cho ăn thành công!");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Tạo log cho ăn thành công!')),
            );
            context.read<TaskBloc>().add(TaskEvent.updateTask(
                widget.taskId, TaskStatusDataConstant.done.toLowerCase()));
          },
          createDailyFoodUsageLogFailure: (e) async {
            LoadingDialog.hide(context);
            log("Tạo log cho ăn thất bại!");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.toString())),
            );
          },
          createHealthLogLoading: () {
            LoadingDialog.show(context, "Đang tạo log uống thuốc...");
            log("Đang tạo log uống thuốc...");
          },
          createHealthLogSuccess: () async {
            LoadingDialog.hide(context);
            log("Tạo log uống thuốc thành công!");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Tạo log uống thuốc thành công!')),
            );
            context.read<TaskBloc>().add(TaskEvent.updateTask(
                widget.taskId, TaskStatusDataConstant.done.toLowerCase()));
          },
          createHealthLogFailure: (e) async {
            LoadingDialog.hide(context);
            log("Tạo log uống thuốc thất bại!");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Tạo log uống thuốc thất bại!')),
            );
          },
          createVaccinScheduleLogLoading: () {
            LoadingDialog.show(context, "Đang tạo log lịch tiêm chủng...");
            log("Đang tạo log lịch tiêm chủng...");
          },
          createVaccinScheduleLogSuccess: () async {
            LoadingDialog.hide(context);
            log("Tạo log lịch tiêm chủng thành công!");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Tạo log lịch tiêm chủng thành công!')),
            );
            context.read<TaskBloc>().add(TaskEvent.updateTask(
                widget.taskId, TaskStatusDataConstant.done.toLowerCase()));
          },
          createVaccinScheduleLogFailure: (e) async {
            LoadingDialog.hide(context);
            log("Tạo log lịch tiêm chủng thất bại!");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Tạo log lịch tiêm chủng thất bại!')),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: LinearIcons.arrowBackIcon),
          title: const Text('Chi tiết công việc'),
          bottom: (task?.taskType.taskTypeId == TaskTypeDataConstant.feeding ||
                  task?.taskType.taskTypeId == TaskTypeDataConstant.health ||
                  task?.taskType.taskTypeId == TaskTypeDataConstant.vaccin)
              ? TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Thông tin'),
                    Tab(text: 'Công việc'),
                  ],
                )
              : null,
        ),
        body: (task?.taskType.taskTypeId == TaskTypeDataConstant.feeding ||
                task?.taskType.taskTypeId == TaskTypeDataConstant.health ||
                task?.taskType.taskTypeId == TaskTypeDataConstant.vaccin)
            ? TabBarView(
                controller: _tabController,
                children: [
                  // Tab "Thông tin"
                  _buildInfoTab(context),
                  // Tab "Công việc"
                  _buildWorkTab(context),
                ],
              )
            : _buildInfoTab(context),
        bottomSheet: task?.assignedToUser.userId == loggedInUserId
            ? Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: FilledButton(
                  onPressed: (taskStatus == 'Đã hoàn thành' ||
                          taskStatus == 'Đã quá hạn')
                      ? null
                      : _updateTaskStatus,
                  child: Text(taskStatus == 'Chuẩn bị'
                      ? 'Bắt đầu'
                      : taskStatus == 'Đã hoàn thành'
                          ? 'Công việc đã hoàn thành'
                          : taskStatus == 'Đã quá hạn'
                              ? 'Công việc đã quá hạn'
                              : 'Xác nhận hoàn thành'),
                ),
              )
            : null,
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
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 80),
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
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          LinearIcons.homeHashtagIcon,
                          const SizedBox(width: 8),
                          Text(
                            task?.cageName ?? "",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Chip(
                        label: Text(
                          taskStatus,
                          style: TextStyle(
                            color: getStatusTextColor(task?.status ?? ''),
                          ),
                        ),
                        backgroundColor: getStatusColor(task?.status ?? ''),
                        shape: const StadiumBorder(
                            side: BorderSide(
                                width: 0, color: Colors.transparent)),
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
            Text(
              'Mô tả',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 4),
            // Log input TextField
            TextField(
              controller: TextEditingController(text: task?.description),
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 3,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Độ ưu tiên',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Chip(
              label: Text(
                getPriorityText(task?.priorityNum ?? 0),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              backgroundColor: getPriorityColor(task?.priorityNum ?? 0),
              shape: const StadiumBorder(
                  side: BorderSide(width: 0, color: Colors.transparent)),
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
            const SizedBox(height: 16),
            TextFieldRequired(
              label: 'Ngày hết hạn',
              hintText: 'Ngày hết hạn',
              content: formatDate(task?.dueDate),
              prefixIcon: const Icon(Icons.date_range),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkTab(BuildContext context) {
    bool isEditable = task?.assignedToUser.userId == loggedInUserId;
    bool isPending = taskStatus == 'Chuẩn bị';
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isPending)
            Text(
              'Xác nhận bắt đầu để có thể tải ảnh lên, ghi chú và hoàn thành công việc.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            )
          else ...[
            // Upload Image Section
            if (task!.taskType.taskTypeId == TaskTypeDataConstant.feeding)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Đơn log công việc cho ăn',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    'Ngày tạo log: ${DateFormat('EEEE, dd/MM/yyyy', 'vi').format(DateTime.now())}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFieldRequired(
                      label: 'Cân nặng thực tế (kg)',
                      keyBoardType: TextInputType.number,
                      controller: actualWeightController,
                      hintText: 'Nhập cân nặng thực tế (kg)')
                ],
              )
            else if (task!.taskType.taskTypeId == TaskTypeDataConstant.health)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Đơn log công việc cho uống thuốc',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    'Ngày tạo log: ${DateFormat('EEEE, dd/MM/yyyy', 'vi').format(DateTime.now())}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ],
              )
            else if (task!.taskType.taskTypeId == TaskTypeDataConstant.vaccin)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Đơn log công việc tiêm vắc xin',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    'Ngày tạo log: ${DateFormat('EEEE, dd/MM/yyyy', 'vi').format(DateTime.now())}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
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
              readOnly: !isEditable,
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
            const SizedBox(height: 24),
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
                      onTap: isEditable ? () => _pickImages() : null,
                      child: SizedBox(
                        width: 120,
                        child: Column(
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
                                    color:
                                        Theme.of(context).colorScheme.outline,
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
          ],
        ],
      ),
    );
  }
}
