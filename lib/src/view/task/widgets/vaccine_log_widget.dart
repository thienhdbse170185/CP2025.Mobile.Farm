import 'package:data_layer/model/dto/growth_stage/growth_stage_dto.dart';
import 'package:data_layer/model/dto/vaccine_schedule/vaccine_schedule_dto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/view/task/widgets/info_item_widget.dart';
import 'package:smart_farm/src/view/task/widgets/quantity_button_widget.dart';

class VaccineLogWidget extends StatelessWidget {
  final String? userName;
  final VaccineScheduleDto? vaccineSchedule;
  final GrowthStageDto? growthStage;
  final TextEditingController countAnimalVaccineController;
  final Function(int) onIncreaseQuantity;
  final Function(int) onDecreaseQuantity;
  final String taskStatus;
  final bool isLoading;

  const VaccineLogWidget({
    super.key,
    required this.userName,
    required this.vaccineSchedule,
    required this.growthStage,
    required this.countAnimalVaccineController,
    required this.onIncreaseQuantity,
    required this.onDecreaseQuantity,
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
          const SizedBox(height: 8),
          const Text('Đang tải báo cáo...')
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
                Icons.vaccines_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Tên báo cáo công việc',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.outline),
                ),
                Text('Đơn báo cáo tiêm vắc xin',
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
          const SizedBox(height: 16),
          if (vaccineSchedule != null)
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline,
                          color: Theme.of(context).primaryColor),
                      const SizedBox(width: 8),
                      Text(
                        'Thông tin về vắc xin',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      InfoItemWidget(
                        context: context,
                        label: 'Ngày tiêm',
                        value: DateFormat('dd/MM/yyyy')
                            .format(vaccineSchedule!.date),
                        icon: Icons.calendar_month,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                      InfoItemWidget(
                        context: context,
                        label: 'Giai đoạn phát triển',
                        value: growthStage?.name ?? "Đang tải...",
                        icon: Icons.pets,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      InfoItemWidget(
                        context: context,
                        label: 'Độ tuổi tiêm',
                        value: '${vaccineSchedule!.applicationAge} ngày tuổi',
                        icon: Icons.health_and_safety_rounded,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.095),
                      InfoItemWidget(
                        context: context,
                        label: 'Buổi tiêm',
                        value: vaccineSchedule!.session == 1
                            ? 'Sáng'
                            : vaccineSchedule!.session == 2
                                ? 'Trưa'
                                : vaccineSchedule!.session == 3
                                    ? 'Chiều'
                                    : 'Tối',
                        icon: Icons.wb_sunny_rounded,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(
                            'Tên vắc xin: ',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          Text(
                            vaccineSchedule!.vaccineName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ],
                    ),
                  )
                ],
              ),
            )
          else
            const Center(
              child: Text('Chưa có dữ liệu lịch tiêm'),
            ),
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
                Text(
                  'Số lượng gia cầm đã tiêm',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QuantityButtonWidget(
                      icon: Icons.remove,
                      onPressed: () {
                        final currentValue =
                            int.tryParse(countAnimalVaccineController.text) ??
                                0;
                        if (currentValue > 0) {
                          onDecreaseQuantity(currentValue);
                        }
                      },
                      isDisable: taskStatus == "Đã hoàn thành",
                    ),
                    Container(
                      width: 80,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: countAnimalVaccineController,
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
                        final currentValue =
                            int.tryParse(countAnimalVaccineController.text) ??
                                0;
                        onIncreaseQuantity(currentValue);
                      },
                      isAdd: true,
                      isDisable: taskStatus == "Đã hoàn thành",
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Ước lượng: 5 con.',
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
        ],
      ),
    );
  }
}
