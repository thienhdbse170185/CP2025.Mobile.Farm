import 'package:data_layer/data_layer.dart';
import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/view/task/widgets/quantity_button_widget.dart';

class AnimalSaleLogWidget extends StatefulWidget {
  final String? userName;
  final GrowthStageDto? growthStage;
  final FarmingBatchDto? farmingBatch;
  final TextEditingController weightMeatSellController;
  final TextEditingController priceMeatSellController;
  final TextEditingController dateAnimalSellController;
  final DateTime saleDate;
  final ValueChanged<DateTime>? onDateChanged; // Make nullable
  final ValueChanged<int>? onWeightChanged; // Make nullable
  final TaskHaveCageName task;
  final bool readOnly; // Add readOnly flag

  const AnimalSaleLogWidget({
    super.key,
    this.userName,
    this.growthStage,
    this.farmingBatch,
    required this.weightMeatSellController,
    required this.priceMeatSellController,
    required this.dateAnimalSellController,
    required this.saleDate,
    this.onDateChanged, // Make optional
    this.onWeightChanged, // Make optional
    required this.task,
    this.readOnly = false, // Default to false
  });

  @override
  State<AnimalSaleLogWidget> createState() => _AnimalSaleLogWidgetState();
}

class _AnimalSaleLogWidgetState extends State<AnimalSaleLogWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        const SizedBox(height: 8),
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
          Icons.sell_rounded,
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
              'Đơn báo cáo bán gia cầm',
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
      child: Column(
        children: [
          Row(
            children: [
              _buildInfoItem(
                context: context,
                label: 'Tên người báo cáo',
                value: widget.userName ?? 'Đang tải...',
                icon: Icons.person,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.15),
              _buildInfoItem(
                context: context,
                label: 'Tên chuồng',
                value: widget.task.cageName,
                icon: Icons.home_work_outlined,
              ),
            ],
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
                  'Thông tin bán thịt',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const Divider(height: 24),
            _buildWeightInputSection(context, isEditable),
            const SizedBox(height: 24),
            _buildPriceInputSection(context, isEditable),
            const SizedBox(height: 24),
            _buildDateInputSection(context, isEditable),
          ],
        ),
      ),
    );
  }

  Widget _buildWeightInputSection(BuildContext context, bool isEditable) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.scale,
                color: Theme.of(context).colorScheme.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              'Khối lượng thịt đã bán',
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
                        widget.weightMeatSellController.text,
                      ) ??
                      0;
                  if (currentValue > 0) {
                    widget.onWeightChanged?.call(currentValue - 1);
                  }
                },
                isDisable: !isEditable,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: widget.weightMeatSellController,
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.number,
                  enabled: isEditable,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    suffixText: '(kg)',
                    suffixStyle:
                        TextStyle(color: Colors.grey[600], fontSize: 18),
                  ),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                  onChanged: (value) async {
                    if (value.isEmpty) {
                      widget.weightMeatSellController.text = '0';
                      widget.weightMeatSellController.selection =
                          TextSelection.fromPosition(
                              const TextPosition(offset: 1));
                    }
                    final currentValue = int.tryParse(value) ?? 0;
                    widget.onWeightChanged?.call(currentValue);
                  },
                  onTap: () {
                    if (widget.weightMeatSellController.text == '0') {
                      widget.weightMeatSellController.clear();
                    }
                  },
                ),
              ),
              QuantityButtonWidget(
                icon: Icons.add,
                onPressed: () {
                  final currentValue = int.tryParse(
                        widget.weightMeatSellController.text,
                      ) ??
                      0;
                  widget.onWeightChanged?.call(currentValue + 1);
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
              'Giá tiền thịt bán ra',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: widget.priceMeatSellController,
          keyboardType: TextInputType.number,
          enabled: isEditable,
          decoration: InputDecoration(
            hintText: '100,000',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: Icon(Icons.currency_exchange,
                color: Theme.of(context).colorScheme.primary),
            suffixText: 'VND/kg',
            helperText: 'Giá tiền trên 1 kg thịt',
            filled: true,
            fillColor: isEditable ? Colors.white : Colors.grey[100],
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              try {
                final formatter = NumberFormat('#,###');
                final newValue =
                    formatter.format(int.parse(value.replaceAll(',', '')));
                widget.priceMeatSellController.value = TextEditingValue(
                  text: newValue,
                  selection: TextSelection.collapsed(offset: newValue.length),
                );
              } catch (e) {
                // If parsing fails, keep the current value
              }
            }
          },
        ),
      ],
    );
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
                    widget.dateAnimalSellController.text =
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
                  widget.dateAnimalSellController.text,
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
                              color:
                                  Theme.of(context).colorScheme.outlineVariant,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildInfoItem(
                                    context: context,
                                    label: 'Tên vụ nuôi',
                                    value: widget.farmingBatch?.name ?? 'N/A',
                                    icon: Icons.assignment,
                                  ),
                                  // _buildInfoItem(
                                  //   context: context,
                                  //   label: 'Loại vật nuôi',
                                  //   value:
                                  //       widget.farmingBatch?.species ?? 'N/A',
                                  //   icon: Icons.pets,
                                  // ),
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
                                value: widget.growthStage?.name ?? '',
                                icon: Icons.label,
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            if (widget.growthStage?.quantity != null) ...[
                              _buildInfoItem(
                                context: context,
                                label: 'Số lượng',
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
                              value:
                                  '${(widget.growthStage?.quantity ?? 0) - (widget.farmingBatch?.affectedQuantity ?? 0)} (con)',
                              icon: Icons.pets,
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.084),
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
                                      widget
                                          .growthStage!.ageStartDate.isNotEmpty
                                  ? DateFormat('dd/MM/yyyy').format(
                                      DateTime.tryParse(widget
                                              .growthStage!.ageStartDate) ??
                                          DateTime.now())
                                  : 'N/A',
                              icon: Icons.calendar_month,
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.163),
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
                                  '${widget.growthStage?.ageStart} ngày tuổi',
                              icon: Icons.health_and_safety_rounded,
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.143),
                            _buildInfoItem(
                              context: context,
                              label: 'Độ tuổi kết thúc',
                              value: '${widget.growthStage?.ageEnd} ngày tuổi',
                              icon: Icons.health_and_safety_rounded,
                            ),
                          ],
                        ),
                      ],
                    )),
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
