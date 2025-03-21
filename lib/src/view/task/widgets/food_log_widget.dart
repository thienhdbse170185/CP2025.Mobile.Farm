import 'package:flutter/material.dart';
import 'package:smart_farm/src/core/utils/date_util.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/view/task/widgets/info_item_widget.dart';

class FoodLogWidget extends StatelessWidget {
  final String? userName;
  final double? recommendedWeight;
  final double actualWeight;
  final List<double> weightList;
  final Function(double) onWeightSelected;
  final TextEditingController logController;
  final String taskStatus;
  final DateTime? logTime;
  final bool hasAnimalDesease;
  final bool isIsolationFed;
  final Function(bool) onIsolationFedChanged;

  const FoodLogWidget({
    super.key,
    required this.userName,
    required this.recommendedWeight,
    required this.actualWeight,
    required this.weightList,
    required this.onWeightSelected,
    required this.logController,
    required this.taskStatus,
    this.logTime,
    required this.hasAnimalDesease,
    required this.isIsolationFed,
    required this.onIsolationFedChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCompleted =
        taskStatus == "Đã hoàn thành" || taskStatus == "Quá hạn";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.restaurant_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Tên báo cáo công việc',
                style: TextStyle(color: Theme.of(context).colorScheme.outline),
              ),
              Text('Đơn báo cáo cho ăn',
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
          SizedBox(width: MediaQuery.of(context).size.width * 0.1),
          InfoItemWidget(
              context: context,
              label: 'Ngày báo cáo',
              value: CustomDateUtils.formatDate(TimeUtils.customNow())),
        ]),
        const SizedBox(height: 24),
        Card.outlined(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Khuyến cáo cho ăn:',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${recommendedWeight != null ? recommendedWeight?.toInt() : 0} (kg)',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Chọn lượng thức ăn:',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isCompleted
                            ? Theme.of(context).colorScheme.outline
                            : null,
                      ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: weightList.map((weight) {
                    bool isSelected = actualWeight == weight;
                    bool isDisabled = isCompleted;
                    return FilterChip(
                      selected: isSelected,
                      showCheckmark: false,
                      label: Text('$weight (kg)'),
                      labelStyle: TextStyle(
                        color: isDisabled
                            ? Theme.of(context).colorScheme.outline
                            : isSelected
                                ? Colors.white
                                : Theme.of(context).colorScheme.onSurface,
                      ),
                      selectedColor: Theme.of(context).colorScheme.primary,
                      onSelected: isDisabled
                          ? null
                          : (bool selected) {
                              if (selected) {
                                onWeightSelected(weight);
                              }
                            },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(isCompleted ? 0.5 : 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Đã cho ăn: ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        '$actualWeight (kg)',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),

                // Add isolation cage feeding confirmation section if needed
                if (hasAnimalDesease) ...[
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .errorContainer
                          .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .error
                            .withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.medical_services_outlined,
                              color: Theme.of(context).colorScheme.error,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Chuồng này có gia cầm bị bệnh ở chuồng cách ly',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Vui lòng đảm bảo bạn đã cho ăn cả chuồng hiện tại và chuồng cách ly.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                        CheckboxListTile(
                          title: Text(
                            'Tôi đã cho ăn ở cả chuồng cách ly',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: isCompleted
                                  ? Theme.of(context).colorScheme.outline
                                  : null,
                            ),
                          ),
                          activeColor: Theme.of(context).colorScheme.primary,
                          value: isIsolationFed,
                          onChanged: isCompleted
                              ? null
                              : (bool? value) {
                                  if (value != null) {
                                    onIsolationFedChanged(value);
                                  }
                                },
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          dense: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
