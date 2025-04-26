import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/model/dto/farming_batch/farming_batch_dto.dart';
import 'package:smart_farm/src/model/dto/growth_stage/growth_stage_dto.dart';
import 'package:smart_farm/src/model/dto/sale_log_detail/sale_log_detail_dto.dart';
import 'package:smart_farm/src/model/dto/task/sale_detail_log/sale_detail_log_dto.dart';
import 'package:smart_farm/src/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:smart_farm/src/view/task/widgets/quantity_button_widget.dart';

class EggSaleLogWidget extends StatefulWidget {
  final String? userName;
  final GrowthStageDto? growthStage;
  final FarmingBatchDto? farmingBatch;
  final TextEditingController countEggSellController;
  final TextEditingController priceEggSellController;
  final TextEditingController dateEggSellController;
  final TextEditingController logController;
  final DateTime saleDate;
  final ValueChanged<DateTime>? onDateChanged; // Make nullable
  final ValueChanged<int>? onCountChanged; // Make nullable
  final TaskHaveCageName task;
  final bool readOnly; // Add readOnly flag
  final SaleDetailLogDto? saleDetailLog;
  final ValueChanged<String>? onPriceChanged;
  final SaleLogDetailDto? saleLogDetail;

  const EggSaleLogWidget({
    super.key,
    this.userName,
    this.growthStage,
    this.farmingBatch,
    required this.countEggSellController,
    required this.priceEggSellController,
    required this.dateEggSellController,
    required this.saleDate,
    this.onDateChanged, // Make optional
    this.onCountChanged, // Make optional
    required this.task,
    this.readOnly = false, // Default to false
    required this.logController,
    this.saleDetailLog,
    this.onPriceChanged,
    this.saleLogDetail,
  });

  @override
  State<EggSaleLogWidget> createState() => _EggSaleLogWidgetState();
}

class _EggSaleLogWidgetState extends State<EggSaleLogWidget> {
  int _availableQuantity = 0;

  @override
  void initState() {
    super.initState();
    _availableQuantity = (widget.growthStage?.quantity ?? 0) -
        (widget.growthStage?.affectQuantity ?? 0) -
        (widget.growthStage?.deadQuantity ?? 0);

    if (widget.saleLogDetail != null) {
      widget.countEggSellController.text =
          widget.saleLogDetail?.quantity.toString() ?? '0';
      // Format the value with commas
      final formatter = NumberFormat('#,###');
      final newValue = formatter.format(widget.saleLogDetail?.unitPrice);

      // Update the controller with the formatted value
      widget.priceEggSellController.value = TextEditingValue(
        text: newValue,
        selection: TextSelection.collapsed(offset: newValue.length),
      );
      // widget.priceEggSellController.text =
      //     widget.saleDetailLog?.unitPrice.toString() ?? '0';
      widget.dateEggSellController.text = DateFormat('dd/MM/yyyy')
          .format(DateTime.parse(widget.saleLogDetail?.saleDate ?? ''));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        const SizedBox(height: 16),
        _buildReporterInfo(context),
        const SizedBox(height: 20),
        _buildGrowthStageInfo(context),
        const SizedBox(height: 30),
        _buildSaleFormSection(context),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.egg_rounded,
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
              'Đơn báo cáo bán trứng',
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
          const SizedBox(width: 16),
          Expanded(
            child: _buildInfoItem(
              context: context,
              label: 'Tên chuồng',
              value: widget.task.cageName,
              icon: Icons.house,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaleFormSection(BuildContext context) {
    final isEditable =
        !widget.readOnly && widget.task.status == StatusDataConstant.inProgress;

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
                  Icons.receipt_long,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Thông tin bán trứng',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const Divider(height: 24),
            _buildEggCountInputSection(context, isEditable),
            const SizedBox(height: 24),
            _buildPriceInputSection(context, isEditable),
            const SizedBox(height: 24),
            _buildDateInputSection(context, isEditable),
          ],
        ),
      ),
    );
  }

