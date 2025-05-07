import 'dart:developer';
import 'dart:io';

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
import 'package:smart_farm/src/model/dto/egg_harvest/egg_harvest_dto.dart';
import 'package:smart_farm/src/model/dto/index.dart';
import 'package:smart_farm/src/model/dto/sale_log_detail/sale_log_detail_dto.dart';
import 'package:smart_farm/src/model/dto/task/sale_detail_log/sale_detail_log_dto.dart';
import 'package:smart_farm/src/model/dto/task/sale_log/sale_log_dto.dart';
import 'package:smart_farm/src/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:smart_farm/src/model/params/create_food_log_cubit/create_food_log_cubit_params.dart';
import 'package:smart_farm/src/model/params/create_sale_log_cubit/create_sale_log_cubit_params.dart';
import 'package:smart_farm/src/model/params/create_vaccine_log_cubit_params/create_vaccine_log_cubit_params.dart';
import 'package:smart_farm/src/model/request/egg_harvest/egg_harvest_request.dart';
import 'package:smart_farm/src/model/request/growth_stage/update_weight/update_weight_request.dart';
import 'package:smart_farm/src/model/request/prescription/update_status_prescription_request.dart';
import 'package:smart_farm/src/model/request/vaccine_schedule_log/vaccine_schedule_log_request.dart';
import 'package:smart_farm/src/view/task/task_validation.dart';
import 'package:smart_farm/src/view/task/widgets/animal_sale_log_widget.dart';
import 'package:smart_farm/src/view/task/widgets/food_log_widget.dart';
import 'package:smart_farm/src/view/task/widgets/give_chicken_log_widget.dart';
import 'package:smart_farm/src/view/task/widgets/health_log_widget.dart';
import 'package:smart_farm/src/view/task/widgets/image_note_section.dart';
import 'package:smart_farm/src/view/task/widgets/status_notification_widget.dart';
import 'package:smart_farm/src/view/task/widgets/vaccine/vaccine_detail_dialog.dart';
import 'package:smart_farm/src/view/task/widgets/vaccine/vaccine_log_widget.dart';
import 'package:smart_farm/src/view/task/widgets/weighing_log_widget.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/view/widgets/processing_button_widget.dart';
import 'package:smart_farm/src/viewmodel/animal_sale/animal_sale_cubit.dart';
import 'package:smart_farm/src/viewmodel/egg_harvest/egg_harvest_cubit.dart';
import 'package:smart_farm/src/viewmodel/farming_batch/farming_batch_cubit.dart';
import 'package:smart_farm/src/viewmodel/growth_stage/growth_stage_cubit.dart';
import 'package:smart_farm/src/viewmodel/index.dart';
import 'package:smart_farm/src/viewmodel/prescription/prescription_cubit.dart';
import 'package:smart_farm/src/viewmodel/sale_type/sale_type_cubit.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';
import 'package:smart_farm/src/viewmodel/task/vaccine_schedule_log/vaccine_schedule_log_cubit.dart';
import 'package:smart_farm/src/viewmodel/upload_image/upload_image_cubit.dart';
import 'package:smart_farm/src/viewmodel/vaccine/vaccine_cubit.dart';
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
  FarmingBatchDto? farmingBatch;
  String? userName = '';
  bool get isPending => taskStatus == StatusDataConstant.pendingVn;
  String imageURL = '';
  VaccineDto? vaccine;

  // --- Prescription related variables ---
  PrescriptionDto? prescription;
  String? prescriptionId;

  // --- Health log related variables ---
  bool _hasTakenAllMedications = false;

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

  // --- Weighing related variables ---
  double weightAnimal = 0;

  // --- Vaccine related variables ---
  List<VaccineScheduleDto> vaccineScheduleList = [];
  VaccineScheduleDto? vaccineSchedule;
  VaccineScheduleLogDto? vaccineScheduleLog;

  // --- Animal sale related variables ---
  DateTime? saleDate;
  SaleTypeDto? saleType;
  SaleLogDto? saleLog;
  SaleDetailLogDto? saleDetailLog;
  SaleLogDetailDto? saleLogDetail;
  double weightMeatSell = 0;
  double weightGiveChicken = 0;

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
  final TextEditingController _animalCountSellController =
      TextEditingController();
  final TextEditingController _animalCountDonateController =
      TextEditingController();
  final TextEditingController _weightGiveChickenController =
      TextEditingController();
  final TextEditingController _priceGiveChickenController =
      TextEditingController();
  final TextEditingController _dateAnimalDonateController =
      TextEditingController();

  // --- Image upload ---
  final List<File> _images = [];

  // --- Medication check state ---
  final Map<String, bool> _medicationChecked = {};

  // Add a new variable to track the isolation cage feeding status
  bool _isIsolationFed = false;

  // Params for CubitLog
  CreateFoodLogCubitParams? _foodLogParams;
  CreateVaccineLogCubitParams? _vaccineLogParams;
  CreateSaleLogCubitParams? _saleLogParams;

  // LogDtos
  DailyFoodUsageLogDto? _foodLog;
  VaccineScheduleLogRequest? _vaccineLogRequest;
  UpdateWeightRequest? _updateWeightRequest;

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
    _viewMode =
        widget.task.status == StatusDataConstant.done; // Store view mode flag
    context
        .read<UserBloc>()
        .add(const UserEvent.getUserProfile(isAppStart: false));

    _actualWeightController.text = '0';
    _affectedController.text = '0';
    _countAnimalVaccineController.text = '0';
    _countAnimalSellControler.text = '0';
    _weightAnimalController.text = "0.0";
    _weightMeatSellController.text = "0.0";
    _countEggCollectedController.text = '0';
    _countEggSellController.text = '0';
    _weightGiveChickenController.text = '0.0';
    // _priceGiveChickenController.text = '0';
    _lastSessionQuantityController.text = '0';
    _dateAnimalSellController.text =
        DateFormat('dd/MM/yyyy').format(TimeUtils.customNow());
    _animalCountSellController.text = '0';
    saleDate = TimeUtils.customNow();
    prescriptionId = widget.task.prescriptionId;
    _animalCountDonateController.text = '0';
    _dateAnimalDonateController.text =
        DateFormat('dd/MM/yyyy').format(TimeUtils.customNow());

    // If in view mode, we're certainly dealing with a completed task
    if (_viewMode) {
      setState(() {
        taskStatus = StatusDataConstant.doneVn;
      });
    }
  }

  void _initDataLog() {
    if (widget.task.status != StatusDataConstant.pending) {
      if (widget.task.taskType.taskTypeName == TaskTypeDataConstant.feeding) {
        if (widget.task.status == StatusDataConstant.inProgress ||
            widget.task.status == StatusDataConstant.overdue) {
          context
              .read<GrowthStageCubit>()
              .getRecommendedWeightByCageId(widget.task.cageId);
        } else {
          context.read<TaskBloc>().add(TaskEvent.getDailyFoodUsageLog(
                widget.taskId,
              ));
        }
      } else if (widget.task.taskType.taskTypeName ==
              TaskTypeDataConstant.weighing ||
          widget.task.taskType.taskTypeName ==
              TaskTypeDataConstant.sellAnimal ||
          widget.task.taskType.taskTypeName == TaskTypeDataConstant.sellEgg ||
          widget.task.taskType.taskTypeName ==
              TaskTypeDataConstant.giveChicken) {
        context.read<FarmingBatchCubit>().getFarmingBatchByCageDuedate(
            widget.task.cageId, widget.task.dueDate);
      } else if (widget.task.taskType.taskTypeName ==
          TaskTypeDataConstant.health) {
        context
            .read<PrescriptionCubit>()
            .getPrescription(widget.task.prescriptionId ?? '');
      } else if (widget.task.taskType.taskTypeName ==
          TaskTypeDataConstant.vaccin) {
        context.read<FarmingBatchCubit>().getFarmingBatchByCageDuedate(
            widget.task.cageId, widget.task.dueDate);
      } else if (widget.task.taskType.taskTypeName ==
          TaskTypeDataConstant.eggHarvest) {
        context
            .read<GrowthStageCubit>()
            .getGrowthStageByCageId(widget.task.cageId);
      }
    }
    if (widget.task.status == StatusDataConstant.done) {
      if (widget.task.taskType.taskTypeName == TaskTypeDataConstant.vaccin) {
        context.read<VaccineScheduleLogCubit>().getVaccineScheduleLogByTaskId(
              widget.taskId,
            );
      } else if (widget.task.taskType.taskTypeName ==
          TaskTypeDataConstant.eggHarvest) {
        context.read<EggHarvestCubit>().getEggHarvestByTaskId(
              taskId: widget.taskId,
            );
      } else if (widget.task.taskType.taskTypeName ==
          TaskTypeDataConstant.health) {
        context.read<TaskBloc>().add(TaskEvent.getHealthLog(
              widget.taskId,
            ));
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

  bool _isWithinWorkingHours() {
    return isWithinWorkingHours(widget.task);
  }

  bool _canCompleteTask() {
    return canCompleteTask(
      taskStatus: widget.task.status,
      task: widget.task,
      hasTakenAllMedications: _hasTakenAllMedications,
      isIsolationFed: _isIsolationFed,
      countAnimalVaccine: _countAnimalVaccineController.text,
      weightAnimal: _weightAnimalController.text,
      weightMeatSell: _weightMeatSellController.text,
      priceMeatSell: _priceMeatSellController.text.trim(),
      countEggSell: _countEggSellController.text,
      priceEggSell: _priceEggSellController.text.trim(),
      countEggCollected: _countEggCollectedController.text,
    );
  }

  void _updateTaskStatus() {
    FocusScope.of(context).unfocus();
    if (!_canCompleteTask()) {
      String errorMessage = 'Lỗi không xác định';

      if (widget.task.taskType.taskTypeName == TaskTypeDataConstant.health) {
        errorMessage = 'Vui lòng xác nhận đã cho uống thuốc.';
      } else if (widget.task.taskType.taskTypeName ==
              TaskTypeDataConstant.feeding &&
          widget.task.hasAnimalDesease == true &&
          !_isIsolationFed) {
        errorMessage = 'Vui lòng xác nhận đã cho ăn ở chuồng cách ly.';
      } else if (widget.task.taskType.taskTypeName ==
          TaskTypeDataConstant.vaccin) {
        errorMessage = 'Vui lòng nhập số lượng gia cầm đã tiêm.';
      } else if (widget.task.taskType.taskTypeName ==
          TaskTypeDataConstant.weighing) {
        errorMessage = 'Vui lòng nhập số cân nặng trung bình';
      } else if (widget.task.taskType.taskTypeName ==
          TaskTypeDataConstant.sellAnimal) {
        if (_weightMeatSellController.text == '0') {
          errorMessage = 'Khối lượng thịt phải lớn hơn 0';
        } else if (_priceMeatSellController.text.trim().isEmpty) {
          errorMessage = 'Vui lòng nhập giá bán hợp lệ';
        } else {
          errorMessage = 'Vui lòng nhập khối lượng thịt và giá bán hợp lệ';
        }
      } else if (widget.task.taskType.taskTypeName ==
          TaskTypeDataConstant.sellEgg) {
        if (_countEggSellController.text == '0') {
          errorMessage = 'Số lượng trứng phải lớn hơn 0';
        } else if (_priceEggSellController.text.trim().isEmpty) {
          errorMessage = 'Vui lòng nhập giá bán hợp lệ';
        } else {
          errorMessage = 'Vui lòng nhập số lượng trứng và giá bán hợp lệ';
        }
      } else if (widget.task.taskType.taskTypeName ==
          TaskTypeDataConstant.eggHarvest) {
        errorMessage = 'Vui lòng nhập số lượng trứng thu hoạch';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
      return;
    }

    // Updated dialog with health status selection
    if (widget.task.isTreatmentTask ||
        widget.task.taskType.taskTypeName == TaskTypeDataConstant.sellAnimal ||
        widget.task.taskType.taskTypeName == TaskTypeDataConstant.sellEgg ||
        widget.task.taskType.taskTypeName == TaskTypeDataConstant.giveChicken) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return WarningConfirmationDialog(
                  title: 'Xác nhận hoàn thành công việc',
                  content: Column(
                    children: [
                      const Text(
                          'Xác nhận cung cấp thông tin chính xác để hoàn thành công việc')
                    ],
                  ),
                  primaryButtonText: 'Xác nhận',
                  onPrimaryButtonPressed: () {
                    Navigator.of(context).pop();
                    if (_images.isNotEmpty) {
                      context
                          .read<UploadImageCubit>()
                          .uploadImage(file: _images.first, isTaskImage: true);
                    } else {
                      _onCreateLog();
                    }
                  },
                  secondaryButtonText: 'Hủy',
                  onSecondaryButtonPressed: () {
                    Navigator.of(context).pop();
                  });
            });
          });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // Use a separate variable to track selected state in dialog
          bool dialogIsHealthy = true;

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
                      groupValue: dialogIsHealthy,
                      onChanged: (value) {
                        setState(() {
                          dialogIsHealthy = value!;
                        });
                      },
                    ),
                    RadioListTile<bool>(
                      title: const Text('Đàn gà có dấu hiệu bất thường/bệnh'),
                      value: false,
                      groupValue: dialogIsHealthy,
                      onChanged: (value) {
                        setState(() {
                          dialogIsHealthy = value!;
                        });
                      },
                    ),
                    if (!dialogIsHealthy)
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
                  if (dialogIsHealthy) {
                    // Normal flow - upload image if available or create log
                    if (_images.isNotEmpty) {
                      context
                          .read<UploadImageCubit>()
                          .uploadImage(file: _images.first, isTaskImage: true);
                    } else {
                      _onCreateLog();
                    }
                  } else {
                    if (widget.task.taskType.taskTypeName ==
                        TaskTypeDataConstant.feeding) {
                      _handleNavigateCreateMedicalSymptomOnFoodTask();
                    } else if (widget.task.taskType.taskTypeName ==
                        TaskTypeDataConstant.vaccin) {
                      _handleNavigateCreateMedicalSymptomOnVaccineTask();
                    } else if (widget.task.taskType.taskTypeName ==
                        TaskTypeDataConstant.sellAnimal) {
                      _handleNavigateCreateMedicalSymptomOnSellAnimalTask();
                    } else if (widget.task.taskType.taskTypeName ==
                        TaskTypeDataConstant.weighing) {
                      _handleNavigateCreateMedicalSymptomOnWeighingTask();
                    } else {
                      context.push(
                        RouteName.createSymptom,
                        extra: {
                          'cageId': widget.task.cageId,
                          'taskId': widget.task.id,
                          'imageLog': _images.isNotEmpty ? _images.first : null,
                          'fromTask': true,
                          'cageName': widget.task.cageName
                        },
                      );
                    }
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
  }

  void _handleNavigateCreateMedicalSymptomOnWeighingTask() {
    _updateWeightRequest = UpdateWeightRequest(
      growthStageId: growthStage!.id,
      // weightAnimal: double.parse(_weightAnimalController.text),
      weightAnimal: weightAnimal,
      taskId: widget.task.id,
    );

    context.push(RouteName.createSymptom, extra: {
      'cageId': widget.task.cageId,
      'taskId': widget.task.id,
      'fromTask': true,
      'imageLog': _images.isNotEmpty ? _images.first : null,
      'cageName': widget.task.cageName,
      'updateWeightRequest': _updateWeightRequest,
    });
  }

  void _handleNavigateCreateMedicalSymptomOnSellAnimalTask() {
    _saleLogParams = CreateSaleLogCubitParams(
      growthStageId: growthStage!.id,
      saleDate: saleDate!.toIso8601String(),
      unitPrice: int.parse(_priceMeatSellController.text.replaceAll(',', '')),
      quantity: int.parse(_animalCountSellController.text),
      weight: double.parse(_weightMeatSellController.text),
      saleTypeId: saleType!.id,
      taskId: widget.task.id,
    );

    context.push(RouteName.createSymptom, extra: {
      'cageId': widget.task.cageId,
      'taskId': widget.task.id,
      'fromTask': true,
      'imageLog': _images.isNotEmpty ? _images.first : null,
      'cageName': widget.task.cageName,
      'paramsSaleLog': _saleLogParams,
    });
  }

  void _handleNavigateCreateMedicalSymptomOnFoodTask() {
    _foodLog = DailyFoodUsageLogDto(
        recommendedWeight: (recommendedWeight!.toDouble()),
        actualWeight: actualWeight.toDouble(),
        notes: logController.text,
        logTime: TimeUtils.customNow(),
        photo: uploadImage?.path != null
            ? '${dotenv.env['IMAGE_STORAGE_URL']}${uploadImage!.path}'
            : '',
        taskId: widget.task.id);

    _foodLogParams = CreateFoodLogCubitParams(
      cageId: widget.task.cageId,
      log: _foodLog!,
      afterSymptomReport: true,
    );

    context.push(RouteName.createSymptom, extra: {
      'cageId': widget.task.cageId,
      'taskId': widget.task.id,
      'fromTask': true,
      'imageLog': _images.isNotEmpty ? _images.first : null,
      'cageName': widget.task.cageName,
      'paramsFoodLog': _foodLogParams,
    });
  }

  void _handleNavigateCreateMedicalSymptomOnVaccineTask() {
    _vaccineLogRequest = VaccineScheduleLogRequest(
      date: TimeUtils.customNow().toIso8601String(),
      session: vaccineSchedule!.session,
      vaccineId: vaccineSchedule!.vaccineId,
      quantity: int.parse(_countAnimalVaccineController.text),
      notes: logController.text,
      photo: uploadImage?.path != null
          ? '${dotenv.env['IMAGE_STORAGE_URL']}${uploadImage!.path}'
          : '',
      taskId: widget.task.id,
    );

    _vaccineLogParams = CreateVaccineLogCubitParams(
      vaccineScheduleLogRequest: _vaccineLogRequest!,
      afterSymptomReport: true,
    );

    context.push(RouteName.createSymptom, extra: {
      'cageId': widget.task.cageId,
      'taskId': widget.task.id,
      'fromTask': true,
      'imageLog': _images.isNotEmpty ? _images.first : null,
      'cageName': widget.task.cageName,
      'paramsVaccineLog': _vaccineLogParams,
    });
  }

  void _onCreateLog() {
    if (widget.task.status == StatusDataConstant.inProgress ||
        widget.task.status == StatusDataConstant.overdue) {
      if (widget.task.taskType.taskTypeName == TaskTypeDataConstant.feeding) {
        double actualWeight = this.actualWeight;
        final log = DailyFoodUsageLogDto(
            recommendedWeight: recommendedWeight!.toDouble(),
            actualWeight: actualWeight.toDouble(),
            notes:
                'Chủ trang trại: ${widget.task.description}. Nhân viên: ${logController.text}',
            logTime: TimeUtils.customNow(),
            photo: uploadImage?.path != null
                ? '${dotenv.env['IMAGE_STORAGE_URL']}${uploadImage!.path}'
                : '',
            taskId: widget.task.id);
        context.read<TaskBloc>().add(
              TaskEvent.createDailyFoodUsageLog(
                cageId: widget.task.cageId,
                log: log,
              ),
            );
      } else if (widget.task.taskType.taskTypeName ==
          TaskTypeDataConstant.health) {
        if (widget.task.prescriptionId != null) {
          final log = HealthLogDto(
            taskId: widget.taskId,
            prescriptionId: prescriptionId ?? '',
            date: TimeUtils.customNow(),
            notes:
                'Chủ trang trại: ${widget.task.description}. Nhân viên: ${logController.text}',
            photo: uploadImage?.path != null
                ? '${dotenv.env['IMAGE_STORAGE_URL']}${uploadImage!.path}'
                : '',
          );
          context.read<TaskBloc>().add(TaskEvent.createHealthLog(
              prescriptionId: prescriptionId ?? '', log: log));
        }
      } else if (widget.task.taskType.taskTypeName ==
          TaskTypeDataConstant.vaccin) {
        final request = VaccineScheduleLogRequest(
          date: TimeUtils.customNow().toIso8601String(),
          session: vaccineSchedule!.session,
          vaccineId: vaccineSchedule!.vaccineId,
          quantity: int.parse(_countAnimalVaccineController.text),
          notes:
              'Chủ trang trại: ${widget.task.description}. Nhân viên: ${logController.text}',
          photo: uploadImage?.path != null
              ? '${dotenv.env['IMAGE_STORAGE_URL']}${uploadImage!.path}'
              : '',
          taskId: widget.task.id,
        );
        context.read<VaccineScheduleLogCubit>().create(request: request);
      } else if (widget.task.taskType.taskTypeName ==
          TaskTypeDataConstant.weighing) {
        context.read<GrowthStageCubit>().updateWeight(
              request: UpdateWeightRequest(
                growthStageId: growthStage!.id,
                // weightAnimal: double.parse(_weightAnimalController.text),
                weightAnimal: weightAnimal,
                taskId: widget.task.id,
              ),
            );
      } else if (widget.task.taskType.taskTypeName ==
          TaskTypeDataConstant.sellAnimal) {
        context.read<AnimalSaleCubit>().createAnimalSale(
              growthStageId: growthStage!.id,
              saleDate: saleDate!.toIso8601String(),
              unitPrice:
                  int.parse(_priceMeatSellController.text.replaceAll(',', '')),
              quantity: int.parse(_animalCountSellController.text),
              saleTypeId: saleType!.id,
              weight: weightMeatSell,
              taskId: widget.task.id,
              note:
                  'Chủ trang trại: ${widget.task.description}. Nhân viên: ${logController.text}',
            );
      } else if (widget.task.taskType.taskTypeName ==
          TaskTypeDataConstant.giveChicken) {
        context.read<AnimalSaleCubit>().createAnimalSale(
              growthStageId: growthStage!.id,
              saleDate: saleDate!.toIso8601String(),
              unitPrice: int.parse(
                  _priceGiveChickenController.text.replaceAll(',', '')),
              quantity: int.parse(_animalCountDonateController.text),
              weight: weightGiveChicken,
              saleTypeId: saleType!.id,
              taskId: widget.task.id,
              note:
                  'Chủ trang trại: ${widget.task.description}. Nhân viên: ${logController.text}',
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
      } else if (_sourceScreen == 'qrcode') {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop({'reload': true, 'source': 'qrcode'});
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
                _handleTaskComplete(context, true);
              },
              updateStatusTaskFailure: (e) async {
                setState(() {
                  _isProcessing = false;
                });
                if (e.toString().contains('task-overdue')) {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return WarningConfirmationDialog(
                          title: 'Cảnh báo',
                          content: const Text(
                              'Công việc đã quá thời gian thực hiện, không thể cập nhật trạng thái.'),
                          primaryButtonText: 'Quay về trang chủ',
                          onPrimaryButtonPressed: () {
                            context.go(RouteName.home);
                          },
                        );
                      });
                }
                log("Cập nhật trạng thái công việc thất bại! \nError: $e");
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
                if (widget.task.status == StatusDataConstant.inProgress) {
                  context.read<TaskBloc>().add(TaskEvent.updateTask(
                      widget.taskId, StatusDataConstant.done));
                } else if (widget.task.status == StatusDataConstant.overdue) {
                  _handleTaskComplete(context, true);
                }
              },
              createDailyFoodUsageLogFailure: (e) async {
                setState(() {
                  _isProcessing = false;
                });
                context
                    .read<UploadImageCubit>()
                    .deleteImage(id: uploadImage!.id);
                // LoadingDialog.hide(context);
                log("Tạo log cho ăn thất bại!");
              },
              createHealthLogLoading: () {
                setState(() {
                  _isProcessing = true;
                });
                log("Đang tạo log uống thuốc...");
              },
              createHealthLogSuccess: () async {
                log("Tạo log uống thuốc thành công!");
                context.read<PrescriptionCubit>().checkPrescriptionLastSession(
                      prescriptionId: widget.task.prescriptionId ?? '',
                      taskId: widget.task.id,
                    );
              },
              createHealthLogFailure: (e) async {
                if (_images.isNotEmpty) {
                  context
                      .read<UploadImageCubit>()
                      .deleteImage(id: uploadImage!.id);
                }
                setState(() {
                  _isProcessing = false;
                });
                // LoadingDialog.hide(context);
                log("Tạo log uống thuốc thất bại!");
              },
              createVaccinScheduleLogLoading: () {
                // LoadingDialog.show(context, "Đang tạo log lịch tiêm chủng...");
                log("Đang tạo log lịch tiêm chủng...");
              },
              createVaccinScheduleLogSuccess: () async {
                // LoadingDialog.hide(context);
                log("Tạo log lịch tiêm chủng thành công!");
                context.read<TaskBloc>().add(TaskEvent.updateTask(
                    widget.taskId, StatusDataConstant.done));
              },
              createVaccinScheduleLogFailure: (e) async {
                context
                    .read<UploadImageCubit>()
                    .deleteImage(id: uploadImage!.id);
                // LoadingDialog.hide(context);
                if (e.toString().contains('vaccinschedule-not-found')) {
                  log("Vaccine schedule không tồn tại!");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Vaccine schedule không tồn tại!')),
                  );
                } else {
                  log("Tạo log lịch tiêm chủng thất bại!");
                }
              },
              getDailyFoodUsageLogLoading: () {
                log("Đang lấy log cho ăn...");
                // LoadingDialog.show(
                //     context, "Đang lấy thông tin đơn báo cáo...");
                setState(() {
                  _isLoading = true;
                });
              },
              getDailyFoodUsageLogSuccess: (foodLog) async {
                // log('[FoodLog] Thông tin FoodLog: id - ${foodLog.}')
                log('[FoodLog] Lấy log cho ăn thành công!');
                setState(() {
                  _isLoading = false;
                  recommendedWeight = foodLog.recommendedWeight.toDouble();
                  actualWeight = foodLog.actualWeight.toDouble();
                  _actualWeightController.text = actualWeight.toString();
                  logController.text = foodLog.notes;
                  logTime = foodLog.logTime;
                  imageURL = foodLog.photo;
                });
                // LoadingDialog.hide(context);
              },
              getDailyFoodUsageLogFailure: (e) async {
                log("Lấy log cho ăn thất bại!");
                setState(() {
                  _isLoading = false;
                });
              },
              getHealthLogLoading: () {
                log("Đang lấy log sức khỏe...");
                // LoadingDialog.show(
                //     context, "Đang lấy thông tin đơn báo cáo...");
                setState(() {
                  _isLoading = true;
                });
              },
              getHealthLogSuccess: (log) async {
                setState(() {
                  logController.text = log.notes;
                  imageURL = log.photo!;
                  logTime = log.date;
                  _isLoading = false;
                });
                // LoadingDialog.hide(context);
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
              getRecommendedWeightByCageIdSuccess:
                  (recommendedWeight, _, growthStage) {
                log('[RECOMMENDED_WEIGHT] Lấy cân nặng khuyến nghị thành công!: $recommendedWeight');
                log('[GROWTH_STAGE] id: ${growthStage.id}');
                setState(() {
                  log('Recommended weight lúc nhân: $recommendedWeight');
                  this.recommendedWeight = recommendedWeight;
                  this.growthStage = growthStage;
                  actualWeight = recommendedWeight;
                  log('Actual weight lúc nhân: $actualWeight');
                  _actualWeightController.text = recommendedWeight.toString();
                  _isLoading = false;
                });
                if (widget.task.status == StatusDataConstant.done) {
                  if (widget.task.taskType.taskTypeName ==
                      TaskTypeDataConstant.feeding) {
                    context
                        .read<TaskBloc>()
                        .add(TaskEvent.getDailyFoodUsageLog(widget.taskId));
                  } else if (widget.task.taskType.taskTypeName ==
                      TaskTypeDataConstant.health) {
                    context
                        .read<TaskBloc>()
                        .add(TaskEvent.getHealthLog(widget.taskId));
                  } else if (widget.task.taskType.taskTypeName ==
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
                setState(() {
                  _isLoading = true;
                });
              },
              getGrowthStageByCageIdSuccess: (growthStage) {
                log('Lấy giai đoạn phát triển thành công!');
                setState(() {
                  this.growthStage = growthStage;
                  _isLoading = false;
                });
                if (widget.task.taskType.taskTypeName ==
                        TaskTypeDataConstant.vaccin &&
                    widget.task.status == StatusDataConstant.inProgress) {
                  int realQuantity = (growthStage.quantity ?? 0) -
                      (growthStage.affectQuantity ?? 0) -
                      (growthStage.deadQuantity ?? 0);
                  setState(() {
                    _countAnimalVaccineController.text =
                        realQuantity.toString();
                  });
                  context
                      .read<VaccineScheduleCubit>()
                      .getVaccineScheduleByStageId(
                        stageId: growthStage.id,
                        date: TimeUtils.customNow(),
                        status: VaccineScheduleStatusConstant.UPCOMING,
                      );
                } else if (widget.task.taskType.taskTypeName ==
                    TaskTypeDataConstant.sellAnimal) {
                  context
                      .read<SaleTypeCubit>()
                      .getSaleTypeByName(saleTypeName: 'MeatSale');
                } else if (widget.task.taskType.taskTypeName ==
                    TaskTypeDataConstant.sellEgg) {
                  context
                      .read<SaleTypeCubit>()
                      .getSaleTypeByName(saleTypeName: 'EggSale');
                } else if (widget.task.taskType.taskTypeName ==
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
                setState(() {
                  _isLoading = false;
                });
              },
              updateWeightInProgress: () {
                setState(() {
                  _isProcessing = true;
                });
              },
              updateWeightSuccess: (result) {
                log('Cập nhật cân nặng thành công!');
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(
                //       content: Text('Cập nhật cân nặng thành công!')),
                // );
                setState(() {
                  _isProcessing = false;
                });
                if (widget.task.status == StatusDataConstant.inProgress) {
                  context.read<TaskBloc>().add(TaskEvent.updateTask(
                      widget.taskId, StatusDataConstant.done));
                } else if (widget.task.status == StatusDataConstant.overdue) {
                  _handleTaskComplete(context, true);
                }
              },
              updateWeightFailure: (e) {
                log('Cập nhật cân nặng thất bại!');
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(content: Text('Cập nhật cân nặng thất bại!')),
                // );
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
                  _isLoading = false;
                });
              },
              getPrescriptionFailure: (e) {
                log('Lấy thuốc thất bại!');
                setState(() {
                  _isLoading = false;
                });
              },
              getPrescriptionLoading: () {
                setState(() {
                  _isLoading = true;
                });
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
                  if (widget.task.status == StatusDataConstant.inProgress) {
                    context.read<TaskBloc>().add(TaskEvent.updateTask(
                        widget.taskId, StatusDataConstant.done));
                  } else if (widget.task.status == StatusDataConstant.overdue) {
                    _handleTaskComplete(context, true);
                  }
                } else {
                  log('[Prescription] Số con còn lại sau điều trị: ${prescription!.quantityAnimal}');
                  final request = UpdateStatusPrescriptionRequest(
                    status: 'Completed',
                    remainingQuantity: prescription!.quantityAnimal,
                  );
                  context
                      .read<PrescriptionCubit>()
                      .updateQuantityAnimalAfterTreatment(
                        prescriptionId: prescriptionId!,
                        request: request,
                      );
                }
              },
              checkPrescriptionLastSessionFailure: (message) {
                setState(() {
                  _isProcessing = false;
                });
              },
              updateQuantityAnimalAfterTreatmentInProgress: () {},
              updateQuantityAnimalAfterTreatmentSuccess: () {
                if (widget.task.status == StatusDataConstant.inProgress) {
                  context.read<TaskBloc>().add(TaskEvent.updateTask(
                      widget.taskId, StatusDataConstant.done));
                } else if (widget.task.status == StatusDataConstant.overdue) {
                  _handleTaskComplete(context, true);
                }
                log('Cập nhật số lượng gia cầm sau điều trị thành công!');
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
                  // _isLoading = false;
                });
                if (vaccineSchedule != null) {
                  context
                      .read<VaccineCubit>()
                      .getVaccineById(id: vaccineSchedule!.vaccineId);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text(
                        'Không có lịch tiêm chủng nào cho giai đoạn này!'),
                    backgroundColor: Colors.red,
                  ));
                  setState(() {
                    _isLoading = false;
                  });
                }
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
                  // _countAnimalVaccineController.text =
                  //     vaccineSchedule.quantity.toString();
                });
                context
                    .read<VaccineCubit>()
                    .getVaccineById(id: vaccineSchedule.vaccineId);
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
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(
                //       content: Text('Tạo log lịch tiêm chủng thành công!')),
                // );
                if (widget.task.status == StatusDataConstant.inProgress) {
                  context.read<TaskBloc>().add(TaskEvent.updateTask(
                      widget.taskId, StatusDataConstant.done));
                } else if (widget.task.status == StatusDataConstant.overdue) {
                  _handleTaskComplete(context, true);
                }
              },
              createVaccineScheduleLogFailure: (e) {
                context
                    .read<UploadImageCubit>()
                    .deleteImage(id: uploadImage!.id);
                log('Tạo log lịch tiêm chủng thất bại!');
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(
                //       content: Text('Tạo log lịch tiêm chủng thất bại!')),
                // );
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
                  logTime = DateTime.parse(vaccineScheduleLog.date);
                  _countAnimalVaccineController.text =
                      vaccineScheduleLog.quantity.toString();
                  logController.text = vaccineScheduleLog.notes;
                  imageURL = vaccineScheduleLog.photo;
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
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(
                //       content: Text('Tạo log bán gia cầm thành công!')),
                // );
                if (widget.task.status == StatusDataConstant.inProgress) {
                  context.read<TaskBloc>().add(TaskEvent.updateTask(
                      widget.taskId, StatusDataConstant.done));
                } else if (widget.task.status == StatusDataConstant.overdue) {
                  _handleTaskComplete(context, true);
                }
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
                if (
                    // growthStage != null &&
                    saleType != null &&
                        widget.task.status == StatusDataConstant.done) {
                  context
                      .read<AnimalSaleCubit>()
                      .getSaleLogByTaskId(taskId: widget.task.id);
                }
                //  else {
                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //     content: const Text(
                //         'Chưa có thông tin growth-stage cho công việc này! Vui lòng liên hệ admin để được hỗ trợ.'),
                //     backgroundColor: Colors.red,
                //   ));
                // }
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
              uploadImageInProgress: (_) {
                setState(() {
                  _isProcessing = true;
                });
                log('Đang tải ảnh lên...');
              },
              uploadImageSuccess: (imageDto, _) {
                setState(() {
                  uploadImage = imageDto;
                });
                log('Tải ảnh lên thành công!');
                _onCreateLog();
              },
              uploadImageFailure: (e, _) {
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
              getUserProfileSuccess: (userName, _, __) {
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
        ),
        BlocListener<FarmingBatchCubit, FarmingBatchState>(
          listener: (context, state) {
            state.maybeWhen(
              getFarmingBatchByCageInProgress: () {
                setState(() {
                  _isLoading = true;
                });
              },
              getFarmingBatchByCageSuccess: (farmingBatch) {
                setState(() {
                  this.farmingBatch = farmingBatch;
                  growthStage = farmingBatch.growthStageDetails;
                  _isLoading = false;
                });
                if (widget.task.taskType.taskTypeName ==
                        TaskTypeDataConstant.sellAnimal ||
                    widget.task.taskType.taskTypeName ==
                        TaskTypeDataConstant.giveChicken) {
                  context
                      .read<SaleTypeCubit>()
                      .getSaleTypeByName(saleTypeName: 'MeatSale');
                } else if (widget.task.taskType.taskTypeName ==
                        TaskTypeDataConstant.vaccin ||
                    widget.task.taskType.taskTypeName ==
                        TaskTypeDataConstant.weighing) {
                  context
                      .read<GrowthStageCubit>()
                      .getGrowthStageByCageId(widget.task.cageId);
                }
              },
              getFarmingBatchByCageFailure: (e) {
                if (e.toString().contains('farming-batch-not-found')) {
                  if (widget.task.taskType.taskTypeName ==
                      TaskTypeDataConstant.sellAnimal) {
                    context
                        .read<SaleTypeCubit>()
                        .getSaleTypeByName(saleTypeName: 'MeatSale');
                  } else {
                    setState(() {
                      _isLoading = false;
                    });
                  }
                } else {
                  setState(() {
                    _isLoading = false;
                  });
                }
                log('Lấy thông tin lô nuôi thất bại!');
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<VaccineCubit, VaccineState>(
          listener: (context, state) {
            state.maybeWhen(getVaccineByIdInProgress: () {
              setState(() {
                _isLoading = true;
              });
            }, getVaccineByIdSuccess: (vaccine) {
              setState(() {
                this.vaccine = vaccine;
                _isLoading = false;
              });
              // if (widget.task.status == StatusDataConstant.done) {
              //   context
              //       .read<VaccineScheduleLogCubit>()
              //       .getVaccineScheduleLogByTaskId(widget.task.id);
              // }
            }, getVaccineByIdFailure: (e) {
              setState(() {
                _isLoading = false;
              });
              log('Lấy thông tin vaccine thất bại!');
            }, orElse: () {
              return null;
            });
          },
        ),
        BlocListener<AnimalSaleCubit, AnimalSaleState>(
          listener: (context, state) {
            state.maybeWhen(
              getSaleLogByGrowthStageIdInProgress: () {
                setState(() {
                  _isLoading = true;
                });
              },
              getSaleLogByGrowthStageIdSuccess: (saleLog) {
                setState(() {
                  saleDetailLog = saleLog;
                  _isLoading = false;
                });
                log('[ANIMAL_SALE_BLOC_LISTENER] Lấy thông tin log bán gia cầm thành công!');
              },
              getSaleLogByGrowthStageIdFailure: (e) {
                setState(() {
                  _isLoading = false;
                });
                log('Lấy thông tin log bán gia cầm thất bại!');
              },
              getSaleLogByTaskIdInProgress: () => setState(() {
                _isLoading = true;
              }),
              getSaleLogByTaskIdSuccess: (saleLog) {
                setState(() {
                  saleLogDetail = saleLog;
                  logTime = DateTime.parse(saleLogDetail!.logTime);
                  _isLoading = false;
                });
                log('Lấy thông tin log bán gia cầm thành công!');
              },
              getSaleLogByTaskIdFailure: (e) {
                setState(() {
                  _isLoading = false;
                });
                log('Lấy thông tin log bán gia cầm thất bại!');
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
          // Replace the text+icon combo with just a home icon
          actions: [
            IconButton(
              icon: const Icon(Icons.home_outlined),
              onPressed: _navigateDirectlyToTaskScreen,
              tooltip: 'Quay lại danh sách công việc',
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _buildTaskReport(context),
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

  // Method to navigate directly to the Task screen
  void _navigateDirectlyToTaskScreen() {
    // If from cage screen, navigate with reload flag
    if (_sourceScreen == 'cage') {
      // If we can pop (e.g., coming from cage details), pop with reload data
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop({'reload': true, 'source': 'cage'});
      } else {
        // Otherwise go directly to cage screen with the appropriate cage ID
        context.go(RouteName.cage, extra: widget.task.cageId);
      }
    } else {
      // Default behavior - navigate to task list
      context.go(RouteName.task);
    }
  }

  Widget _buildTaskReport(BuildContext context) {
    // Adjust all input fields to be read-only if in view mode
    final bool readOnly =
        _viewMode || widget.task.status == StatusDataConstant.done;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 24.0, bottom: 80.0),
      child: Column(
        children: [
          if (widget.task.taskType.taskTypeName == TaskTypeDataConstant.feeding)
            FoodLogWidget(
              userName: userName,
              // ignore: unnecessary_null_comparison
              logTime: logTime,
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
                        // _actualWeightController.text = newWeight.toString();
                      });
                    },
              task: widget.task,
              recommendedWeight: recommendedWeight,
              logController: logController,
              actualWeightController: _actualWeightController,
              foodType: growthStage?.foodType,
            )
          else if (widget.task.taskType.taskTypeName ==
              TaskTypeDataConstant.health)
            HealthLogWidget(
              userName: userName,
              logTime: logTime,
              prescription: prescription,
              session: widget.task.session,
              task: widget.task,
              isConfirmed: _hasTakenAllMedications,
              onConfirmationChanged: readOnly
                  ? null
                  : (bool value) {
                      setState(() {
                        _hasTakenAllMedications = value;
                      });
                    },
              noteController: logController,
            )
          else if (widget.task.taskType.taskTypeName ==
              TaskTypeDataConstant.vaccin)
            VaccineLogWidget(
              userName: userName,
              vaccineSchedule: vaccineSchedule,
              growthStage: growthStage,
              logTime: logTime,
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
              logController: logController,
              farmingBatch: farmingBatch,
              readOnly: readOnly,
              vaccine: vaccine,
              vaccineScheduleLog: vaccineScheduleLog,
              totalPrice: vaccineScheduleLog?.toltalPrice,
              onVaccineDetailPressed: () {
                if (vaccine != null) {
                  showDialog(
                    context: context,
                    builder: (context) => VaccineDetailDialog(
                      vaccineName: vaccineSchedule?.vaccineName,
                      scheduleDate: vaccineSchedule?.date,
                      scheduleSession: vaccineSchedule?.session,
                      applicationAge: vaccineSchedule?.applicationAge,
                      vaccineDetail: vaccine!,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Không có thông tin vaccine!'),
                    ),
                  );
                }
              },
            )
          else if (widget.task.taskType.taskTypeName ==
              TaskTypeDataConstant.weighing)
            WeighingLogWidget(
              userName: userName,
              farmingBatch: farmingBatch,
              growthStage: growthStage,
              weightAnimalController: _weightAnimalController,
              onWeightChanged: readOnly
                  ? null
                  : (double newWeight) {
                      setState(() {
                        _weightAnimalController.text = newWeight.toString();
                        weightAnimal = newWeight;
                      });
                    },
              taskStatus: taskStatus,
              task: widget.task,
              readOnly: readOnly,
            )
          else if (widget.task.taskType.taskTypeName ==
                  TaskTypeDataConstant.sellAnimal ||
              widget.task.taskType.taskTypeName == TaskTypeDataConstant.sellEgg)
            if (widget.task.taskType.taskTypeName ==
                TaskTypeDataConstant.sellAnimal) ...[
              AnimalSaleLogWidget(
                userName: userName,
                logController: logController,
                growthStage: growthStage,
                isDisabled: readOnly,
                farmingBatch: farmingBatch,
                weightMeatSellController: _weightMeatSellController,
                priceMeatSellController: _priceMeatSellController,
                dateAnimalSellController: _dateAnimalSellController,
                animalCountSellController: _animalCountSellController,
                logTime: logTime,
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
                          // _weightMeatSellController.text = weight.toString();
                          weightMeatSell = weight;
                        });
                      },
                onPriceChanged: readOnly
                    ? null
                    : (price) {
                        setState(() {
                          _priceMeatSellController.text = price.toString();
                        });
                      },
                onAnimalCountChanged: readOnly
                    ? null
                    : (count) {
                        setState(() {
                          _animalCountSellController.text = count.toString();
                        });
                      },
                task: widget.task,
                readOnly: readOnly,
                salelog: saleLog,
                saleDetailLog: saleDetailLog,
                saleLogDetail: saleLogDetail,
              )
            ],
          if (widget.task.taskType.taskTypeName ==
              TaskTypeDataConstant.giveChicken)
            GiveChickenLogWidget(
              userName: userName,
              growthStage: growthStage,
              farmingBatch: farmingBatch,
              donationDate: saleDate!,
              logTime: logTime,
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
                        // _weightMeatSellController.text = weight.toString();
                        weightGiveChicken = weight;
                      });
                    },
              onPriceChanged: readOnly
                  ? null
                  : (price) {
                      setState(() {
                        _priceGiveChickenController.text = price.toString();
                      });
                    },
              priceGiveChickenController: _priceGiveChickenController,
              weightGiveChickenController: _weightGiveChickenController,
              task: widget.task,
              readOnly: readOnly,
              animalCountDonateController: _animalCountDonateController,
              dateDonateController: _dateAnimalDonateController,
              giveChickenLogDetail: saleLogDetail,
              isDisabled: readOnly,
              onAnimalCountChanged: readOnly
                  ? null
                  : (count) {
                      setState(() {
                        _animalCountDonateController.text = count.toString();
                      });
                    },
            ),
          const SizedBox(height: 16),
          if (widget.task.taskType.taskTypeName ==
                  TaskTypeDataConstant.health ||
              widget.task.taskType.taskTypeName ==
                  TaskTypeDataConstant.vaccin ||
              widget.task.taskType.taskTypeName == TaskTypeDataConstant.feeding)
            ImageNoteSection(
              images: _images,
              onImageAdded: _addImage,
              onImageRemoved: _removeImage,
              noteController: logController,
              isDisabled: readOnly,
              notePlaceholder:
                  'Nhập ghi chú về ${_getTaskTypeName()} (nếu có)...',
              imageURL: imageURL,
            )
        ],
      ),
    );
  }

  Widget _contentButton() {
    if (_isLoading == false) {
      if (widget.task.taskType.taskTypeName == TaskTypeDataConstant.health &&
          !_hasTakenAllMedications) {
        return const Text('Chưa xác nhận đã cho uống đủ thuốc');
      } else if (widget.task.taskType.taskTypeName ==
              TaskTypeDataConstant.feeding &&
          widget.task.hasAnimalDesease == true &&
          !_isIsolationFed) {
        return const Text('Vui lòng xác nhận đã cho ăn ở chuồng cách ly');
      } else if (widget.task.taskType.taskTypeName ==
              TaskTypeDataConstant.vaccin &&
          vaccineSchedule == null) {
        return const Text('Thông tin lịch tiêm trống');
      } else {
        return const Text('Xác nhận hoàn thành');
      }
    } else {
      return const Text('Đang tải...');
    }
  }

  bool _validateTaskInfo() {
    if (_isLoading == false) {
      if (_isProcessing == false) {
        if (widget.task.taskType.taskTypeName == TaskTypeDataConstant.feeding) {
          return TaskValidation.validateFoodLog(
            actualWeightController: _actualWeightController,
            hasAnimalDesease: widget.task.hasAnimalDesease ?? false,
            isIsolationFed: _isIsolationFed,
          );
        } else if (widget.task.taskType.taskTypeName ==
            TaskTypeDataConstant.health) {
          return TaskValidation.validateHealthLog(
            widget.task,
            prescription,
            _hasTakenAllMedications,
          );
        } else if (widget.task.taskType.taskTypeName ==
            TaskTypeDataConstant.vaccin) {
          return TaskValidation.validateVaccineLog(
            countAnimalVaccineController: _countAnimalVaccineController,
            vaccineSchedule: vaccineSchedule,
          );
        } else if (widget.task.taskType.taskTypeName ==
            TaskTypeDataConstant.eggHarvest) {
          return TaskValidation.validateEggHarvestLog(
            countEggCollectedController: _countEggCollectedController,
          );
        } else if (widget.task.taskType.taskTypeName ==
            TaskTypeDataConstant.sellAnimal) {
          return TaskValidation.validateAnimalSaleLog(
            weightAnimalController: _weightMeatSellController,
            priceAnimalController: _priceMeatSellController,
            animalCountSellController: _animalCountSellController,
          );
        } else if (widget.task.taskType.taskTypeName ==
            TaskTypeDataConstant.sellEgg) {
          return TaskValidation.validateEggSaleLog(
            countEggSellController: _countEggSellController,
            priceEggSellController: _priceEggSellController,
          );
        } else if (widget.task.taskType.taskTypeName ==
            TaskTypeDataConstant.weighing) {
          return TaskValidation.validateWeighingLog(
            weightAnimalController: _weightAnimalController,
          );
        } else if (widget.task.taskType.taskTypeName ==
            TaskTypeDataConstant.giveChicken) {
          return TaskValidation.validateGiveChickenLog(
            giveChickenCountController: _animalCountDonateController,
            giveChickenPriceController: _priceGiveChickenController,
            giveChickenWeightController: _weightGiveChickenController,
          );
        } else {
          return true;
        }
      }
    }
    return false;
  }

  String _getTaskTypeName() {
    switch (widget.task.taskType.taskTypeName) {
      case TaskTypeDataConstant.feeding:
        return "việc cho ăn";
      case TaskTypeDataConstant.health:
        return "việc cho uống thuốc";
      case TaskTypeDataConstant.vaccin:
        return "việc tiêm vaccine";
      case TaskTypeDataConstant.weighing:
        return "việc cân gia cầm";
      case TaskTypeDataConstant.eggHarvest:
        return "việc thu hoạch trứng";
      case TaskTypeDataConstant.sellAnimal:
        return "việc bán gia cầm";
      case TaskTypeDataConstant.sellEgg:
        return "việc bán trứng";
      default:
        return "công việc";
    }
  }
}
