import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/common/widgets/warning_confirm_dialog.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/core/utils/date_util.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/model/dto/farming_batch/farming_batch_dto.dart';
import 'package:smart_farm/src/model/dto/growth_stage/growth_stage_dto.dart';
import 'package:smart_farm/src/model/dto/task/sale_log/sale_log_dto.dart';
import 'package:smart_farm/src/model/dto/upload_image/upload_image_dto.dart';
import 'package:smart_farm/src/model/params/create_food_log_cubit/create_food_log_cubit_params.dart';
import 'package:smart_farm/src/model/params/create_health_log_cubit/create_health_log_cubit_params.dart';
import 'package:smart_farm/src/model/params/create_sale_log_cubit/create_sale_log_cubit_params.dart';
import 'package:smart_farm/src/model/params/create_vaccine_log_cubit_params/create_vaccine_log_cubit_params.dart';
import 'package:smart_farm/src/model/request/growth_stage/update_weight/update_weight_request.dart';
import 'package:smart_farm/src/model/response/medical_symptom/medical_symptom_response.dart';
import 'package:smart_farm/src/view/symptom/cage_option.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/view/widgets/loading_widget.dart';
import 'package:smart_farm/src/view/widgets/processing_button_widget.dart';
import 'package:smart_farm/src/view/widgets/qr_scanner.dart'
    show QRScannerWidget;
import 'package:smart_farm/src/viewmodel/cage/cage_cubit.dart';
import 'package:smart_farm/src/viewmodel/farming_batch/farming_batch_cubit.dart';
import 'package:smart_farm/src/viewmodel/growth_stage/growth_stage_cubit.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';
import 'package:smart_farm/src/viewmodel/upload_image/upload_image_cubit.dart';

class CreateDeathReportScreen extends StatefulWidget {
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

