import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:data_layer/data_layer.dart';
import 'package:data_layer/model/dto/task/sale_log/sale_log_dto.dart';
import 'package:data_layer/model/request/growth_stage/update_weight/update_weight_request.dart';
import 'package:data_layer/model/request/symptom/create_symptom/create_symptom_request.dart';
import 'package:data_layer/model/request/symptom/symptom/get_symptom_request.dart';
import 'package:data_layer/model/request/vaccine_schedule_log/vaccine_schedule_log_request.dart';
import 'package:data_layer/model/response/medical_symptom/medical_symptom_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/common/widgets/warning_confirm_dialog.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/constants/task_type_data_constant.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/core/utils/date_util.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/model/params/create_food_log_cubit/create_food_log_cubit_params.dart';
import 'package:smart_farm/src/model/params/create_health_log_cubit/create_health_log_cubit_params.dart';
import 'package:smart_farm/src/model/params/create_sale_log_cubit/create_sale_log_cubit_params.dart';
import 'package:smart_farm/src/model/params/create_vaccine_log_cubit_params/create_vaccine_log_cubit_params.dart';
import 'package:smart_farm/src/view/symptom/cage_option.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/view/widgets/loading_widget.dart';
import 'package:smart_farm/src/view/widgets/processing_button_widget.dart';
import 'package:smart_farm/src/view/widgets/qr_scanner.dart'
    show QRScannerWidget;
import 'package:smart_farm/src/viewmodel/animal_sale/animal_sale_cubit.dart';
import 'package:smart_farm/src/viewmodel/cage/cage_cubit.dart';
import 'package:smart_farm/src/viewmodel/farming_batch/farming_batch_cubit.dart';
import 'package:smart_farm/src/viewmodel/growth_stage/growth_stage_cubit.dart';
import 'package:smart_farm/src/viewmodel/healthy/healthy_cubit.dart';
import 'package:smart_farm/src/viewmodel/symptom/symptom_cubit.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';
import 'package:smart_farm/src/viewmodel/task/vaccine_schedule_log/vaccine_schedule_log_cubit.dart';
import 'package:smart_farm/src/viewmodel/upload_image/upload_image_cubit.dart';

class CreateSymptomWidget extends StatefulWidget {
  final String cageName;
  final String? cageId;
  final String? taskId;
  final bool fromTask;
  final CreateFoodLogCubitParams? paramsFoodLog;
  final CreateHealthLogCubitParams? paramsHealthLog;
  final CreateVaccineLogCubitParams? paramsVaccineLog;
  final CreateSaleLogCubitParams? paramsSaleLog;
  final UpdateWeightRequest? paramsUpdateWeight;
  final SaleLogDto? animalSaleLog;
  final File? imageLog;

  const CreateSymptomWidget({
    super.key,
    required this.cageName,
    this.cageId,
    this.taskId,
    this.fromTask = false,
    this.paramsFoodLog,
    this.paramsHealthLog,
    this.paramsVaccineLog,
    this.paramsSaleLog,
    this.paramsUpdateWeight,
    this.animalSaleLog,
    this.imageLog,
  });

  @override
  State<CreateSymptomWidget> createState() => _CreateSymptomWidgetState();
}

class _CreateSymptomWidgetState extends State<CreateSymptomWidget> {
  final _noteController = TextEditingController();
  final _affectedController = TextEditingController(text: '0');
  final _farmingBatchController = TextEditingController();
  final _searchSymptomController = TextEditingController();

  final List<File> _images = [];
  final List<GetSymptomRequest> _enteredSymptoms = [];
  final List<String> _symptomsName = [];
  final List<UploadImageDto> _uploadedImages = [];
  MedicalSymptomResponse? symptom;

  FarmingBatchDto? _farmingBatch;
  GrowthStageDto? _growthStage;
  List<SymptomDto> _symptoms = [];
  List<CageOption> _cages = [];
  UploadImageDto? _uploadedImage;

  String? _selectedCage;
  String? _selectedCageId;
  int? _affectedQuantity;
  bool _isLoading = false;
  bool _isProcessing = false;
  bool _isEmergency = false;
  bool _isCheckAllAnimalSick = false;
  bool _isEmptyCage = false;
  int _availableQuantity = 0;

  bool get _isCageSelected => _selectedCage != null;
  bool get _hasFarmingBatch => _farmingBatch != null;
  bool get _hasSymptoms => _symptomsName.isNotEmpty;
  bool get _hasValidQuantity {
    final quantity = int.tryParse(_affectedController.text) ?? 0;
    log('Quantity: $quantity');
    return quantity > 0 &&
        (_farmingBatch == null ||
            quantity <=
                ((_growthStage?.quantity ?? 0) -
                    (_farmingBatch?.affectedQuantity ?? 0)));
  }

  bool get _isFormValid =>
      _isCageSelected &&
      _hasFarmingBatch &&
      _hasSymptoms &&
      _hasValidQuantity &&
      (!_isEmergency || _images.isNotEmpty);

  // Check if there are unsaved changes
  bool get _hasUnsavedChanges {
    return _selectedCage != null ||
        _farmingBatch != null ||
        _symptomsName.isNotEmpty ||
        int.tryParse(_affectedController.text) != 0 ||
        _noteController.text.isNotEmpty ||
        _images.isNotEmpty;
  }

