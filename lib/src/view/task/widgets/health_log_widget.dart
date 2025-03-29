import 'package:data_layer/model/dto/medication/medication.dart';
import 'package:data_layer/model/dto/prescription/prescription.dart';
import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/utils/date_util.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';

class HealthLogWidget extends StatefulWidget {
  final String? userName;
  final PrescriptionDto? prescription;
  final int session;
  final Map<String, bool> medicationChecked;
  final Function(String, bool)? onMedicationCheckedChanged;
  final TaskHaveCageName task;
  final TextEditingController? noteController;

  const HealthLogWidget({
    super.key,
    required this.userName,
    required this.prescription,
    required this.session,
    required this.medicationChecked,
    required this.onMedicationCheckedChanged,
    required this.task,
    this.noteController,
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
    final bool isEditable = widget.task.status == StatusDataConstant.inProgress;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        const SizedBox(height: 8),
        _buildReporterInfo(context),
        const SizedBox(height: 20),
        if (widget.prescription != null) ...[
          _buildPrescriptionInfo(context),
          const SizedBox(height: 20),
          _buildMedicationsList(context, isEditable),
        ] else ...[
          _buildNoPrescriptionMessage(context),
        ]
      ],
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
      child: Row(
        children: [
          Expanded(
            child: _buildInfoItem(
              context: context,
              label: 'Tên người báo cáo',
              value: widget.userName ?? 'Đang tải...',
              icon: Icons.person,
            ),
          ),
          Expanded(
            child: _buildInfoItem(
              context: context,
              label: 'Thời điểm cho uống thuốc',
              value: _getSessionName(),
              icon: Icons.access_time,
            ),
          ),
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
                  value: CustomDateUtils.formatDate(
                      widget.prescription!.prescribedDate),
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
                label: 'Số lượng động vật',
                value: '${widget.prescription!.quantityAnimal} con',
                icon: Icons.pets,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.15),
              _buildInfoItem(
                context: context,
                label: 'Mã đơn thuốc',
                value: widget.prescription!.id,
                icon: Icons.qr_code,
              ),
            ],
          ),
          // if (widget.prescription!.noteFromVet != null &&
          //     widget.prescription!.noteFromVet!.isNotEmpty) ...[
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
                  // widget.prescription!.noteFromVet!,
                  'Lưu ý từ bác sĩ thú y',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ],
        // ],
      ),
    );
  }

  Widget _buildMedicationsList(BuildContext context, bool isEditable) {
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
                  'Danh sách thuốc cần uống',
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
                  isEditable,
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
    bool isEditable,
  ) {
    final int dose = _getDoseForSession(medication);
    final bool isChecked =
        widget.medicationChecked[medication.medicationId] ?? false;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isChecked
            ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3)
            : Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isChecked
              ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
              : Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isEditable)
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                value: isChecked,
                activeColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                onChanged: (bool? value) {
                  if (widget.onMedicationCheckedChanged != null) {
                    widget.onMedicationCheckedChanged!(
                        medication.medicationId, value ?? false);
                  }
                },
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Icon(
                isChecked ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isChecked
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                size: 24,
              ),
            ),
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
                            '$dose liều',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "${TimeUtils.getCurrentSession() == 1 ? medication.morning : TimeUtils.getCurrentSession() == 2 ? medication.noon : TimeUtils.getCurrentSession() == 3 ? medication.afternoon : medication.evening} liều",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                // if (medication. != null &&
                //     medication.description!.isNotEmpty) ...[
                //   const SizedBox(height: 8),
                //   Text(
                //     medication.description!,
                //     style: TextStyle(
                //       fontSize: 13,
                //       color: Theme.of(context).colorScheme.outline,
                //       fontStyle: FontStyle.italic,
                //     ),
                //   ),
                // ],
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
              'Hiện tại không có đơn thuốc nào được chỉ định',
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

  String _formatDate(String? dateString) {
    if (dateString == null) return 'Không xác định';
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('dd/MM/yyyy').format(date);
    } catch (e) {
      return 'Không xác định';
    }
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