  Widget _buildEggCountInputSection(BuildContext context, bool isEditable) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.egg_outlined,
                color: Theme.of(context).colorScheme.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              'Số lượng trứng đã bán',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: Theme.of(context).colorScheme.outlineVariant),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QuantityButtonWidget(
                icon: Icons.remove,
                onPressed: () {
                  final currentValue = int.tryParse(
                        widget.countEggSellController.text,
                      ) ??
                      0;
                  if (currentValue > 0) {
                    widget.onCountChanged?.call(currentValue - 1);
                  }
                },
                isDisable: !isEditable,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: widget.countEggSellController,
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.number,
                  enabled: isEditable,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    suffixText: '(quả)',
                    suffixStyle:
                        TextStyle(color: Colors.grey[600], fontSize: 18),
                  ),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                  onChanged: (value) async {
                    if (value.isEmpty) {
                      widget.countEggSellController.text = '0';
                      widget.countEggSellController.selection =
                          TextSelection.fromPosition(
                              const TextPosition(offset: 1));
                    }
                    final currentValue = int.tryParse(value) ?? 0;
                    widget.onCountChanged?.call(currentValue);
                  },
                  onTap: () {
                    if (widget.countEggSellController.text == '0') {
                      widget.countEggSellController.clear();
                    }
                  },
                ),
              ),
              QuantityButtonWidget(
                icon: Icons.add,
                onPressed: () {
                  final currentValue = int.tryParse(
                        widget.countEggSellController.text,
                      ) ??
                      0;
                  widget.onCountChanged?.call(currentValue + 1);
                },
                isAdd: true,
                isDisable: !isEditable,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceInputSection(BuildContext context, bool isEditable) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.attach_money,
                color: Theme.of(context).colorScheme.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              'Giá bán trứng',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: widget.priceEggSellController,
          keyboardType: TextInputType.number,
          enabled: isEditable,
          decoration: InputDecoration(
            hintText: '2,000',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: Icon(Icons.currency_exchange,
                color: Theme.of(context).colorScheme.primary),
            suffixText: 'VND/quả',
            helperText: 'Giá tiền trên 1 quả trứng',
            filled: true,
            fillColor: isEditable ? Colors.white : Colors.grey[100],
            errorText: _validatePrice(widget.priceEggSellController.text),
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              try {
                final formatter = NumberFormat('#,###');
                final newValue =
                    formatter.format(int.parse(value.replaceAll(',', '')));
                widget.priceEggSellController.value = TextEditingValue(
                  text: newValue,
                  selection: TextSelection.collapsed(offset: newValue.length),
                );

                // Trigger the callback with the clean value (for validation)
                if (widget.onPriceChanged != null) {
                  widget.onPriceChanged!(newValue);
                }

                // Force rebuild to update validation
                setState(() {});
              } catch (e) {
                // If parsing fails, keep the current value
              }
            } else {
              // Force rebuild to update validation when field is cleared
              setState(() {});
            }
          },
        ),
      ],
    );
  }

  String? _validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập giá tiền';
    }

    try {
      final cleanValue = value.replaceAll(',', '');
      final parsedValue = int.parse(cleanValue);

      if (parsedValue < 1000) {
        return 'Giá tiền phải lớn hơn 1,000 VNĐ';
      }
    } catch (e) {
      return 'Vui lòng nhập giá tiền hợp lệ';
    }

    return null;
  }

  Widget _buildDateInputSection(BuildContext context, bool isEditable) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.event,
                color: Theme.of(context).colorScheme.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              'Ngày bán',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: isEditable
              ? () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: widget.saleDate,
                    firstDate: DateTime(2024),
                    lastDate: TimeUtils.customNow(),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null) {
                    widget.dateEggSellController.text =
                        DateFormat('dd/MM/yyyy').format(pickedDate);
                    widget.onDateChanged?.call(pickedDate);
                  }
                }
              : null,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).colorScheme.outlineVariant),
              borderRadius: BorderRadius.circular(12),
              color: isEditable ? Colors.white : Colors.grey[100],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.dateEggSellController.text,
                  style: const TextStyle(fontSize: 16),
                ),
                if (isEditable) const Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGrowthStageInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              Text(
                'Thông tin về giai đoạn phát triển',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: (widget.growthStage == null || widget.farmingBatch == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outlineVariant,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Thông tin vụ nuôi',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildInfoItem(
                                  context: context,
                                  label: 'Tên vụ nuôi',
                                  value: widget.farmingBatch?.name ?? 'N/A',
                                  icon: Icons.assignment,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.38,
                            child: _buildInfoItem(
                              context: context,
                              label: 'Tên giai đoạn',
                              value: widget.growthStage?.name ?? "",
                              icon: Icons.label,
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          if (widget.growthStage?.quantity != null) ...[
                            _buildInfoItem(
                              context: context,
                              label: 'Tổng số con',
                              value:
                                  '${widget.growthStage?.quantity.toString()} (con)',
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
                            value: '$_availableQuantity (con)',
                            icon: Icons.pets,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.084),
                          _buildInfoItem(
                            context: context,
                            label: 'Số con bị bệnh',
                            value:
                                '${widget.growthStage?.affectQuantity} (con)',
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
                            value: widget.growthStage != null &&
                                    widget.growthStage!.ageStartDate.isNotEmpty
                                ? DateFormat('dd/MM/yyyy').format(
                                    DateTime.tryParse(
                                            widget.growthStage!.ageStartDate) ??
                                        DateTime.now())
                                : 'N/A',
                            icon: Icons.calendar_month,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.163),
                          _buildInfoItem(
                            context: context,
                            label: 'Ngày kết thúc',
                            value: widget.growthStage != null &&
                                    widget.growthStage!.ageEndDate.isNotEmpty
                                ? DateFormat('dd/MM/yyyy').format(
                                    DateTime.tryParse(
                                            widget.growthStage!.ageEndDate) ??
                                        DateTime.now())
                                : 'N/A',
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
                                '${widget.growthStage?.ageStart ?? ''} ngày tuổi',
                            icon: Icons.health_and_safety_rounded,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.143),
                          _buildInfoItem(
                            context: context,
                            label: 'Độ tuổi kết thúc',
                            value:
                                '${widget.growthStage?.ageEnd ?? ''} ngày tuổi',
                            icon: Icons.health_and_safety_rounded,
                          ),
                        ],
                      ),
                    ],
                  ),
          )
        ],
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
