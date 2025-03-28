import 'dart:developer';
import 'dart:io';

import 'package:data_layer/model/dto/egg_harvest/egg_harvest_dto.dart';
import 'package:data_layer/model/dto/growth_stage/growth_stage_dto.dart';
import 'package:data_layer/model/dto/prescription/prescription.dart';
import 'package:data_layer/model/dto/sale_type/sale_type_dto.dart';
import 'package:data_layer/model/dto/task/daily_food_usage_log/daily_food_usage_log_dto.dart';
import 'package:data_layer/model/dto/task/health_log/health_log_dto.dart';
import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:data_layer/model/dto/task/vaccin_schedule_log/vaccin_schedule_log_dto.dart';
import 'package:data_layer/model/dto/upload_image/upload_image_dto.dart';
import 'package:data_layer/model/dto/vaccine_schedule/vaccine_schedule_dto.dart';
import 'package:data_layer/model/request/egg_harvest/egg_harvest_request.dart';
import 'package:data_layer/model/request/growth_stage/update_weight/update_weight_request.dart';
import 'package:data_layer/model/request/prescription/update_status_prescription_request.dart';
import 'package:data_layer/model/request/vaccine_schedule_log/vaccine_schedule_log_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/common/widgets/warning_confirm_dialog.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/constants/task_type_data_constant.dart';
import 'package:smart_farm/src/core/constants/vaccine_schedule_status_constant.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/core/utils/date_util.dart';
import 'package:smart_farm/src/core/utils/task_util.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/view/task/task_validation.dart';
import 'package:smart_farm/src/view/task/widgets/animal_sale_log_widget.dart';
import 'package:smart_farm/src/view/task/widgets/egg_harvest_log_widget.dart';
import 'package:smart_farm/src/view/task/widgets/egg_sale_log_widget.dart';
import 'package:smart_farm/src/view/task/widgets/food_log_widget.dart';
import 'package:smart_farm/src/view/task/widgets/health_log_widget.dart';
import 'package:smart_farm/src/view/task/widgets/image_picker_section.dart';
import 'package:smart_farm/src/view/task/widgets/status_notification_widget.dart';
import 'package:smart_farm/src/view/task/widgets/vaccine_log_widget.dart';
import 'package:smart_farm/src/view/task/widgets/weighing_log_widget.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/view/widgets/loading_widget.dart';
import 'package:smart_farm/src/view/widgets/processing_button_widget.dart';
import 'package:smart_farm/src/viewmodel/animal_sale/animal_sale_cubit.dart';
import 'package:smart_farm/src/viewmodel/egg_harvest/egg_harvest_cubit.dart';
import 'package:smart_farm/src/viewmodel/growth_stage/growth_stage_cubit.dart';
import 'package:smart_farm/src/viewmodel/index.dart';
import 'package:smart_farm/src/viewmodel/prescription/prescription_cubit.dart';
import 'package:smart_farm/src/viewmodel/sale_type/sale_type_cubit.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';
import 'package:smart_farm/src/viewmodel/task/vaccine_schedule_log/vaccine_schedule_log_cubit.dart';
import 'package:smart_farm/src/viewmodel/upload_image/upload_image_cubit.dart';
import 'package:smart_farm/src/viewmodel/vaccine_schedule/vaccine_schedule_cubit.dart';

class TaskReportScreen extends StatefulWidget {
  final TaskHaveCageName task;
  final String taskId;
  final String? source;
  final bool viewMode; // Add viewMode flag

  const TaskReportScreen({
    super.key,
    required this.task,
    required this.taskId,
    this.source,
    this.viewMode = false, // Default to false (edit mode)
  });

  @override
  State<TaskReportScreen> createState() => _TaskReportScreenState();
}

class _TaskReportScreenState extends State<TaskReportScreen> {
  bool _isProcessing = false;
  bool _isLoading = false;
  bool _isHealthyAfterTreatment = false;
  String? _sourceScreen; // Track the source screen
  bool _viewMode = false; // Track if we're in view mode
  String taskStatus = 'Loading...'; // Start directly at 'in progress'
  GrowthStageDto? growthStage;
  String? userName = '';
  bool get isPending => taskStatus == StatusDataConstant.pendingVn;

