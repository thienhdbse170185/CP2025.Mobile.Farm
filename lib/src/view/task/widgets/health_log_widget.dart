import 'package:data_layer/model/dto/prescription/prescription.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/view/task/widgets/info_item_widget.dart';

class HealthLogWidget extends StatelessWidget {
  final String? userName;
  final PrescriptionDto? prescription;
  final int session;
  final Map<String, bool> medicationChecked;
  final Function(String, bool) onMedicationCheckedChanged;
  final String taskStatus;

  const HealthLogWidget({
    super.key,
    required this.userName,
    required this.prescription,
    required this.session,
    required this.medicationChecked,
    required this.onMedicationCheckedChanged,
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
          // Header
          Row(
            children: [
              Icon(
                Icons.medical_services_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Tên báo cáo công việc',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.outline),
                ),
                Text('Đơn báo cáo cho uống thuốc',
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
          if (prescription != null) ...[
            const SizedBox(height: 16),
            // Prescription Info
            Container(
              padding: const EdgeInsets.all(12),
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
                          color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 8),
                      Text(
                        'Thông tin đơn thuốc',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      InfoItemWidget(
                        context: context,
                        label: 'Số ngày uống',
                        value: '${prescription?.daysToTake} ngày',
                        icon: Icons.calendar_today,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.16),
                      InfoItemWidget(
                        context: context,
                        label: 'Số lượng',
                        value: '${prescription?.quantityAnimal} con',
                        icon: Icons.pets,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Medications List
            Text(
              'Danh sách thuốc',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ...prescription?.medications?.where((medication) {
                  // Chỉ hiển thị thuốc có liều > 0 theo session
                  int dose = session == 1
                      ? medication.morning
                      : session == 2
                          ? medication.noon
                          : session == 3
                              ? medication.afternoon
                              : medication.evening;
                  return dose > 0;
                }).map((medication) => Container(
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
                          Row(
                            children: [
                              // Thêm checkbox với alignment center
                              if (taskStatus != "Đã hoàn thành")
                                Checkbox(
                                  value: medicationChecked[
                                          medication.medicationId] ??
                                      false,
                                  onChanged: (bool? value) {
                                    onMedicationCheckedChanged(
                                        medication.medicationId,
                                        value ?? false);
                                  },
                                ),
                              Expanded(
                                child: Text(
                                  medication.medicationName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Text(
                                'Số lượng: ',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                              ),
                              Text(
                                '${session == 1 ? medication.morning : session == 2 ? medication.noon : session == 3 ? medication.afternoon : medication.evening} liều',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )) ??
                [],
          ] else ...[
            const SizedBox(height: 20),
            const Center(
              child: Text('Không có thông tin đơn thuốc'),
            ),
          ]
        ],
      ),
    );
  }
}
