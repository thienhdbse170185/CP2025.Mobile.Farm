import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/model/task/task_have_cage_name/task_have_cage_name.dart';

class TaskCard extends StatelessWidget {
  final String? taskId;
  final TaskHaveCageName task;
  final bool isCompleted;
  final bool isInProgress;
  final bool isFirst;
  final Color borderColor;
  final bool highlightName;
  final String? cageName;

  const TaskCard(
      {super.key,
      required this.task,
      required this.isCompleted,
      required this.isInProgress,
      this.isFirst = false,
      this.taskId,
      required this.borderColor,
      required this.highlightName,
      this.cageName});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isCompleted ? 0.5 : 1.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: GestureDetector(
          onTap: () {
            if (!isCompleted) {
              context.push(RouteName.taskDetail, extra: taskId);
            }
          },
          child: Card.outlined(
            child: ListTile(
              leading: isCompleted
                  ? LinearIcons.doneTaskIcon
                  : (isInProgress
                      ? LinearIcons.inprogressTaskIcon
                      : LinearIcons.pendingTaskIcon),
              title: Text(
                task.taskName,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      decoration:
                          isCompleted ? TextDecoration.lineThrough : null,
                    ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trạng thái: ${task.status}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
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
