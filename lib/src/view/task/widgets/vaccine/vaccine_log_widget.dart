import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:smart_farm/src/view/task/widgets/quantity_button_widget.dart';

import '../../../../model/dto/index.dart';

class VaccineLogWidget extends StatefulWidget {
  final String? userName;
  final VaccineScheduleDto? vaccineSchedule;
  final GrowthStageDto? growthStage;
  final FarmingBatchDto? farmingBatch;
  final TextEditingController countAnimalVaccineController;
  final TextEditingController logController;
  final ValueChanged<int>? onCountChanged;
  final TaskHaveCageName task;
  final bool isLoading;
  final bool readOnly;
  final int? totalPrice;
  final VoidCallback?
      onVaccineDetailPressed; // Thêm callback khi nhấn vào chi tiết vắc xin
  final VaccineDto? vaccine;
  final DateTime? logTime;

  const VaccineLogWidget({
    super.key,
    this.userName,
    this.vaccineSchedule,
    this.growthStage,
    required this.countAnimalVaccineController,
    required this.logController,
    this.farmingBatch,
    this.onCountChanged,
    required this.task,
    this.isLoading = false,
    this.readOnly = false,
    this.totalPrice,
    this.onVaccineDetailPressed, // Thêm vào constructor
    this.vaccine,
    this.logTime,
  });

  @override
  State<VaccineLogWidget> createState() => _VaccineLogWidgetState();
}

class _VaccineLogWidgetState extends State<VaccineLogWidget> {
  int expectedInjectedAnimal = 0;

  @override
  void initState() {
    super.initState();
    if (widget.task.status == StatusDataConstant.inProgress) {
      setState(() {
        expectedInjectedAnimal = widget.growthStage?.quantity ??
            0 - (widget.farmingBatch?.affectedQuantity ?? 0);
        widget.countAnimalVaccineController.text =
            expectedInjectedAnimal.toString();
      });
    }
  }

