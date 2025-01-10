import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:flutter/material.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/view/widgets/task_card.dart';

class TaskListWidget extends StatelessWidget {
  final List<TaskHaveCageName>
      tasks; // Thay TaskByUserResponse thành List<TaskHaveCageName>

  const TaskListWidget({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: tasks.map((task) {
          return TaskCard(
            task: task, // Chuyển sang sử dụng TaskHaveCageName
            taskId: task.id,
            cageName: task.cageName,
            isCompleted: task.status == StatusDataConstant.done,
            isInProgress: task.status == StatusDataConstant.inProgress,
            isOverdue: task.status == StatusDataConstant.overdue,
            isFirst: false, // Giữ nguyên theo yêu cầu
            borderColor: task.status == StatusDataConstant.inProgress ||
                    task.status == StatusDataConstant.done
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondaryContainer,
          );
        }).toList(),
      ),
    );
  }
}
