import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/router.dart';

class TaskCardMap extends StatelessWidget {
  final Map<String, dynamic> task;
  final bool isCompleted;
  final bool isInProgress;

  const TaskCardMap({
    super.key,
    required this.task,
    required this.isCompleted,
    required this.isInProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isCompleted ? 0.5 : 1.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: GestureDetector(
          onTap: () {
            if (!isCompleted) {
              context.push(RouteName.taskDetail);
            }
          },
          child: Card.outlined(
            child: ListTile(
              leading: Icon(
                isCompleted
                    ? Icons.task_alt_outlined
                    : (isInProgress
                        ? Icons.timelapse_outlined
                        : Icons.pending_outlined),
              ),
              title: Text(
                task['title'],
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      decoration:
                          isCompleted ? TextDecoration.lineThrough : null,
                    ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trạng thái: ${task['status']}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const Text('Người làm: '),
                      const SizedBox(width: 2),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.asset('assets/images/avatar.png'),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Bảo Thiên',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
