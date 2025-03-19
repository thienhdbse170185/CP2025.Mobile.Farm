import 'dart:developer';
import 'dart:io';

import 'package:data_layer/data_layer.dart';
import 'package:data_layer/model/dto/egg_harvest/egg_harvest_dto.dart';
import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:data_layer/model/request/egg_harvest/egg_harvest_request.dart';
import 'package:data_layer/model/request/growth_stage/update_weight/update_weight_request.dart';
import 'package:data_layer/model/request/prescription/update_status_prescription_request.dart';
import 'package:data_layer/model/request/vaccine_schedule_log/vaccine_schedule_log_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/common/widgets/warning_confirm_dialog.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/constants/task_type_data_constant.dart';
import 'package:smart_farm/src/core/constants/vaccine_schedule_status_constant.dart';
import 'package:smart_farm/src/core/utils/date_util.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/view/widgets/processing_button_widget.dart';
import 'package:smart_farm/src/view/widgets/text_field_required.dart';
import 'package:smart_farm/src/viewmodel/animal_sale/animal_sale_cubit.dart';
import 'package:smart_farm/src/viewmodel/egg_harvest/egg_harvest_cubit.dart';
import 'package:smart_farm/src/viewmodel/growth_stage/growth_stage_cubit.dart';
import 'package:smart_farm/src/viewmodel/index.dart';
import 'package:smart_farm/src/viewmodel/prescription/prescription_cubit.dart';
import 'package:smart_farm/src/viewmodel/sale_type/sale_type_cubit.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';
import 'package:smart_farm/src/viewmodel/task/vaccine_schedule_log/vaccine_schedule_log_cubit.dart';
import 'package:smart_farm/src/viewmodel/upload_image/upload_image_cubit.dart';
import 'package:smart_farm/src/viewmodel/vaccine_schedule/vaccine_schedule_cubit.dart'; // To handle file

class TaskDetailWidget extends StatefulWidget {
  final String taskId;

  const TaskDetailWidget({super.key, required this.taskId});

  // const TaskDetailWidget({super.key});

  @override
  State<TaskDetailWidget> createState() => _TaskDetailWidgetState();
}

