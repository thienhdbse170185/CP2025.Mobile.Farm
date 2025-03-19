import 'dart:developer';

import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/router.dart';

class TaskCard extends StatelessWidget {
  final String? taskId;
  final TaskHaveCageName task;
  final bool isCompleted;
  final bool isInProgress;
  final bool isFirst;
  final Color borderColor;
  final String? cageName;
  final bool isOverdue;

  const TaskCard({
    super.key,
    required this.task,
    required this.isCompleted,
    required this.isInProgress,
    this.isFirst = false,
    this.taskId,
    required this.borderColor,
    this.cageName,
    required this.isOverdue,
  });

  @override
  Widget build(BuildContext context) {
    String getStatusText(String status) {
      switch (status) {
        case StatusDataConstant.pending:
          return StatusDataConstant.pendingVn;
        case StatusDataConstant.inProgress:
          return StatusDataConstant.inProgressVn;
        case StatusDataConstant.done:
          return StatusDataConstant.doneVn;
        case StatusDataConstant.overdue:
          return StatusDataConstant.overdueVn;
        case StatusDataConstant.cancelled:
          return StatusDataConstant.cancelledVn;
        default:
          return status;
      }
    }

    final bool isCancelled = task.status == StatusDataConstant.cancelled;

    return Opacity(
      opacity: isCompleted || isOverdue || isCancelled ? 0.5 : 1.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: GestureDetector(
          onTap: () {
            log('$taskId');
            context.push(RouteName.taskDetail, extra: taskId);
          },
          child: Card.outlined(
            color: isCompleted
                ? Theme.of(context).colorScheme.primaryContainer
                : isOverdue
                    ? Colors.red.withOpacity(0.1)
                    : isCancelled
                        ? Colors.grey.withOpacity(0.1)
                        : null,
            child: ListTile(
              leading: isCompleted
                  ? LinearIcons.doneTaskIcon
                  : (isInProgress
                      ? LinearIcons.inprogressTaskIcon
                      : (isOverdue
                          ? LinearIcons.deadlineIcon
                          : (isCancelled
                              ? Icon(Icons.cancel_outlined, color: Colors.grey)
                              : LinearIcons.pendingTaskIcon))),
              title: Text(
                task.taskName,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: isOverdue
                          ? Colors.red
                          : isCompleted
                              ? Colors.green
                              : isCancelled
                                  ? Colors.grey
                                  : null,
                    ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Trạng thái: ',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        getStatusText(task.status),
                        style: TextStyle(
                          color: task.status == StatusDataConstant.pending
                              ? Colors.grey
                              : task.status == StatusDataConstant.inProgress
                                  ? Colors.amber
                                  : task.status == StatusDataConstant.done
                                      ? Colors.green
                                      : task.status ==
                                              StatusDataConstant.overdue
                                          ? Colors.red
                                          : task.status ==
                                                  StatusDataConstant.cancelled
                                              ? Colors.grey
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                  if (cageName != null)
                    Row(
                      children: [
                        const Text('Chuồng: '),
                        const SizedBox(width: 2),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.41,
                          child: Text(
                            task.cageName,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        )
                      ],
                    ),
                ],
              ),
              trailing: Icon(
                Icons.chevron_right_outlined,
                color: Theme.of(context).colorScheme.onSurface,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
