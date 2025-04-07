import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';

class StatusLogsBanner extends StatelessWidget {
  final List<StatusLogDto> statusLogs;

  const StatusLogsBanner({
    Key? key,
    required this.statusLogs,
  }) : super(key: key);

  String getStatusText(String status) {
    switch (status) {
      case StatusDataConstant.inProgress:
        return StatusDataConstant.inProgressVn;
      case StatusDataConstant.done:
        return StatusDataConstant.doneVn;
      case StatusDataConstant.pending:
        return StatusDataConstant.pendingVn;
      case StatusDataConstant.overdue:
        return StatusDataConstant.overdueVn;
      case StatusDataConstant.cancelled:
        return StatusDataConstant.cancelledVn;
      default:
        return status;
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case StatusDataConstant.inProgress:
        return Colors.yellow.shade200;
      case StatusDataConstant.done:
        return Colors.green.shade200;
      case StatusDataConstant.pending:
        return Colors.grey.shade300;
      case StatusDataConstant.overdue:
        return Colors.red.shade200;
      case StatusDataConstant.cancelled:
        return Colors.grey.shade400;
      default:
        return Colors.grey.shade300;
    }
  }

  String formatDateTime(String dateTimeStr) {
    try {
      final DateTime dateTime = DateTime.parse(dateTimeStr);
      final DateFormat dateFormatter = DateFormat('dd/MM/yyyy');
      final DateFormat timeFormatter = DateFormat('HH:mm');
      return '${timeFormatter.format(dateTime)} - ${dateFormatter.format(dateTime)}';
    } catch (e) {
      return 'Invalid date';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (statusLogs.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.history,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 8),
              Text(
                'Lịch sử cập nhật trạng thái',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...statusLogs
              .map((log) => _buildStatusLogItem(context, log))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildStatusLogItem(BuildContext context, StatusLogDto log) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 12,
            height: 12,
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: getStatusColor(log.status),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getStatusText(log.status),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  formatDateTime(log.updatedAt),
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Thêm StatusLogDto model nếu chưa có
class StatusLogDto {
  final String status;
  final String updatedAt;

  StatusLogDto({
    required this.status,
    required this.updatedAt,
  });

  factory StatusLogDto.fromJson(Map<String, dynamic> json) {
    return StatusLogDto(
      status: json['status'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }
}
