import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';

class TaskHistoryWidget extends StatefulWidget {
  const TaskHistoryWidget({super.key});

  @override
  State<TaskHistoryWidget> createState() => _TaskHistoryWidgetState();
}

class _TaskHistoryWidgetState extends State<TaskHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: LinearIcons.arrowBackIcon),
        title: const Text('Lịch sử công việc'),
      ),
      body: const Column(
        children: [
          Text('Task history screen'),
        ],
      ),
    );
  }
}