class _TaskDetailWidgetState extends State<TaskDetailWidget>
    with SingleTickerProviderStateMixin {
  bool _isProcessing = false;
  bool _isLoading = false;
  bool _isHealthyAfterTreatment = false;

  // --- Task related variables ---
  TaskHaveCageName? task;
  String taskStatus = 'Loading...'; // Start directly at 'in progress'
  GrowthStageDto? growthStage;
  String? userName = '';

  // --- Prescription related variables ---
  PrescriptionDto? prescription;
  String? prescriptionId;

  // --- Weight related variables ---
  DateTime? logTime;
  double? recommendedWeight;
  int actualWeight = 0;
  List<int> weightList = [];

  // --- Food related variables ---
  List<String> foodList = [
    "--- Chọn loại thức ăn ---",
    "Loại thức ăn 1",
    "Loại thức ăn 2",
    "Loại thức ăn 3"
  ];
  String? selectedFood = "--- Chọn loại thức ăn ---";

  // --- Vaccine related variables ---
  List<VaccineScheduleDto> vaccineScheduleList = [];
  VaccineScheduleLogDto? vaccineScheduleLog;
  VaccineScheduleDto? vaccineSchedule;

  // --- Animal sale related variables ---
  SaleTypeDto? saleType;
  DateTime? saleDate;

  // --- Egg harvest related variables ---
  EggHarvestDto? eggHarvest;

  // --- Upload image related variables ---
  UploadImageDto? uploadImage;

  // --- After treatment variables ---
  int _lastSessionQuantity = 0;

  // --- Controllers ---
  final TextEditingController _affectedController = TextEditingController();
  final TextEditingController logController = TextEditingController();
  final TextEditingController morningController = TextEditingController();
  final TextEditingController noonController = TextEditingController();
  final TextEditingController afternoonController = TextEditingController();
  final TextEditingController eveningController = TextEditingController();

  final TextEditingController _countAnimalVaccineController =
      TextEditingController();

  final TextEditingController _nameFoodController = TextEditingController();
  final TextEditingController _priceFoodController = TextEditingController();

  final TextEditingController _countAnimalSellControler =
      TextEditingController();
  final TextEditingController _priceAnimalSellController =
      TextEditingController();
  final TextEditingController _dateAnimalSellController =
      TextEditingController();

  final TextEditingController _weightAnimalController = TextEditingController();

  final TextEditingController _weightMeatSellController =
      TextEditingController();
  final TextEditingController _priceMeatSellController =
      TextEditingController();
  final TextEditingController _countEggSellController = TextEditingController();
  final TextEditingController _priceEggSellController = TextEditingController();

  final TextEditingController _countEggCollectedController =
      TextEditingController();

  final TextEditingController _lastSessionQuantityController =
      TextEditingController();

  // --- Image upload ---
  final List<File> _images = [];

  // --- Medication check state ---
  final Map<String, bool> _medicationChecked = {};

  // --- Lifecycle methods ---
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const UserEvent.getUserProfile());
    context.read<TaskBloc>().add(TaskEvent.getTaskById(widget.taskId));
    _affectedController.text = '0';
    _countAnimalVaccineController.text = '0';
    _countAnimalSellControler.text = '0';
    _weightAnimalController.text = "0.0";
    _weightMeatSellController.text = "0";
    _countEggCollectedController.text = '0';
    _countEggSellController.text = '0';
    _lastSessionQuantityController.text = '0';
    _dateAnimalSellController.text =
        DateFormat('dd/MM/yyyy').format(TimeUtils.customNow());
    saleDate = TimeUtils.customNow();
  }

  @override
  void dispose() {
    _affectedController.dispose();
    logController.dispose();
    morningController.dispose();
    noonController.dispose();
    afternoonController.dispose();
    eveningController.dispose();
    _countAnimalVaccineController.dispose();
    _nameFoodController.dispose();
    _priceFoodController.dispose();
    _countAnimalSellControler.dispose();
    _priceAnimalSellController.dispose();
    _dateAnimalSellController.dispose();
    _weightAnimalController.dispose();
    _weightMeatSellController.dispose();
    _priceMeatSellController.dispose();
    _countEggSellController.dispose();
    _priceEggSellController.dispose();
    _countEggCollectedController.dispose();
    _lastSessionQuantityController.dispose();
    super.dispose();
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

  // Function to check if all medications are checked
  // bool _areAllMedicationsChecked() {
  //   if (task?.taskType.taskTypeId == TaskTypeDataConstant.health) {
  //     return prescription?.medications?.every((medication) =>
  //             _medicationChecked[medication.medicationId] ?? false) ??
  //         false;
  //   }
  //   return true;
  // }

  // Function to check if at least one medication is checked
  bool _areAnyMedicationsChecked() {
    if (task?.taskType.taskTypeId == TaskTypeDataConstant.health) {
      return prescription?.medications?.any((medication) =>
              _medicationChecked[medication.medicationId] ?? false) ??
          false;
    }
    return true;
  }

  bool _isWithinWorkingHours() {
    if (task == null) return false;
    final now = TimeUtils.customNow();
    final startHour = task!.session == 1
        ? 6
        : task!.session == 2
            ? 12
            : task!.session == 3
                ? 14
                : 18;
    final endHour = task!.session == 1
        ? 12
        : task!.session == 2
            ? 14
            : task!.session == 3
                ? 18
                : 23;
    return now.hour >= startHour && now.hour < endHour;
  }

  void _onCreateLog() {
    if (taskStatus == StatusDataConstant.inProgressVn) {
      if (task!.taskType.taskTypeId == TaskTypeDataConstant.feeding) {
        int actualWeight = this.actualWeight;
        final log = DailyFoodUsageLogDto(
            recommendedWeight: recommendedWeight?.toInt() ?? 0,
            actualWeight: actualWeight,
            notes: logController.text,
            logTime: DateTime.now(),
            photo: uploadImage?.path != null
                ? '${dotenv.env['IMAGE_STORAGE_URL']}/${uploadImage!.path}'
                : '',
            taskId: widget.taskId);
        context.read<TaskBloc>().add(
              TaskEvent.createDailyFoodUsageLog(cageId: task!.cageId, log: log),
            );
      } else if (task!.taskType.taskTypeId == TaskTypeDataConstant.health) {
        if (prescriptionId != null) {
          context
              .read<PrescriptionCubit>()
              .checkPrescriptionLastSession(prescriptionId: prescriptionId!);
        }
      } else if (task!.taskType.taskTypeId == TaskTypeDataConstant.vaccin) {
        final request = VaccineScheduleLogRequest(
          date: TimeUtils.customNow().toIso8601String(),
          session: vaccineSchedule!.session,
          vaccineId: vaccineSchedule!.vaccineId,
          quantity: int.parse(_countAnimalVaccineController.text),
          notes: "notes",
          photo: uploadImage?.path != null
              ? '${dotenv.env['IMAGE_STORAGE_URL']}/${uploadImage!.path}'
              : '',
          taskId: widget.taskId,
        );
        context.read<VaccineScheduleLogCubit>().create(request: request);
      } else if (task!.taskType.taskTypeId == TaskTypeDataConstant.weighing) {
        context.read<GrowthStageCubit>().updateWeight(
              request: UpdateWeightRequest(
                growthStageId: growthStage!.id,
                weightAnimal: double.parse(_weightAnimalController.text),
              ),
            );
      } else if (task!.taskType.taskTypeId == TaskTypeDataConstant.sellAnimal) {
        context.read<AnimalSaleCubit>().createAnimalSale(
              growthStageId: growthStage!.id,
              saleDate: saleDate!.toIso8601String(),
              unitPrice:
                  int.parse(_priceMeatSellController.text.replaceAll(',', '')),
              quantity: int.parse(_weightMeatSellController.text),
              saleTypeId: saleType!.id,
            );
      } else if (task!.taskType.taskTypeId == TaskTypeDataConstant.sellEgg) {
        context.read<AnimalSaleCubit>().createAnimalSale(
              growthStageId: growthStage!.id,
              saleDate: saleDate!.toIso8601String(),
              unitPrice:
                  int.parse(_priceEggSellController.text.replaceAll(',', '')),
              quantity: int.parse(_countEggSellController.text),
              saleTypeId: saleType!.id,
            );
      } else if (task!.taskType.taskTypeId == TaskTypeDataConstant.eggHarvest) {
        final request = EggHarvestRequest(
          eggCount: int.parse(_countEggCollectedController.text),
          notes: logController.text,
          growthStageId: growthStage!.id,
          taskId: widget.taskId,
        );
        context.read<EggHarvestCubit>().createEggHarvest(request: request);
      } else {
        context.read<TaskBloc>().add(
              TaskEvent.updateTask(
                widget.taskId,
                StatusDataConstant.done,
              ),
            );
      }
    } else if (taskStatus == StatusDataConstant.pendingVn) {
      if (_isWithinWorkingHours()) {
        context.read<TaskBloc>().add(
              TaskEvent.updateTask(
                  widget.taskId, StatusDataConstant.inProgress),
            );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Chưa đến giờ làm việc của phiên này.')),
        );
      }
    }
  }

  // Function to update task status
  void _updateTaskStatus() {
    if (task?.taskType.taskTypeId == TaskTypeDataConstant.health &&
        taskStatus == StatusDataConstant.inProgressVn &&
        !_areAnyMedicationsChecked()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng xác nhận đã uống thuốc.')),
      );
      return;
    } else if (task?.taskType.taskTypeId == TaskTypeDataConstant.vaccin &&
        taskStatus == StatusDataConstant.inProgressVn &&
        _countAnimalVaccineController.text == '0') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Vui lòng nhập số lượng gia cầm đã tiêm.')),
      );
      return;
    } else if (task?.taskType.taskTypeId == TaskTypeDataConstant.weighing &&
        taskStatus == StatusDataConstant.inProgressVn &&
        _weightAnimalController.text == '0.0') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập số cân nặng trung bình')),
      );
      return;
    } else if (task?.taskType.taskTypeId == TaskTypeDataConstant.sellAnimal &&
        taskStatus == StatusDataConstant.inProgressVn &&
        (_weightMeatSellController.text == '0' ||
            _priceMeatSellController.text.isEmpty ||
            _priceMeatSellController.text == '0')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Vui lòng nhập khối lượng thịt và giá bán hợp lệ')),
      );
      return;
    } else if (task?.taskType.taskTypeId == TaskTypeDataConstant.sellEgg &&
        taskStatus == StatusDataConstant.inProgressVn &&
        (_countEggSellController.text == '0' ||
            _priceEggSellController.text.isEmpty ||
            _priceEggSellController.text == '0')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Vui lòng nhập số lượng trứng và giá bán hợp lệ')),
      );
      return;
    } else if (task?.taskType.taskTypeId == TaskTypeDataConstant.eggHarvest &&
        taskStatus == StatusDataConstant.inProgressVn &&
        _countEggCollectedController.text == '0') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập số lượng trứng thu hoạch')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận'),
          content: Text(taskStatus == StatusDataConstant.pendingVn
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
              onPressed: () async {
                Navigator.of(context).pop();
                if (_images.isNotEmpty) {
                  context
                      .read<UploadImageCubit>()
                      .uploadImage(file: _images.first);
                } else {
                  _onCreateLog();
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
      case StatusDataConstant.inProgress:
        return StatusDataConstant.inProgressVn;
      case StatusDataConstant.done:
        return StatusDataConstant.doneVn;
      case StatusDataConstant.pending:
        return StatusDataConstant.pendingVn;
      case StatusDataConstant.overdue:
        return StatusDataConstant.overdueVn;
      default:
        return status;
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case StatusDataConstant.inProgress:
        return Colors.yellow.shade200;
      case StatusDataConstant.done:
        return Colors.green.shade200;
      case StatusDataConstant.pending:
        return Colors.grey.shade300;
      case StatusDataConstant.overdue:
        return Colors.red.shade200;
      default:
        return Colors.grey.shade300;
    }
  }

  Color getStatusTextColor(String status) {
    switch (status) {
      case StatusDataConstant.inProgress:
        return Colors.black;
      case StatusDataConstant.done:
        return Colors.white;
      case StatusDataConstant.pending:
        return Colors.black;
      case StatusDataConstant.overdue:
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
                  prescriptionId = task.prescriptionId;
                });
                log("Lấy thông tin công việc thành công!");
                if (task.status != StatusDataConstant.pending) {
                  if (task.taskType.taskTypeId ==
                      TaskTypeDataConstant.feeding) {
                    context
                        .read<GrowthStageCubit>()
                        .getRecommendedWeightByCageId(task.cageId);
                  } else if (task.taskType.taskTypeId ==
                          TaskTypeDataConstant.weighing ||
                      task.taskType.taskTypeId ==
                          TaskTypeDataConstant.sellAnimal ||
                      task.taskType.taskTypeId ==
                          TaskTypeDataConstant.sellEgg) {
                    context
                        .read<GrowthStageCubit>()
                        .getGrowthStageByCageId(task.cageId);
                  } else if (task.taskType.taskTypeId ==
                      TaskTypeDataConstant.health) {
                    context
                        .read<PrescriptionCubit>()
                        .getPrescription(prescriptionId ?? '');
                  } else if (task.taskType.taskTypeId ==
                      TaskTypeDataConstant.vaccin) {
                    context
                        .read<GrowthStageCubit>()
                        .getGrowthStageByCageId(task.cageId);
                  } else if (task.taskType.taskTypeId ==
                      TaskTypeDataConstant.eggHarvest) {
                    context
                        .read<GrowthStageCubit>()
                        .getGrowthStageByCageId(task.cageId);
                  }
                }
                if (task.status == StatusDataConstant.done) {
                  if (task.taskType.taskTypeId == TaskTypeDataConstant.vaccin) {
                    context
                        .read<VaccineScheduleLogCubit>()
                        .getVaccineScheduleLogByTaskId(
                          widget.taskId,
                        );
                  } else if (task.taskType.taskTypeId ==
                      TaskTypeDataConstant.eggHarvest) {
                    context.read<EggHarvestCubit>().getEggHarvestByTaskId(
                          taskId: widget.taskId,
                        );
                  }
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
                setState(() {
                  _isProcessing = true;
                });
                log("Đang cập nhật trạng thái công việc...");
              },
              updateStatusTaskSuccess: () async {
                setState(() {
                  _isProcessing = false;
                });
                log("Cập nhật trạng thái công việc thành công!");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content:
                          Text('Cập nhật trạng thái công việc thành công!')),
                );
                context.pop(true); // Pass true to indicate success
              },
              updateStatusTaskFailure: (e) async {
                setState(() {
                  _isProcessing = false;
                });
                log("Cập nhật trạng thái công việc thất bại! \nError: $e");
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
                    widget.taskId, StatusDataConstant.done));
              },
              createDailyFoodUsageLogFailure: (e) async {
                setState(() {
                  _isProcessing = false;
                });
                context
                    .read<UploadImageCubit>()
                    .deleteImage(id: uploadImage!.id);
                LoadingDialog.hide(context);
                log("Tạo log cho ăn thất bại!");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(e.toString())),
                );
              },
              createHealthLogLoading: () {
                setState(() {
                  _isProcessing = true;
                });
                log("Đang tạo log uống thuốc...");
              },
              createHealthLogSuccess: () async {
                log("Tạo log uống thuốc thành công!");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Tạo log uống thuốc thành công!')),
                );
                context.read<TaskBloc>().add(TaskEvent.updateTask(
                    widget.taskId, StatusDataConstant.done));
              },
              createHealthLogFailure: (e) async {
                context
                    .read<UploadImageCubit>()
                    .deleteImage(id: uploadImage!.id);
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
                    widget.taskId, StatusDataConstant.done));
              },
              createVaccinScheduleLogFailure: (e) async {
                context
                    .read<UploadImageCubit>()
                    .deleteImage(id: uploadImage!.id);
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
                if (task?.status == StatusDataConstant.done) {
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
              getGrowthStageByCageIdInProgress: () {
                log('Đang lấy giai đoạn phát triển cho chuồng ${task?.cageName}...');
              },
              getGrowthStageByCageIdSuccess: (growthStage) {
                log('Lấy giai đoạn phát triển thành công!');
                setState(() {
                  this.growthStage = growthStage;
                });
                if (task?.taskType.taskTypeId == TaskTypeDataConstant.vaccin &&
                    task?.status == StatusDataConstant.inProgress) {
                  context
                      .read<VaccineScheduleCubit>()
                      .getVaccineScheduleByStageId(
                        stageId: growthStage.id,
                        date: TimeUtils.customNow(),
                        status: VaccineScheduleStatusConstant.UPCOMING,
                      );
                } else if (task?.taskType.taskTypeId ==
                    TaskTypeDataConstant.sellAnimal) {
                  context
                      .read<SaleTypeCubit>()
                      .getSaleTypeByName(saleTypeName: 'MeatSale');
                } else if (task?.taskType.taskTypeId ==
                    TaskTypeDataConstant.sellEgg) {
                  context
                      .read<SaleTypeCubit>()
                      .getSaleTypeByName(saleTypeName: 'EggSale');
                } else if (task?.taskType.taskTypeId ==
                        TaskTypeDataConstant.weighing &&
                    task?.status == StatusDataConstant.done) {
                  setState(() {
                    _weightAnimalController.text =
                        growthStage.weightAnimal.toString();
                  });
                }
              },
              getGrowthStageByCageIdFailure: (e) {
                log('Lấy giai đoạn phát triển thất bại!');
              },
              updateWeightInProgress: () {
                setState(() {
                  _isProcessing = true;
                });
              },
              updateWeightSuccess: (result) {
                log('Cập nhật cân nặng thành công!');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Cập nhật cân nặng thành công!')),
                );
                setState(() {
                  _isProcessing = false;
                });
                context.read<TaskBloc>().add(TaskEvent.updateTask(
                    widget.taskId, StatusDataConstant.done));
              },
              updateWeightFailure: (e) {
                log('Cập nhật cân nặng thất bại!');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cập nhật cân nặng thất bại!')),
                );
                setState(() {
                  _isProcessing = false;
                });
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
                  _lastSessionQuantity = prescription.quantityAnimal;
                });
              },
              getPrescriptionFailure: (e) {
                log('Lấy thuốc thất bại!');
              },
              updatePrescriptionStatusInProgress: () {
                LoadingDialog.show(context, 'Đang cập nhật tình trạng...');
              },
              updatePrescriptionStatusSuccess: () {
                LoadingDialog.hide(context);
                context.pop();
                ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                  content: const Text('Đã cập nhật tình trạng!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .hideCurrentMaterialBanner();
                      },
                      child: const Text('Đóng'),
                    ),
                  ],
                ));
              },
              updatePrescriptionStatusFailure: (e) {
                LoadingDialog.hide(context);
                ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                  content: const Text('Cập nhật tình trạng thất bại!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .hideCurrentMaterialBanner();
                      },
                      child: const Text('Đóng'),
                    ),
                  ],
                ));
              },
              checkPrescriptionLastSessionInProgress: () {
                setState(() {
                  _isProcessing = true;
                });
              },
              checkPrescriptionLastSessionSuccess: (isLastSession) {
                setState(() {
                  _isProcessing = false;
                });
                // if (isLastSession == false) {
                //   final log = HealthLogDto(
                //     prescriptionId: prescriptionId ?? '',
                //     date: DateTime.now(),
                //     notes: logController.text,
                //     photo: uploadImage?.path != null
                //         ? '${dotenv.env['IMAGE_STORAGE_URL']}/${uploadImage!.path}'
                //         : '',
                //     taskId: widget.taskId);
                // context.read<TaskBloc>().add(TaskEvent.createHealthLog(
                //     prescriptionId: prescriptionId ?? '', log: log));
                // } else {
                //   showDialog(
                //       context: context,
                //       builder: (context) => WarningConfirmationDialog(
                //           title: 'Cập nhật sau điều trị',
                //           content: _buildLastSessionForm(),
                //           secondaryButtonText: 'Đóng',
                //           primaryButtonText: 'Xác nhận',
                //           onPrimaryButtonPressed: () {},
                //           onSecondaryButtonPressed: () {
                //             context.pop();
                //           }));
                // }
                showDialog(
                    context: context,
                    builder: (context) => WarningConfirmationDialog(
                        isEmergency: true,
                        title: 'Cập nhật sau điều trị',
                        content: _buildLastSessionForm(),
                        secondaryButtonText: 'Đóng',
                        primaryButtonText: 'Xác nhận',
                        onPrimaryButtonPressed: () {
                          final request = UpdateStatusPrescriptionRequest(
                              status: 'Complete',
                              remainingQuantity: _lastSessionQuantity);
                          context
                              .read<PrescriptionCubit>()
                              .updateQuantityAnimalAfterTreatment(
                                  prescriptionId: prescriptionId!,
                                  request: request);
                        },
                        onSecondaryButtonPressed: () {
                          setState(() {
                            _lastSessionQuantity = prescription!.quantityAnimal;
                            _isHealthyAfterTreatment = false;
                          });
                          context.pop();
                          _lastSessionQuantityController.text = '0';
                        }));
              },
              checkPrescriptionLastSessionFailure: (message) {
                setState(() {
                  _isProcessing = false;
                });
              },
              updateQuantityAnimalAfterTreatmentInProgress: () {},
              updateQuantityAnimalAfterTreatmentSuccess: () {
                context.pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text(
                          'Cập nhật số lượng gia cầm sau điều trị thành công!')),
                );
                final log = HealthLogDto(
                    prescriptionId: prescriptionId ?? '',
                    date: DateTime.now(),
                    notes: logController.text,
                    photo: uploadImage?.path != null
                        ? '${dotenv.env['IMAGE_STORAGE_URL']}/${uploadImage!.path}'
                        : '',
                    taskId: widget.taskId);
                context.read<TaskBloc>().add(TaskEvent.createHealthLog(
                    prescriptionId: prescriptionId ?? '', log: log));
              },
              updateQuantityAnimalAfterTreatmentFailure: (message) {
                setState(() {
                  _isProcessing = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text(
                          'Cập nhật số lượng gia cầm sau điều trị thất bại!')),
                );
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<VaccineScheduleCubit, VaccineScheduleState>(
          listener: (context, state) {
            state.maybeWhen(
              getVaccineScheduleByStageIdInProgress: () {
                setState(() {
                  _isLoading = true;
                });
              },
              getVaccineScheduleByStageIdSuccess: (vaccineScheduleList) {
                setState(() {
                  this.vaccineScheduleList = vaccineScheduleList;
                  _isLoading = false;
                });
              },
              getVaccineScheduleByStageIdFailure: (e) {
                setState(() {
                  _isLoading = false;
                });
              },
              getVaccineScheduleByIdInProgress: () {
                setState(() {
                  _isLoading = true;
                });
              },
              getVaccineScheduleByIdSuccess: (vaccineSchedule) {
                setState(() {
                  _isLoading = false;
                  this.vaccineSchedule = vaccineSchedule;
                  _countAnimalVaccineController.text =
                      vaccineSchedule.quantity.toString();
                });
              },
              getVaccineScheduleByIdFailure: (message) {
                setState(() {
                  _isLoading = false;
                });
                log('Lấy lịch tiêm chủng thất bại!');
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<VaccineScheduleLogCubit, VaccineScheduleLogState>(
          listener: (context, state) {
            state.maybeWhen(
              createVaccineScheduleLogInProgress: () {
                setState(() {
                  _isProcessing = true;
                });
              },
              createVaccineScheduleLogSuccess: () {
                log('Tạo log lịch tiêm chủng thành công!');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Tạo log lịch tiêm chủng thành công!')),
                );
                context.read<TaskBloc>().add(TaskEvent.updateTask(
                    widget.taskId, StatusDataConstant.done));
              },
              createVaccineScheduleLogFailure: (e) {
                context
                    .read<UploadImageCubit>()
                    .deleteImage(id: uploadImage!.id);
                log('Tạo log lịch tiêm chủng thất bại!');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Tạo log lịch tiêm chủng thất bại!')),
                );
              },
              getVaccineScheduleLogByTaskIdInProgress: () {
                log('Đang lấy log lịch tiêm chủng...');
                setState(() {
                  _isLoading = true;
                });
              },
              getVaccineScheduleLogByTaskIdSuccess: (vaccineScheduleLog) {
                setState(() {
                  this.vaccineScheduleLog = vaccineScheduleLog;
                });
                context
                    .read<VaccineScheduleCubit>()
                    .getVaccineScheduleById(id: vaccineScheduleLog.scheduleId);
              },
              getVaccineScheduleLogByTaskIdFailure: (error) {
                log('Lấy log lịch tiêm chủng thất bại!');
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<AnimalSaleCubit, AnimalSaleState>(
          listener: (context, state) {
            state.maybeWhen(
              createAnimalSaleInProgress: () {
                setState(() {
                  _isProcessing = true;
                });
              },
              createAnimalSaleSuccess: () {
                log('Tạo log bán gia cầm thành công!');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Tạo log bán gia cầm thành công!')),
                );
                context.read<TaskBloc>().add(TaskEvent.updateTask(
                    widget.taskId, StatusDataConstant.done));
              },
              createAnimalSaleFailure: (e) {
                context
                    .read<UploadImageCubit>()
                    .deleteImage(id: uploadImage!.id);
                setState(() {
                  _isProcessing = false;
                });
                log('Tạo log bán gia cầm thất bại!');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Tạo log bán gia cầm thất bại!')),
                );
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<SaleTypeCubit, SaleTypeState>(
          listener: (context, state) {
            state.maybeWhen(
              getByNameSuccess: (saleTypes) {
                setState(() {
                  saleType = saleTypes.first;
                });
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<EggHarvestCubit, EggHarvestState>(
          listener: (context, state) {
            state.maybeWhen(
              createEggHarvestLogInProgress: () {
                setState(() {
                  _isProcessing = true;
                });
              },
              createEggHarvestLogSuccess: () {
                log('Tạo log thu hoạch trứng thành công!');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Tạo log thu hoạch trứng thành công!')),
                );
                context.read<TaskBloc>().add(TaskEvent.updateTask(
                    widget.taskId, StatusDataConstant.done));
              },
              createEggHarvestLogFailure: (e) {
                context
                    .read<UploadImageCubit>()
                    .deleteImage(id: uploadImage!.id);
                setState(() {
                  _isProcessing = false;
                });
                log('Tạo log thu hoạch trứng thất bại!');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Tạo log thu hoạch trứng thất bại!')),
                );
              },
              getEggHarvestLogsByTaskIdInProgress: () {
                log('Đang lấy log thu hoạch trứng...');
                setState(() {
                  _isLoading = true;
                });
              },
              getEggHarvestLogsByTaskIdSuccess: (eggHarvest) {
                setState(() {
                  this.eggHarvest = eggHarvest;
                  _isLoading = false;
                  _countEggCollectedController.text =
                      eggHarvest.eggCount.toString();
                });
              },
              getEggHarvestLogsByTaskIdFailure: (e) {
                log('Lấy log thu hoạch trứng thất bại!');
                setState(() {
                  _isLoading = false;
                });
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<UploadImageCubit, UploadImageState>(
          listener: (context, state) {
            state.maybeWhen(
              uploadImageInProgress: () {
                setState(() {
                  _isProcessing = true;
                });
                log('Đang tải ảnh lên...');
              },
              uploadImageSuccess: (imageDto) {
                setState(() {
                  uploadImage = imageDto;
                });
                log('Tải ảnh lên thành công!');
                _onCreateLog();
              },
              uploadImageFailure: (e) {
                setState(() {
                  _isProcessing = false;
                });
                log('Tải ảnh lên thất bại!');
                SnackBar(content: Text(e));
              },
              deleteImageInProgress: () {
                setState(() {
                  _isProcessing = true;
                });
                log('Đang xóa ảnh...');
              },
              deleteImageSuccess: () {
                setState(() {
                  uploadImage = null;
                });
                log('Xóa ảnh thành công!');
              },
              deleteImageFailure: (e) {
                setState(() {
                  _isProcessing = false;
                });
                log('Xóa ảnh thất bại!');
                SnackBar(content: Text(e));
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            state.maybeWhen(
              getUserProfileInProgress: () {
                log('Đang lấy thông tin người dùng...');
              },
              getUserProfileSuccess: (userName, _) {
                setState(() {
                  this.userName = userName;
                });
              },
              getUserProfileFailure: (e) {
                log('Lấy thông tin người dùng thất bại!');
              },
              orElse: () {},
            );
          },
        )
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          appBarHeight: 70,
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back)),
          title: Column(children: [
            const Text('Chi tiết công việc'),
            Text(CustomDateUtils.formatDate(TimeUtils.customNow()),
                style: Theme.of(context).textTheme.bodyMedium)
          ]),
          actions: [
            if (task?.taskType.taskTypeId == TaskTypeDataConstant.health &&
                task?.status == StatusDataConstant.inProgress) ...[
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.power_settings_new_rounded),
                              title: Text('Kết thúc điều trị'),
                              onTap: () {
                                Navigator.pop(context);
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return WarningConfirmationDialog(
                                      isEmergency: true,
                                      title: 'Kết thúc điều trị',
                                      content: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                              'Bạn đã chắc chắn xác nhận kết thúc điều trị?. Chủ trang trại sẽ nhận được việc kết thúc điều trị với lý do sau: '),
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  top: 12),
                                              padding: const EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primaryContainer,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .outlineVariant,
                                                ),
                                              ),
                                              child: Row(children: [
                                                Text(
                                                  'Lý do: ',
                                                ),
                                                Text('Đàn gà chết hết',
                                                    style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    )),
                                              ])),
                                        ],
                                      ),
                                      secondaryButtonText: 'Hủy',
                                      primaryButtonText: 'Xác nhận',
                                      onPrimaryButtonPressed: () {
                                        if (prescriptionId != null) {
                                          final request =
                                              UpdateStatusPrescriptionRequest(
                                            status: 'Dead',
                                            remainingQuantity: 0,
                                          );
                                          context
                                              .read<PrescriptionCubit>()
                                              .updatePrescriptionStatus(
                                                prescriptionId:
                                                    prescriptionId ?? '',
                                                request: request,
                                              );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showMaterialBanner(
                                                  MaterialBanner(
                                            content: const Text(
                                                'Không nhận được mã đơn thuốc!'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentMaterialBanner();
                                                },
                                                child: const Text('Đóng'),
                                              ),
                                            ],
                                          ));
                                        }
                                      },
                                      onSecondaryButtonPressed: () {
                                        context.pop();
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              )
            ]
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<UserBloc>().add(const UserEvent.getUserProfile());
            context.read<TaskBloc>().add(TaskEvent.getTaskById(widget.taskId));
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      top: 24, left: 20, right: 20, bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Thông tin công việc',
                          style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 16),
                      Row(children: [
                        Icon(
                          Icons.task_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 8),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tên công việc',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                    fontSize: 13,
                                  )),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  const SizedBox(width: 4),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Text(
                                      task?.taskName ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ])
                      ]),
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
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 24, right: 20),
                  decoration: BoxDecoration(
                    border: Border(
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
                    itemCount: 6,
                    // Tổng số phần tử trong lưới
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return _buildGridItem(
                            context,
                            icon: LinearIcons.homeHashtagIcon,
                            label: 'Tên chuồng',
                            value: task?.isTreatmentTask == true
                                ? 'Chuồng cách ly'
                                : task?.cageName ?? "",
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
                          return _buildGridItem(
                            context,
                            icon: Icon(Icons.wb_sunny_outlined),
                            label: 'Buổi',
                            value: TimeUtils.getCurrentSessionName(),
                          );
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
                              TaskTypeDataConstant.vaccin ||
                          task?.taskType.taskTypeId ==
                              TaskTypeDataConstant.sellAnimal ||
                          task?.taskType.taskTypeId ==
                              TaskTypeDataConstant.weighing ||
                          task?.taskType.taskTypeId ==
                              TaskTypeDataConstant.eggHarvest ||
                          task?.taskType.taskTypeId ==
                              TaskTypeDataConstant.sellEgg)
                      ? _buildWorkTab(context)
                      : const Text(
                          '(!) Loại công việc này không cần tạo đơn báo cáo hằng ngày.',
                        ),
                )
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: FilledButton(
            onPressed: _isProcessing
                ? null
                : (taskStatus == StatusDataConstant.doneVn ||
                        taskStatus == StatusDataConstant.overdueVn ||
                        (taskStatus == StatusDataConstant.pendingVn &&
                                !_isWithinWorkingHours() ||
                            taskStatus == StatusDataConstant.inProgressVn &&
                                task?.taskType.taskTypeId ==
                                    TaskTypeDataConstant.health &&
                                !_areAnyMedicationsChecked()))
                    ? null
                    : _updateTaskStatus,
            child: _isProcessing
                ? ProcessingButtonWidget(loadingMessage: 'Đang xác nhận...')
                : _contentButton(),
          ),
        ),
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
    bool isPending = taskStatus == StatusDataConstant.pendingVn;
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
                      taskStatus == StatusDataConstant.pendingVn &&
                              !_isWithinWorkingHours()
                          ? 'Bạn chỉ có thể bắt đầu công việc trong đúng buổi đã được phân công.'
                          : 'Xác nhận bắt đầu để có thể tạo đơn báo cáo và hoàn thành công việc.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          ),
                    ),
                  ),
                ],
              ),
            )
          else ...[
            Text('Báo cáo công việc', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
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
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tên báo cáo công việc',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.outline),
                            ),
                            Text('Đơn báo cáo cho ăn',
                                style: Theme.of(context).textTheme.titleLarge)
                          ]),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(children: [
                    _buildInfoItem(
                      context: context,
                      label: 'Tên người báo cáo',
                      value: userName ?? 'Đang tải...',
                    ),
                    const SizedBox(width: 24),
                    _buildInfoItem(
                        context: context,
                        label: 'Ngày báo cáo',
                        value:
                            CustomDateUtils.formatDate(TimeUtils.customNow())),
                  ]),
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
                                '${recommendedWeight != null ? recommendedWeight?.toInt() : 0} (g)',
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
                                              StatusDataConstant.done ||
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
                              bool isDisabled = task?.status ==
                                      StatusDataConstant.done ||
                                  task?.status == StatusDataConstant.overdue;
                              return FilterChip(
                                selected: isSelected,
                                showCheckmark: false,
                                label: Text('$weight (g)'),
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
                                  .withOpacity(
                                      task?.status == StatusDataConstant.done
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
                                              StatusDataConstant.done
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
                                                StatusDataConstant.done
                                            ? Theme.of(context)
                                                .colorScheme
                                                .outline
                                            : null,
                                      ),
                                ),
                                Text(
                                  '$actualWeight (g)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: task?.status ==
                                                StatusDataConstant.done
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
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tên báo cáo công việc',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                              ),
                              Text('Đơn báo cáo cho uống thuốc',
                                  style: Theme.of(context).textTheme.titleLarge)
                            ]),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(children: [
                      _buildInfoItem(
                        context: context,
                        label: 'Tên người báo cáo',
                        value: userName ?? 'Đang tải...',
                      ),
                      const SizedBox(width: 24),
                      _buildInfoItem(
                          context: context,
                          label: 'Ngày báo cáo',
                          value: CustomDateUtils.formatDate(
                              TimeUtils.customNow())),
                    ]),
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
                                Icon(Icons.info_outline,
                                    color:
                                        Theme.of(context).colorScheme.primary),
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
                                  context: context,
                                  label: 'Số ngày uống',
                                  value: '${prescription?.daysToTake} ngày',
                                  icon: Icons.calendar_today,
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.16),
                                _buildInfoItem(
                                  context: context,
                                  label: 'Số lượng',
                                  value: '${prescription?.quantityAnimal} con',
                                  icon: Icons.pets,
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                _buildInfoItem(
                                  context: context,
                                  label: 'Chuồng ban đầu',
                                  value: task?.cageAnimalName ?? "Đang tải",
                                  icon: Icons.warehouse_rounded,
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
                      ...prescription?.medications?.where((medication) {
                            // Chỉ hiển thị thuốc có liều > 0 theo session
                            int dose = task?.session == 1
                                ? medication.morning
                                : task?.session == 2
                                    ? medication.noon
                                    : task?.session == 3
                                        ? medication.afternoon
                                        : medication.evening;
                            return dose > 0;
                          }).map((medication) => Container(
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
                                        // Thêm checkbox với alignment center
                                        if (task?.status !=
                                            StatusDataConstant.done)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Center(
                                              child: SizedBox(
                                                width: 24,
                                                height: 24,
                                                child: Checkbox(
                                                  value: _medicationChecked[
                                                          medication
                                                              .medicationId] ??
                                                      false,
                                                  onChanged: task?.status ==
                                                          StatusDataConstant
                                                              .inProgress
                                                      ? (bool? value) {
                                                          setState(() {
                                                            _medicationChecked[
                                                                    medication
                                                                        .medicationId] =
                                                                value ?? false;
                                                          });
                                                        }
                                                      : null,
                                                ),
                                              ),
                                            ),
                                          ),
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
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        Text(
                                          'Liều uống:',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          '${task?.session == 1 ? medication.morning : task?.session == 2 ? medication.noon : task?.session == 3 ? medication.afternoon : medication.evening} liều',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )) ??
                          [],
                    ] else ...[
                      const SizedBox(height: 20),
                      const Center(
                        child: Text('Không có thông tin đơn thuốc'),
                      ),
                    ]
                  ],
                ),
              )
            else if (task?.taskType.taskTypeId == TaskTypeDataConstant.vaccin)
              _isLoading
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                          child: Column(children: [
                        CircularProgressIndicator(),
                        const SizedBox(height: 8),
                        const Text('Đang tải báo cáo...')
                      ])),
                    )
                  : Container(
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
                              const SizedBox(width: 10),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tên báo cáo công việc',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline),
                                    ),
                                    Text('Đơn báo cáo tiêm vắc xin',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge)
                                  ]),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(children: [
                            _buildInfoItem(
                              context: context,
                              label: 'Tên người báo cáo',
                              value: userName ?? 'Đang tải...',
                            ),
                            const SizedBox(width: 24),
                            _buildInfoItem(
                                context: context,
                                label: 'Ngày báo cáo',
                                value: CustomDateUtils.formatDate(
                                    TimeUtils.customNow())),
                          ]),
                          const SizedBox(height: 16),
                          if (_isLoading)
                            Center(
                              child: CircularProgressIndicator(),
                            )
                          else if (vaccineScheduleList.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Danh sách lịch tiêm chủng',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 8),
                                ...vaccineScheduleList.map(
                                  (vaccineSchedule) {
                                    return Container(
                                      padding: const EdgeInsets.all(16),
                                      margin: const EdgeInsets.only(bottom: 16),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer
                                            .withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.info_outline,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                              const SizedBox(width: 8),
                                              Text(
                                                'Thông tin về vắc xin',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          Row(
                                            children: [
                                              _buildInfoItem(
                                                context: context,
                                                label: 'Ngày tiêm',
                                                value: DateFormat('dd/MM/yyyy')
                                                    .format(
                                                        vaccineSchedule.date),
                                                icon: Icons.calendar_month,
                                              ),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.1),
                                              _buildInfoItem(
                                                context: context,
                                                label: 'Giai đoạn phát triển',
                                                value: growthStage?.name ??
                                                    "Đang tải...",
                                                icon: Icons.pets,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          Row(
                                            children: [
                                              _buildInfoItem(
                                                context: context,
                                                label: 'Độ tuổi tiêm',
                                                value:
                                                    '${vaccineSchedule.applicationAge} tuổi',
                                                icon: Icons
                                                    .health_and_safety_rounded,
                                              ),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.12),
                                              _buildInfoItem(
                                                context: context,
                                                label: 'Buổi tiêm',
                                                value: vaccineSchedule
                                                            .session ==
                                                        1
                                                    ? 'Sáng'
                                                    : vaccineSchedule.session ==
                                                            2
                                                        ? 'Trưa'
                                                        : vaccineSchedule
                                                                    .session ==
                                                                3
                                                            ? 'Chiều'
                                                            : 'Tối',
                                                icon: Icons.wb_sunny_rounded,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 16),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 12),
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .outlineVariant,
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary
                                                          .withOpacity(0.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/medicine.png',
                                                      width: 24,
                                                      height: 24,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 12),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Tên vắc xin',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .outline)),
                                                      Text(
                                                        vaccineSchedule
                                                            .vaccineName,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium,
                                                      ),
                                                    ],
                                                  ),
                                                ]),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )
                          else if (vaccineSchedule != null)
                            Container(
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(bottom: 16),
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
                                      Icon(Icons.info_outline,
                                          color:
                                              Theme.of(context).primaryColor),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Thông tin về vắc xin',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      _buildInfoItem(
                                        context: context,
                                        label: 'Ngày tiêm',
                                        value: DateFormat('dd/MM/yyyy')
                                            .format(vaccineSchedule!.date),
                                        icon: Icons.calendar_month,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1),
                                      _buildInfoItem(
                                        context: context,
                                        label: 'Giai đoạn phát triển',
                                        value:
                                            growthStage?.name ?? "Đang tải...",
                                        icon: Icons.pets,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      _buildInfoItem(
                                        context: context,
                                        label: 'Độ tuổi tiêm',
                                        value:
                                            '${vaccineSchedule!.applicationAge} tuổi',
                                        icon: Icons.health_and_safety_rounded,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.12),
                                      _buildInfoItem(
                                        context: context,
                                        label: 'Buổi tiêm',
                                        value: vaccineSchedule!.session == 1
                                            ? 'Sáng'
                                            : vaccineSchedule!.session == 2
                                                ? 'Trưa'
                                                : vaccineSchedule!.session == 3
                                                    ? 'Chiều'
                                                    : 'Tối',
                                        icon: Icons.wb_sunny_rounded,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
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
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Tên vắc xin',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .outline)),
                                              Text(
                                                vaccineSchedule!.vaccineName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          else
                            const Center(
                              child: Text('Chưa có dữ liệu lịch tiêm'),
                            ),
                          const SizedBox(height: 16),
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
                                  'Số lượng gia cầm đã tiêm',
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
                                                _countAnimalVaccineController
                                                    .text) ??
                                            0;
                                        setState(() {
                                          _countAnimalVaccineController.text =
                                              (currentValue - 1).toString();
                                        });
                                      },
                                      isDisable: vaccineScheduleLog != null,
                                    ),
                                    Container(
                                      width: 80,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: TextField(
                                        controller:
                                            _countAnimalVaccineController,
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
                                                _countAnimalVaccineController
                                                    .text) ??
                                            0;
                                        setState(() {
                                          _countAnimalVaccineController.text =
                                              (currentValue + 1).toString();
                                        });
                                      },
                                      isAdd: true,
                                      isDisable: vaccineScheduleLog != null,
                                    ),
                                  ],
                                ),
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
                                      'Ước lượng: 5 con.',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
            // else if (task?.taskType.taskTypeId == TaskTypeDataConstant.addFood)
            //   Container(
            //     padding: const EdgeInsets.all(16),
            //     decoration: BoxDecoration(
            //       color: Theme.of(context).colorScheme.surface,
            //       borderRadius: BorderRadius.circular(12),
            //       border: Border.all(
            //         color: Theme.of(context).colorScheme.outlineVariant,
            //       ),
            //     ),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //           children: [
            //             Icon(
            //               Icons.warehouse_rounded,
            //               color: Theme.of(context).colorScheme.primary,
            //             ),
            //             const SizedBox(width: 10),
            //             Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     'Tên báo cáo công việc',
            //                     style: TextStyle(
            //                         color:
            //                             Theme.of(context).colorScheme.outline),
            //                   ),
            //                   Text('Đơn báo cáo nhập thức ăn',
            //                       style: Theme.of(context).textTheme.titleLarge)
            //                 ]),
            //           ],
            //         ),
            //         const SizedBox(height: 8),
            //         Row(children: [
            //           _buildInfoItem(
            //             context: context,
            //             label: 'Tên người báo cáo',
            //             value: userName ?? 'Đang tải...',
            //           ),
            //           const SizedBox(width: 24),
            //           _buildInfoItem(
            //               context: context,
            //               label: 'Ngày báo cáo',
            //               value: CustomDateUtils.formatDate(
            //                   TimeUtils.customNow())),
            //         ]),
            //         const SizedBox(height: 20),
            //         Container(
            //           padding: const EdgeInsets.all(12),
            //           decoration: BoxDecoration(
            //             color: Theme.of(context)
            //                 .colorScheme
            //                 .primaryContainer
            //                 .withOpacity(0.2),
            //             borderRadius: BorderRadius.circular(8),
            //           ),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Row(
            //                 children: [
            //                   Icon(Icons.info_outline,
            //                       color: Theme.of(context).primaryColor),
            //                   const SizedBox(width: 8),
            //                   Text(
            //                     'Thông tin về kho thức ăn',
            //                     style: Theme.of(context)
            //                         .textTheme
            //                         .titleMedium
            //                         ?.copyWith(
            //                             color: Theme.of(context)
            //                                 .colorScheme
            //                                 .primary),
            //                   ),
            //                 ],
            //               ),
            //               const SizedBox(height: 12),
            //               Row(
            //                 children: [
            //                   _buildInfoItem(
            //                     context: context,
            //                     label: 'Khối lượng hiện tại',
            //                     value: '200 (kg)',
            //                     icon: Icons.calendar_month,
            //                   ),
            //                   SizedBox(
            //                       width:
            //                           MediaQuery.of(context).size.width * 0.07),
            //                   _buildInfoItem(
            //                     context: context,
            //                     label: 'Giá trung bình/kg',
            //                     value: '20.000 (VND)',
            //                     icon: Icons.pets,
            //                   ),
            //                 ],
            //               ),
            //               const SizedBox(height: 12),
            //               Row(
            //                 children: [
            //                   _buildInfoItem(
            //                     context: context,
            //                     label: 'Mức cảnh báo tồn kho',
            //                     value: 'Cảnh báo thấp',
            //                     icon: Icons.medical_services_rounded,
            //                     warningLevel: 1,
            //                   ),
            //                 ],
            //               ),
            //               const SizedBox(height: 12),
            //               _buildInfoItem(
            //                 context: context,
            //                 label: 'Ngày cập nhật gần nhất',
            //                 value: '21/02/2025',
            //                 icon: Icons.calendar_today,
            //               ),
            //             ],
            //           ),
            //         ),
            //         const SizedBox(height: 16),
            //         Text('Form nhập liệu',
            //             style: Theme.of(context).textTheme.titleMedium),
            //         const SizedBox(height: 8),
            //         Container(
            //           margin: const EdgeInsets.only(bottom: 12),
            //           padding: const EdgeInsets.all(12),
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(12),
            //             border: Border.all(
            //               color: Theme.of(context).colorScheme.outlineVariant,
            //             ),
            //           ),
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 8.0),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 DropdownButtonFormField<String>(
            //                   decoration: InputDecoration(
            //                     labelText: 'Chọn loại thức ăn',
            //                     border: OutlineInputBorder(
            //                       borderRadius: BorderRadius.circular(8),
            //                     ),
            //                   ),
            //                   value: selectedFood,
            //                   onChanged: (String? value) {
            //                     setState(() {
            //                       selectedFood = value;
            //                     });
            //                   },
            //                   items: foodList
            //                       .map((food) => DropdownMenuItem(
            //                             value: food,
            //                             child: Text(food),
            //                           ))
            //                       .toList(),
            //                 ),
            //                 const SizedBox(height: 16),
            //                 TextFormField(
            //                   controller: _nameFoodController,
            //                   decoration: InputDecoration(
            //                     labelText: 'Nhập tên thức ăn',
            //                     border: OutlineInputBorder(
            //                       borderRadius: BorderRadius.circular(8),
            //                     ),
            //                   ),
            //                 ),
            //                 const SizedBox(height: 24),
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       'Khối lượng thức ăn nhập vào',
            //                       style: Theme.of(context).textTheme.titleSmall,
            //                     ),
            //                     const SizedBox(height: 16),
            //                     Row(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: [
            //                         _buildQuantityButton(
            //                           icon: Icons.remove,
            //                           onPressed: () {
            //                             final currentValue = double.tryParse(
            //                                     _affectedController.text) ??
            //                                 0;
            //                             if (currentValue > 0) {
            //                               setState(() {
            //                                 _affectedController.text =
            //                                     (currentValue - 1).toString();
            //                               });
            //                             }
            //                           },
            //                         ),
            //                         Container(
            //                           width: 80,
            //                           margin: const EdgeInsets.symmetric(
            //                               horizontal: 16),
            //                           child: TextField(
            //                             controller: _affectedController,
            //                             textAlign: TextAlign.center,
            //                             keyboardType: TextInputType.number,
            //                             style: const TextStyle(
            //                               fontSize: 24,
            //                               fontWeight: FontWeight.w600,
            //                             ),
            //                             decoration: const InputDecoration(
            //                               border: InputBorder.none,
            //                               contentPadding: EdgeInsets.zero,
            //                             ),
            //                           ),
            //                         ),
            //                         _buildQuantityButton(
            //                           icon: Icons.add,
            //                           onPressed: () {
            //                             final currentValue = double.tryParse(
            //                                     _affectedController.text) ??
            //                                 0;
            //                             setState(() {
            //                               _affectedController.text =
            //                                   (currentValue + 1).toString();
            //                             });
            //                           },
            //                           isAdd: true,
            //                         ),
            //                       ],
            //                     ),
            //                     const SizedBox(height: 16),
            //                     Row(
            //                       children: [
            //                         Icon(
            //                           Icons.info_outline,
            //                           size: 16,
            //                           color: Colors.grey[600],
            //                         ),
            //                         const SizedBox(width: 4),
            //                         Row(children: [
            //                           Text(
            //                             'Đơn vị tính: ',
            //                             style: TextStyle(
            //                               color: Colors.grey[600],
            //                               fontSize: 13,
            //                             ),
            //                           ),
            //                           Text(
            //                             'kg.',
            //                             style: TextStyle(
            //                                 fontWeight: FontWeight.bold),
            //                           )
            //                         ])
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //                 const SizedBox(height: 24),
            //                 TextFormField(
            //                   controller: _priceFoodController,
            //                   keyboardType: TextInputType.number,
            //                   decoration: InputDecoration(
            //                     labelText: 'Nhập giá tiền (VND)',
            //                     border: OutlineInputBorder(
            //                       borderRadius: BorderRadius.circular(8),
            //                     ),
            //                     suffixText: 'VND',
            //                   ),
            //                   onChanged: (value) {
            //                     if (value.isNotEmpty) {
            //                       final formatter = NumberFormat('#,###');
            //                       final newValue = formatter.format(
            //                           int.parse(value.replaceAll(',', '')));
            //                       _priceFoodController.value = TextEditingValue(
            //                         text: newValue,
            //                         selection: TextSelection.collapsed(
            //                             offset: newValue.length),
            //                       );
            //                     }
            //                   },
            //                 ),
            //                 const SizedBox(height: 8),
            //                 Row(
            //                   children: [
            //                     Icon(
            //                       Icons.info_outline,
            //                       size: 16,
            //                       color: Colors.grey[600],
            //                     ),
            //                     const SizedBox(width: 4),
            //                     Row(children: [
            //                       Text(
            //                         'Đơn vị tiền: ',
            //                         style: TextStyle(
            //                           color: Colors.grey[600],
            //                           fontSize: 13,
            //                         ),
            //                       ),
            //                       Text(
            //                         'VND.',
            //                         style:
            //                             TextStyle(fontWeight: FontWeight.bold),
            //                       )
            //                     ])
            //                   ],
            //                 ),
            //                 const SizedBox(height: 24),
            //                 TextFormField(
            //                   controller: TextEditingController(
            //                     text: DateFormat('dd/MM/yyyy')
            //                         .format(DateTime.now()),
            //                   ),
            //                   decoration: InputDecoration(
            //                     labelText: 'Ngày nhập kho',
            //                     border: OutlineInputBorder(
            //                       borderRadius: BorderRadius.circular(8),
            //                     ),
            //                     suffixIcon: Icon(Icons.calendar_today),
            //                   ),
            //                   readOnly: true,
            //                   onTap: () async {
            //                     DateTime? pickedDate = await showDatePicker(
            //                       context: context,
            //                       initialDate: TimeUtils.customNow(),
            //                       firstDate: DateTime(2024),
            //                       lastDate: DateTime(2030),
            //                     );
            //                     if (pickedDate != null) {
            //                       setState(() {
            //                         _nameFoodController.text =
            //                             DateFormat('dd/MM/yyyy')
            //                                 .format(pickedDate);
            //                       });
            //                     }
            //                   },
            //                 ),
            //                 const SizedBox(height: 8),
            //                 Row(
            //                   children: [
            //                     Icon(
            //                       Icons.info_outline,
            //                       size: 16,
            //                       color: Colors.grey[600],
            //                     ),
            //                     const SizedBox(width: 4),
            //                     Text(
            //                       'Bấm vào để sửa ngày nhập kho (nếu có thay đổi).',
            //                       style: TextStyle(
            //                         color: Colors.grey[600],
            //                         fontSize: 13,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   )
            else if (task?.taskType.taskTypeId ==
                    TaskTypeDataConstant.sellAnimal ||
                task?.taskType.taskTypeId == TaskTypeDataConstant.sellEgg)
              BlocBuilder<GrowthStageCubit, GrowthStageState>(
                builder: (context, state) {
                  return state.maybeWhen(getGrowthStageByCageIdInProgress: () {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                          child: Column(children: [
                        CircularProgressIndicator(),
                        const SizedBox(height: 16),
                        const Text('Đang tải báo cáo...')
                      ])),
                    );
                  }, getGrowthStageByCageIdSuccess: (growthStage) {
                    return Container(
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
                                Icons.sell_rounded,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tên báo cáo công việc',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline),
                                    ),
                                    if (task?.taskType.taskTypeId ==
                                        TaskTypeDataConstant.sellAnimal)
                                      Text('Đơn báo cáo bán gia cầm',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge)
                                    else
                                      Text('Đơn báo cáo bán trứng',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge)
                                  ]),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(children: [
                            _buildInfoItem(
                              context: context,
                              label: 'Tên người báo cáo',
                              value: userName ?? 'Đang tải...',
                            ),
                            const SizedBox(width: 24),
                            _buildInfoItem(
                                context: context,
                                label: 'Ngày báo cáo',
                                value: CustomDateUtils.formatDate(
                                    TimeUtils.customNow())),
                          ]),
                          const SizedBox(height: 20),
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
                                    Icon(Icons.info_outline,
                                        color: Theme.of(context).primaryColor),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Thông tin về giai đoạn phát triển',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.38,
                                      child: _buildInfoItem(
                                        context: context,
                                        label: 'Tên giai đoạn',
                                        value: growthStage.name,
                                        icon: Icons.label,
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                    if (growthStage.quantity != null) ...[
                                      _buildInfoItem(
                                        context: context,
                                        label: 'Tổng số con',
                                        value:
                                            '${growthStage.quantity.toString()} (con)',
                                        icon: Icons.warehouse,
                                      ),
                                    ]
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Số con bình thường',
                                      value:
                                          '${growthStage.quantity! - growthStage.affectQuantity!} (con)',
                                      icon: Icons.pets,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.084),
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Số con bị bệnh',
                                      value:
                                          '${growthStage.affectQuantity} (con)',
                                      icon: Icons.medical_services_rounded,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Ngày bắt đầu',
                                      value: DateFormat('dd/MM/yyyy').format(
                                          DateTime.parse(
                                              growthStage.ageStartDate)),
                                      icon: Icons.calendar_month,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.163),
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Ngày kết thúc',
                                      value: DateFormat('dd/MM/yyyy').format(
                                          DateTime.parse(
                                              growthStage.ageEndDate)),
                                      icon: Icons.calendar_month,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Độ tuổi bắt đầu',
                                      value:
                                          '${growthStage.ageStart} ngày tuổi',
                                      icon: Icons.health_and_safety_rounded,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.143),
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Độ tuổi kết thúc',
                                      value: '${growthStage.ageEnd} ngày tuổi',
                                      icon: Icons.health_and_safety_rounded,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          BlocBuilder<SaleTypeCubit, SaleTypeState>(
                            builder: (context, state) {
                              return state.maybeWhen(getByNameInProgress: () {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 24.0),
                                  child: Center(
                                      child: Column(children: [
                                    CircularProgressIndicator(),
                                    const SizedBox(height: 16),
                                    const Text('Đang tải form nhập liệu...')
                                  ])),
                                );
                              }, getByNameSuccess: (saleTypes) {
                                return Column(children: [
                                  if (task?.taskType.taskTypeId ==
                                      TaskTypeDataConstant.sellAnimal)
                                    Text('Form nhập liệu bán thịt',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge)
                                  else
                                    Text('Form nhập liệu bán trứng',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge),
                                  const SizedBox(height: 16),
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
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (task?.taskType.taskTypeId ==
                                              TaskTypeDataConstant.sellAnimal)
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Khối lượng thịt đã bán',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                                const SizedBox(height: 16),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    _buildQuantityButton(
                                                      icon: Icons.remove,
                                                      onPressed: () {
                                                        final currentValue =
                                                            int.tryParse(
                                                                    _weightMeatSellController
                                                                        .text) ??
                                                                0;
                                                        if (currentValue > 0) {
                                                          setState(() {
                                                            _weightMeatSellController
                                                                    .text =
                                                                (currentValue -
                                                                        1)
                                                                    .toString();
                                                          });
                                                        }
                                                      },
                                                    ),
                                                    Container(
                                                      width: 80,
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16),
                                                      child: TextField(
                                                        controller:
                                                            _weightMeatSellController,
                                                        textAlign:
                                                            TextAlign.center,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        style: const TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        decoration:
                                                            const InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          contentPadding:
                                                              EdgeInsets.zero,
                                                        ),
                                                      ),
                                                    ),
                                                    _buildQuantityButton(
                                                      icon: Icons.add,
                                                      onPressed: () {
                                                        final currentValue =
                                                            int.tryParse(
                                                                    _weightMeatSellController
                                                                        .text) ??
                                                                0;
                                                        setState(() {
                                                          _weightMeatSellController
                                                                  .text =
                                                              (currentValue + 1)
                                                                  .toString();
                                                        });
                                                      },
                                                      isAdd: true,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 16),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.info_outline,
                                                      size: 16,
                                                      color: Colors.grey[600],
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Row(children: [
                                                      Text(
                                                        'Đơn vị tính: ',
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[600],
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      Text(
                                                        'kg.',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ])
                                                  ],
                                                ),
                                                const SizedBox(height: 24),
                                                TextFormField(
                                                  controller:
                                                      _priceMeatSellController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    labelText: 'Nhập giá tiền',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    suffixText: 'VND',
                                                    helperText:
                                                        'Giá tiền trên 1 trứng.',
                                                  ),
                                                  onChanged: (value) {
                                                    if (value.isNotEmpty) {
                                                      final formatter =
                                                          NumberFormat('#,###');
                                                      final newValue = formatter
                                                          .format(int.parse(
                                                              value.replaceAll(
                                                                  ',', '')));
                                                      _priceMeatSellController
                                                              .value =
                                                          TextEditingValue(
                                                        text: newValue,
                                                        selection: TextSelection
                                                            .collapsed(
                                                                offset: newValue
                                                                    .length),
                                                      );
                                                    }
                                                  },
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.info_outline,
                                                      size: 16,
                                                      color: Colors.grey[600],
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Row(children: [
                                                      Text(
                                                        'Đơn vị tiền: ',
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[600],
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      Text(
                                                        'VND.',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ])
                                                  ],
                                                ),
                                              ],
                                            )
                                          else
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Số trứng đã bán',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                                const SizedBox(height: 16),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    _buildQuantityButton(
                                                      icon: Icons.remove,
                                                      onPressed: () {
                                                        final currentValue =
                                                            int.tryParse(
                                                                    _countEggSellController
                                                                        .text) ??
                                                                0;
                                                        if (currentValue > 0) {
                                                          setState(() {
                                                            _countEggSellController
                                                                    .text =
                                                                (currentValue -
                                                                        1)
                                                                    .toString();
                                                          });
                                                        }
                                                      },
                                                    ),
                                                    Container(
                                                      width: 80,
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16),
                                                      child: TextField(
                                                        controller:
                                                            _countEggSellController,
                                                        textAlign:
                                                            TextAlign.center,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        style: const TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        decoration:
                                                            const InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          contentPadding:
                                                              EdgeInsets.zero,
                                                        ),
                                                      ),
                                                    ),
                                                    _buildQuantityButton(
                                                      icon: Icons.add,
                                                      onPressed: () {
                                                        final currentValue =
                                                            int.tryParse(
                                                                    _countEggSellController
                                                                        .text) ??
                                                                0;
                                                        setState(() {
                                                          _countEggSellController
                                                                  .text =
                                                              (currentValue + 1)
                                                                  .toString();
                                                        });
                                                      },
                                                      isAdd: true,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 16),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.info_outline,
                                                      size: 16,
                                                      color: Colors.grey[600],
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Row(children: [
                                                      Text(
                                                        'Đơn vị tính: ',
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[600],
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      Text(
                                                        'trứng.',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ])
                                                  ],
                                                ),
                                                const SizedBox(height: 24),
                                                TextFormField(
                                                  controller:
                                                      _priceEggSellController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    labelText: 'Nhập giá tiền',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    suffixText: 'VND',
                                                    helperText:
                                                        'Giá tiền trên 1 trứng.',
                                                  ),
                                                  onChanged: (value) {
                                                    if (value.isNotEmpty) {
                                                      final formatter =
                                                          NumberFormat('#,###');
                                                      final newValue = formatter
                                                          .format(int.parse(
                                                              value.replaceAll(
                                                                  ',', '')));
                                                      _priceEggSellController
                                                              .value =
                                                          TextEditingValue(
                                                        text: newValue,
                                                        selection: TextSelection
                                                            .collapsed(
                                                                offset: newValue
                                                                    .length),
                                                      );
                                                    }
                                                  },
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.info_outline,
                                                      size: 16,
                                                      color: Colors.grey[600],
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Row(children: [
                                                      Text(
                                                        'Đơn vị tiền: ',
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[600],
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      Text(
                                                        'VND.',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ])
                                                  ],
                                                ),
                                              ],
                                            ),
                                          const SizedBox(height: 24),
                                          TextFormField(
                                            controller: TextEditingController(
                                              text: _dateAnimalSellController
                                                  .text,
                                            ),
                                            decoration: InputDecoration(
                                              labelText: 'Ngày bán',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              suffixIcon:
                                                  Icon(Icons.calendar_today),
                                            ),
                                            readOnly: true,
                                            onTap: () async {
                                              DateTime? pickedDate =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    TimeUtils.customNow(),
                                                firstDate: DateTime(2024),
                                                lastDate: DateTime(2030),
                                              );
                                              if (pickedDate != null) {
                                                setState(() {
                                                  _dateAnimalSellController
                                                          .text =
                                                      DateFormat('dd/MM/yyyy')
                                                          .format(pickedDate);
                                                  saleDate = pickedDate;
                                                });
                                              }
                                            },
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.info_outline,
                                                size: 16,
                                                color: Colors.grey[600],
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                'Bấm vào để sửa ngày bán (nếu có thay đổi).',
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ]);
                              }, orElse: () {
                                return Container();
                              });
                            },
                          )
                        ],
                      ),
                    );
                  }, getGrowthStageByCageIdFailure: (message) {
                    log(message);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                          child: Column(children: [
                        const Icon(Icons.error_outline, color: Colors.red),
                        const SizedBox(height: 8),
                        Text('Đã xảy ra lỗi: $message'),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            if (task?.cageId != null) {
                              context
                                  .read<GrowthStageCubit>()
                                  .getGrowthStageByCageId(task!.cageId);
                            }
                          },
                          child: const Text('Thử lại'),
                        )
                      ])),
                    );
                  }, updateWeightInProgress: () {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                          child: Column(children: [
                        CircularProgressIndicator(),
                        const SizedBox(height: 16),
                        const Text('Đang xử lý báo cáo...')
                      ])),
                    );
                  }, orElse: () {
                    return Container();
                  });
                },
              )
            else if (task?.taskType.taskTypeId == TaskTypeDataConstant.weighing)
              BlocBuilder<GrowthStageCubit, GrowthStageState>(
                builder: (context, state) {
                  return state.maybeWhen(getGrowthStageByCageIdInProgress: () {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                          child: Column(children: [
                        CircularProgressIndicator(),
                        const SizedBox(height: 16),
                        const Text('Đang tải báo cáo...')
                      ])),
                    );
                  }, getGrowthStageByCageIdSuccess: (growthStage) {
                    return Container(
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
                                Icons.sell_rounded,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tên báo cáo công việc',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline),
                                    ),
                                    Text('Đơn báo cáo cân gà',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge)
                                  ]),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(children: [
                            _buildInfoItem(
                              context: context,
                              label: 'Tên người báo cáo',
                              value: userName ?? 'Đang tải...',
                            ),
                            const SizedBox(width: 24),
                            _buildInfoItem(
                                context: context,
                                label: 'Ngày báo cáo',
                                value: CustomDateUtils.formatDate(
                                    TimeUtils.customNow())),
                          ]),
                          const SizedBox(height: 20),
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
                                    Icon(Icons.info_outline,
                                        color: Theme.of(context).primaryColor),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Giai đoạn phát triển hiện hành',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.38,
                                      child: _buildInfoItem(
                                        context: context,
                                        label: 'Tên giai đoạn',
                                        value: growthStage.name,
                                        icon: Icons.label,
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                    if (growthStage.quantity != null) ...[
                                      _buildInfoItem(
                                        context: context,
                                        label: 'Tổng số con',
                                        value:
                                            '${growthStage.quantity.toString()} (con)',
                                        icon: Icons.warehouse,
                                      ),
                                    ]
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Số con bình thường',
                                      value:
                                          '${growthStage.quantity! - growthStage.affectQuantity!} (con)',
                                      icon: Icons.pets,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.084),
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Số con bị bệnh',
                                      value:
                                          '${growthStage.affectQuantity} (con)',
                                      icon: Icons.medical_services_rounded,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Ngày bắt đầu',
                                      value: DateFormat('dd/MM/yyyy').format(
                                          DateTime.parse(
                                              growthStage.ageStartDate)),
                                      icon: Icons.calendar_month,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.163),
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Ngày kết thúc',
                                      value: DateFormat('dd/MM/yyyy').format(
                                          DateTime.parse(
                                              growthStage.ageEndDate)),
                                      icon: Icons.calendar_month,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Độ tuổi bắt đầu',
                                      value:
                                          '${growthStage.ageStart} ngày tuổi',
                                      icon: Icons.health_and_safety_rounded,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.143),
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Độ tuổi kết thúc',
                                      value: '${growthStage.ageEnd} ngày tuổi',
                                      icon: Icons.health_and_safety_rounded,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Text('Form nhập liệu',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              if (taskStatus == StatusDataConstant.doneVn) ...[
                                const SizedBox(width: 8),
                                const Icon(Icons.check_circle,
                                    color: Colors.green),
                              ]
                            ],
                          ),
                          const SizedBox(height: 8),
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
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Cân nặng trung bình gia cầm',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          _buildQuantityButton(
                                              icon: Icons.remove,
                                              onPressed: () {
                                                final currentValue =
                                                    double.tryParse(
                                                            _weightAnimalController
                                                                .text) ??
                                                        0;
                                                if (currentValue >= 1) {
                                                  setState(() {
                                                    _weightAnimalController
                                                            .text =
                                                        (currentValue - 1)
                                                            .toString();
                                                  });
                                                }
                                              },
                                              isDisable: taskStatus !=
                                                  StatusDataConstant
                                                      .inProgressVn),
                                          Container(
                                            width: 80,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: TextField(
                                              controller:
                                                  _weightAnimalController,
                                              textAlign: TextAlign.center,
                                              keyboardType:
                                                  TextInputType.number,
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
                                                final currentValue =
                                                    double.tryParse(
                                                            _weightAnimalController
                                                                .text) ??
                                                        0;
                                                setState(() {
                                                  _weightAnimalController.text =
                                                      (currentValue + 1)
                                                          .toString();
                                                });
                                              },
                                              isAdd: true,
                                              isDisable: taskStatus !=
                                                  StatusDataConstant
                                                      .inProgressVn),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.info_outline,
                                            size: 16,
                                            color: Colors.grey[600],
                                          ),
                                          const SizedBox(width: 4),
                                          Row(children: [
                                            Text(
                                              'Đơn vị tính: ',
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              'kg.',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ])
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }, getGrowthStageByCageIdFailure: (message) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                          child: Column(children: [
                        const Icon(Icons.error_outline, color: Colors.red),
                        const SizedBox(height: 8),
                        Text('Đã xảy ra lỗi: $message'),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            if (task?.cageId != null) {
                              context
                                  .read<GrowthStageCubit>()
                                  .getGrowthStageByCageId(task!.cageId);
                            }
                          },
                          child: const Text('Thử lại'),
                        )
                      ])),
                    );
                  }, updateWeightInProgress: () {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                          child: Column(children: [
                        CircularProgressIndicator(),
                        const SizedBox(height: 16),
                        const Text('Đang xử lý báo cáo...')
                      ])),
                    );
                  }, orElse: () {
                    return Container();
                  });
                },
              )
            else if (task?.taskType.taskTypeId ==
                TaskTypeDataConstant.eggHarvest)
              BlocBuilder<GrowthStageCubit, GrowthStageState>(
                builder: (context, state) {
                  return state.maybeWhen(getGrowthStageByCageIdInProgress: () {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                          child: Column(children: [
                        CircularProgressIndicator(),
                        const SizedBox(height: 16),
                        const Text('Đang tải báo cáo...')
                      ])),
                    );
                  }, getGrowthStageByCageIdSuccess: (growthStage) {
                    return Container(
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
                                Icons.sell_rounded,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tên báo cáo công việc',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline),
                                    ),
                                    Text('Đơn báo cáo thu hoạch trứng',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge)
                                  ]),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(children: [
                            _buildInfoItem(
                              context: context,
                              label: 'Tên người báo cáo',
                              value: userName ?? 'Đang tải...',
                            ),
                            const SizedBox(width: 24),
                            _buildInfoItem(
                                context: context,
                                label: 'Ngày báo cáo',
                                value: CustomDateUtils.formatDate(
                                    TimeUtils.customNow())),
                          ]),
                          const SizedBox(height: 20),
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
                                    Icon(Icons.info_outline,
                                        color: Theme.of(context).primaryColor),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Thông tin về vụ nuôi',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.38,
                                      child: _buildInfoItem(
                                        context: context,
                                        label: 'Tên vụ nuôi',
                                        value: growthStage.name,
                                        icon: Icons.label,
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                    if (growthStage.quantity != null) ...[
                                      _buildInfoItem(
                                        context: context,
                                        label: 'Tổng số con',
                                        value:
                                            '${growthStage.quantity.toString()} (con)',
                                        icon: Icons.warehouse,
                                      ),
                                    ]
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Số con bình thường',
                                      value:
                                          '${growthStage.quantity! - growthStage.affectQuantity!} (con)',
                                      icon: Icons.pets,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.084),
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Số con bị bệnh',
                                      value:
                                          '${growthStage.affectQuantity} (con)',
                                      icon: Icons.medical_services_rounded,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Ngày bắt đầu',
                                      value: DateFormat('dd/MM/yyyy').format(
                                          DateTime.parse(
                                              growthStage.ageStartDate)),
                                      icon: Icons.calendar_month,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.163),
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Ngày kết thúc',
                                      value: DateFormat('dd/MM/yyyy').format(
                                          DateTime.parse(
                                              growthStage.ageEndDate)),
                                      icon: Icons.calendar_month,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Độ tuổi bắt đầu',
                                      value:
                                          '${growthStage.ageStart} ngày tuổi',
                                      icon: Icons.health_and_safety_rounded,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.143),
                                    _buildInfoItem(
                                      context: context,
                                      label: 'Độ tuổi kết thúc',
                                      value: '${growthStage.ageEnd} ngày tuổi',
                                      icon: Icons.health_and_safety_rounded,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('Form nhập liệu',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                  if (taskStatus ==
                                      StatusDataConstant.doneVn) ...[
                                    const SizedBox(width: 8),
                                    const Icon(Icons.check_circle,
                                        color: Colors.green),
                                  ]
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
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
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Số trứng thu hoạch được',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          _buildQuantityButton(
                                              icon: Icons.remove,
                                              onPressed: () {
                                                final currentValue = int.tryParse(
                                                        _countEggCollectedController
                                                            .text) ??
                                                    0;
                                                if (currentValue > 0) {
                                                  setState(() {
                                                    _countEggCollectedController
                                                            .text =
                                                        (currentValue - 1)
                                                            .toString();
                                                  });
                                                }
                                              },
                                              isDisable: taskStatus !=
                                                  StatusDataConstant
                                                      .inProgressVn),
                                          Container(
                                            width: 80,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: TextField(
                                              controller:
                                                  _countEggCollectedController,
                                              textAlign: TextAlign.center,
                                              keyboardType:
                                                  TextInputType.number,
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
                                                        _countEggCollectedController
                                                            .text) ??
                                                    0;
                                                setState(() {
                                                  _countEggCollectedController
                                                          .text =
                                                      (currentValue + 1)
                                                          .toString();
                                                });
                                              },
                                              isAdd: true,
                                              isDisable: taskStatus !=
                                                  StatusDataConstant
                                                      .inProgressVn),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.info_outline,
                                            size: 16,
                                            color: Colors.grey[600],
                                          ),
                                          const SizedBox(width: 4),
                                          Row(children: [
                                            Text(
                                              'Đơn vị tính: ',
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              'quả.',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ])
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }, getGrowthStageByCageIdFailure: (message) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                          child: Column(children: [
                        const Icon(Icons.error_outline, color: Colors.red),
                        const SizedBox(height: 8),
                        Text('Đã xảy ra lỗi: $message'),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            if (task?.cageId != null) {
                              context
                                  .read<GrowthStageCubit>()
                                  .getGrowthStageByCageId(task!.cageId);
                            }
                          },
                          child: const Text('Thử lại'),
                        )
                      ])),
                    );
                  }, orElse: () {
                    return Container();
                  });
                },
              ),
            const SizedBox(height: 24),
            TextFieldRequired(
              isRequired: false,
              controller: logController,
              maxLines: 3,
              isDisabled: taskStatus == StatusDataConstant.doneVn ||
                  taskStatus == StatusDataConstant.overdueVn,
              label: 'Ghi chú (nếu có)',
              hintText: 'Nhập ghi chú',
            ),
            const SizedBox(height: 32),
            if (taskStatus != StatusDataConstant.overdueVn)
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
                          onTap: _pickImageFromCamera,
                        ),
                        _buildImagePickerButton(
                          context: context,
                          icon: LinearIcons.folderAddIcon,
                          label: 'Chọn tập tin',
                          onTap: _pickImageFromGallery,
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
      {Widget? icon,
      required String label,
      required String value,
      Color? color,
      bool? isDot = true}) {
    return Row(
      children: [
        if (icon != null)
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
              value.length > 14 && isDot == true
                  ? '${value.substring(0, 14)}...'
                  : value,
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

  Widget _buildInfoItem(
      {required BuildContext context,
      required String label,
      required String value,
      IconData? icon,
      int warningLevel = 0}) {
    return Row(
      children: [
        if (icon != null)
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                  fontSize: 12,
                ),
              ),
            ]),
            Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                if (warningLevel != 0) ...[
                  const SizedBox(width: 4),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onPressed,
    bool isAdd = false,
    bool isDisable = false,
  }) {
    return Opacity(
      opacity: isDisable ? 0.5 : 1,
      child: Container(
        decoration: BoxDecoration(
          color:
              isAdd ? Theme.of(context).colorScheme.primary : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          onPressed: isDisable ? null : onPressed,
          icon: Icon(
            icon,
            color: isAdd ? Colors.white : Colors.grey[700],
          ),
          iconSize: 24,
        ),
      ),
    );
  }

  Widget _contentButton() {
    return Text(taskStatus == StatusDataConstant.inProgressVn
        ? (_areAnyMedicationsChecked()
            ? 'Xác nhận hoàn thành'
            : 'Chưa ghi nhận đã cho uống thuốc')
        : taskStatus == StatusDataConstant.doneVn
            ? 'Công việc đã hoàn thành'
            : taskStatus == StatusDataConstant.overdueVn
                ? 'Công việc đã quá hạn'
                : _isWithinWorkingHours()
                    ? 'Xác nhận làm việc'
                    : 'Chưa đến giờ làm việc');
  }

  Widget _buildLastSessionForm() {
    return Column(children: [
      const Text(
          'Vì đây là đơn thuốc cuối cùng nên điền số lượng gia cầm sau điều trị vào mẫu bên dưới. '),
      const SizedBox(height: 16),
      StatefulBuilder(builder: (context, setState) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Opacity(
                opacity: _isHealthyAfterTreatment ? 0.5 : 1,
                child: Row(
                  children: [
                    const Text('Số gia cầm '),
                    Text(
                      'đã chết',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(' sau điều trị: '),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildQuantityButton(
                    icon: Icons.remove,
                    onPressed: () {
                      final currentValue =
                          int.tryParse(_lastSessionQuantityController.text) ??
                              0;
                      if (currentValue > 0) {
                        setState(() {
                          _lastSessionQuantityController.text =
                              (currentValue - 1).toString();
                          _lastSessionQuantity = _lastSessionQuantity + 1;
                        });
                      }
                    },
                    isDisable: _isHealthyAfterTreatment,
                  ),
                  Container(
                    width: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: _lastSessionQuantityController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixText: '(con)',
                        suffixStyle:
                            TextStyle(color: Colors.grey[600], fontSize: 18),
                      ),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      onChanged: _onChangedQuantityLastSession,
                      enabled: !_isHealthyAfterTreatment,
                    ),
                  ),
                  _buildQuantityButton(
                    icon: Icons.add,
                    onPressed: () {
                      final currentValue =
                          int.tryParse(_lastSessionQuantityController.text) ??
                              0;
                      setState(() {
                        _lastSessionQuantityController.text =
                            (currentValue + 1).toString();
                        _lastSessionQuantity = _lastSessionQuantity - 1;
                      });
                    },
                    isAdd: true,
                    isDisable: _isHealthyAfterTreatment,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                  '- Tick vào ô bên dưới nếu tất cả khỏe mạnh sau điều trị.'),
              const SizedBox(height: 8),
              CheckboxListTile(
                title: const Text('Tất cả gia cầm khỏe mạnh sau điều trị'),
                value: _isHealthyAfterTreatment,
                onChanged: (bool? value) {
                  if (value == true) {
                    setState(() {
                      _isHealthyAfterTreatment = true;
                      _lastSessionQuantityController.text = '0';
                    });
                  } else {
                    setState(() {
                      _isHealthyAfterTreatment = false;
                      _lastSessionQuantityController.text = '0';
                    });
                  }
                },
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Số gia cầm khỏe mạnh',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                        ),
                        Row(children: [
                          Text(
                            '$_lastSessionQuantity con',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' (sau điều trị)',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                        ])
                      ])
                ],
              ),
            ],
          ),
        );
      }),
    ]);
  }

  _onChangedQuantityLastSession(String value) {
    if (int.tryParse(value) == null) {
      return;
    }
    final newValue = int.parse(value);
    if (newValue > prescription!.quantityAnimal) {
      _lastSessionQuantityController.text =
          prescription!.quantityAnimal.toString();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Số gia cầm còn sống sau điều trị không thể lớn hơn số gia cầm ban đầu.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      setState(() {
        _lastSessionQuantity = newValue;
      });
    }
  }
}