  const CreateDeathReportScreen({
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
  State<CreateDeathReportScreen> createState() =>
      _CreateDeathReportScreenState();
}

class _CreateDeathReportScreenState extends State<CreateDeathReportScreen> {
  final _noteController = TextEditingController();
  final _affectedController = TextEditingController(text: '0');
  final _farmingBatchController = TextEditingController();
  final _searchSymptomController = TextEditingController();

  final List<File> _images = [];
  final List<String> _symptomsName = [];
  MedicalSymptomResponse? symptom;

  FarmingBatchDto? _farmingBatch;
  GrowthStageDto? _growthStage;
  List<CageOption> _cages = [];
  UploadImageDto? _uploadedImage;

  String? _selectedCage;
  String? _selectedCageId;
  int? _affectedQuantity;
  bool _isLoading = false;
  bool _isProcessing = false;
  bool _isEmptyCage = false;
  int _availableQuantity = 0;

  bool get _isCageSelected => _selectedCage != null;
  bool get _hasFarmingBatch => _farmingBatch != null;
  bool get _hasValidQuantity {
    final quantityText = _affectedController.text.trim();
    // Kiểm tra xem text có phải là số hợp lệ không
    if (quantityText.isEmpty) return false;

    final quantity = int.tryParse(quantityText) ?? 0;
    log('Quantity: $quantity, Available: $_availableQuantity');

    return quantity > 0 && quantity <= _availableQuantity;
  }

  bool get _isFormValid =>
      _isCageSelected &&
      _hasFarmingBatch &&
      _hasValidQuantity &&
      _noteController.text.trim().isNotEmpty;

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

    // Thêm listener để cập nhật state khi giá trị thay đổi
    _noteController.addListener(_onInputChanged);
    _affectedController.addListener(_onInputChanged);

    _fetchInitialData();
  }

  @override
  void dispose() {
    _noteController.removeListener(_onInputChanged);
    _affectedController.removeListener(_onInputChanged);

    _noteController.dispose();
    _affectedController.dispose();
    _farmingBatchController.dispose();
    _searchSymptomController.dispose();
    super.dispose();
  }

  void _onInputChanged() {
    // Gọi setState để kích hoạt việc đánh giá lại các getter
    setState(() {
      // Không cần thay đổi gì ở đây - chỉ cần kích hoạt rebuild
    });
  }

  void _fetchInitialData() {
    context.read<CageCubit>().getCagesByUserId();
  }

  String get formattedDate =>
      DateFormat('EEEE, dd/MM/yyyy', 'vi').format(DateTime.now());

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
            _submitSymptomRequest(null);
          }),
    );
  }

  void _submitSymptomRequest(String? imagePath) {
    context.read<FarmingBatchCubit>().createDeathReport(
          _farmingBatch!.id,
          _growthStage!.id,
          int.parse(_affectedController.text),
          _noteController.text,
        );
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

    // Kiểm tra số lượng kỹ hơn
    final quantityText = _affectedController.text.trim();
    if (quantityText.isEmpty || int.tryParse(quantityText) == 0) {
      return 'Vui lòng nhập số lượng con vật bị thất thoát.';
    }

    final quantity = int.tryParse(quantityText) ?? 0;
    if (quantity <= 0) {
      return 'Số lượng con vật thất thoát phải lớn hơn 0.';
    }

    if (quantity > _availableQuantity) {
      return 'Số lượng con vật thất thoát không thể lớn hơn số lượng hiện có ($_availableQuantity con).';
    }

    if (_noteController.text.trim().isEmpty) {
      return 'Vui lòng nhập lý do thất thoát.';
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
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
            createDeathReportInProgress: () {
              setState(() {
                _isProcessing = true;
              });
            },
            createDeathReportSuccess: () {
              _handleCreateSuccess();
            },
            createDeathReportFailure: (error) {
              _handleCreateFailure(error);
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
                    (_farmingBatch?.affectedQuantity ?? 0) -
                    (_growthStage!.deadQuantity));
              });
              // context.read<SymptomCubit>().getSymptoms();
              return null;
            },
            getGrowthStageByCageIdFailure: (error) => setState(() =>
                _affectedQuantity =
                    _farmingBatch!.quantity), // Fallback to total quantity

            orElse: () {
              return null;
            },
          ),
        ),
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
                const Text('Tạo báo cáo thất thoát'),
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

  void _handleCreateSuccess() {
    setState(() {
      _isProcessing = false;
    });
    log("[CREATE_SYMPTOM_SCREEN] Tạo medical_symptom thành công");
    final selectedCage = _selectedCage;
    setState(() {
      _selectedCage = null;
      _farmingBatch = null;
      _selectedCageId = null;
    });
    final totalQuantity =
        (_growthStage?.quantity ?? 0) - (_farmingBatch?.affectedQuantity ?? 0);
    context.go(RouteName.createDeathReportSuccess, extra: {
      'cageName': selectedCage,
      'deathCount': int.parse(_affectedController.text),
      'totalCount': totalQuantity,
      'createdAt': TimeUtils.customNow(),
    });
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

  // Future<bool> _validateAffectedQuantityForm(String value) async {
  //   if (_farmingBatch != null) {
  //     if (value.isNotEmpty) {
  //       final enteredQuantity = int.tryParse(value) ?? 0;
  //       final quantityReal =
  //           _growthStage!.quantity! - (_farmingBatch?.affectedQuantity ?? 0);
  //       log('Quantity real: $quantityReal');
  //       if (enteredQuantity > quantityReal) {
  //         await showDialog(
  //           context: context,
  //           builder: (context) => WarningConfirmationDialog(
  //             title: 'Số lượng vượt mức',
  //             content: const Text(
  //               'Số lượng bị bệnh không thể lớn hơn số lượng gia cầm có trong chuồng.',
  //               textAlign: TextAlign.center,
  //             ),
  //             primaryButtonText: 'Đã hiểu',
  //             secondaryButtonText: 'Đặt lại',
  //             onPrimaryButtonPressed: () {
  //               _affectedController.text = _farmingBatch!.quantity.toString();
  //               context.pop();
  //             },
  //             onSecondaryButtonPressed: () {
  //               _affectedController.text = '0';
  //               context.pop();
  //             },
  //           ),
  //         );
  //         return false;
  //       }
  //       return true;
  //     }
  //   }
  //   return false;
  // }
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
  final _CreateDeathReportScreenState state;

  const _FormBody({required this.state});

  @override
  State<_FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<_FormBody> {
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
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
                        child: widget.state._buildSectionTitle(
                            'Thông tin cơ bản',
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
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
                  const Text('Chọn chuồng để báo cáo tử vong (bắt buộc)',
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
                          Text(
                              'Bạn có thể quét mã QR trên chuồng để chọn nhanh',
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
                      'Số lượng thất thoát',
                      isCompleted: widget.state._hasValidQuantity,
                    ),
                    const SizedBox(height: 8),
                    const Text('Nhập số lượng gia cầm đã thất thoát (bắt buộc)',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
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
                          Text('Nhập số lượng con vật đã thất thoát',
                              style: Theme.of(context).textTheme.titleSmall),
                          if (widget.state._farmingBatch != null) ...[
                            const SizedBox(height: 4),
                            Text(
                                '${widget.state._selectedCage} có: ${widget.state._availableQuantity} (con)',
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
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: TextField(
                                    controller:
                                        widget.state._affectedController,
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    decoration: InputDecoration(
                                      suffixText: '(con)',
                                      suffixStyle: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 18),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8),
                                    ),
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                    onChanged: (value) {
                                      // Đảm bảo cập nhật UI khi giá trị thay đổi
                                      widget.state.setState(() {
                                        if (value.isEmpty) {
                                          widget.state._affectedController
                                              .text = '0';
                                          widget.state._affectedController
                                                  .selection =
                                              TextSelection.fromPosition(
                                                  const TextPosition(
                                                      offset: 1));
                                          return;
                                        }

                                        final enteredQuantity =
                                            int.tryParse(value) ?? 0;
                                        final availableQuantity =
                                            widget.state._availableQuantity;

                                        if (enteredQuantity >
                                                availableQuantity &&
                                            widget.state._farmingBatch !=
                                                null) {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                WarningConfirmationDialog(
                                              title: 'Số lượng vượt mức',
                                              content: const Text(
                                                'Số lượng thất thoát không thể lớn hơn số lượng gia cầm có trong chuồng.',
                                                textAlign: TextAlign.center,
                                              ),
                                              primaryButtonText: 'Đã hiểu',
                                              secondaryButtonText: 'Đặt lại',
                                              onPrimaryButtonPressed: () {
                                                widget.state.setState(() {
                                                  widget
                                                          .state
                                                          ._affectedController
                                                          .text =
                                                      availableQuantity
                                                          .toString();
                                                });
                                                Navigator.pop(context);
                                              },
                                              onSecondaryButtonPressed: () {
                                                widget.state.setState(() {
                                                  widget
                                                      .state
                                                      ._affectedController
                                                      .text = '0';
                                                });
                                                Navigator.pop(context);
                                              },
                                            ),
                                          );
                                        }
                                      });
                                    },
                                    onTap: () {
                                      if (widget
                                              .state._affectedController.text ==
                                          '0') {
                                        widget.state._affectedController
                                            .clear();
                                      }
                                    },
                                  )),
                              _buildQuantityButton(
                                context: context,
                                icon: Icons.add,
                                onPressed: () {
                                  final currentValue = int.tryParse(widget
                                          .state._affectedController.text) ??
                                      0;
                                  final availableQuantity =
                                      widget.state._availableQuantity;

                                  // Check if adding one more would exceed the available quantity
                                  if (currentValue < availableQuantity) {
                                    widget.state.setState(() => widget
                                        .state
                                        ._affectedController
                                        .text = (currentValue + 1).toString());
                                  } else {
                                    // Show warning dialog if we're at the maximum
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          WarningConfirmationDialog(
                                        title: 'Số lượng tối đa',
                                        content: Text(
                                          'Số lượng đã đạt mức tối đa ($availableQuantity con).',
                                          textAlign: TextAlign.center,
                                        ),
                                        primaryButtonText: 'Đã hiểu',
                                        onPrimaryButtonPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    );
                                  }
                                },
                                isAdd: true,
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
                  ],
                ),
              )),
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
                    'Lý do thất thoát',
                    isRequired: true, // Required field
                    isCompleted: widget.state._noteController.text.isNotEmpty,
                  ),
                  const SizedBox(height: 8),
                  const Text('Ghi chú lý do thất thoát của gia cầm (bắt buộc)',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 16),
                  TextField(
                    controller: widget.state._noteController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Nhập lý do thất thoát...',
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[200]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[200]!),
                      ),
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.info_outline,
                          size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Vui lòng cung cấp lý do thất thoát để hỗ trợ quản lý và phân tích vấn đề sau này.',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
