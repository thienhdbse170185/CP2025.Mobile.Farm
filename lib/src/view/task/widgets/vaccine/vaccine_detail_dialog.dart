import 'package:data_layer/data_layer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VaccineDetailDialog extends StatelessWidget {
  final String? vaccineName;
  final DateTime? scheduleDate;
  final int? scheduleSession;
  final int? applicationAge;
  final VaccineDto vaccineDetail;

  const VaccineDetailDialog({
    super.key,
    this.vaccineName,
    this.scheduleDate,
    this.scheduleSession,
    this.applicationAge,
    required this.vaccineDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildVaccineInfo(context),
            const SizedBox(height: 24),
            _buildApplicationInfo(context),
            const SizedBox(height: 24),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.medication_liquid,
            color: Theme.of(context).colorScheme.primary,
            size: 28,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vaccineName ?? vaccineDetail.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                'Chi tiết vắc-xin',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }

  Widget _buildVaccineInfo(BuildContext context) {
    final formatter = NumberFormat('#,###', 'vi_VN');
    final formattedPrice = '${formatter.format(vaccineDetail.price)} đ/liều';

    return Container(
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
          _buildInfoRow(
            context,
            icon: Icons.info_outline,
            label: 'Mã vắc-xin',
            value: vaccineDetail.name,
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            context,
            icon: Icons.medical_services_outlined,
            label: 'Phương pháp tiêm',
            value: vaccineDetail.method,
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            context,
            icon: Icons.local_offer,
            label: 'Giá tiền đơn vị',
            value: formattedPrice,
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            context,
            icon: Icons.pets,
            label: 'Độ tuổi khuyến nghị',
            value: vaccineDetail.ageStart == vaccineDetail.ageEnd
                ? '${vaccineDetail.ageStart} ngày tuổi'
                : 'Từ ${vaccineDetail.ageStart} đến ${vaccineDetail.ageEnd} ngày tuổi',
          ),
        ],
      ),
    );
  }

  Widget _buildApplicationInfo(BuildContext context) {
    final dateFormatted = scheduleDate != null
        ? DateFormat('dd/MM/yyyy').format(scheduleDate!)
        : 'Chưa xác định';

    String sessionText = 'Chưa xác định';
    if (scheduleSession != null) {
      sessionText = scheduleSession == 1
          ? 'Sáng'
          : scheduleSession == 2
              ? 'Trưa'
              : scheduleSession == 3
                  ? 'Chiều'
                  : 'Tối';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.schedule,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Thông tin lịch tiêm',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
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
              _buildInfoRow(
                context,
                icon: Icons.calendar_month,
                label: 'Ngày tiêm theo lịch',
                value: dateFormatted,
              ),
              const SizedBox(height: 12),
              _buildInfoRow(
                context,
                icon: Icons.wb_sunny,
                label: 'Buổi tiêm',
                value: sessionText,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Đóng'),
        ),
      ],
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    bool isWarning = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 18,
          color: isWarning
              ? Colors.orange[700]
              : Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isWarning ? FontWeight.bold : FontWeight.w500,
                  color: isWarning ? Colors.orange[800] : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
