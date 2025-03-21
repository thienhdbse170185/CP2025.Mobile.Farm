import 'package:data_layer/model/dto/growth_stage/growth_stage_dto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/view/task/widgets/info_item_widget.dart';
import 'package:smart_farm/src/view/task/widgets/quantity_button_widget.dart';

class EggHarvestLogWidget extends StatelessWidget {
  final String? userName;
  final GrowthStageDto? growthStage;
  final TextEditingController countEggCollectedController;
  final Function(int) onCountChanged;
  final String taskStatus;
  final bool isLoading;

  const EggHarvestLogWidget({
    super.key,
    required this.userName,
    required this.growthStage,
    required this.countEggCollectedController,
    required this.onCountChanged,
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
                Icons.egg_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Tên báo cáo công việc',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.outline),
                ),
                Text('Đơn báo cáo thu hoạch trứng',
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
          const SizedBox(height: 24),
          Column(
            children: [
              Row(
                children: [
                  Text('Form nhập liệu',
                      style: Theme.of(context).textTheme.titleLarge),
                  if (taskStatus == "Đã hoàn thành") ...[
                    const SizedBox(width: 8),
                    const Icon(Icons.check_circle, color: Colors.green),
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
                        'Số trứng thu hoạch được',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          QuantityButtonWidget(
                            icon: Icons.remove,
                            onPressed: () {
                              final currentValue = int.tryParse(
                                      countEggCollectedController.text) ??
                                  0;
                              if (currentValue > 0) {
                                onCountChanged(currentValue - 1);
                              }
                            },
                            isDisable: taskStatus != "Đang thực hiện",
                          ),
                          Container(
                            width: 80,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: countEggCollectedController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                          QuantityButtonWidget(
                            icon: Icons.add,
                            onPressed: () {
                              final currentValue = int.tryParse(
                                      countEggCollectedController.text) ??
                                  0;
                              onCountChanged(currentValue + 1);
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
                              'quả.',
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
                'Thông tin về vụ nuôi',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildGrowthStageInfoRows(context, growthStage),
        ],
      ),
    );
  }

  Widget _buildGrowthStageInfoRows(
      BuildContext context, GrowthStageDto growthStage) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.38,
              child: InfoItemWidget(
                context: context,
                label: 'Tên vụ nuôi',
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
    );
  }
}