  // --- Prescription related variables ---
  PrescriptionDto? prescription;
  String? prescriptionId;

  // --- Weight related variables ---
  DateTime? logTime;
  double? recommendedWeight;
  double actualWeight = 0;
  List<double> weightList = [];

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
  VaccineScheduleDto? vaccineSchedule;
  VaccineScheduleLogDto? vaccineScheduleLog;

  // --- Animal sale related variables ---
  DateTime? saleDate;
  SaleTypeDto? saleType;

  // --- Egg harvest related variables ---
  EggHarvestDto? eggHarvest;

  // --- Upload image related variables ---
  UploadImageDto? uploadImage;

  // --- After treatment variables ---
  int _lastSessionQuantity = 0;

  // --- Controllers ---
  final TextEditingController _actualWeightController = TextEditingController();
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

  // Add a new variable to track the isolation cage feeding status
  bool _isIsolationFed = false;

  void _addImage(File image) {
    setState(() {
      _images.add(image);
    });
  }

  void _removeImage(File image) {
    setState(() {
      _images.remove(image);
    });
  }

  // --- Lifecycle methods ---
  @override
  void initState() {
    super.initState();
    _sourceScreen = widget.source; // Store the source screen
    _viewMode = widget.viewMode; // Store view mode flag
    context.read<UserBloc>().add(const UserEvent.getUserProfile());

    _actualWeightController.text = '0';
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

    // If in view mode, we're certainly dealing with a completed task
    if (_viewMode) {
      setState(() {
        taskStatus = StatusDataConstant.doneVn;
      });
    }
  }

