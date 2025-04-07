import 'package:data_layer/model/dto/farming_batch/farming_batch_dto.dart';
import 'package:data_layer/model/dto/growth_stage/growth_stage_dto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/view/task/widgets/quantity_button_widget.dart';

class WeighingLogWidget extends StatefulWidget {
  final String? userName;
  final GrowthStageDto? growthStage;
  final FarmingBatchDto? farmingBatch;
  final TextEditingController weightAnimalController;
  final ValueChanged<double>? onWeightChanged; // Make nullable
  final String? taskStatus;
  final bool readOnly; // Add readOnly flag

  const WeighingLogWidget({
    super.key,
    this.userName,
    required this.growthStage,
    required this.farmingBatch,
    required this.weightAnimalController,
    this.onWeightChanged, // Make optional
    this.taskStatus,
    this.readOnly = false, // Default to false
  });

  @override
  State<WeighingLogWidget> createState() => _WeighingLogWidgetState();
}

class _WeighingLogWidgetState extends State<WeighingLogWidget> {
  double _currentWeight = 0.0;
  double _weightDifference = 0.0;
  double _percentChange = 0.0;

  @override
  void initState() {
    super.initState();
    _currentWeight = double.tryParse(widget.weightAnimalController.text) ?? 0.0;
    _calculateDifference();
  }

  @override
  void didUpdateWidget(WeighingLogWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _currentWeight = double.tryParse(widget.weightAnimalController.text) ?? 0.0;
    _calculateDifference();
  }

  void _calculateDifference() {
    final previousWeight = widget.growthStage?.weightAnimal ?? 0.0;
    _weightDifference = _currentWeight - previousWeight;
    _percentChange =
        previousWeight > 0 ? (_weightDifference / previousWeight) * 100 : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.growthStage == null) {
      return _buildErrorState(context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        const SizedBox(height: 16),
        _buildReporterInfo(context),
        const SizedBox(height: 20),
        _buildGrowthStageInfo(context, widget.growthStage),
        const SizedBox(height: 24),
        _buildWeightInputForm(context),
        // const SizedBox(height: 20),
        // _buildPreviousWeightComparison(context), // Thêm phần so sánh cân nặng
      ],
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.error_outline,
                color: Theme.of(context).colorScheme.error,
                size: 48,
              ),
              const SizedBox(height: 16),
              Text(
                'Không tìm thấy thông tin giai đoạn phát triển',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh),
                label: const Text('Thử lại'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.monitor_weight_rounded,
          color: Theme.of(context).colorScheme.primary,
          size: 32,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tên báo cáo công việc',
              style: TextStyle(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            Text(
              'Đơn báo cáo cân gia cầm',
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
      ],
    );
  }

