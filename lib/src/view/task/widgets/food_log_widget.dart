import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/view/task/widgets/quantity_button_widget.dart';

class FoodLogWidget extends StatefulWidget {
  final String? userName;
  final double? recommendedWeight;
  final double actualWeight;
  final TextEditingController logController;
  final DateTime? logTime;
  final bool hasAnimalDesease;
  final bool isIsolationFed;
  final ValueChanged<bool>? onIsolationFedChanged;
  final ValueChanged<double>? onWeightChanged;
  final TextEditingController actualWeightController;
  final TaskHaveCageName task;
  final String? foodType; // Thêm trường foodType từ API

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
    this.foodType, // Nhận foodType từ API
  });

  @override
  State<FoodLogWidget> createState() => _FoodLogWidgetState();
}

class _FoodLogWidgetState extends State<FoodLogWidget> {
  bool _showRecommendationInfo = true;

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = widget.task.status == StatusDataConstant.done ||
        widget.task.status == StatusDataConstant.overdue;
    final isEditable = widget.task.status == StatusDataConstant.inProgress;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        const SizedBox(height: 16),
        _buildReporterInfo(context),
        const SizedBox(height: 20),
        _buildFoodQuantityInput(context, isEditable),
        if (widget.hasAnimalDesease &&
            widget.task.status == StatusDataConstant.inProgress) ...[
          const SizedBox(height: 24),
          _buildIsolationSection(context, isCompleted),
        ],
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.restaurant_rounded,
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
              'Đơn báo cáo cho ăn',
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
          // const SizedBox(height: 16),
          // Row(
          //   children: [
          //     _buildInfoItem(
          //       context: context,
          //       label: 'Thời gian báo cáo',
          //       value: widget.logTime != null
          //           ? '${widget.logTime?.day}/${widget.logTime?.month}/${widget.logTime?.year}'
          //           : 'Đang tải...',
          //       icon: Icons.access_time,
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }

  Widget _buildFoodQuantityInput(BuildContext context, bool isEditable) {
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
                  Icons.restaurant_menu,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Thông tin cho ăn',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const Divider(height: 24),

            // Recommended food amount section
            if (widget.recommendedWeight != null) ...[
              ExpansionTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Thông tin khuyến cáo',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                initiallyExpanded: _showRecommendationInfo,
                onExpansionChanged: (expanded) {
                  setState(() {
                    _showRecommendationInfo = expanded;
                  });
                },
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .secondaryContainer
                          .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoItem(
                          context: context,
                          label: 'Lượng thức ăn khuyến cáo',
                          value: '${widget.recommendedWeight?.toInt()} (kg)',
                          icon: Icons.scale,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Vui lòng cho gia cầm ăn đủ lượng thức ăn được khuyến cáo để đảm bảo sự phát triển.',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],

            // Food type section - Read-only display
            if (widget.foodType != null && widget.foodType!.isNotEmpty) ...[
              _buildFoodTypeSection(context),
              const SizedBox(height: 20),
            ],

            // Actual weight input section
            _buildWeightInputSection(context, isEditable),
          ],
        ),
      ),
    );
  }

  // Method to build food type display section
  Widget _buildFoodTypeSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.food_bank_outlined,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Loại thức ăn',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.agriculture_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.foodType ?? 'Không có thông tin',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: widget.foodType != null
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
          child: Row(
            children: [
              Icon(Icons.info_outline, size: 14, color: Colors.grey[600]),
              const SizedBox(width: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  'Loại thức ăn được sử dụng cho giai đoạn phát triển hiện tại',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWeightInputSection(BuildContext context, bool isEditable) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.scale,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Lượng thức ăn thực tế',
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
                        widget.actualWeightController.text,
                      ) ??
                      0.0;
                  if (currentValue > 0.1) {
                    if (widget.onWeightChanged != null) {
                      widget.onWeightChanged!(currentValue - 0.1);
                    }
                  }
                },
                isDisable: !isEditable,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: widget.actualWeightController,
                  textAlign: TextAlign.right,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  enabled: isEditable,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,1}')),
                  ],
                  decoration: InputDecoration(
                    suffixText: '(kg)',
                    suffixStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
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
                    if (widget.onWeightChanged != null) {
                      widget.onWeightChanged!(currentValue);
                    }
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
                        widget.actualWeightController.text,
                      ) ??
                      0.0;
                  if (widget.onWeightChanged != null) {
                    widget.onWeightChanged!(currentValue + 0.1);
                  }
                },
                isAdd: true,
                isDisable: !isEditable,
              ),
            ],
          ),
        ),
        if (isEditable)
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: Row(
              children: [
                Icon(Icons.info_outline, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  'Nhập tổng lượng thức ăn thực tế',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildIsolationSection(BuildContext context, bool isCompleted) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer.withOpacity(0.1),
        border: Border.all(
          color: Theme.of(context).colorScheme.error.withOpacity(0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.medical_services_outlined,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Chuồng có gia cầm bị bệnh',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.error,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:
                  Theme.of(context).colorScheme.errorContainer.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Vui lòng đảm bảo bạn đã cho ăn cả chuồng hiện tại và chuồng cách ly.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 16),
          CheckboxListTile(
            title: Text(
              'Tôi đã cho ăn ở cả chuồng cách ly',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: isCompleted
                    ? Theme.of(context).colorScheme.outline
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.primary,
            value: widget.isIsolationFed,
            onChanged: isCompleted
                ? null
                : (bool? value) {
                    if (value != null) {
                      if (widget.onIsolationFedChanged != null) {
                        widget.onIsolationFedChanged!(value);
                      }
                    }
                  },
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
              ),
            ),
            tileColor: widget.isIsolationFed
                ? Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.3)
                : Colors.transparent,
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
}