  void _initDataLog() {
    if (widget.task.status != StatusDataConstant.pending) {
      if (widget.task.taskType.taskTypeId == TaskTypeDataConstant.feeding) {
        context
            .read<GrowthStageCubit>()
            .getRecommendedWeightByCageId(widget.task.cageId);
      } else if (widget.task.taskType.taskTypeId ==
              TaskTypeDataConstant.weighing ||
          widget.task.taskType.taskTypeId == TaskTypeDataConstant.sellAnimal ||
          widget.task.taskType.taskTypeId == TaskTypeDataConstant.sellEgg) {
        context
            .read<GrowthStageCubit>()
            .getGrowthStageByCageId(widget.task.cageId);
      } else if (widget.task.taskType.taskTypeId ==
          TaskTypeDataConstant.health) {
        context.read<PrescriptionCubit>().getPrescription(prescriptionId ?? '');
      } else if (widget.task.taskType.taskTypeId ==
          TaskTypeDataConstant.vaccin) {
        context
            .read<GrowthStageCubit>()
            .getGrowthStageByCageId(widget.task.cageId);
      } else if (widget.task.taskType.taskTypeId ==
          TaskTypeDataConstant.eggHarvest) {
        context
            .read<GrowthStageCubit>()
            .getGrowthStageByCageId(widget.task.cageId);
      }
    }
    if (widget.task.status == StatusDataConstant.done) {
      if (widget.task.taskType.taskTypeId == TaskTypeDataConstant.vaccin) {
        context.read<VaccineScheduleLogCubit>().getVaccineScheduleLogByTaskId(
              widget.taskId,
            );
      } else if (widget.task.taskType.taskTypeId ==
          TaskTypeDataConstant.eggHarvest) {
        context.read<EggHarvestCubit>().getEggHarvestByTaskId(
              taskId: widget.taskId,
            );
      }
    }
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

  bool _areAnyMedicationsChecked() {
    return areAnyMedicationsChecked(
      task: widget.task,
      prescription: prescription,
      medicationChecked: _medicationChecked,
    );
  }

  bool _isWithinWorkingHours() {
    return isWithinWorkingHours(widget.task);
  }

  bool _canCompleteTask() {
    return canCompleteTask(
      taskStatus: taskStatus,
      task: widget.task,
      areAnyMedicationsChecked: _areAnyMedicationsChecked(),
      isIsolationFed: _isIsolationFed,
      countAnimalVaccine: _countAnimalVaccineController.text,
      weightAnimal: _weightAnimalController.text,
      weightMeatSell: _weightMeatSellController.text,
      priceMeatSell: _priceMeatSellController.text,
      countEggSell: _countEggSellController.text,
      priceEggSell: _priceEggSellController.text,
      countEggCollected: _countEggCollectedController.text,
    );
  }

  void _updateTaskStatus() {
    if (!_canCompleteTask()) {
      String errorMessage = '';

      if (widget.task.taskType.taskTypeId == TaskTypeDataConstant.health) {
        errorMessage = 'Vui lòng xác nhận đã uống thuốc.';
      } else if (widget.task.taskType.taskTypeId ==
              TaskTypeDataConstant.feeding &&
          widget.task.hasAnimalDesease == true &&
          !_isIsolationFed) {
        errorMessage = 'Vui lòng xác nhận đã cho ăn ở chuồng cách ly.';
      } else if (widget.task.taskType.taskTypeId ==
          TaskTypeDataConstant.vaccin) {
        errorMessage = 'Vui lòng nhập số lượng gia cầm đã tiêm.';
      } else if (widget.task.taskType.taskTypeId ==
          TaskTypeDataConstant.weighing) {
        errorMessage = 'Vui lòng nhập số cân nặng trung bình';
      } else if (widget.task.taskType.taskTypeId ==
          TaskTypeDataConstant.sellAnimal) {
        errorMessage = 'Vui lòng nhập khối lượng thịt và giá bán hợp lệ';
      } else if (widget.task.taskType.taskTypeId ==
          TaskTypeDataConstant.sellEgg) {
        errorMessage = 'Vui lòng nhập số lượng trứng và giá bán hợp lệ';
      } else if (widget.task.taskType.taskTypeId ==
          TaskTypeDataConstant.eggHarvest) {
        errorMessage = 'Vui lòng nhập số lượng trứng thu hoạch';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
      return;
    }

    // Updated dialog with health status selection
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Use a separate variable to track selected state in dialog
        bool _dialogIsHealthy = true;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return WarningConfirmationDialog(
              title: 'Xác nhận tình trạng sức khỏe',
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Vui lòng chọn tình trạng sức khỏe của đàn gà:'),
                  const SizedBox(height: 16),
                  RadioListTile<bool>(
                    title: const Text('Đàn gà bình thường, khỏe mạnh'),
                    value: true,
                    groupValue: _dialogIsHealthy,
                    onChanged: (value) {
                      setState(() {
                        _dialogIsHealthy = value!;
                      });
                    },
                  ),
                  RadioListTile<bool>(
                    title: const Text('Đàn gà có dấu hiệu bất thường/bệnh'),
                    value: false,
                    groupValue: _dialogIsHealthy,
                    onChanged: (value) {
                      setState(() {
                        _dialogIsHealthy = value!;
                      });
                    },
                  ),
                  if (!_dialogIsHealthy)
                    Container(
                      margin:
                          const EdgeInsets.only(top: 8, left: 16, right: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber.shade200),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.warning_amber, color: Colors.amber[700]),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Bạn sẽ được chuyển đến màn hình báo cáo triệu chứng sau khi đóng hộp thoại này.',
                              style: TextStyle(color: Colors.amber[900]),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              primaryButtonText: 'Xác nhận',
              onPrimaryButtonPressed: () {
                Navigator.of(context).pop();
                if (_dialogIsHealthy) {
                  // Normal flow - upload image if available or create log
                  if (_images.isNotEmpty) {
                    context
                        .read<UploadImageCubit>()
                        .uploadImage(file: _images.first);
                  } else {
                    _onCreateLog();
                  }
                } else {
                  // Navigate to symptom reporting screen
                  context.push(
                    RouteName.createSymptom,
                    extra: {
                      'cageId': widget.task.cageId,
                      'taskId': widget.task.id,
                      'fromTask': true,
                      'cageName': widget.task.cageName
                    },
                  );
                }
              },
              secondaryButtonText: 'Hủy',
              onSecondaryButtonPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        );
      },
    );
  }

