import 'dart:developer';
import 'dart:io';

import 'package:data_layer/data_layer.dart';
import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
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
import 'package:smart_farm/src/viewmodel/growth_stage/growth_stage_cubit.dart';
import 'package:smart_farm/src/viewmodel/prescription/prescription_cubit.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart'; // To handle file

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
  DateTime? logTime;
  double? recommendedWeight;
  int actualWeight = 0;
  String? prescriptionId;
  PrescriptionDto? prescription;

  // For image upload
  final List<File> _images = [];
  List<int> weightList = [];

  // Controller for log input
  TextEditingController logController = TextEditingController();

  TaskHaveCageName? task;

  // Assume this is the logged-in user ID
  String loggedInUserId = '';

  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(TaskEvent.getTaskById(widget.taskId));
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

  // Function to update task status
  void _updateTaskStatus() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận'),
          content: Text(taskStatus == TaskStatusDataConstant.pendingVn
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
                if (taskStatus == TaskStatusDataConstant.inprogressVn) {
                  if (task!.taskType.taskTypeId ==
                      TaskTypeDataConstant.feeding) {
                    int actualWeight = this.actualWeight;
                    final log = DailyFoodUsageLogDto(
                        recommendedWeight: recommendedWeight?.toInt() ?? 0,
                        actualWeight: actualWeight,
                        notes: logController.text,
                        logTime: DateTime.now(),
                        photo: '',
                        taskId: widget.taskId);
                    context.read<TaskBloc>().add(
                          TaskEvent.createDailyFoodUsageLog(
                              cageId: task!.cageId, log: log),
                        );
                  } else if (task!.taskType.taskTypeId ==
                      TaskTypeDataConstant.health) {
                    final log = HealthLogDto(
                        prescriptionId: prescriptionId ?? '',
                        date: DateTime.now(),
                        notes: logController.text,
                        photo: '',
                        taskId: widget.taskId);
                    context.read<TaskBloc>().add(TaskEvent.createHealthLog(
                        prescriptionId: prescriptionId ?? '', log: log));
                  } else if (task!.taskType.taskTypeId ==
                      TaskTypeDataConstant.vaccin) {
                    final log = VaccinScheduleLogDto(
                      date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                      notes: logController.text,
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
                    context.read<TaskBloc>().add(
                          TaskEvent.updateTask(
                              widget.taskId, TaskStatusDataConstant.done),
                        );
                  }
                } else if (taskStatus == TaskStatusDataConstant.pendingVn) {
                  context.read<TaskBloc>().add(
                        TaskEvent.updateTask(
                            widget.taskId, TaskStatusDataConstant.inprogress),
                      );
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
      case TaskStatusDataConstant.inprogress:
        return TaskStatusDataConstant.inprogressVn;
      case TaskStatusDataConstant.done:
        return TaskStatusDataConstant.doneVn;
      case TaskStatusDataConstant.pending:
        return TaskStatusDataConstant.pendingVn;
      case TaskStatusDataConstant.overdue:
        return TaskStatusDataConstant.overdueVn;
      default:
        return status;
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case TaskStatusDataConstant.inprogress:
        return Colors.yellow.shade200;
      case TaskStatusDataConstant.done:
        return Colors.green.shade200;
      case TaskStatusDataConstant.pending:
        return Colors.grey.shade300;
      case TaskStatusDataConstant.overdue:
        return Colors.red.shade200;
      default:
        return Colors.grey.shade300;
    }
  }

  Color getStatusTextColor(String status) {
    switch (status) {
      case TaskStatusDataConstant.inprogress:
        return Colors.black;
      case TaskStatusDataConstant.done:
        return Colors.white;
      case TaskStatusDataConstant.pending:
        return Colors.black;
      case TaskStatusDataConstant.overdue:
        return Colors.white;
      default:
        return Colors.black;
    }
  }

  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red.shade200;
      case 2:
        return Colors.yellow.shade200;
      case 3:
        return Colors.lightBlue.shade300;
      default:
        return Colors
            .lightBlue.shade200; // Treat priorities greater than 3 as "Thấp"
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
    return MultiBlocListener(
      listeners: [
        BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
            state.maybeWhen(
              getTaskByIdSuccess: (task, userId) async {
                // Handle task data
                LoadingDialog.hide(context);
                setState(() {
                  this.task = task;
                  taskStatus = getStatusText(task.status);
                  loggedInUserId = userId;
                  prescriptionId = task.prescriptionId;
                });
                log("Lấy thông tin công việc thành công!");
                if (task.status != TaskStatusDataConstant.pending) {
                  if (task.taskType.taskTypeId ==
                      TaskTypeDataConstant.feeding) {
                    context
                        .read<GrowthStageCubit>()
                        .getRecommendedWeightByCageId(task.cageId);
                  } else if (task.taskType.taskTypeId ==
                      TaskTypeDataConstant.health) {
                    context
                        .read<TaskBloc>()
                        .add(TaskEvent.getHealthLog(widget.taskId));
                  }
                }
                if (task.taskType.taskTypeId == TaskTypeDataConstant.health) {
                  context
                      .read<PrescriptionCubit>()
                      .getPrescription(prescriptionId ?? '');
                }
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
                      content:
                          Text('Cập nhật trạng thái công việc thành công!')),
                );
                context.pop();
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
                    widget.taskId, TaskStatusDataConstant.done));
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
                  const SnackBar(
                      content: Text('Tạo log uống thuốc thành công!')),
                );
                context.read<TaskBloc>().add(TaskEvent.updateTask(
                    widget.taskId, TaskStatusDataConstant.done));
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
                    widget.taskId, TaskStatusDataConstant.done));
              },
              createVaccinScheduleLogFailure: (e) async {
                LoadingDialog.hide(context);
                if (e.toString().contains('vaccinschedule-not-found')) {
                  log("Vaccine schedule không tồn tại!");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Vaccine schedule không tồn tại!')),
                  );
                } else {
                  log("Tạo log lịch tiêm chủng thất bại!");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Tạo log lịch tiêm chủng thất bại!')),
                  );
                }
              },
              getDailyFoodUsageLogLoading: () {
                log("Đang lấy log cho ăn...");
                LoadingDialog.show(
                    context, "Đang lấy thông tin đơn báo cáo...");
              },
              getDailyFoodUsageLogSuccess: (log) async {
                setState(() {
                  actualWeight = log.actualWeight;
                  logController.text = log.notes;
                  logTime = log.logTime;
                });
                LoadingDialog.hide(context);
              },
              getDailyFoodUsageLogFailure: (e) async {
                log("Lấy log cho ăn thất bại!");
              },
              getHealthLogLoading: () {
                log("Đang lấy log sức khỏe...");
                LoadingDialog.show(
                    context, "Đang lấy thông tin đơn báo cáo...");
              },
              getHealthLogSuccess: (log) async {
                setState(() {
                  logController.text = log.notes;
                });
                LoadingDialog.hide(context);
              },
              getHealthLogFailure: (e) async {
                log("Lấy log sức khỏe thất bại!");
              },
              getVaccinScheduleLogLoading: () {
                log("Đang lấy log lịch tiêm chủng...");
                LoadingDialog.show(
                    context, "Đang lấy thông tin đơn báo cáo...");
              },
              getVaccinScheduleLogSuccess: (log) async {
                setState(() {
                  logController.text = log.notes;
                });
                LoadingDialog.hide(context);
              },
              getVaccinScheduleLogFailure: (e) async {
                log("Lấy log lịch tiêm chủng thất bại!");
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<GrowthStageCubit, GrowthStageState>(
          listener: (context, state) {
            state.maybeWhen(
              getRecommendedWeightByCageIdInProgress: () {
                log('Đang lấy cân nặng khuyến nghị...');
                LoadingDialog.show(context, 'Đang lấy cân nặng khuyến nghị...');
              },
              getRecommendedWeightByCageIdSuccess:
                  (recommendedWeight, weightList) {
                log('Lấy cân nặng khuyến nghị thành công!');
                setState(() {
                  this.recommendedWeight = recommendedWeight;
                  actualWeight = recommendedWeight.toInt();
                  this.weightList = weightList;
                });
                if (task?.status == TaskStatusDataConstant.done) {
                  if (task?.taskType.taskTypeId ==
                      TaskTypeDataConstant.feeding) {
                    context
                        .read<TaskBloc>()
                        .add(TaskEvent.getDailyFoodUsageLog(widget.taskId));
                  } else if (task?.taskType.taskTypeId ==
                      TaskTypeDataConstant.health) {
                    context
                        .read<TaskBloc>()
                        .add(TaskEvent.getHealthLog(widget.taskId));
                  } else if (task?.taskType.taskTypeId ==
                      TaskTypeDataConstant.vaccin) {
                    context
                        .read<TaskBloc>()
                        .add(TaskEvent.getVaccinScheduleLog(widget.taskId));
                  }
                }
                LoadingDialog.hide(context);
              },
              getRecommendedWeightByCageIdFailure: (e) {
                log('Lấy cân nặng khuyến nghị thất bại!');
                LoadingDialog.hide(context);
                SnackBar(content: Text(e));
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<PrescriptionCubit, PrescriptionState>(
          listener: (context, state) {
            state.maybeWhen(
              getPrescriptionSuccess: (prescription) {
                log('Lấy thuốc thành công!');
                setState(() {
                  this.prescription = prescription;
                });
              },
              getPrescriptionFailure: (e) {
                log('Lấy thuốc thất bại!');
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: LinearIcons.arrowBackIcon),
          title: const Text('Chi tiết công việc'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            // Refresh the task details
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 24, left: 20, bottom: 24),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant,
                        width: 1,
                      ),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tên công việc',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.outline,
                            fontSize: 13,
                          )),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const SizedBox(width: 4),
                          Text(
                            task?.taskName ?? "",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Mô tả',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              task?.description ?? "",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      top: 24, left: 20, bottom: 24, right: 20),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant,
                        width: 1,
                      ),
                    ),
                    color: Colors.white,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Số cột
                      mainAxisSpacing: 16, // Khoảng cách giữa các hàng
                      crossAxisSpacing: 16, // Khoảng cách giữa các cột
                      childAspectRatio: 3, // Tỉ lệ chiều rộng / chiều cao
                    ),
                    itemCount: 6, // Tổng số phần tử trong lưới
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return _buildGridItem(
                            context,
                            icon: LinearIcons.homeHashtagIcon,
                            label: 'Tên chuồng',
                            value: task?.cageName ?? "",
                          );
                        case 1:
                          return _buildGridItem(
                            context,
                            icon: LinearIcons.categoryIcon,
                            label: 'Loại công việc',
                            value: task?.taskType.taskTypeName ?? "",
                          );
                        case 2:
                          return _buildGridItem(
                            context,
                            icon: LinearIcons.taskSquareIcon,
                            label: 'Độ ưu tiên',
                            value: getPriorityText(task?.priorityNum ?? 0),
                            color: getPriorityColor(task?.priorityNum ?? 0),
                          );
                        case 3:
                          return _buildGridItem(
                            context,
                            icon: LinearIcons.notiStatusIcon,
                            label: 'Trạng thái',
                            value: getStatusText(task?.status ?? ""),
                            color: getStatusColor(task?.status ?? ""),
                          );
                        case 4:
                          return _buildGridItem(
                            context,
                            icon: LinearIcons.calendarRemoveIcon,
                            label: 'Hạn chót',
                            value: formatDate(task?.dueDate ?? ""),
                          );
                        case 5:
                          return Container(); // Phần tử trống
                        default:
                          return Container();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant,
                        width: 1,
                      ),
                    ),
                    color: Colors.white,
                  ),
                  child: (task?.taskType.taskTypeId ==
                              TaskTypeDataConstant.feeding ||
                          task?.taskType.taskTypeId ==
                              TaskTypeDataConstant.health ||
                          task?.taskType.taskTypeId ==
                              TaskTypeDataConstant.vaccin)
                      ? _buildWorkTab(context)
                      : const Text(
                          '(!) Loại công việc này không cần tạo đơn báo cáo hằng ngày.',
                        ),
                )
              ],
            ),
          ),
        ),
        bottomSheet: task?.assignedToUser.userId == loggedInUserId
            ? Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: FilledButton(
                  onPressed: (taskStatus == TaskStatusDataConstant.doneVn ||
                          taskStatus == TaskStatusDataConstant.overdueVn)
                      ? null
                      : _updateTaskStatus,
                  child: Text(taskStatus == TaskStatusDataConstant.pendingVn
                      ? 'Bắt đầu'
                      : taskStatus == TaskStatusDataConstant.doneVn
                          ? 'Công việc đã hoàn thành'
                          : taskStatus == TaskStatusDataConstant.overdueVn
                              ? 'Công việc đã quá hạn'
                              : 'Xác nhận hoàn thành'),
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildImagePickerButton({
    required BuildContext context,
    required Widget icon,
    required String label,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Card.outlined(
        child: SizedBox(
          width: 110,
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  color: onTap == null
                      ? Theme.of(context).colorScheme.outline
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWorkTab(BuildContext context) {
    bool isEditable = task?.assignedToUser.userId == loggedInUserId;
    bool isPending = taskStatus == TaskStatusDataConstant.pendingVn;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isPending)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Xác nhận bắt đầu để có thể tạo đơn báo cáo và hoàn thành công việc.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          ),
                    ),
                  ),
                ],
              ),
            )
          else ...[
            if (task?.taskType.taskTypeId == TaskTypeDataConstant.feeding)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.restaurant_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Đơn log công việc cho ăn',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Ngày tạo log: ${DateFormat('EEEE, dd/MM/yyyy', 'vi').format(logTime ?? DateTime.now())}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Card.outlined(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Theme.of(context).colorScheme.primary,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Khuyến cáo cho ăn:',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${recommendedWeight != null ? recommendedWeight?.toInt() : 0}g',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Chọn lượng thức ăn:',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: (task?.status ==
                                              TaskStatusDataConstant.done ||
                                          DateTime.parse(task?.dueDate ?? "")
                                              .isBefore(DateTime.now()))
                                      ? Theme.of(context).colorScheme.outline
                                      : null,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 4,
                            runSpacing: 4,
                            children: weightList.map((weight) {
                              bool isSelected = actualWeight == weight;
                              bool isDisabled =
                                  task?.status == TaskStatusDataConstant.done ||
                                      task?.status ==
                                          TaskStatusDataConstant.overdue;
                              return FilterChip(
                                selected: isSelected,
                                showCheckmark: false,
                                label: Text('${weight}g'),
                                labelStyle: TextStyle(
                                  color: isDisabled
                                      ? (isSelected
                                          ? Theme.of(context)
                                              .colorScheme
                                              .onPrimary
                                          : Theme.of(context)
                                              .colorScheme
                                              .outline)
                                      : (isSelected
                                          ? Theme.of(context)
                                              .colorScheme
                                              .onPrimary
                                          : Theme.of(context)
                                              .colorScheme
                                              .onSurface),
                                ),
                                selectedColor:
                                    Theme.of(context).colorScheme.primary,
                                onSelected: isDisabled
                                    ? null
                                    : (bool selected) {
                                        if (selected) {
                                          setState(() {
                                            actualWeight = weight;
                                          });
                                        }
                                      },
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer
                                  .withOpacity(task?.status ==
                                          TaskStatusDataConstant.done
                                      ? 0.5
                                      : 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(task?.status ==
                                              TaskStatusDataConstant.done
                                          ? 0.5
                                          : 1),
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Đã cho ăn: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: task?.status ==
                                                TaskStatusDataConstant.done
                                            ? Theme.of(context)
                                                .colorScheme
                                                .outline
                                            : null,
                                      ),
                                ),
                                Text(
                                  '${actualWeight}g',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: task?.status ==
                                                TaskStatusDataConstant.done
                                            ? Theme.of(context)
                                                .colorScheme
                                                .outline
                                            : null,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            else if (task?.taskType.taskTypeId == TaskTypeDataConstant.health)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      children: [
                        Icon(
                          Icons.medical_services_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Đơn log công việc uống thuốc',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ngày tạo log: ${DateFormat('EEEE, dd/MM/yyyy', 'vi').format(DateTime.now())}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),

                    if (prescription != null) ...[
                      const SizedBox(height: 16),
                      // Prescription Info
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primaryContainer
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                LinearIcons.healthIconGreen,
                                const SizedBox(width: 8),
                                Text(
                                  'Thông tin đơn thuốc',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                _buildInfoItem(
                                  context,
                                  'Số ngày uống',
                                  '${prescription?.daysToTake} ngày',
                                  Icons.calendar_today,
                                ),
                                const SizedBox(width: 16),
                                _buildInfoItem(
                                  context,
                                  'Số lượng',
                                  '${prescription?.quantityAnimal} con',
                                  Icons.pets,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),
                      // Medications List
                      Text(
                        'Danh sách thuốc',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      ...prescription?.medications?.map((medication) =>
                              Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outlineVariant,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
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
                                          child: Image.asset(
                                            'assets/images/medicine.png',
                                            width: 24,
                                            height: 24,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                medication.medicationName,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                'Liều lượng: ${medication.dosage}mg',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .outline,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        Text(
                                          'Thời gian uống:',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        if (medication.morning)
                                          _buildTimeChip(context, 'Sáng'),
                                        if (medication.noon)
                                          _buildTimeChip(context, 'Trưa'),
                                        if (medication.afternoon)
                                          _buildTimeChip(context, 'Chiều'),
                                        if (medication.evening)
                                          _buildTimeChip(context, 'Tối'),
                                      ],
                                    ),
                                  ],
                                ),
                              )) ??
                          [],
                    ] else
                      const Center(
                        child: Text('Không có thông tin đơn thuốc'),
                      ),
                  ],
                ),
              )
            else if (task?.taskType.taskTypeId == TaskTypeDataConstant.vaccin)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.vaccines_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Đơn log công việc tiêm vắc xin',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ngày tạo log: ${DateFormat('EEEE, dd/MM/yyyy', 'vi').format(DateTime.now())}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 24),
            TextFieldRequired(
              isRequired: false,
              controller: logController,
              maxLines: 3,
              isDisabled: taskStatus == TaskStatusDataConstant.doneVn ||
                  taskStatus == TaskStatusDataConstant.overdueVn,
              label: 'Ghi chú (nếu có)',
              hintText: 'Nhập ghi chú',
            ),
            const SizedBox(height: 32),
            if (taskStatus != TaskStatusDataConstant.overdueVn)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tập tin đính kèm',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  if (_images.isEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildImagePickerButton(
                          context: context,
                          icon: LinearIcons.cameraIcon,
                          label: 'Chụp ảnh',
                          onTap: isEditable ? _pickImageFromCamera : null,
                        ),
                        _buildImagePickerButton(
                          context: context,
                          icon: LinearIcons.folderAddIcon,
                          label: 'Chọn tập tin',
                          onTap: isEditable ? _pickImageFromGallery : null,
                        ),
                      ],
                    ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _images.map((image) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              image,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              icon: Icon(
                                Icons.remove_circle,
                                color: Theme.of(context).colorScheme.error,
                              ),
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
              )
            else
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Công việc đã quá hạn, không thể tạo đơn báo cáo.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.error,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildGridItem(BuildContext context,
      {required Widget icon,
      required String label,
      required String value,
      Color? color}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: icon,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.outline,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value.length > 14 ? '${value.substring(0, 14)}...' : value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeChip(BuildContext context, String time) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        time,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildInfoItem(
      BuildContext context, String label, String value, IconData icon) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                  fontSize: 12,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
