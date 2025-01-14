import 'dart:developer';

import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/view/symptom/cage_option.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';

class TaskQRCodeWidget extends StatefulWidget {
  const TaskQRCodeWidget({super.key, required this.cage});
  final CageOption cage;

  @override
  State<TaskQRCodeWidget> createState() => _TaskQRCodeWidgetState();
}

class _TaskQRCodeWidgetState extends State<TaskQRCodeWidget> {
  List<TaskHaveCageName>? _tasks;
  List<TaskHaveCageName>? _filteredTasks;
  // final TextEditingController _searchController = TextEditingController();
  final Set<String> _selectedTaskIds = {};

  @override
  void initState() {
    super.initState();
    context
        .read<TaskBloc>()
        .add(TaskEvent.getTasksByScanQRCode(widget.cage.id));
  }

  void _saveSelectedTasks() {
    if (_selectedTaskIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Chưa có công việc nào được chọn'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // Update all selected tasks
    context.read<TaskBloc>().add(
          TaskEvent.updateMultipleTask(
            _selectedTaskIds.toList(),
            StatusDataConstant.done,
          ),
        );

    // Clear selection after saving
    setState(() {
      _selectedTaskIds.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
            state.maybeWhen(
              getTasksByScanQRCodeLoading: () {
                log("Đang tải thông tin công việc...");
              },
              getTasksByScanQRCodeSuccess: (tasks) {
                setState(() {
                  _tasks = tasks;
                  _filteredTasks = tasks;
                });
              },
              getTasksByScanQRCodeFailure: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Không thể tải danh sách công việc')),
                );
              },
              updateMultipleTaskSuccess: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Đã cập nhật trạng thái công việc'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                // Refresh task list
                context
                    .read<TaskBloc>()
                    .add(TaskEvent.getTasksByScanQRCode(widget.cage.id));
              },
              updateMultipleTaskFailure: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Không thể cập nhật trạng thái công việc'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: LinearIcons.arrowBackIcon,
          ),
          title: Text(widget.cage.name),
          actions: [
            // Add save button if there are selected tasks
            if (_selectedTaskIds.isNotEmpty)
              TextButton.icon(
                onPressed: _saveSelectedTasks,
                icon: const Icon(Icons.save),
                label: Text('Lưu (${_selectedTaskIds.length})'),
              ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 16, top: 24, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Danh sách công việc',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${_tasks?.length} công việc')
                  ],
                )),
            // Tasks List
            Expanded(
              child: _filteredTasks == null
                  ? const Center(child: CircularProgressIndicator())
                  : _filteredTasks!.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.task_outlined,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Không có công việc nào',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: _filteredTasks!.length,
                          padding: const EdgeInsets.all(16),
                          itemBuilder: (context, index) {
                            final task = _filteredTasks![index];
                            return TaskCard(
                              task: task,
                              onStatusChanged: (newStatus) {
                                // Handle status change
                                context.read<TaskBloc>().add(
                                      TaskEvent.updateTask(
                                        task.id,
                                        newStatus,
                                      ),
                                    );
                              },
                              isSelected: _selectedTaskIds.contains(task.id),
                              onSelected: (bool? value) {
                                if (value == true) {
                                  setState(() {
                                    _selectedTaskIds.add(task.id);
                                  });
                                } else {
                                  setState(() {
                                    _selectedTaskIds.remove(task.id);
                                  });
                                }
                              },
                            );
                          },
                        ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.push(RouteName.createSymptom, extra: {
              'cageName': widget.cage.name,
            });
          },
          icon: const Icon(Icons.add_alert),
          label: const Text('Báo bệnh'),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final TaskHaveCageName task;
  final Function(String) onStatusChanged;
  final bool isSelected;
  final Function(bool?) onSelected;

  const TaskCard({
    super.key,
    required this.task,
    required this.onStatusChanged,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = task.status == StatusDataConstant.done;

    return Card.outlined(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          context.push(RouteName.taskDetail, extra: task.id);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (!isCompleted) // Only show checkbox for incomplete tasks
                    Row(
                      children: [
                        Checkbox(
                          value: isSelected,
                          onChanged: onSelected,
                          activeColor: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  Expanded(
                    child: Text(
                      task.taskName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color:
                            isCompleted ? Theme.of(context).primaryColor : null,
                        // decoration:
                        //     isCompleted ? TextDecoration.lineThrough : null,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                task.description,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    DateFormat('HH:mm, dd/MM/yyyy')
                        .format(DateTime.parse(task.dueDate)),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  // Checkbox for selection
                  _buildStatusChip(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context) {
    Color color;
    String label;

    switch (task.status) {
      case StatusDataConstant.done:
        color = Colors.green;
        label = StatusDataConstant.doneVn;
        break;
      case StatusDataConstant.inProgress:
        color = Colors.orange;
        label = StatusDataConstant.inProgressVn;
        break;
      case StatusDataConstant.pending:
        color = Colors.blue;
        label = StatusDataConstant.pendingVn;
        break;
      case StatusDataConstant.overdue:
        color = Colors.red;
        label = StatusDataConstant.overdueVn;
        break;
      default:
        color = Colors.grey;
        label = 'Không xác định';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
