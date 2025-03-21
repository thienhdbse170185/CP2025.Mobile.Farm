import 'package:data_layer/data_layer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/core/utils/date_util.dart';

class AnimalSaleLogWidget extends StatelessWidget {
  final String? userName;
  final GrowthStageDto growthStage;
  final TextEditingController weightMeatSellController;
  final TextEditingController priceMeatSellController;
  final TextEditingController dateAnimalSellController;
  final DateTime saleDate;
  final Function(DateTime) onDateChanged;
  final Function(int) onWeightChanged;
  final String taskStatus;

  const AnimalSaleLogWidget({
    super.key,
    required this.userName,
    required this.growthStage,
    required this.weightMeatSellController,
    required this.priceMeatSellController,
    required this.dateAnimalSellController,
    required this.saleDate,
    required this.onDateChanged,
    required this.onWeightChanged,
    required this.taskStatus,
  });

  @override
  Widget build(BuildContext context) {
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
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildInfoItem(
                context: context,
                label: 'Tên người báo cáo',
                value: userName ?? 'Đang tải...',
              ),
              const SizedBox(width: 24),
              _buildInfoItem(
                context: context,
                label: 'Ngày báo cáo',
                value: CustomDateUtils.formatDate(TimeUtils.customNow()),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildGrowthStageInfo(context),
          const SizedBox(height: 30),
          Text(
            'Form nhập liệu bán thịt',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Khối lượng thịt đã bán',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildQuantityButton(
                        context: context,
                        icon: Icons.remove,
                        onPressed: () {
                          final currentValue =
                              int.tryParse(weightMeatSellController.text) ?? 0;
                          if (currentValue > 0) {
                            onWeightChanged(currentValue - 1);
                          }
                        },
                      ),
                      Container(
                        width: 80,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: weightMeatSellController,
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
                        context: context,
                        icon: Icons.add,
                        onPressed: () {
                          final currentValue =
                              int.tryParse(weightMeatSellController.text) ?? 0;
                          onWeightChanged(currentValue + 1);
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
                      Row(
                        children: [
                          Text(
                            'Đơn vị tính: ',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            'kg.',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: priceMeatSellController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Nhập giá tiền',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixText: 'VND',
                      helperText: 'Giá tiền trên 1 kg thịt.',
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        final formatter = NumberFormat('#,###');
                        final newValue = formatter
                            .format(int.parse(value.replaceAll(',', '')));
                        priceMeatSellController.value = TextEditingValue(
                          text: newValue,
                          selection:
                              TextSelection.collapsed(offset: newValue.length),
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
                      Row(
                        children: [
                          Text(
                            'Đơn vị tiền: ',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            'VND.',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: dateAnimalSellController,
                    decoration: InputDecoration(
                      labelText: 'Ngày bán',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: TimeUtils.customNow(),
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2030),
                      );
                      if (pickedDate != null) {
                        dateAnimalSellController.text =
                            DateFormat('dd/MM/yyyy').format(pickedDate);
                        onDateChanged(pickedDate);
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
        ],
      ),
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
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.38,
                child: _buildInfoItem(
                  context: context,
                  label: 'Tên giai đoạn',
                  value: growthStage.name,
                  icon: Icons.label,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              if (growthStage.quantity != null) ...[
                _buildInfoItem(
                  context: context,
                  label: 'Tổng số con',
                  value: '${growthStage.quantity.toString()} (con)',
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
              SizedBox(width: MediaQuery.of(context).size.width * 0.084),
              _buildInfoItem(
                context: context,
                label: 'Số con bị bệnh',
                value: '${growthStage.affectQuantity} (con)',
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
                    .format(DateTime.parse(growthStage.ageStartDate)),
                icon: Icons.calendar_month,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.163),
              _buildInfoItem(
                context: context,
                label: 'Ngày kết thúc',
                value: DateFormat('dd/MM/yyyy')
                    .format(DateTime.parse(growthStage.ageEndDate)),
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
                value: '${growthStage.ageStart} ngày tuổi',
                icon: Icons.health_and_safety_rounded,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.143),
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
          icon: Icon(
            icon,
            color: isAdd ? Colors.white : Colors.grey[700],
          ),
          iconSize: 24,
        ),
      ),
    );
  }
}