  // Show confirmation dialog when trying to exit
  Future<bool> _onWillPop() async {
    if (!_hasUnsavedChanges || _isProcessing) {
      return true; // Allow exit if no changes or if processing
    }

    // Show confirmation dialog
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => WarningConfirmationDialog(
        title: 'Xác nhận hủy',
        content: const Text(
          'Bạn có thông tin chưa lưu. Bạn có chắc chắn muốn thoát không?',
          textAlign: TextAlign.center,
        ),
        primaryButtonText: 'Tiếp tục',
        secondaryButtonText: 'Hủy bỏ',
        onPrimaryButtonPressed: () => Navigator.pop(context, false),
        onSecondaryButtonPressed: () => Navigator.pop(context, true),
      ),
    );
    return result ?? false;
  }

  @override
  void initState() {
    super.initState();
    _selectedCage = widget.cageName.isNotEmpty ? widget.cageName : null;
    _selectedCageId = widget.cageId;

    // If coming from a task, automatically load the farming batch
    if (widget.fromTask == true && widget.cageId != null) {
      context
          .read<TaskBloc>()
          .add(TaskEvent.getTaskById(widget.taskId!, onSuccess: (task) {
            if (TimeUtils.isTimeInSession(
                TimeUtils.customNow(), task.session)) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context
                    .read<FarmingBatchCubit>()
                    .getFarmingBatchByCage(widget.cageId!);
              });
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return WarningConfirmationDialog(
                      title: 'Hết thời gian làm việc',
                      content: const Text(
                          'Đã quá thời gian cho phép thực hiện công việc này, không thể tiếp tục.'),
                      primaryButtonText: 'Quay về trang chủ',
                      onPrimaryButtonPressed: () {
                        context.go(RouteName.home);
                      },
                    );
                  });
            }
          }));
    } else {
      context.read<CageCubit>().getCagesByUserId();
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    _affectedController.dispose();
    _farmingBatchController.dispose();
    _searchSymptomController.dispose();
    super.dispose();
  }

  void _fetchInitialData() {
    context.read<CageCubit>().getCagesByUserId();
  }

  String get formattedDate =>
      DateFormat('EEEE, dd/MM/yyyy', 'vi').format(DateTime.now());

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null && _images.length <= 10) {
      // Giới hạn 5 ảnh
      setState(() => _images.add(File(pickedFile.path)));
    } else if (_images.length > 10) {
      _showErrorSnackBar('Bạn chỉ có thể thêm tối đa 10 ảnh.');
    }
  }

  void _submitForm() {
    showDialog(
      context: context,
      builder: (_) => WarningConfirmationDialog(
        title: 'Xác nhận báo cáo',
        content: const Text(
            'Hãy kiểm tra thông tin trước khi gửi. Bạn có chắc chắn muốn xác nhận gửi không?'),
        secondaryButtonText: 'Hủy',
        primaryButtonText: 'Xác nhận',
        onSecondaryButtonPressed: () => Navigator.pop(context),
        onPrimaryButtonPressed: () {
          Navigator.pop(context);
          if (_images.isNotEmpty) {
            context
                .read<UploadImageCubit>()
                .uploadImages(files: _images); // Chỉ upload ảnh đầu tiên
          } else {
            _submitSymptomRequest(null);
          }
        },
      ),
    );
  }

  void _submitSymptomRequest(String? imagePath) {
    final request = CreateSymptomRequest(
      farmingBatchId: _farmingBatch?.id ?? '',
      symptoms: _symptomsName.join(', '),
      status: 'Pending',
      affectedQuantity: int.parse(_affectedController.text),
      isEmergency: _isEmergency,
      quantityInCage:
          _growthStage!.quantity! - (_farmingBatch!.affectedQuantity ?? 0),
      notes: _noteController.text,
      pictures: imagePath != null
          ? [
              PictureSymptom(
                  image: imagePath, dateCaptured: TimeUtils.customNow())
            ]
          : [],
      medicalSymptomDetails: _enteredSymptoms,
    );
    context.read<HealthyCubit>().createSymptom(request);
  }

  void _submitSymptomRequestMultipleImage(List<String?> imagePaths) {
    final request = CreateSymptomRequest(
      farmingBatchId: _farmingBatch?.id ?? '',
      symptoms: _symptomsName.join(', '),
      status: 'Pending',
      affectedQuantity: int.parse(_affectedController.text),
      isEmergency: _isEmergency,
      quantityInCage:
          _growthStage!.quantity! - (_farmingBatch!.affectedQuantity ?? 0),
      notes: _noteController.text,
      pictures: imagePaths
          .map((imagePath) => PictureSymptom(
              image: imagePath!, dateCaptured: TimeUtils.customNow()))
          .toList(),
      medicalSymptomDetails: _enteredSymptoms,
    );
    context.read<HealthyCubit>().createSymptom(request);
  }

  void _showCageSelectionSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _CageSelectionSheet(
        cages: _cages,
        selectedCage: _selectedCage,
        onCageSelected: (cage) {
          context.read<FarmingBatchCubit>().getFarmingBatchByCage(cage.id);
          setState(() {
            _selectedCage = cage.name;
            _selectedCageId = cage.id;
          });
        },
      ),
    );
  }

  void _showSymptomSelectionSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _SymptomSelectionSheet(
        symptoms: _symptoms,
        selectedSymptoms: _symptomsName,
        enteredSymptoms: _enteredSymptoms,
        noteController: _searchSymptomController,
        onSymptomToggled: (symptom, selected) {
          setState(() {
            if (selected) {
              _symptomsName.add(symptom.symptomName);
              _enteredSymptoms.add(GetSymptomRequest(
                  symptomId: symptom.id, notes: _noteController.text));
            } else {
              _symptomsName.remove(symptom.symptomName);
              _enteredSymptoms.removeWhere((s) => s.symptomId == symptom.id);
            }
          });
        },
      ),
    );
  }

  void _showQRScanner() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QRScannerWidget(
          title: 'Quét mã QR chuồng',
          instruction: 'Đặt mã QR vào khung hình để quét',
          helperText: 'Mã QR được dán trên chuồng',
          onScanned: (qrCode) {
            final cage = _cages.firstWhere(
                (cage) => cage.id == qrCode.toLowerCase(),
                orElse: () => CageOption(id: '', name: ''));
            if (cage.id.isNotEmpty) {
              setState(() {
                _selectedCage = cage.name;
                _selectedCageId = cage.id;
              });
              context.read<FarmingBatchCubit>().getFarmingBatchByCage(cage.id);
              Navigator.pop(context);
            } else {
              _showErrorSnackBar(
                  'Không tìm thấy thông tin chuồng, hãy thử lại.');
            }
          },
        ),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(children: [
          const Icon(Icons.error_outline, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(child: Text(message)),
        ]),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).colorScheme.error,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        action: SnackBarAction(
            label: 'Đóng', textColor: Colors.white, onPressed: () {}),
      ),
    );
  }

  Widget _buildSectionTitle(String title,
      {bool isRequired = true, bool isCompleted = false}) {
    return Row(
      children: [
        if (isRequired) ...[
          Icon(
            isCompleted ? Icons.check_circle : Icons.error_outline,
            color: isCompleted
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.error,
            size: 20,
          ),
          const SizedBox(width: 8),
        ],
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const Spacer(),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, -1))
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!_isFormValid) ...[
            _ValidationMessage(message: _getValidationMessage()),
            const SizedBox(height: 12),
          ],
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed:
                  _isProcessing ? null : (_isFormValid ? _submitForm : null),
              child: _isProcessing
                  ? const ProcessingButtonWidget(
                      loadingMessage: 'Đang xử lý...')
                  : const Text('Tạo báo cáo'),
            ),
          ),
        ],
      ),
    );
  }

  String _getValidationMessage() {
    if (_isEmptyCage) {
      return 'Không tìm thấy thông tin chuồng, vui lòng liên hệ admin để được hỗ trợ.';
    }
    if (!_isCageSelected) return 'Vui lòng chọn chuồng nuôi.';
    if (!_hasFarmingBatch) {
      return 'Không tìm thấy thông tin vụ nuôi cho chuồng này.';
    }
    if (!_hasSymptoms) return 'Vui lòng chọn ít nhất một triệu chứng.';
    if (!_hasValidQuantity) {
      return int.tryParse(_affectedController.text) == 0
          ? 'Vui lòng nhập số lượng con vật bị bệnh.'
          : 'Số lượng con vật bị bệnh không hợp lệ.';
    }
    if (_isEmergency && _images.isEmpty) {
      return 'Trường hợp khẩn cấp yêu cầu phải đính kèm ít nhất 1 hình ảnh.';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AnimalSaleCubit, AnimalSaleState>(
            listener: (context, state) {
          state.maybeWhen(
            createAnimalSaleInProgress: () {
              log('[CREATE_SYMPTOM_SUCCESS] Đang tạo thông tin bán gia cầm...');
              setState(() => _isProcessing = true);
            },
            createAnimalSaleSuccess: () {
              log('[CREATE_SYMPTOM_SUCCESS] Tạo thông tin bán gia cầm thành công.');
              setState(() => _isProcessing = false);
              context.read<TaskBloc>().add(TaskEvent.updateTask(
                    widget.taskId!,
                    StatusDataConstant.done,
                    afterSymptomReport: true,
                  ));
            },
            createAnimalSaleFailure: (error) {
              log('[CREATE_SYMPTOM_SUCCESS] Tạo thông tin bán gia cầm thất bại: $error');
              setState(() => _isProcessing = false);
              _showErrorSnackBar('Lỗi tạo thông tin bán gia cầm: $error');
            },
            orElse: () {},
          );
        }),
        BlocListener<HealthyCubit, HealthyState>(
          listener: (context, state) => state.maybeWhen(
            createLoading: () {
              log('[CREATE_SYMPTOM_SUCCESS] Đang tạo medical_symptom...');
              setState(() => _isProcessing = true);
              return null;
            },
            createSuccess: (medicalSymptom) =>
                _handleCreateSuccess(medicalSymptom),
            createFailure: (error) => _handleCreateFailure(error),
            orElse: () {
              return null;
            },
          ),
        ),
        BlocListener<CageCubit, CageState>(
          listener: (context, state) => state.maybeWhen(
            loadByUserIdInProgress: () => setState(() => _isLoading = true),
            loadByUserIdSuccess: (cages) {
              setState(() {
                _isLoading = false;
                _cages = cages
                    .map((cage) {
                      if (!cage.name.contains('cách ly')) {
                        return CageOption(id: cage.id, name: cage.name);
                      }
                      return null;
                    })
                    .whereType<CageOption>()
                    .toList();
              });
              context.read<SymptomCubit>().getSymptoms();
              return null;
            },
            loadByUserIdFailure: (error) => _handleCageFailure(error),
            orElse: () {
              return null;
            },
          ),
        ),
        BlocListener<FarmingBatchCubit, FarmingBatchState>(
          listener: (context, state) => state.maybeWhen(
            getFarmingBatchByCageSuccess: (farmingBatch) => setState(() {
              _farmingBatch = farmingBatch;
              _farmingBatchController.text = farmingBatch.name;
              context
                  .read<GrowthStageCubit>()
                  .getGrowthStageByCageId(_selectedCageId!);
            }),
            getFarmingBatchByCageFailure: (error) =>
                _handleFarmingBatchFailure(error),
            orElse: () {
              return null;
            },
          ),
        ),
        BlocListener<SymptomCubit, SymptomState>(
          listener: (context, state) => state.maybeWhen(
            getSymptomsInProgress: () => setState(() => _isLoading = true),
            getSymptomsSuccess: (symptoms) => setState(() {
              _symptoms = symptoms;
              _isLoading = false;
            }),
            getSymptomsFailure: (error) {
              _showErrorSnackBar('Lỗi tải danh sách triệu chứng: $error');
              setState(() => _isLoading = false);
              return null;
            },
            orElse: () {
              return null;
            },
          ),
        ),
        BlocListener<GrowthStageCubit, GrowthStageState>(
          listener: (context, state) => state.maybeWhen(
            getGrowthStageByCageIdSuccess: (growthStage) {
              setState(() {
                _growthStage = growthStage;
                _affectedQuantity =
                    _farmingBatch!.quantity - growthStage.affectQuantity!;
                _availableQuantity = (_growthStage!.quantity! -
                    (_farmingBatch?.affectedQuantity ?? 0));
              });
              context.read<SymptomCubit>().getSymptoms();
              return null;
            },
            getGrowthStageByCageIdFailure: (error) => setState(() =>
                _affectedQuantity =
                    _farmingBatch!.quantity), // Fallback to total quantity
            updateWeightInProgress: () {
              log('[CREATE_SYMPTOM_SUCCESS] Đang cập nhật trọng lượng...');
              setState(() => _isProcessing = true);
              return null;
            },
            updateWeightSuccess: (result) {
              log('[CREATE_SYMPTOM_SUCCESS] Cập nhật trọng lượng thành công.');
              setState(() => _isProcessing = false);
              context.read<TaskBloc>().add(TaskEvent.updateTask(
                    widget.taskId!,
                    StatusDataConstant.done,
                    afterSymptomReport: true,
                  ));
              return null;
            },
            updateWeightFailure: (error) {
              log('[CREATE_SYMPTOM_SUCCESS] Cập nhật trọng lượng thất bại: $error');
              setState(() => _isProcessing = false);
              _showErrorSnackBar('Lỗi cập nhật trọng lượng: $error');
              return null;
            },
            orElse: () {
              return null;
            },
          ),
        ),
        BlocListener<UploadImageCubit, UploadImageState>(
          listener: (context, state) => state.maybeWhen(
            uploadImageInProgress: (isImageTask) {
              if (isImageTask) {
                log('[CREATE_SYMPTOM_SUCCESS] Đang tải ảnh công việc lên...');
              } else {
                log('[CREATE_SYMPTOM_SUCCESS] Đang tải 1 ảnh triệu chứng lên...');
              }
              setState(() => _isProcessing = true);
              return null;
            },
            uploadImageSuccess: (imageDto, isTaskImage) =>
                _handleUploadSuccess(imageDto, isTaskImage),
            uploadImageFailure: (error, isTaskImage) {
              if (isTaskImage) {
                log('[CREATE_SYMPTOM_SUCCESS] Tải ảnh công việc thất bại: $error');
              } else {
                log('[CREATE_SYMPTOM_SUCCESS] Tải ảnh triệu chứng thất bại: $error');
              }
              _handleUploadFailure(error);
              return null;
            },
            uploadMultipleImageInProgress: () {
              log('[CREATE_SYMPTOM_SUCCESS] Upload multiple images in progress...');
              setState(() => _isProcessing = true);
              return null;
            },
            uploadMultipleImageSuccess: (images) =>
                _handleUploadMultipleImageSuccess(images),
            uploadMultipleImageFailure: (error) => _handleUploadFailure(error),
            // uploadMultipleImageSuccess: (images) => ,
            deleteImageInProgress: () => setState(() => _isProcessing = true),
            deleteImageSuccess: () => setState(() => _isProcessing = false),
            deleteImageFailure: (error) => _handleDeleteImageFailure(error),
            orElse: () {
              return null;
            },
          ),
        ),
        BlocListener<TaskBloc, TaskState>(listener: (context, state) {
          state.maybeWhen(
            setTaskIsTreatmentInProgress: () {
              log('[CREATE_SYMPTOM_SUCCESS] Đang cập nhật trạng thái công việc sang Warning...');
              setState(() => _isProcessing = true);
            },
            setTaskIsTreatmentSuccess: () {
              log('[CREATE_SYMPTOM_SUCCESS] Cập nhật trạng thái công việc sang Warning thành công.');
              setState(() => _isProcessing = false);
              // Create task log if needed based on task type
              if (widget.imageLog != null) {
                context
                    .read<UploadImageCubit>()
                    .uploadImage(file: widget.imageLog!, isTaskImage: true);
              } else {
                _createTaskLogAfterSymptomReport(widget.taskId!, null);
              }
            },
            setTaskIsTreatmentFailure: (error) {
              setState(() => _isProcessing = false);
              _showErrorSnackBar('Lỗi cập nhật trạng thái công việc: $error');
            },
            createDailyFoodUsageLogSuccess: () {
              log('[CREATE_SYMPTOM_SUCCESS] Tạo log DailyFoodUsageLog thành công.');
              setState(() => _isProcessing = false);
              context.read<TaskBloc>().add(TaskEvent.updateTask(
                    widget.taskId!,
                    StatusDataConstant.done,
                    afterSymptomReport: true,
                  ));
            },
            createDailyFoodUsageLogLoading: () {
              log('[CREATE_SYMPTOM_SCREEN] Đang tạo food-log...');
              setState(() => _isProcessing = true);
            },
            createHealthLogSuccess: () {
              log('[CREATE_SYMPTOM_SCREEN] Tạo health-log thành công.');
              setState(() => _isProcessing = false);
              context.read<TaskBloc>().add(TaskEvent.updateTask(
                    widget.taskId!,
                    StatusDataConstant.done,
                    afterSymptomReport: true,
                  ));
            },
            createHealthLogLoading: () {
              log('[CREATE_SYMPTOM_SCREEN] Đang tạo health-log...');
              setState(() => _isProcessing = true);
            },
            createVaccinScheduleLogLoading: () {
              log('[CREATE_SYMPTOM_SCREEN] Đang tạo vaccin-log...');
              setState(() => _isProcessing = true);
            },
            createVaccinScheduleLogSuccess: () {
              log('[CREATE_SYMPTOM_SCREEN] Tạo vaccin-log thành công.');
              setState(() => _isProcessing = false);
              context.read<TaskBloc>().add(TaskEvent.updateTask(
                    widget.taskId!,
                    StatusDataConstant.done,
                    afterSymptomReport: true,
                  ));
            },
            updateStatusTaskLoading: () {
              setState(() => _isProcessing = true);
            },
            updateStatusTaskSuccess: () {
              context.go(RouteName.symptomSuccess, extra: {
                'symptom': symptom,
                'cageName': _selectedCage,
                'fromTask': true,
                'taskId': widget.taskId
              });
              setState(() {
                _isProcessing = false;
                _selectedCage = null;
                _farmingBatch = null;
                _selectedCageId = null;
              });
            },
            updateStatusTaskFailure: (error) {
              setState(() => _isProcessing = false);
              _showErrorSnackBar('Lỗi cập nhật trạng thái công việc: $error');
            },
            orElse: () {
              return null;
            },
          );
        })
      ],
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: CustomAppBar(
            appBarHeight: 70,
            leading: IconButton(
                onPressed: () async {
                  final canPop = await _onWillPop();
                  if (canPop && context.mounted) {
                    context.pop();
                  }
                },
                icon: const Icon(Icons.arrow_back)),
            title: Column(
              children: [
                const Text('Tạo báo cáo triệu chứng'),
                Text(CustomDateUtils.formatDate(TimeUtils.customNow()),
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: _isLoading ? null : _fetchInitialData,
                tooltip: 'Tải lại dữ liệu',
              ),
            ],
          ),
          body: _isLoading
              ? const LoadingWidget()
              : SingleChildScrollView(child: _FormBody(state: this)),
          bottomNavigationBar: _buildSubmitButton(),
        ),
      ),
    );
  }

  void _handleCreateSuccess(MedicalSymptomDto medicalSymptom) {
    setState(() {
      _isProcessing = false;
    });
    log("[CREATE_SYMPTOM_SCREEN] Tạo medical_symptom thành công");
    symptom = MedicalSymptomResponse(
      id: medicalSymptom.id,
      farmingBatchId: medicalSymptom.farmingBatchId,
      symtom: _symptomsName.join(', '),
      status: medicalSymptom.status,
      diagnosis: medicalSymptom.diagnosis,
      nameAnimal: medicalSymptom.nameAnimal,
      prescriptions: medicalSymptom.prescriptions,
      affectedQuantity: medicalSymptom.affectedQuantity,
      quantity: (_growthStage?.quantity ?? 0) -
          (_farmingBatch?.affectedQuantity ?? 0),
      notes: medicalSymptom.notes,
      createAt: medicalSymptom.createAt,
      pictures: medicalSymptom.pictures,
      medicalSymptomDetails: medicalSymptom.medicalSymptomDetails,
    );

    // If coming from a task, mark the task as having a problem before navigating
    if (widget.fromTask && widget.taskId != null) {
      // Mark the task as having a problem (treatment needed)
      context.read<TaskBloc>().add(TaskEvent.setTaskIsTreatment(
            taskId: widget.taskId!,
            medicalSymptomId: medicalSymptom.id,
          ));
    } else {
      final selectedCage = _selectedCage;
      setState(() {
        _selectedCage = null;
        _farmingBatch = null;
        _selectedCageId = null;
      });
      context.go(RouteName.symptomSuccess, extra: {
        'symptom': symptom,
        'cageName': selectedCage,
      });
    }
  }

  // Helper method to create task log after symptom report
  void _createTaskLogAfterSymptomReport(String taskId, String? imagePath) {
    log('[CREATE_SYMPTOM_SCREEN] Đang khởi tạo data để tạo log warning-task...');
    // Get the task details to determine which type of log to create
    context.read<TaskBloc>().add(
          TaskEvent.getTaskById(
            taskId,
            onSuccess: (task) {
              if (task.taskType.taskTypeId == TaskTypeDataConstant.feeding &&
                  widget.paramsFoodLog != null) {
                final logTemp = DailyFoodUsageLogDto(
                  recommendedWeight:
                      widget.paramsFoodLog!.log.recommendedWeight,
                  actualWeight: widget.paramsFoodLog!.log.actualWeight,
                  logTime: widget.paramsFoodLog!.log.logTime,
                  notes: widget.paramsFoodLog!.log.notes,
                  taskId: widget.paramsFoodLog!.log.taskId,
                  photo: imagePath ?? '',
                );
                context.read<TaskBloc>().add(
                      TaskEvent.createDailyFoodUsageLog(
                        cageId: widget.paramsFoodLog!.cageId,
                        log: logTemp,
                        afterSymptomReport:
                            widget.paramsFoodLog!.afterSymptomReport,
                      ),
                    );
              } else if (task.taskType.taskTypeId ==
                      TaskTypeDataConstant.health &&
                  widget.paramsHealthLog != null) {
                final logTemp = HealthLogDto(
                  prescriptionId: widget.paramsHealthLog!.log.prescriptionId,
                  notes: widget.paramsHealthLog!.log.notes,
                  taskId: widget.paramsHealthLog!.log.taskId,
                  photo: imagePath ?? '',
                  date: widget.paramsHealthLog!.log.date,
                  id: widget.paramsHealthLog!.log.id,
                );
                context.read<TaskBloc>().add(TaskEvent.createHealthLog(
                      prescriptionId: widget.paramsHealthLog!.prescriptionId,
                      log: logTemp,
                    ));
              } else if (task.taskType.taskTypeId ==
                  TaskTypeDataConstant.vaccin) {
                final logTemp = VaccineScheduleLogRequest(
                  vaccineId: widget
                      .paramsVaccineLog!.vaccineScheduleLogRequest.vaccineId,
                  notes:
                      widget.paramsVaccineLog!.vaccineScheduleLogRequest.notes,
                  taskId:
                      widget.paramsVaccineLog!.vaccineScheduleLogRequest.taskId,
                  photo: imagePath ?? '',
                  date: widget.paramsVaccineLog!.vaccineScheduleLogRequest.date,
                  quantity: widget
                      .paramsVaccineLog!.vaccineScheduleLogRequest.quantity,
                  session: widget
                      .paramsVaccineLog!.vaccineScheduleLogRequest.session,
                );
                context.read<VaccineScheduleLogCubit>().create(
                      request: logTemp,
                      afterSymptomReport:
                          widget.paramsVaccineLog!.afterSymptomReport,
                    );
              } else if (task.taskType.taskTypeId ==
                  TaskTypeDataConstant.sellAnimal) {
                context.read<AnimalSaleCubit>().createAnimalSale(
                      growthStageId: widget.paramsSaleLog!.growthStageId,
                      quantity: widget.paramsSaleLog!.quantity,
                      saleDate: widget.paramsSaleLog!.saleDate,
                      saleTypeId: widget.paramsSaleLog!.saleTypeId,
                      taskId: widget.paramsSaleLog!.taskId,
                      unitPrice: widget.paramsSaleLog!.unitPrice,
                    );
              } else if (task.taskType.taskTypeId ==
                  TaskTypeDataConstant.weighing) {
                // For weighing tasks, update with default values
                context.read<GrowthStageCubit>().updateWeight(
                      request: UpdateWeightRequest(
                        growthStageId: widget.paramsUpdateWeight!
                            .growthStageId, // Will be set by backend
                        weightAnimal: widget.paramsUpdateWeight!.weightAnimal,
                        taskId: widget.paramsUpdateWeight!.taskId,
                      ),
                    );
              } else {
                context.read<TaskBloc>().add(
                      TaskEvent.updateTask(
                        taskId,
                        StatusDataConstant.done,
                        afterSymptomReport: true,
                      ),
                    );
              }
            },
          ),
        );
  }

  void _handleCreateFailure(String error) {
    if (_uploadedImage != null) {
      context.read<UploadImageCubit>().deleteImage(id: _uploadedImage!.id);
    }
    setState(() => _isProcessing = false);
    _showErrorSnackBar(error);
  }

  void _handleCageFailure(String error) {
    setState(() {
      _isLoading = false;
      _isEmptyCage = true;
    });

    // Check if the error is about not finding any cages
    if (error.contains("no-cages-found") ||
        error.toLowerCase().contains("không tìm thấy chuồng") ||
        error.toLowerCase().contains("empty cage list")) {
      showDialog(
        context: context,
        builder: (context) => WarningConfirmationDialog(
          title: "Không tìm thấy chuồng",
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hiện tại bạn không có quyền truy cập vào bất kỳ chuồng nuôi nào, hoặc chưa có chuồng nuôi nào được tạo.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                "Vui lòng liên hệ quản lý trang trại để được cấp quyền truy cập chuồng nuôi.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
          primaryButtonText: "Đã hiểu",
          onPrimaryButtonPressed: () => Navigator.pop(context),
          secondaryButtonText: "Trở về",
          onSecondaryButtonPressed: () {
            Navigator.pop(context);
            context.pop();
          },
        ),
      );
    } else {
      _showErrorSnackBar('Lỗi tải danh sách chuồng: $error');
    }
  }

  void _handleFarmingBatchFailure(String error) {
    setState(() {
      _farmingBatch = null;
      _farmingBatchController.text = '';
    });

    // Display a user-friendly error dialog when no farming batch is found
    if (error.contains("farming-batch-not-found") ||
        error.toLowerCase().contains("không tìm thấy")) {
      showDialog(
        context: context,
        builder: (context) => WarningConfirmationDialog(
          title: "Không tìm thấy vụ nuôi",
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Chuồng $_selectedCage hiện không có vụ nuôi nào đang hoạt động."),
              const SizedBox(height: 12),
              const Text(
                  "Vui lòng chọn chuồng khác hoặc tạo vụ nuôi mới cho chuồng này."),
            ],
          ),
          primaryButtonText: "Thay đổi",
          onPrimaryButtonPressed: () {
            Navigator.pop(context);
            _showCageSelectionSheet();
          },
          secondaryButtonText: "Đóng",
          onSecondaryButtonPressed: () => Navigator.pop(context),
        ),
      );
    } else {
      _showErrorSnackBar('Không tìm thấy thông tin vụ nuôi: $error');
    }
  }

  void _handleUploadSuccess(UploadImageDto imageDto, bool isTaskImage) {
    if (isTaskImage) {
      log('[CREATE_SYMPTOM_SCREEN] Upload ảnh công việc thành công!');
    } else {
      log('[CREATE_SYMPTOM_SCREEN] Upload ảnh triệu chứng thành công!');
    }
    setState(() {
      _isProcessing = false;
      _uploadedImage = imageDto;
    });
    final imagePath = "https://imageservice.fjourney.site${imageDto.path}";
    if (isTaskImage) {
      _createTaskLogAfterSymptomReport(widget.taskId!, imagePath);
    } else {
      _submitSymptomRequest(imagePath);
    }
  }

  void _handleUploadMultipleImageSuccess(List<UploadImageDto> images) {
    log('[CREATE_SYMPTOM_SCREEN] Upload multiple image thành công!');
    setState(() {
      _isProcessing = false;
      _uploadedImages.clear();
      _uploadedImages.addAll(images);
    });
    final imagePaths = _uploadedImages
        .map((image) => "https://imageservice.fjourney.site${image.path}")
        .toList();
    _submitSymptomRequestMultipleImage(imagePaths);
  }

  void _handleUploadFailure(String error) {
    log('[CREATE_SYMPTOM_SCREEN] Upload multiple image thất bại: $error');
    setState(() => _isProcessing = false);
    _showErrorSnackBar('Lỗi upload ảnh: $error');
  }

  void _handleDeleteImageFailure(String error) {
    setState(() => _isProcessing = false);
    _showErrorSnackBar('Lỗi xóa ảnh: $error');
  }

  Future<bool> _validateAffectedQuantityForm(String value) async {
    if (_farmingBatch != null) {
      if (value.isNotEmpty) {
        final enteredQuantity = int.tryParse(value) ?? 0;
        final quantityReal =
            _growthStage!.quantity! - (_farmingBatch?.affectedQuantity ?? 0);
        log('Quantity real: $quantityReal');
        if (enteredQuantity > quantityReal) {
          await showDialog(
            context: context,
            builder: (context) => WarningConfirmationDialog(
              title: 'Số lượng vượt mức',
              content: const Text(
                'Số lượng bị bệnh không thể lớn hơn số lượng gia cầm có trong chuồng.',
                textAlign: TextAlign.center,
              ),
              primaryButtonText: 'Đã hiểu',
              secondaryButtonText: 'Đặt lại',
              onPrimaryButtonPressed: () {
                _affectedController.text = _farmingBatch!.quantity.toString();
                context.pop();
              },
              onSecondaryButtonPressed: () {
                _affectedController.text = '0';
                context.pop();
              },
            ),
          );
          return false;
        }
        return true;
      }
    }
    return false;
  }

  Future<bool> _isEmergencyAffectedQuantityForm(String value) async {
    if (_farmingBatch != null) {
      final enteredQuantity = int.tryParse(value) ?? 0;
      final quantityReal =
          _growthStage!.quantity! - (_farmingBatch?.affectedQuantity ?? 0);
      final threshold = (quantityReal * 0.5).toInt();
      if (enteredQuantity > threshold) {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => WarningConfirmationDialog(
            isEmergency: true,
            title: 'Trường hợp khẩn cấp',
            content: Text(
              'Số lượng con vật bị bệnh vượt quá 50% số lượng trong chuồng (${_farmingBatch!.quantity}). Đây có phải là trường hợp khẩn cấp không?',
              textAlign: TextAlign.center,
            ),
            primaryButtonText: 'Xác nhận',
            secondaryButtonText: 'Đặt lại',
            onPrimaryButtonPressed: () {
              setState(() => _isEmergency = true);
              Navigator.pop(context, true);
            },
            onSecondaryButtonPressed: () {
              _affectedController.text = '0';
              setState(() => _isEmergency = false);
              Navigator.pop(context, false);
              FocusScope.of(context).unfocus();
            },
          ),
        );
        return confirmed ?? false;
      } else {
        setState(() => _isEmergency = false); // Reset if below threshold
        return false;
      }
    }
    return false;
  }
}