  void _onCreateLog() {
    if (widget.task.status == StatusDataConstant.inProgress) {
      if (widget.task.taskType.taskTypeId == TaskTypeDataConstant.feeding) {
        double actualWeight = this.actualWeight * 1000;
        final log = DailyFoodUsageLogDto(
            recommendedWeight: (recommendedWeight!.toInt() * 1000),
            actualWeight: actualWeight.toInt(),
            notes: logController.text,
            logTime: DateTime.now(),
            photo: uploadImage?.path != null
                ? '${dotenv.env['IMAGE_STORAGE_URL']}/${uploadImage!.path}'
                : '',
            taskId: widget.task.id);
        context.read<TaskBloc>().add(
              TaskEvent.createDailyFoodUsageLog(
                  cageId: widget.task.cageId, log: log),
            );
      } else if (widget.task.taskType.taskTypeId ==
          TaskTypeDataConstant.health) {
        if (prescriptionId != null) {
          context
              .read<PrescriptionCubit>()
              .checkPrescriptionLastSession(prescriptionId: prescriptionId!);
        }
      } else if (widget.task.taskType.taskTypeId ==
          TaskTypeDataConstant.vaccin) {
        final request = VaccineScheduleLogRequest(
          date: TimeUtils.customNow().toIso8601String(),
          session: vaccineSchedule!.session,
          vaccineId: vaccineSchedule!.vaccineId,
          quantity: int.parse(_countAnimalVaccineController.text),
          notes: "notes",
          photo: uploadImage?.path != null
              ? '${dotenv.env['IMAGE_STORAGE_URL']}/${uploadImage!.path}'
              : '',
          taskId: widget.task.id,
        );
        context.read<VaccineScheduleLogCubit>().create(request: request);
      } else if (widget.task.taskType.taskTypeId ==
          TaskTypeDataConstant.weighing) {
        context.read<GrowthStageCubit>().updateWeight(
              request: UpdateWeightRequest(
                growthStageId: growthStage!.id,
                weightAnimal: double.parse(_weightAnimalController.text),
              ),
            );
      } else if (widget.task.taskType.taskTypeId ==
          TaskTypeDataConstant.sellAnimal) {
        context.read<AnimalSaleCubit>().createAnimalSale(
              growthStageId: growthStage!.id,
              saleDate: saleDate!.toIso8601String(),
              unitPrice:
                  int.parse(_priceMeatSellController.text.replaceAll(',', '')),
              quantity: int.parse(_weightMeatSellController.text),
              saleTypeId: saleType!.id,
            );
      } else if (widget.task.taskType.taskTypeId ==
          TaskTypeDataConstant.sellEgg) {
        context.read<AnimalSaleCubit>().createAnimalSale(
              growthStageId: growthStage!.id,
              saleDate: saleDate!.toIso8601String(),
              unitPrice:
                  int.parse(_priceEggSellController.text.replaceAll(',', '')),
              quantity: int.parse(_countEggSellController.text),
              saleTypeId: saleType!.id,
            );
      } else if (widget.task.taskType.taskTypeId ==
          TaskTypeDataConstant.eggHarvest) {
        final request = EggHarvestRequest(
          eggCount: int.parse(_countEggCollectedController.text),
          notes: logController.text,
          growthStageId: growthStage!.id,
          taskId: widget.task.id,
        );
        context.read<EggHarvestCubit>().createEggHarvest(request: request);
      } else {
        context.read<TaskBloc>().add(
              TaskEvent.updateTask(
                widget.task.id,
                StatusDataConstant.done,
              ),
            );
      }
    } else if (taskStatus == StatusDataConstant.pendingVn) {
      if (_isWithinWorkingHours()) {
        context.read<TaskBloc>().add(
              TaskEvent.updateTask(
                  widget.task.id, StatusDataConstant.inProgress),
            );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Chưa đến giờ làm việc của phiên này.')),
        );
      }
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
      case StatusDataConstant.cancelled:
        return StatusDataConstant.cancelledVn;
      default:
        return status;
    }
  }

  void _handleTaskComplete(BuildContext context, bool success) {
    if (success) {
      // Check if we need to navigate back to a specific screen
      if (_sourceScreen == 'cage') {
        // Navigate back to cage screen with reload indicator
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop({'reload': true, 'source': 'cage'});
        } else {
          // If we can't pop (e.g., after symptom reporting), go to task list
          context.go(RouteName.cage, extra: widget.task.cageId);
        }
      } else {
        // Default behavior - navigate back to task screen or task list
        context.go(RouteName.task);
      }
    }
  }

  void _onChangedQuantityLastSession(String value) {
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

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
            state.maybeWhen(
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

                // Use the new navigation handler
                _handleTaskComplete(context, true);
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
                // LoadingDialog.show(context, "Đang tạo log cho ăn...");
                log("Đang tạo log cho ăn...");
                setState(() {
                  _isProcessing = true;
                });
              },
              createDailyFoodUsageLogSuccess: () async {
                // LoadingDialog.hide(context);
                setState(() {
                  _isProcessing = false;
                });
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
                  actualWeight = log.actualWeight / 1000;
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
                // LoadingDialog.show(context, 'Đang lấy cân nặng khuyến nghị...');
                setState(() {
                  _isLoading = true;
                });
              },
              getRecommendedWeightByCageIdSuccess: (recommendedWeight, _) {
                log('Lấy cân nặng khuyến nghị thành công!');
                setState(() {
                  this.recommendedWeight = recommendedWeight;
                  actualWeight = recommendedWeight;
                  _actualWeightController.text = recommendedWeight.toString();
                  _isLoading = false;
                });
                if (widget.task.status == StatusDataConstant.done) {
                  if (widget.task.taskType.taskTypeId ==
                      TaskTypeDataConstant.feeding) {
                    context
                        .read<TaskBloc>()
                        .add(TaskEvent.getDailyFoodUsageLog(widget.taskId));
                  } else if (widget.task.taskType.taskTypeId ==
                      TaskTypeDataConstant.health) {
                    context
                        .read<TaskBloc>()
                        .add(TaskEvent.getHealthLog(widget.taskId));
                  } else if (widget.task.taskType.taskTypeId ==
                      TaskTypeDataConstant.vaccin) {
                    context
                        .read<TaskBloc>()
                        .add(TaskEvent.getVaccinScheduleLog(widget.taskId));
                  }
                }
                // LoadingDialog.hide(context);
              },
              getRecommendedWeightByCageIdFailure: (e) {
                log('Lấy cân nặng khuyến nghị thất bại!');
                // LoadingDialog.hide(context);
                setState(() {
                  _isLoading = false;
                });
                SnackBar(content: Text(e));
              },
              getGrowthStageByCageIdInProgress: () {
                log('Đang lấy giai đoạn phát triển cho chuồng ${widget.task.cageName}...');
              },
              getGrowthStageByCageIdSuccess: (growthStage) {
                log('Lấy giai đoạn phát triển thành công!');
                setState(() {
                  this.growthStage = growthStage;
                });
                if (widget.task.taskType.taskTypeId ==
                        TaskTypeDataConstant.vaccin &&
                    widget.task.status == StatusDataConstant.inProgress) {
                  context
                      .read<VaccineScheduleCubit>()
                      .getVaccineScheduleByStageId(
                        stageId: growthStage.id,
                        date: TimeUtils.customNow(),
                        status: VaccineScheduleStatusConstant.UPCOMING,
                      );
                } else if (widget.task.taskType.taskTypeId ==
                    TaskTypeDataConstant.sellAnimal) {
                  context
                      .read<SaleTypeCubit>()
                      .getSaleTypeByName(saleTypeName: 'MeatSale');
                } else if (widget.task.taskType.taskTypeId ==
                    TaskTypeDataConstant.sellEgg) {
                  context
                      .read<SaleTypeCubit>()
                      .getSaleTypeByName(saleTypeName: 'EggSale');
                } else if (widget.task.taskType.taskTypeId ==
                        TaskTypeDataConstant.weighing &&
                    widget.task.status == StatusDataConstant.done) {
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
                if (isLastSession == false) {
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
                } else {
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
                              _lastSessionQuantity =
                                  prescription!.quantityAnimal;
                              _isHealthyAfterTreatment = false;
                            });
                            context.pop();
                            _lastSessionQuantityController.text = '0';
                          }));
                }
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
                  if (vaccineScheduleList.isNotEmpty) {
                    vaccineSchedule = vaccineScheduleList.first;
                  }
                  _isLoading = false;
                });
              },
              getVaccineScheduleByStageIdFailure: (e) {
                setState(() {
                  _isLoading = false;
                });
                log('Lấy lịch tiêm chủng thất bại!');
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
                    widget.task.id, StatusDataConstant.done));
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
                    widget.task.id, StatusDataConstant.done));
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
                _initDataLog();
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
          title: Column(
            children: [
              Text(_viewMode ? 'Chi tiết báo cáo' : 'Báo cáo công việc'),
              Text(
                '${DateFormat('HH:mm').format(TimeUtils.customNow())} - ${CustomDateUtils.formatDate(TimeUtils.customNow())}',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
        body: _isLoading ? LoadingWidget() : _buildTaskReport(context),
        bottomSheet: _viewMode
            ? null
            : Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: FilledButton(
                  onPressed: _validateTaskInfo() ? _updateTaskStatus : null,
                  child: _isProcessing
                      ? ProcessingButtonWidget(
                          loadingMessage: 'Đang xác nhận...')
                      : _contentButton(),
                ),
              ),
      ),
    );
  }

  Widget _buildTaskReport(BuildContext context) {
    // Adjust all input fields to be read-only if in view mode
    final bool readOnly = _viewMode ||
        taskStatus == StatusDataConstant.doneVn ||
        taskStatus == StatusDataConstant.overdueVn;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 16.0, bottom: 80.0),
      child: Column(
        children: [
          if (widget.task.taskType.taskTypeId == TaskTypeDataConstant.feeding)
            FoodLogWidget(
              userName: userName,
              // ignore: unnecessary_null_comparison
              logTime: widget.task.dueDate != null
                  ? DateTime.parse(widget.task.dueDate)
                  : null,
              hasAnimalDesease: widget.task.hasAnimalDesease ?? false,
              isIsolationFed: _isIsolationFed,
              onIsolationFedChanged: readOnly
                  ? null
                  : (value) {
                      setState(() {
                        _isIsolationFed = value;
                      });
                    },
              actualWeight: actualWeight,
              onWeightChanged: readOnly
                  ? null
                  : (double newWeight) {
                      setState(() {
                        actualWeight = newWeight;
                        _actualWeightController.text = newWeight.toString();
                      });
                    },
              task: widget.task,
              recommendedWeight: recommendedWeight,
              logController: logController,
              actualWeightController: _actualWeightController,
            )
          else if (widget.task.taskType.taskTypeId ==
              TaskTypeDataConstant.health)
            HealthLogWidget(
              userName: userName,
              prescription: prescription,
              session: widget.task.session,
              medicationChecked: _medicationChecked,
              onMedicationCheckedChanged: readOnly
                  ? null
                  : (String medicationId, bool value) {
                      setState(() {
                        _medicationChecked[medicationId] = value;
                      });
                    },
              task: widget.task,
            )
          else if (widget.task.taskType.taskTypeId ==
              TaskTypeDataConstant.vaccin)
            VaccineLogWidget(
              userName: userName,
              vaccineSchedule: vaccineSchedule,
              growthStage: growthStage,
              countAnimalVaccineController: _countAnimalVaccineController,
              onCountChanged: readOnly
                  ? null
                  : (int value) {
                      setState(() {
                        _countAnimalVaccineController.text = value.toString();
                      });
                    },
              task: widget.task,
              isLoading: _isLoading,
            )
          else if (widget.task.taskType.taskTypeId ==
              TaskTypeDataConstant.weighing)
            BlocBuilder<GrowthStageCubit, GrowthStageState>(
              builder: (context, state) {
                return state.maybeWhen(
                  getGrowthStageByCageIdInProgress: () {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                          child: Column(children: [
                        CircularProgressIndicator(),
                        const SizedBox(height: 16),
                        const Text('Đang tải báo cáo...')
                      ])),
                    );
                  },
                  getGrowthStageByCageIdSuccess: (growthStage) {
                    log('Trạng thái: $taskStatus');
                    return WeighingLogWidget(
                      userName: userName,
                      growthStage: growthStage,
                      weightAnimalController: _weightAnimalController,
                      onWeightChanged: readOnly
                          ? null
                          : (double newWeight) {
                              setState(() {
                                _weightAnimalController.text =
                                    newWeight.toStringAsFixed(1);
                              });
                            },
                      taskStatus: taskStatus,
                    );
                  },
                  getGrowthStageByCageIdFailure: (message) {
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
                            context
                                .read<GrowthStageCubit>()
                                .getGrowthStageByCageId(widget.task.cageId);
                          },
                          child: const Text('Thử lại'),
                        ),
                      ])),
                    );
                  },
                  updateWeightInProgress: () {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            const SizedBox(height: 16),
                            const Text('Đang xử lý báo cáo...')
                          ],
                        ),
                      ),
                    );
                  },
                  orElse: () {
                    return Container();
                  },
                );
              },
            )
          else if (widget.task.taskType.taskTypeId ==
              TaskTypeDataConstant.eggHarvest)
            BlocBuilder<GrowthStageCubit, GrowthStageState>(
              builder: (context, state) {
                return state.maybeWhen(
                  getGrowthStageByCageIdInProgress: () {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                          child: Column(children: [
                        CircularProgressIndicator(),
                        const SizedBox(height: 16),
                        const Text('Đang tải báo cáo...')
                      ])),
                    );
                  },
                  getGrowthStageByCageIdSuccess: (growthStage) {
                    return EggHarvestLogWidget(
                      userName: userName,
                      growthStage: growthStage,
                      countEggCollectedController: _countEggCollectedController,
                      onCountChanged: readOnly
                          ? null
                          : (int value) {
                              setState(() {
                                _countEggCollectedController.text =
                                    value.toString();
                              });
                            },
                      taskStatus: taskStatus,
                    );
                  },
                  getGrowthStageByCageIdFailure: (message) {
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
                            context
                                .read<GrowthStageCubit>()
                                .getGrowthStageByCageId(widget.task.cageId);
                          },
                          child: const Text('Thử lại'),
                        ),
                      ])),
                    );
                  },
                  updateWeightInProgress: () {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                          child: Column(children: [
                        CircularProgressIndicator(),
                        const SizedBox(height: 16),
                        const Text('Đang xử lý báo cáo...')
                      ])),
                    );
                  },
                  orElse: () {
                    return Container();
                  },
                );
              },
            )
          else if (widget.task.taskType.taskTypeId ==
                  TaskTypeDataConstant.sellAnimal ||
              widget.task.taskType.taskTypeId == TaskTypeDataConstant.sellEgg)
            BlocBuilder<GrowthStageCubit, GrowthStageState>(
              builder: (context, state) {
                return state.maybeWhen(
                  getGrowthStageByCageIdInProgress: () {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            const SizedBox(height: 16),
                            const Text('Đang tải báo cáo...')
                          ],
                        ),
                      ),
                    );
                  },
                  getGrowthStageByCageIdSuccess: (growthStage) {
                    if (widget.task.taskType.taskTypeId ==
                        TaskTypeDataConstant.sellAnimal) {
                      return AnimalSaleLogWidget(
                        userName: userName,
                        growthStage: growthStage,
                        weightMeatSellController: _weightMeatSellController,
                        priceMeatSellController: _priceMeatSellController,
                        dateAnimalSellController: _dateAnimalSellController,
                        saleDate: saleDate!,
                        onDateChanged: readOnly
                            ? null
                            : (date) {
                                setState(() {
                                  saleDate = date;
                                });
                              },
                        onWeightChanged: readOnly
                            ? null
                            : (weight) {
                                setState(() {
                                  _weightMeatSellController.text =
                                      weight.toString();
                                });
                              },
                        task: widget.task,
                      );
                    } else {
                      return EggSaleLogWidget(
                        userName: userName,
                        growthStage: growthStage,
                        countEggSellController: _countEggSellController,
                        priceEggSellController: _priceEggSellController,
                        dateEggSellController: _dateAnimalSellController,
                        saleDate: saleDate!,
                        onDateChanged: readOnly
                            ? null
                            : (date) {
                                setState(() {
                                  saleDate = date;
                                });
                              },
                        onCountChanged: readOnly
                            ? null
                            : (count) {
                                setState(() {
                                  _countEggSellController.text =
                                      count.toString();
                                });
                              },
                        task: widget.task,
                      );
                    }
                  },
                  getGrowthStageByCageIdFailure: (message) {
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
                            context
                                .read<GrowthStageCubit>()
                                .getGrowthStageByCageId(widget.task.cageId);
                          },
                          child: const Text('Thử lại'),
                        ),
                      ])),
                    );
                  },
                  updateWeightInProgress: () {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                          child: Column(children: [
                        CircularProgressIndicator(),
                        const SizedBox(height: 16),
                        const Text('Đang xử lý báo cáo...')
                      ])),
                    );
                  },
                  orElse: () {
                    return Container();
                  },
                );
              },
            ),
          const SizedBox(height: 32),
          if (!_viewMode && taskStatus != StatusDataConstant.overdueVn)
            ImagePickerSection(
              images: _images,
              onImageAdded: _addImage,
              onImageRemoved: _removeImage,
              isDisabled: readOnly,
            )
          else if (taskStatus == StatusDataConstant.overdueVn)
            StatusNotificationWidget(
              iconData: Icons.error_outline,
              iconColor: Theme.of(context).colorScheme.error,
              message: 'Công việc đã quá hạn, không thể tạo đơn báo cáo.',
            ),
        ],
      ),
    );
  }

  Widget _contentButton() {
    if (_isLoading == false) {
      if (widget.task.status == StatusDataConstant.inProgress) {
        if (widget.task.taskType.taskTypeId == TaskTypeDataConstant.health &&
            !_areAnyMedicationsChecked()) {
          return const Text('Chưa ghi nhận đã cho uống thuốc');
        } else if (widget.task.taskType.taskTypeId ==
                TaskTypeDataConstant.feeding &&
            widget.task.hasAnimalDesease == true &&
            !_isIsolationFed) {
          return const Text('Vui lòng xác nhận đã cho ăn ở chuồng cách ly');
        } else {
          return const Text('Xác nhận hoàn thành');
        }
      } else if (taskStatus == StatusDataConstant.doneVn) {
        return const Text('Công việc đã hoàn thành');
      } else if (taskStatus == StatusDataConstant.overdueVn) {
        return const Text('Công việc đã quá hạn');
      } else if (taskStatus == StatusDataConstant.cancelledVn) {
        return const Text('Công việc đã bị hủy');
      } else {
        return Text(_isWithinWorkingHours()
            ? 'Xác nhận làm việc'
            : 'Chưa đến giờ làm việc');
      }
    } else {
      return const Text('Đang tải...');
    }
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

  bool _validateTaskInfo() {
    if (_isLoading == false) {
      if (_isProcessing == false) {
        if (widget.task.taskType.taskTypeId == TaskTypeDataConstant.feeding) {
          return TaskValidation.validateFoodLog(
            actualWeightController: _actualWeightController,
            hasAnimalDesease: widget.task.hasAnimalDesease ?? false,
            isIsolationFed: _isIsolationFed,
          );
        } else if (widget.task.taskType.taskTypeId ==
            TaskTypeDataConstant.health) {
          return TaskValidation.validateHealthLog();
        } else if (widget.task.taskType.taskTypeId ==
            TaskTypeDataConstant.vaccin) {
          return TaskValidation.validateVaccineLog(
            countAnimalVaccineController: _countAnimalVaccineController,
          );
        } else if (widget.task.taskType.taskTypeId ==
            TaskTypeDataConstant.eggHarvest) {
          return TaskValidation.validateEggHarvestLog(
            countEggCollectedController: _countEggCollectedController,
          );
        } else if (widget.task.taskType.taskTypeId ==
            TaskTypeDataConstant.sellAnimal) {
          return TaskValidation.validateAnimalSaleLog(
            weightAnimalController: _weightMeatSellController,
            priceAnimalController: _priceMeatSellController,
          );
        } else if (widget.task.taskType.taskTypeId ==
            TaskTypeDataConstant.sellEgg) {
          return TaskValidation.validateEggSaleLog(
            countEggSellController: _countEggSellController,
            priceEggSellController: _priceEggSellController,
          );
        } else if (widget.task.taskType.taskTypeId ==
            TaskTypeDataConstant.weighing) {
          return TaskValidation.validateWeighingLog(
            weightAnimalController: _weightAnimalController,
          );
        }
      }
    }
    return false;
  }
}
