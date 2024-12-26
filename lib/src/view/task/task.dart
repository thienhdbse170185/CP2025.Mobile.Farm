import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/model/task/cage_filter.dart';
import 'package:smart_farm/src/model/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:smart_farm/src/view/widgets/task_card.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart'; // Import the TaskCard widget

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  DateTime selectedDate = DateTime.now(); // Store the selected date
  String selectedFilter = 'Tất cả'; // Default filter
  List<CageFilter> availableCageFilters = []; // List of available cage filters

  Map<String, List<TaskHaveCageName>> taskSorted = {}; // Updated to Map

  // Function to format the selected date to a string (e.g., "Nov 19, 2024")
  String get formattedDate {
    return DateFormat('MMM dd, yyyy').format(selectedDate);
  }

  // Function to get the day of the week for the selected date in Vietnamese
  String get dayOfWeek {
    return DateFormat('EEEE', 'vi_VN')
        .format(selectedDate); // Full day name in Vietnamese (e.g., "Thứ Hai")
  }

  // Function to check if the selected date is today
  bool get isToday {
    final DateTime now = DateTime.now();
    return selectedDate.year == now.year &&
        selectedDate.month == now.month &&
        selectedDate.day == now.day;
  }

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2020),
          lastDate: DateTime(2025),
        )) ??
        selectedDate;

    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      // Call the API to fetch tasks for the selected date
      context
          .read<TaskBloc>()
          .add(TaskEvent.getTasksByUserIdAndDate(picked, null));
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch tasks for the selected date when the widget is initialized
    context
        .read<TaskBloc>()
        .add(TaskEvent.getTasksByUserIdAndDate(DateTime.now(), null));
  }

  @override
  Widget build(BuildContext context) {
    final availableLocations = taskSorted.values
        .expand(
            (tasks) => tasks.map((task) => task.cageName)) // Extract cageName
        .toSet();
    if (availableLocations.isNotEmpty) {
      availableLocations.add('Tất cả'); // Ensure 'Tất cả' is always available
    }

    return BlocListener<TaskBloc, TaskState>(
      listener: (context, state) {
        state.maybeWhen(
          getTasksByUserIdAndDateLoading: () {
            log("Đang lấy danh sách công việc...");
            LoadingDialog.show(context, "Đang lấy danh sách công việc...");
          },
          getTasksByUserIdAndDateSuccess: (tasks, cageList) {
            // Update the tasksByDate list with the new tasks
            setState(() {
              taskSorted = tasks;
              availableCageFilters = cageList;
            });

            LoadingDialog.hide(context);
          },
          getTasksByUserIdAndDateFailure: (e) {
            log("Lấy danh sách công việc thất bại! Message:");
            log(e.toString());
            LoadingDialog.hide(context);
            SnackBar(content: Text('Lỗi: ${e.toString()}'));
          },
          filteredTaskLoading: () {
            log("Đang lọc công việc...");
            LoadingDialog.show(context, "Đang lọc công việc...");
          },
          filteredTasksSuccess: (filteredTasks) {
            log("Lọc công việc thành công!");
            setState(() {
              taskSorted = filteredTasks;
            });

            LoadingDialog.hide(context);
          },
          filteredTasksFailure: (e) {
            log("Lọc công việc thất bại! Message:");
            log(e.toString());
            LoadingDialog.hide(context);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh: () async {
            context
                .read<TaskBloc>()
                .add(TaskEvent.getTasksByUserIdAndDate(selectedDate, null));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.6),
                  image: DecorationImage(
                    image: AssetImage('assets/images/leaf.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.1),
                      BlendMode.dstATop,
                    ),
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // [APPBAR] Time
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isToday ? 'Hôm nay' : dayOfWeek,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: 22),
                          ),
                          InkWell(
                            onTap: () => _selectDate(context),
                            child: Chip(
                              shape: const StadiumBorder(
                                  side: BorderSide(
                                      width: 0, color: Colors.transparent)),
                              label: Text(
                                formattedDate,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              avatar: LinearIcons.calendarIcon,
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    // [APPBAR] Location Filter
                    if (availableCageFilters.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.only(left: 8.0),
                        height: 50,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final isSelected = selectedFilter ==
                                availableCageFilters[index].cageName;
                            return GestureDetector(
                              onTap: () {
                                context.read<TaskBloc>().add(
                                    TaskEvent.filterTasksByLocation(
                                        cageId:
                                            availableCageFilters[index].cageId,
                                        date: selectedDate,
                                        cageName: availableCageFilters[index]
                                            .cageName));
                                setState(() {
                                  selectedFilter =
                                      availableCageFilters[index].cageName;
                                });
                              },
                              child: Card.outlined(
                                shape: StadiumBorder(
                                  side: BorderSide(
                                    color: isSelected
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .outlineVariant,
                                  ),
                                ),
                                color: isSelected
                                    ? Colors.white
                                    : Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      availableCageFilters[index].cageType ==
                                              'all'
                                          ? LinearIcons.farmHouseIcon
                                          : LinearIcons.chickenIcon,
                                      const SizedBox(width: 8),
                                      Text(
                                        availableCageFilters[index].cageName,
                                        style: TextStyle(
                                            color: isSelected
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .onSurfaceVariant,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: availableCageFilters.length,
                        ),
                      ),
                  ],
                ),
              ),
              // [BODY]
              Expanded(
                child: taskSorted.isNotEmpty
                    ? ListView(
                        children: [
                          ..._buildSessionSections(taskSorted),
                        ],
                      )
                    : Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer
                                    .withOpacity(0.4),
                              ),
                              width: 120,
                              height: 120,
                              child: Icon(
                                Icons.task_alt_outlined,
                                size: 64,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.4),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Không có công việc nào\n trong ngày này',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outlineVariant,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSessionSections(
      Map<String, List<TaskHaveCageName>> tasks) {
    return tasks.entries.map((entry) {
      final session = entry.key;
      final sessionTasks = entry.value;

      // Tính tổng số lượng tasks trong session
      int totalTasks = sessionTasks.length;

      String sessionTitle, image = 'assets/images/default.png';
      switch (session) {
        case 'Morning':
          sessionTitle = 'Buổi sáng';
          image = 'assets/images/morning.png';
          break;
        case 'Afternoon':
          sessionTitle = 'Buổi trưa';
          image = 'assets/images/afternoon.png';
          break;
        case 'Evening':
          sessionTitle = 'Buổi chiều';
          image = 'assets/images/moon.png';
          break;
        default:
          sessionTitle = 'Khác';
      }

      return Container(
        color: Colors.white,
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Image.asset(image, width: 32, height: 32),
                  const SizedBox(width: 8),
                  Text(
                    sessionTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    '$totalTasks công việc',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ...sessionTasks.map((task) => TaskList(tasks: [task])),
          ],
        ),
      );
    }).toList();
  }
}

class TaskList extends StatelessWidget {
  final List<TaskHaveCageName>
      tasks; // Thay TaskByUserResponse thành List<TaskHaveCageName>

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: tasks.map((task) {
          return TaskCard(
            task: task, // Chuyển sang sử dụng TaskHaveCageName
            taskId: task.id,
            cageName: task.cageName,
            isCompleted: task.status == 'Done',
            isInProgress: task.status == 'InProgress',
            isFirst: false, // Giữ nguyên theo yêu cầu
            borderColor: task.status == 'InProgress'
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondaryContainer,
            highlightName: task.assignedToUser.fullName == 'Staff Farm 1',
          );
        }).toList(),
      ),
    );
  }
}