class _CageSelectionSheet extends StatefulWidget {
  final List<CageOption> cages;
  final String? selectedCage;
  final ValueChanged<CageOption> onCageSelected;

  const _CageSelectionSheet({
    required this.cages,
    required this.selectedCage,
    required this.onCageSelected,
  });

  @override
  State<_CageSelectionSheet> createState() => _CageSelectionSheetState();
}

class _CageSelectionSheetState extends State<_CageSelectionSheet> {
  String searchQuery = '';
  Timer? _debounceTimer;
  bool _isSearching = false;

  List<CageOption> get filteredCages => searchQuery.isEmpty
      ? widget.cages
      : widget.cages
          .where((cage) =>
              cage.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
              cage.id.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();

  void _onSearchChanged(String value) {
    _debounceTimer?.cancel();
    setState(() => _isSearching = true);
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          searchQuery = value;
          _isSearching = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        children: [
          _SheetHeader(
            title: 'Chọn chuồng báo cáo',
            count: filteredCages.length,
            countLabel: 'chuồng',
            onSearchChanged: _onSearchChanged,
            isSearching: _isSearching,
          ),
          Expanded(
            child: filteredCages.isEmpty
                ? const _EmptyState(message: 'Không tìm thấy chuồng phù hợp')
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredCages.length,
                    itemBuilder: (context, index) {
                      final cage = filteredCages[index];
                      final isSelected = widget.selectedCage == cage.name;
                      return Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                              color: isSelected
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.grey[200]!),
                        ),
                        child: ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: LinearIcons.chickenIcon,
                          ),
                          title: Text(cage.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          subtitle: isSelected
                              ? Text('Đã chọn',
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 13))
                              : null,
                          trailing: isSelected
                              ? Icon(Icons.check_circle,
                                  color: Theme.of(context).colorScheme.primary)
                              : null,
                          onTap: () {
                            widget.onCageSelected(cage);
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _SymptomSelectionSheet extends StatefulWidget {
  final List<SymptomDto> symptoms;
  final List<String> selectedSymptoms;
  final List<GetSymptomRequest> enteredSymptoms;
  final TextEditingController noteController;
  final void Function(SymptomDto, bool) onSymptomToggled;

  const _SymptomSelectionSheet({
    required this.symptoms,
    required this.selectedSymptoms,
    required this.enteredSymptoms,
    required this.noteController,
    required this.onSymptomToggled,
  });

  @override
  State<_SymptomSelectionSheet> createState() => _SymptomSelectionSheetState();
}

class _SymptomSelectionSheetState extends State<_SymptomSelectionSheet> {
  String searchQuery = '';
  Timer? _debounceTimer;
  bool _isSearching = false;

  List<SymptomDto> get filteredSymptoms => searchQuery.isEmpty
      ? widget.symptoms
      : widget.symptoms
          .where((symptom) => symptom.symptomName
              .toLowerCase()
              .contains(searchQuery.toLowerCase()))
          .toList();

  void _onSearchChanged(String value) {
    _debounceTimer?.cancel();
    setState(() => _isSearching = true);
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          searchQuery = value;
          _isSearching = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        children: [
          _SheetHeader(
            title: 'Chọn triệu chứng',
            count: widget.selectedSymptoms.length,
            countLabel: 'đã chọn',
            searchController: widget.noteController,
            searchHint: 'Bụng căng tròn, phình to...',
            onSearchChanged: _onSearchChanged,
            isSearching: _isSearching,
            selectedItems: widget.selectedSymptoms.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Đã chọn',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextButton(
                            onPressed: () => setState(() {
                              widget.selectedSymptoms.clear();
                              widget.enteredSymptoms.clear();
                            }),
                            child: const Text('Xóa tất cả',
                                style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.selectedSymptoms
                            .map((symptom) => Chip(
                                  label: Text(symptom),
                                  deleteIcon: const Icon(Icons.close, size: 16),
                                  onDeleted: () => widget.onSymptomToggled(
                                      widget.symptoms.firstWhere(
                                          (s) => s.symptomName == symptom),
                                      false),
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ))
                            .toList(),
                      ),
                    ],
                  )
                : null,
          ),
          Expanded(
            child: searchQuery.isEmpty
                ? const _EmptyState(
                    message: 'Nhập từ khóa để tìm kiếm\ntriệu chứng')
                : filteredSymptoms.isEmpty
                    ? const _EmptyState(
                        message: 'Không tìm thấy triệu chứng phù hợp')
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Danh sách triệu chứng',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Wrap(
                                    spacing: 8.0,
                                    runSpacing: 8.0,
                                    children: filteredSymptoms.map((symptom) {
                                      final isSelected = widget.selectedSymptoms
                                          .contains(symptom.symptomName);
                                      return FilterChip(
                                        selected: isSelected,
                                        label: Text(symptom.symptomName),
                                        onSelected: (selected) {
                                          setState(() {
                                            widget.onSymptomToggled(
                                                symptom, selected);
                                          });
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
          ),
          _SheetFooter(
            onClose: () => Navigator.pop(context),
            onConfirm: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class _SheetHeader extends StatelessWidget {
  final String title;
  final int count;
  final String countLabel;
  final TextEditingController? searchController;
  final String? searchHint;
  final ValueChanged<String> onSearchChanged;
  final bool isSearching;
  final Widget? selectedItems;

  const _SheetHeader({
    required this.title,
    required this.count,
    required this.countLabel,
    this.searchController,
    this.searchHint,
    required this.onSearchChanged,
    required this.isSearching,
    this.selectedItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 4)
        ],
      ),
      child: Column(
        children: [
          Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              Text('$count $countLabel',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: searchHint ?? 'Tìm kiếm...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: isSearching
                  ? const SizedBox(
                      width: 8,
                      height: 8,
                      child: CircularProgressIndicator(strokeWidth: 2))
                  : null,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            onChanged: onSearchChanged,
          ),
          if (selectedItems != null) ...[
            const SizedBox(height: 16),
            selectedItems!,
          ],
        ],
      ),
    );
  }
}

class _SheetFooter extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onConfirm;

  const _SheetFooter({required this.onClose, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, -1))
        ],
      ),
      child: Row(
        children: [
          Expanded(
              child: OutlinedButton(
                  onPressed: onClose, child: const Text('Đóng'))),
          const SizedBox(width: 16),
          Expanded(
              child: FilledButton(
                  onPressed: onConfirm, child: const Text('Xác nhận'))),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String message;

  const _EmptyState({required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(message,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}

class _ValidationMessage extends StatelessWidget {
  final String message;

  const _ValidationMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline,
              color: Theme.of(context).colorScheme.error, size: 20),
          const SizedBox(width: 8),
          Expanded(
              child: Text(message,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 13))),
        ],
      ),
    );
  }
}

class _FormBody extends StatefulWidget {
  final _CreateSymptomWidgetState state;

  const _FormBody({required this.state});

  @override
  State<_FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<_FormBody> {
  void _showImagePickerOptions(BuildContext context) {
    widget.state._pickImage(ImageSource.camera);
  }

  Widget _buildQuantityButton({
    required BuildContext context,
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
          icon: Icon(icon, color: isAdd ? Colors.white : Colors.grey[700]),
          iconSize: 24,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Opacity(
          opacity: widget.state._isEmptyCage ? 0.5 : 1,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: widget.state._buildSectionTitle('Thông tin cơ bản',
                          isCompleted: widget.state._isCageSelected &&
                              widget.state._hasFarmingBatch),
                    ),
                    const SizedBox(width: 12),
                    Material(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: widget.state._isEmptyCage
                            ? null
                            : widget.state._showQRScanner,
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.qr_code_scanner, size: 20),
                              SizedBox(width: 8),
                              Text('Quét QR',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('Chọn chuồng để báo cáo triệu chứng (bắt buộc)',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 8),
                InkWell(
                  onTap: widget.state._isEmptyCage
                      ? null
                      : widget.state._showCageSelectionSheet,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        LinearIcons.chickenIcon,
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Chuồng nuôi',
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 13)),
                              const SizedBox(height: 4),
                              Text(
                                  widget.state._selectedCage ??
                                      'Chọn chuồng báo cáo',
                                  style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.grey[600]),
                      ],
                    ),
                  ),
                ),
                if (widget.state._selectedCage == null)
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.info_outline, size: 16),
                        SizedBox(width: 4),
                        Text('Bạn có thể quét mã QR trên chuồng để chọn nhanh',
                            style: TextStyle(fontSize: 13)),
                      ],
                    ),
                  ),
                if (widget.state._hasFarmingBatch) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline,
                            color: Colors.blue[700], size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Vụ nuôi hiện tại',
                                  style: TextStyle(
                                      color: Colors.blue[700], fontSize: 13)),
                              const SizedBox(height: 4),
                              Text(widget.state._farmingBatch!.name,
                                  style: TextStyle(
                                      color: Colors.blue[900],
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Opacity(
            opacity: widget.state._hasFarmingBatch == true ? 1 : 0.5,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.state._buildSectionTitle(
                    'Triệu chứng và số lượng',
                    isCompleted: widget.state._hasSymptoms &&
                        widget.state._hasValidQuantity,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                      'Chọn triệu chứng và nhập số lượng gia cầm bị bệnh (bắt buộc)',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 8),
                  if (widget.state._symptomsName.isNotEmpty) ...[
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
                          Row(
                            children: [
                              Icon(Icons.medical_information_outlined,
                                  size: 20,
                                  color: Theme.of(context).colorScheme.primary),
                              const SizedBox(width: 8),
                              Text('Triệu chứng đã chọn',
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: widget.state._symptomsName
                                .map((symptom) => Chip(
                                      label: Text(symptom,
                                          style: const TextStyle(fontSize: 13)),
                                      deleteIcon:
                                          const Icon(Icons.close, size: 16),
                                      onDeleted: () =>
                                          widget.state.setState(() {
                                        widget.state._symptomsName
                                            .remove(symptom);
                                        widget.state._enteredSymptoms
                                            .removeWhere((s) =>
                                                widget.state._symptoms
                                                    .firstWhere((sym) =>
                                                        sym.symptomName ==
                                                        symptom)
                                                    .id ==
                                                s.symptomId);
                                      }),
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      side:
                                          BorderSide(color: Colors.grey[300]!),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  InkWell(
                    onTap: widget.state._isCageSelected
                        ? () => widget.state._showSymptomSelectionSheet()
                        : null,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle_outline,
                              color: Theme.of(context).colorScheme.primary),
                          const SizedBox(width: 8),
                          Text(
                            widget.state._symptomsName.isEmpty
                                ? 'Thêm triệu chứng'
                                : 'Thêm triệu chứng khác',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
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
                        Text('Nhập số lượng con vật bị bệnh',
                            style: Theme.of(context).textTheme.titleSmall),
                        if (widget.state._farmingBatch != null) ...[
                          const SizedBox(height: 4),
                          Text(
                              'Chuồng ${widget.state._selectedCage} có: ${widget.state._availableQuantity} (con)',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 13)),
                        ],
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildQuantityButton(
                              context: context,
                              icon: Icons.remove,
                              onPressed: () {
                                final currentValue = int.tryParse(widget
                                        .state._affectedController.text) ??
                                    0;
                                if (currentValue > 0) {
                                  widget.state.setState(() => widget
                                      .state
                                      ._affectedController
                                      .text = (currentValue - 1).toString());
                                }
                              },
                              isDisable: widget.state._isEmergency,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: TextField(
                                enabled: !widget.state._isEmergency,
                                controller: widget.state._affectedController,
                                textAlign: TextAlign.right,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  suffixText: '(con)',
                                  suffixStyle: TextStyle(
                                      color: Colors.grey[600], fontSize: 18),
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                ),
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                                onChanged: (value) async {
                                  if (value.isEmpty) {
                                    widget.state.setState(() {
                                      widget.state._affectedController.text =
                                          '0';
                                      widget.state._affectedController
                                              .selection =
                                          TextSelection.fromPosition(
                                              const TextPosition(offset: 1));
                                    });
                                  } else if (await widget.state
                                          ._validateAffectedQuantityForm(
                                              value) &&
                                      await widget.state
                                          ._isEmergencyAffectedQuantityForm(
                                              value)) {
                                    widget.state.setState(
                                        () => widget.state._isEmergency = true);
                                  }
                                },
                                onTap: () {
                                  if (widget.state._affectedController.text ==
                                      '0') {
                                    widget.state._affectedController.clear();
                                  }
                                },
                              ),
                            ),
                            _buildQuantityButton(
                              context: context,
                              icon: Icons.add,
                              onPressed: () async {
                                final currentValue = int.tryParse(widget
                                        .state._affectedController.text) ??
                                    0;
                                if (await widget.state
                                    ._validateAffectedQuantityForm(widget
                                        .state._affectedController.text)) {
                                  widget.state.setState(() => widget
                                      .state
                                      ._affectedController
                                      .text = (currentValue + 1).toString());
                                  if (await widget.state
                                      ._isEmergencyAffectedQuantityForm(widget
                                          .state._affectedController.text)) {
                                    widget.state.setState(
                                        () => widget.state._isEmergency = true);
                                  }
                                }
                              },
                              isAdd: true,
                              isDisable: widget.state._isEmergency,
                            ),
                          ],
                        ),
                        if (widget.state._farmingBatch != null) ...[
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Icon(Icons.info_outline,
                                  size: 16, color: Colors.grey[600]),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Dấu (-) để giảm số lượng.',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 13)),
                                  Text('Dấu (+) để tăng số lượng.',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 13)),
                                  Text('Bấm vào ô để nhập số bất kỳ.',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 13)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // --- Checkbox cả đàn đều bị bệnh
                  if (widget.state._isEmergency == false) ...[
                    Opacity(
                      opacity: (widget.state._isCageSelected &&
                              widget.state._hasFarmingBatch &&
                              widget.state._hasSymptoms)
                          ? 1
                          : 0.5,
                      child: Row(
                        children: [
                          Checkbox(
                            value: widget.state._isCheckAllAnimalSick,
                            onChanged: (bool? value) async {
                              if (widget.state._isCageSelected &&
                                  widget.state._hasFarmingBatch &&
                                  widget.state._hasSymptoms) {
                                if (value == true) {
                                  await showDialog<bool>(
                                    context: context,
                                    builder: (context) =>
                                        WarningConfirmationDialog(
                                      title: 'Xác nhận trường hợp khẩn cấp',
                                      content: const Text(
                                        'Bạn đang chọn "Cả đàn đều bị bệnh", điều này báo hiệu tình trạng khẩn cấp. Bạn có chắc chắn không?',
                                        textAlign: TextAlign.center,
                                      ),
                                      primaryButtonText: 'Xác nhận',
                                      secondaryButtonText: 'Hủy',
                                      onPrimaryButtonPressed: () {
                                        widget.state.setState(() {
                                          widget.state._affectedController
                                                  .text =
                                              widget.state._availableQuantity
                                                  .toString();
                                          widget.state._isEmergency = true;
                                          widget.state._isCheckAllAnimalSick =
                                              true;
                                        });
                                        Navigator.pop(context, true);
                                      },
                                      onSecondaryButtonPressed: () =>
                                          Navigator.pop(context, false),
                                      isEmergency: true,
                                    ),
                                  );
                                } else {
                                  widget.state.setState(() {
                                    widget.state._affectedController.text = '0';
                                    widget.state._isCheckAllAnimalSick = false;
                                  });
                                }
                              } else if (!widget.state._isCageSelected) {
                                ScaffoldMessenger.of(context)
                                    .showMaterialBanner(
                                  MaterialBanner(
                                    content: const Text(
                                        'Vui lòng chọn chuồng nuôi trước khi xác nhận.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentMaterialBanner(),
                                        child: const Text('Đóng'),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (!widget.state._hasFarmingBatch) {
                                ScaffoldMessenger.of(context)
                                    .showMaterialBanner(
                                  MaterialBanner(
                                    content: const Text(
                                      'Vui lòng chọn vụ nuôi trước khi xác nhận.',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentMaterialBanner(),
                                        child: const Text('Đóng'),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (!widget.state._hasSymptoms) {
                                ScaffoldMessenger.of(context)
                                    .showMaterialBanner(
                                  MaterialBanner(
                                    content: const Text(
                                        'Vui lòng chọn triệu chứng trước khi xác nhận.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentMaterialBanner(),
                                        child: const Text('Đóng'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(width: 8),
                          Row(
                            children: [
                              Icon(Icons.warning, color: Colors.red, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                'Cả đàn đều bị bệnh',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.info_outline,
                            size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                              text:
                                  'Vui lòng chọn chuồng nuôi và triệu chứng trước khi xác nhận ',
                              children: [
                                TextSpan(
                                  text: 'tình trạng khẩn cấp',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                TextSpan(text: '.'),
                              ],
                            ),
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (widget.state._isEmergency) ...[
                    const SizedBox(height: 16),
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
                              'Đã xác nhận trường hợp khẩn cấp! \nTriệu chứng sẽ được khám ngay.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: () {
                              widget.state.setState(() {
                                widget.state._isEmergency = false;
                                widget.state._isCheckAllAnimalSick = false;
                              });
                              // state._affectedController.text = '0';
                            },
                            child: const Text('Hủy',
                                style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    )
                  ],
                ],
              ),
            )),
        const SizedBox(height: 8),
        Opacity(
            opacity: widget.state._hasFarmingBatch &&
                    widget.state._hasSymptoms &&
                    widget.state._hasValidQuantity
                ? 1
                : 0.5,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.state._buildSectionTitle(
                    'Ghi chú và hình ảnh',
                    isRequired: false,
                    isCompleted: widget.state._images.isNotEmpty ||
                        widget.state._noteController.text.isNotEmpty,
                  ),
                  const SizedBox(height: 8),
                  const Text('Thêm ghi chú hoặc hình ảnh nếu cần (tùy chọn)',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: widget.state._noteController,
                    maxLines: 4,
                    enabled: widget.state._isCageSelected &&
                        widget.state._hasFarmingBatch &&
                        widget.state._hasSymptoms &&
                        widget.state._hasValidQuantity,
                    decoration: InputDecoration(
                      hintText: 'Nhập ghi chú về tình trạng...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Hình ảnh đính kèm (tối đa 10 ảnh)',
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 12),
                  widget.state._images.isEmpty
                      ? InkWell(
                          onTap: widget.state._isCageSelected &&
                                  widget.state._hasFarmingBatch
                              ? () => _showImagePickerOptions(context)
                              : null,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]!),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              children: [
                                Icon(Icons.add_photo_alternate_outlined,
                                    size: 40, color: Colors.grey[400]),
                                const SizedBox(height: 12),
                                Text('Thêm hình ảnh',
                                    style: TextStyle(color: Colors.grey[600])),
                              ],
                            ),
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8),
                          itemCount: widget.state._images.length +
                              (widget.state._images.length < 10 ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == widget.state._images.length) {
                              return InkWell(
                                onTap: () => _showImagePickerOptions(context),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.grey[300]!),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Icon(
                                      Icons.add_photo_alternate_outlined,
                                      color: Colors.grey[400]),
                                ),
                              );
                            }
                            return Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.file(
                                        widget.state._images[index],
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity)),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: InkWell(
                                    onTap: () => widget.state.setState(() =>
                                        widget.state._images.removeAt(index)),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                          color: Colors.black54,
                                          shape: BoxShape.circle),
                                      child: const Icon(Icons.close,
                                          size: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                ],
              ),
            )),
      ],
    );
  }
}