  // Hàm kiểm tra và giới hạn số lượng
  void _validateAndUpdateCount(int value) {
    // Giới hạn số lượng không vượt quá cả đàn
    int validCount = value;
    if (value > expectedInjectedAnimal) {
      validCount = expectedInjectedAnimal;
      // Hiển thị thông báo nếu muốn
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Số lượng không thể lớn hơn tổng số gia cầm ($expectedInjectedAnimal con)'),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 2),
        ),
      );
    }

    // Cập nhật giá trị và gọi callback
    widget.countAnimalVaccineController.text = validCount.toString();
    widget.onCountChanged?.call(validCount);

    // Đặt vị trí con trỏ ở cuối text
    widget.countAnimalVaccineController.selection = TextSelection.fromPosition(
      TextPosition(offset: widget.countAnimalVaccineController.text.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Center(
          child: Column(
            children: [
              CircularProgressIndicator(),
              const SizedBox(height: 8),
              const Text('Đang tải báo cáo...')
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Đóng bàn phím khi nhấn ra ngoài
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          _buildReporterInfo(context),
          const SizedBox(height: 20),
          _buildVaccineInfo(context),
          const SizedBox(height: 24),
          _buildVaccineFormSection(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.vaccines_rounded,
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
              'Đơn báo cáo tiêm vắc xin',
              style: Theme.of(context).textTheme.titleLarge,
            ),
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
                  icon: Icons.home_work_outlined)
            ],
          ),
          if (widget.logTime != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                _buildInfoItem(
                  context: context,
                  label: 'Thời gian báo cáo',
                  value: widget.logTime != null
                      ? DateFormat('dd/MM/yyyy HH:mm').format(widget.logTime!)
                      : 'Đang tải...',
                  icon: Icons.access_time,
                ),
              ],
            )
          ]
        ],
      ),
    );
  }

  Widget _buildVaccineInfo(BuildContext context) {
    if (widget.vaccineSchedule == null) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                ),
                const SizedBox(width: 8),
                Text(
                  'Thông tin về vắc xin',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const Divider(height: 24),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Theme.of(context).colorScheme.error,
                      size: 40,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Không có thông tin lịch tiêm vắc xin',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Vui lòng kiểm tra lại thông tin về lịch tiêm vắc xin, liên hệ Admin để được hỗ trợ sớm nhất.',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Thông tin về vắc xin',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const Spacer(),
              if (widget.vaccine != null) _buildDetailButton(context),
            ],
          ),
          const Divider(height: 24),
          Row(
            children: [
              Expanded(
                child: _buildInfoItem(
                  context: context,
                  label: 'Tên vắc xin',
                  value: widget.vaccineSchedule!.vaccineName,
                  icon: Icons.medication_liquid,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildInfoItem(
                  context: context,
                  label: 'Ngày tiêm',
                  value: DateFormat('dd/MM/yyyy')
                      .format(widget.vaccineSchedule!.date),
                  icon: Icons.calendar_month,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildInfoItem(
                  context: context,
                  label: 'Buổi tiêm',
                  value: widget.vaccineSchedule!.session == 1
                      ? 'Sáng'
                      : widget.vaccineSchedule!.session == 2
                          ? 'Trưa'
                          : widget.vaccineSchedule!.session == 3
                              ? 'Chiều'
                              : 'Tối',
                  icon: widget.vaccineSchedule!.session == 1
                      ? Icons.wb_sunny
                      : widget.vaccineSchedule!.session == 2
                          ? Icons.wb_twighlight
                          : widget.vaccineSchedule!.session == 3
                              ? Icons.wb_cloudy
                              : Icons.nightlight_round,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildInfoItem(
                  context: context,
                  label: 'Giai đoạn phát triển',
                  value: widget.growthStage?.name ?? "Đang tải...",
                  icon: Icons.pets,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildInfoItem(
                  context: context,
                  label: 'Độ tuổi tiêm',
                  value: '${widget.vaccineSchedule!.applicationAge} ngày tuổi',
                  icon: Icons.monitor_weight_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailButton(BuildContext context) {
    return TextButton.icon(
      onPressed: widget.onVaccineDetailPressed,
      icon: const Icon(Icons.visibility),
      label: const Text('Xem chi tiết'),
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.primary,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  Widget _buildVaccineFormSection(BuildContext context) {
    final isEditable =
        widget.task.status == StatusDataConstant.inProgress && !widget.readOnly;

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
                  Icons.checklist_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Thông tin tiêm chủng',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const Divider(height: 24),
            _buildAnimalCountSection(context, isEditable),
            if (widget.task.status == StatusDataConstant.done) ...[
              const SizedBox(height: 20),
              _buildTotalPriceSection(context),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildAnimalCountSection(BuildContext context, bool isEditable) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.format_list_numbered,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Số lượng gia cầm đã tiêm',
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
                  final currentValue = int.tryParse(
                        widget.countAnimalVaccineController.text,
                      ) ??
                      0;
                  if (currentValue > 0) {
                    final newValue = currentValue - 1;
                    _validateAndUpdateCount(newValue);
                  }
                },
                isDisable: !isEditable,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: widget.countAnimalVaccineController,
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.number,
                  enabled: isEditable,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    suffixText: '(con)',
                    suffixStyle:
                        TextStyle(color: Colors.grey[600], fontSize: 18),
                  ),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      widget.countAnimalVaccineController.text = '0';
                      widget.countAnimalVaccineController.selection =
                          TextSelection.fromPosition(
                              const TextPosition(offset: 1));
                      widget.onCountChanged?.call(0);
                      return;
                    }
                    final currentValue = int.tryParse(value) ?? 0;
                    _validateAndUpdateCount(currentValue);
                  },
                  onTap: () {
                    if (widget.countAnimalVaccineController.text == '0') {
                      widget.countAnimalVaccineController.clear();
                    }
                  },
                ),
              ),
              QuantityButtonWidget(
                icon: Icons.add,
                onPressed: () {
                  final currentValue = int.tryParse(
                        widget.countAnimalVaccineController.text,
                      ) ??
                      0;
                  final newValue = currentValue + 1;
                  _validateAndUpdateCount(newValue);
                },
                isAdd: true,
                isDisable: !isEditable ||
                    int.tryParse(widget.countAnimalVaccineController.text)! >=
                        expectedInjectedAnimal,
              ),
            ],
          ),
        ),
        if (isEditable && widget.growthStage != null)
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 14,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Cả đàn có: $expectedInjectedAnimal con',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                  ),
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
                  'Nhập số lượng gia cầm đã tiêm vắc xin',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildTotalPriceSection(BuildContext context) {
    String formatCurrency(int amount) {
      final formatter = NumberFormat('#,###', 'vi_VN');
      return '${formatter.format(amount)} đ';
    }

    final formattedTotalPrice = formatCurrency(widget.totalPrice ?? 0);
    final countText = widget.countAnimalVaccineController.text.isEmpty
        ? '0'
        : widget.countAnimalVaccineController.text;
    final formatter = NumberFormat('#,###', 'vi_VN');
    final formattedPrice =
        '${formatter.format(widget.vaccine?.price ?? 0)} đ/liều';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.monetization_on,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Chi phí vắc xin',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Giá:',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  Text(
                    formattedPrice,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Số lượng:',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  Text(
                    '$countText con',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Divider(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tổng chi phí:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    formattedTotalPrice,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
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
      mainAxisSize: MainAxisSize.min, // Đảm bảo Row co giãn theo nội dung
      children: [
        if (icon != null)
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
        const SizedBox(width: 8),
        Flexible(
          fit: FlexFit
              .loose, // Cho phép widget con chiếm không gian vừa đủ nội dung
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (warningLevel != 0) ...[
                    const SizedBox(width: 4),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: warningLevel == 1
                            ? Colors.orange
                            : warningLevel == 2
                                ? Colors.red
                                : Colors.yellow,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
