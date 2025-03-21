import 'package:data_layer/model/dto/growth_stage/growth_stage_dto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/view/task/widgets/info_item_widget.dart';
import 'package:smart_farm/src/view/task/widgets/quantity_button_widget.dart';

class WeighingLogWidget extends StatelessWidget {
  final String? userName;
  final GrowthStageDto? growthStage;
  final TextEditingController weightAnimalController;
  final Function(double) onWeightChanged;
  final String taskStatus;
  final bool isLoading;

  const WeighingLogWidget({
    super.key,
    required this.userName,
    required this.growthStage,
    required this.weightAnimalController,
    required this.onWeightChanged,
    required this.taskStatus,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Center(
            child: Column(children: [
          CircularProgressIndicator(),
          const SizedBox(height: 16),
          const Text('Đang tải báo cáo...')
        ])),
      );
    }

    if (growthStage == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Center(
            child: Column(children: [
          const Icon(Icons.error_outline, color: Colors.red),
          const SizedBox(height: 8),
          const Text('Không tìm thấy thông tin giai đoạn phát triển'),
          const SizedBox(height: 8),
        ])),
      );
    }

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
                Icons.monitor_weight_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Tên báo cáo công việc',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.outline),
                ),
                Text('Đơn báo cáo cân gà',
                    style: Theme.of(context).textTheme.titleLarge)
              ]),
            ],
          ),
          const SizedBox(height: 8),
          Row(children: [
            InfoItemWidget(
              context: context,
              label: 'Tên người báo cáo',
              value: userName ?? 'Đang tải...',
            ),
            const SizedBox(width: 24),
            InfoItemWidget(
                context: context,
                label: 'Ngày báo cáo',
                value: DateFormat('dd/MM/yyyy').format(TimeUtils.customNow())),
          ]),
          const SizedBox(height: 20),
          _buildGrowthStageInfo(context, growthStage!),
          const SizedBox(height: 16),
          Row(
            children: [
              Text('Form nhập liệu',
                  style: Theme.of(context).textTheme.titleMedium),
              if (taskStatus == "Đã hoàn thành") ...[
                const SizedBox(width: 8),
                const Icon(Icons.check_circle, color: Colors.green),
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
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cân nặng trung bình gia cầm',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          QuantityButtonWidget(
                            icon: Icons.remove,
                            onPressed: () {
                              final currentValue = double.tryParse(
                                      weightAnimalController.text) ??
                                  0.0;
                              if (currentValue > 0.1) {
                                onWeightChanged(currentValue - 0.1);
                              }
                            },
                            isDisable: taskStatus != "Đang thực hiện",
                          ),
                          Container(
                            width: 80,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: weightAnimalController,
                              textAlign: TextAlign.center,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.zero,
                              ),
                              enabled: taskStatus == "Đang thực hiện",
                            ),
                          ),
                          QuantityButtonWidget(
                            icon: Icons.add,
                            onPressed: () {
                              final currentValue = double.tryParse(
                                      weightAnimalController.text) ??
                                  0.0;
                              onWeightChanged(currentValue + 0.1);
                            },
                            isAdd: true,
                            isDisable: taskStatus != "Đang thực hiện",
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
                                color: Colors.grey[600],
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              'kg.',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
  }

  Widget _buildGrowthStageInfo(
      BuildContext context, GrowthStageDto growthStage) {
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
                child: InfoItemWidget(
                  context: context,
                  label: 'Tên giai đoạn',
                  value: growthStage.name,
                  icon: Icons.label,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              if (growthStage.quantity != null) ...[
                InfoItemWidget(
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
              InfoItemWidget(
                context: context,
                label: 'Số con bình thường',
                value:
                    '${growthStage.quantity! - growthStage.affectQuantity!} (con)',
                icon: Icons.pets,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.084),
              InfoItemWidget(
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
              InfoItemWidget(
                context: context,
                label: 'Ngày bắt đầu',
                value: DateFormat('dd/MM/yyyy')
                    .format(DateTime.parse(growthStage.ageStartDate)),
                icon: Icons.calendar_month,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.163),
              InfoItemWidget(
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
              InfoItemWidget(
                context: context,
                label: 'Độ tuổi bắt đầu',
                value: '${growthStage.ageStart} ngày tuổi',
                icon: Icons.health_and_safety_rounded,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.143),
              InfoItemWidget(
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
}