  Widget _buildReporterInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildInfoItem(
              context: context,
              label: 'Tên người báo cáo',
              value: widget.userName ?? 'Đang tải...',
              icon: Icons.person,
            ),
          ),
          Expanded(
            child: _buildInfoItem(
              context: context,
              label: 'Ngày báo cáo',
              value: DateFormat('dd/MM/yyyy').format(TimeUtils.customNow()),
              icon: Icons.today,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrowthStageInfo(
      BuildContext context, GrowthStageDto? growthStage) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Giai đoạn phát triển hiện hành',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: _buildInfoItem(
                    context: context,
                    label: 'Tên giai đoạn',
                    value: growthStage?.name ?? '',
                    icon: Icons.label,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                if (growthStage?.quantity != null) ...[
                  _buildInfoItem(
                    context: context,
                    label: 'Tổng số con',
                    value: '${growthStage?.quantity.toString()} (con)',
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
                      '${(growthStage?.quantity ?? 0) - (widget.farmingBatch?.affectedQuantity ?? 0)} (con)',
                  icon: Icons.pets,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.084),
                _buildInfoItem(
                  context: context,
                  label: 'Số con bị bệnh',
                  value: '${growthStage?.affectQuantity} (con)',
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
                  value: DateFormat('dd/MM/yyyy')
                      .format(DateTime.parse(growthStage?.ageStartDate ?? '')),
                  icon: Icons.calendar_month,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.163),
                _buildInfoItem(
                  context: context,
                  label: 'Ngày kết thúc',
                  value: DateFormat('dd/MM/yyyy')
                      .format(DateTime.parse(growthStage?.ageEndDate ?? '')),
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
                  value: '${growthStage?.ageStart} ngày tuổi',
                  icon: Icons.health_and_safety_rounded,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.143),
                _buildInfoItem(
                  context: context,
                  label: 'Độ tuổi kết thúc',
                  value: '${growthStage?.ageEnd} ngày tuổi',
                  icon: Icons.health_and_safety_rounded,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeightInputForm(BuildContext context) {
    final isEditable = !widget.readOnly;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.scale,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Cân nặng gia cầm',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                if (widget.taskStatus == "Đã hoàn thành") ...[
                  const SizedBox(width: 8),
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 20,
                  ),
                ]
              ],
            ),
            const Divider(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cân nặng trung bình gia cầm (hiện tại):',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      QuantityButtonWidget(
                        icon: Icons.remove,
                        onPressed: () {
                          final currentValue = double.tryParse(
                                  widget.weightAnimalController.text) ??
                              0.0;
                          if (currentValue > 0.1) {
                            _currentWeight = currentValue - 0.1;
                            widget.onWeightChanged?.call(_currentWeight);
                            _calculateDifference();
                          }
                        },
                        isDisable: !isEditable,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: widget.weightAnimalController,
                          textAlign: TextAlign.center,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          enabled: isEditable,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            suffixText: 'kg',
                            suffixStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onChanged: (value) async {
                            if (value.isEmpty) {
                              widget.weightAnimalController.text = '0';
                              widget.weightAnimalController.selection =
                                  TextSelection.fromPosition(
                                      const TextPosition(offset: 1));
                            }
                            _currentWeight = double.tryParse(value) ?? 0;
                            widget.onWeightChanged?.call(_currentWeight);
                            _calculateDifference();
                          },
                          onTap: () {
                            if (widget.weightAnimalController.text == '0') {
                              widget.weightAnimalController.clear();
                            }
                          },
                        ),
                      ),
                      QuantityButtonWidget(
                        icon: Icons.add,
                        onPressed: () {
                          final currentValue = double.tryParse(
                                  widget.weightAnimalController.text) ??
                              0.0;
                          _currentWeight = currentValue + 0.1;
                          widget.onWeightChanged?.call(_currentWeight);
                          _calculateDifference();
                        },
                        isAdd: true,
                        isDisable: !isEditable,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                          children: [
                            const TextSpan(text: 'Đơn vị tính: '),
                            TextSpan(
                              text: 'kg.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Thêm phương thức mới để hiển thị thông tin giai đoạn trước
  Widget _buildPreviousWeightComparison(BuildContext context) {
    // Nếu không có dữ liệu giai đoạn trước
    // Xác định màu sắc và biểu tượng phù hợp với xu hướng cân nặng
    final IconData trendIcon =
        _weightDifference >= 0 ? Icons.trending_up : Icons.trending_down;

    final Color trendColor = _weightDifference >= 0 ? Colors.green : Colors.red;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.history,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Lịch sử cân nặng',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const Divider(height: 24),
            // Thông tin giai đoạn trước
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Giai đoạn trước:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoItem(
                        context: context,
                        label: 'Tên giai đoạn',
                        value: widget.growthStage?.name ?? 'Không xác định',
                        icon: Icons.label,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildInfoItem(
                        context: context,
                        label: 'Cân nặng trung bình',
                        value:
                            '${widget.growthStage!.weightAnimal.toStringAsFixed(2)} kg',
                        icon: Icons.scale,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                      _buildInfoItem(
                        context: context,
                        label: 'Độ tuổi',
                        value:
                            '${widget.growthStage!.ageStart} - ${widget.growthStage!.ageEnd} ngày',
                        icon: Icons.calendar_view_day,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Phần thông tin so sánh
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'So sánh với giai đoạn trước:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: trendColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: trendColor.withOpacity(0.3),
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: trendColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      trendIcon,
                      color: trendColor,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    _weightDifference >= 0 ? 'Tăng ' : 'Giảm ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: trendColor,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '${_weightDifference.abs().toStringAsFixed(2)} kg',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' so với giai đoạn trước',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            children: [
                              TextSpan(text: 'Tỷ lệ thay đổi: '),
                              TextSpan(
                                text:
                                    '${_percentChange >= 0 ? '+' : ''}${_percentChange.toStringAsFixed(1)}%',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: trendColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Thêm gợi ý hoặc nhận xét (tùy chọn)
            if (_weightDifference != 0) ...[
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      size: 14,
                      color: Colors.amber[700],
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        _weightDifference > 0
                            ? 'Gia cầm phát triển tốt so với giai đoạn trước.'
                            : 'Gia cầm đang có dấu hiệu chậm phát triển, cần kiểm tra chế độ dinh dưỡng.',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // Biểu đồ so sánh (có thể thêm nếu cần)
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required BuildContext context,
    required String label,
    required String value,
    IconData? icon,
    int warningLevel = 0,
  }) {
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
            Row(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
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
}
