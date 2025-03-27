import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/utils/date_util.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/view/task/widgets/info_item_widget.dart';
import 'package:smart_farm/src/view/task/widgets/quantity_button_widget.dart';

class FoodLogWidget extends StatefulWidget {
  final String? userName;
  final double? recommendedWeight;
  final double actualWeight;
  final TextEditingController logController;
  final DateTime? logTime;
  final bool hasAnimalDesease;
  final bool isIsolationFed;
  final Function(bool) onIsolationFedChanged;
  final Function(double) onWeightChanged;
  final TextEditingController actualWeightController;
  final TaskHaveCageName task;

  const FoodLogWidget({
    super.key,
    required this.userName,
    required this.recommendedWeight,
    required this.actualWeight,
    required this.logController,
    required this.task,
    this.logTime,
    required this.hasAnimalDesease,
    required this.isIsolationFed,
    required this.onIsolationFedChanged,
    required this.onWeightChanged,
    required this.actualWeightController,
  });

  @override
  State<FoodLogWidget> createState() => _FoodLogWidgetState();
}

class _FoodLogWidgetState extends State<FoodLogWidget> {
  @override
  Widget build(BuildContext context) {
    final bool isCompleted = widget.task.status == StatusDataConstant.done ||
        widget.task.status == StatusDataConstant.overdue;

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
            value: widget.userName ?? 'Đang tải...',
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
                Text(
                  'Nhập lượng thức ăn:',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isCompleted
                            ? Theme.of(context).colorScheme.outline
                            : null,
                      ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QuantityButtonWidget(
                      icon: Icons.remove,
                      onPressed: () {
                        final currentValue = double.tryParse(
                                widget.actualWeightController.text) ??
                            0.0;
                        if (currentValue > 0.01) {
                          widget.onWeightChanged(currentValue - 0.1);
                        }
                      },
                      isDisable:
                          widget.task.status != StatusDataConstant.inProgress,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: widget.actualWeightController,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          suffixText: '(kg)',
                          suffixStyle:
                              TextStyle(color: Colors.grey[600], fontSize: 18),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                        ),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                        onChanged: (value) async {
                          if (value.isEmpty) {
                            setState(() {
                              widget.actualWeightController.text = '0';
                              widget.actualWeightController.selection =
                                  TextSelection.fromPosition(
                                      const TextPosition(offset: 1));
                            });
                          }
                          final currentValue = double.tryParse(value) ?? 0.0;
                          widget.onWeightChanged(currentValue);
                        },
                        onTap: () {
                          if (widget.actualWeightController.text == '0') {
                            widget.actualWeightController.clear();
                          }
                        },
                      ),
                    ),
                    QuantityButtonWidget(
                      icon: Icons.add,
                      onPressed: () {
                        final currentValue = double.tryParse(
                                widget.actualWeightController.text) ??
                            0.0;
                        widget.onWeightChanged(currentValue + 0.1);
                      },
                      isAdd: true,
                      isDisable:
                          widget.task.status != StatusDataConstant.inProgress,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
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
                      '${widget.recommendedWeight != null ? widget.recommendedWeight?.toInt() : 0} (kg)',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),

                // Add isolation cage feeding confirmation section if needed
                if (widget.hasAnimalDesease) ...[
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
                          value: widget.isIsolationFed,
                          onChanged: isCompleted
                              ? null
                              : (bool? value) {
                                  if (value != null) {
                                    widget.onIsolationFedChanged(value);
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
