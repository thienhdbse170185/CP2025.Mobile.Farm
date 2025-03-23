import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/constants/task_type_data_constant.dart';
import 'package:smart_farm/src/core/router.dart';

class TaskListWidget extends StatelessWidget {
  final List<TaskHaveCageName> tasks;
  final bool highlightWarning; // New parameter to enable warning highlight

  const TaskListWidget({
    super.key,
    required this.tasks,
    this.highlightWarning = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tasks.map((task) {
        final bool hasWarning = task.isWarning == true;

        // Generate appropriate status colors and icons
        Color statusColor;
        IconData statusIcon;

        switch (task.status) {
          case StatusDataConstant.pending:
            statusColor = Colors.blue;
            statusIcon = Icons.pending_actions;
            break;
          case StatusDataConstant.inProgress:
            statusColor = Colors.orange;
            statusIcon = Icons.sync;
            break;
          case StatusDataConstant.done:
            statusColor = Colors.green;
            statusIcon = Icons.check_circle;
            break;
          case StatusDataConstant.overdue:
            statusColor = Colors.red;
            statusIcon = Icons.schedule;
            break;
          default:
            statusColor = Colors.grey;
            statusIcon = Icons.help_outline;
        }

        // Task type icon
        IconData typeIcon;
        switch (task.taskType.taskTypeId) {
          case TaskTypeDataConstant.feeding:
            typeIcon = Icons.restaurant;
            break;
          case TaskTypeDataConstant.health:
            typeIcon = Icons.medical_services;
            break;
          case TaskTypeDataConstant.vaccin:
            typeIcon = Icons.vaccines;
            break;
          default:
            typeIcon = Icons.work_outline;
        }

        // Format due date
        final dueDate = DateTime.parse(task.dueDate);
        final formattedTime = DateFormat.Hm().format(dueDate);

        return GestureDetector(
          onTap: () {
            context.push(
              RouteName.taskDetail,
              extra: task.id,
            );
          },
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            elevation: hasWarning && highlightWarning ? 4 : 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: hasWarning && highlightWarning
                  ? BorderSide(color: Colors.amber, width: 2)
                  : BorderSide.none,
            ),
            child: Container(
              decoration: hasWarning && highlightWarning
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.amber.withOpacity(0.1),
                          Colors.white,
                        ],
                      ),
                    )
                  : null,
              child: Stack(
                children: [
                  // Warning indicator (diagonal strip)
                  if (hasWarning && highlightWarning)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Transform.rotate(
                            angle: 0.785398, // 45 degrees in radians
                            child: Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),

                  // Main content
                  Padding(
                    padding: EdgeInsets.all(
                        hasWarning && highlightWarning ? 16.0 : 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Task Type Icon
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer
                                    .withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(typeIcon, size: 16),
                            ),
                            SizedBox(width: 12),

                            // Task Title and Cage
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          task.taskName,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                hasWarning && highlightWarning
                                                    ? Colors.amber[800]
                                                    : null,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      if (hasWarning && highlightWarning)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Icon(
                                            Icons.warning_amber_rounded,
                                            color: Colors.amber[800],
                                            size: 16,
                                          ),
                                        ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.home_work_outlined,
                                          size: 12, color: Colors.grey),
                                      SizedBox(width: 4),
                                      Text(
                                        task.cageName,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Status Indicator
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: statusColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: statusColor.withOpacity(0.5),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(statusIcon,
                                      size: 12, color: statusColor),
                                  SizedBox(width: 4),
                                  Text(
                                    _getStatusText(task.status),
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: statusColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // Warning message if task has an issue
                        if (hasWarning && highlightWarning)
                          Container(
                            margin: EdgeInsets.only(top: 12),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.amber.withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.amber[800],
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Công việc này có vấn đề cần chú ý',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.amber[800],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Due time and description
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.access_time,
                                size: 12, color: Colors.grey),
                            SizedBox(width: 4),
                            Text(
                              'Thời gian: $formattedTime',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(width: 16),
                            Icon(Icons.description_outlined,
                                size: 12, color: Colors.grey),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                task.description ?? 'Không có mô tả',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[700],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // Helper method to get status text in Vietnamese
  String _getStatusText(String status) {
    switch (status) {
      case StatusDataConstant.pending:
        return StatusDataConstant.pendingVn;
      case StatusDataConstant.inProgress:
        return StatusDataConstant.inProgressVn;
      case StatusDataConstant.done:
        return StatusDataConstant.doneVn;
      case StatusDataConstant.overdue:
        return StatusDataConstant.overdueVn;
      default:
        return 'Không xác định';
    }
  }
}
