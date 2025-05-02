import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/model/dto/medication/medication.dart';
import 'package:smart_farm/src/model/dto/prescription/prescription.dart';
import 'package:smart_farm/src/model/dto/task/task_have_cage_name/task_have_cage_name.dart';

class HealthLogWidget extends StatefulWidget {
  final String? userName;
  final PrescriptionDto? prescription;
  final int session;
  final bool isConfirmed;
  final Function(bool)? onConfirmationChanged;
  final TaskHaveCageName task;
  final TextEditingController? noteController;
  final DateTime? logTime;

  const HealthLogWidget({
    super.key,
    required this.userName,
    required this.prescription,
    required this.session,
    required this.isConfirmed,
    required this.onConfirmationChanged,
    required this.task,
    this.noteController,
    this.logTime,
  });

  @override
  State<HealthLogWidget> createState() => _HealthLogWidgetState();
}

class _HealthLogWidgetState extends State<HealthLogWidget> {
  String _getSessionName() {
    switch (widget.session) {
      case 1:
        return 'Buổi sáng';
      case 2:
        return 'Buổi trưa';
      case 3:
        return 'Buổi chiều';
      case 4:
        return 'Buổi tối';
      default:
        return 'Không xác định';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isEditable =
        widget.task.status == StatusDataConstant.inProgress ||
            widget.task.status == StatusDataConstant.overdue;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss the keyboard
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          _buildReporterInfo(context),
          const SizedBox(height: 20),
          if (widget.prescription != null) ...[
            _buildPrescriptionInfo(context),
            const SizedBox(height: 20),
            _buildMedicationsList(context),
            const SizedBox(height: 16),
            if (isEditable) _buildConfirmationCheckbox(context),
          ] else ...[
            _buildNoPrescriptionMessage(context),
          ]
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.medical_services_rounded,
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
              'Đơn báo cáo cho uống thuốc',
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
          const SizedBox(height: 16),
          if (widget.logTime != null) ...[
            Row(
              children: [
                _buildInfoItem(
                  context: context,
                  label: 'Thời gian báo cáo',
                  value: widget.logTime != null
                      ? '${widget.logTime?.day}/${widget.logTime?.month}/${widget.logTime?.year}'
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

  Widget _buildPrescriptionInfo(BuildContext context) {
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
                'Thông tin đơn thuốc',
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
                  label: 'Ngày bắt đầu',
                  value: DateFormat('dd/MM/yyyy')
                      .format(widget.prescription!.prescribedDate),
                  icon: Icons.calendar_month,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              ...[
                _buildInfoItem(
                  context: context,
                  label: 'Số ngày uống',
                  value: '${widget.prescription!.daysToTake} ngày',
                  icon: Icons.schedule,
                ),
              ]
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildInfoItem(
                context: context,
                label: 'Số lượng cho uống',
                value: '${widget.prescription!.quantityAnimal} con',
                icon: Icons.pets,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.09),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.note_alt,
                        color: Theme.of(context).colorScheme.secondary),
                    const SizedBox(width: 8),
                    Text(
                      'Lưu ý từ bác sĩ thú y',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  widget.prescription?.notes ?? 'Không có ghi chú',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicationsList(BuildContext context) {
    final relevantMedications = widget.prescription?.medications?.where((med) {
      int dose = _getDoseForSession(med);
      return dose > 0;
    }).toList();

    if (relevantMedications == null || relevantMedications.isEmpty) {
      return Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Không có thuốc cần uống vào ${_getSessionName().toLowerCase()}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      );
    }

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
                  Icons.medication_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Danh sách thuốc',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const Divider(height: 24),
            ...relevantMedications.map((medication) => _buildMedicationItem(
                  context,
                  medication,
                )),
          ],
        ),
      ),
    );
  }

  int _getDoseForSession(MedicationDto medication) {
    switch (widget.session) {
      case 1:
        return medication.morning;
      case 2:
        return medication.noon;
      case 3:
        return medication.afternoon;
      case 4:
        return medication.evening;
      default:
        return 0;
    }
  }

  Widget _buildMedicationItem(
    BuildContext context,
    MedicationDto medication,
  ) {
    final int dose = _getDoseForSession(medication);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.medication_outlined,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medication.medicationName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.vaccines,
                            size: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '$dose liều / 1 con',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmationCheckbox(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.isConfirmed
            ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2)
            : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: widget.isConfirmed
              ? Theme.of(context).colorScheme.primary
              : Colors.grey[300]!,
          width: widget.isConfirmed ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              value: widget.isConfirmed,
              activeColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onChanged: (bool? value) {
                if (widget.onConfirmationChanged != null) {
                  widget.onConfirmationChanged!(value ?? false);
                }
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Xác nhận đã cho uống thuốc',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tôi xác nhận đã cho tất cả vật nuôi uống thuốc theo đơn thuốc của bác sĩ thú y',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoPrescriptionMessage(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(
              Icons.medication_liquid_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Không có thông tin đơn thuốc',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Hiện tại không có đơn thuốc nào được chỉ định. Vui lòng liên hệ admin để được hỗ trợ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
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
