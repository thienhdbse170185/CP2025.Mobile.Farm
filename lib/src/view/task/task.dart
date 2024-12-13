import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/constants/user_data_constant.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/view/widgets/task_card.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart'; // Import the TaskCard widget
import 'package:data_layer/model/response/task/task_by_user/task_by_user_response.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  DateTime selectedDate = DateTime.now(); // Store the selected date
  String selectedFilter = 'Tất cả chuồng'; // Default filter
  String selectedLocation = 'Tất cả'; // Default location filter

  List<TaskByUserResponse> tasksByDate = []; // Use TaskByUserResponse

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

  // Function to group tasks by session and filter by location
  Map<String, List<TaskByUserResponse>> get groupedTasksBySession {
    final filteredTasks = selectedLocation == 'Tất cả'
        ? tasksByDate
        : tasksByDate
            .where((task) =>
                task.cages.any((cage) => cage.cageName == selectedLocation))
            .toList();

    final grouped = <String, List<TaskByUserResponse>>{};
    for (final task in filteredTasks) {
      final session = task.sessionName;
      grouped.putIfAbsent(session, () => []).add(task);
    }

    // Sort tasks within each session by priorityNum
    grouped.forEach((session, tasks) {
      tasks.sort((a, b) => a.cages.first.tasks.first.priorityNum
          .compareTo(b.cages.first.tasks.first.priorityNum));
    });

    return grouped;
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
      context.read<TaskBloc>().add(TaskEvent.getTasksByUserIdAndDate(
          UserDataConstant.userId, picked, null));
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch tasks for the selected date when the widget is initialized
    context.read<TaskBloc>().add(TaskEvent.getTasksByUserIdAndDate(
        UserDataConstant.userId, DateTime.now(), null));
  }

  @override
  Widget build(BuildContext context) {
    final availableLocations = tasksByDate
        .expand((task) => task.cages.map((cage) => cage.cageName))
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
          getTasksByUserIdAndDateSuccess: (tasks) {
            // Update the tasksByDate list with the new tasks
            setState(() {
              tasksByDate = tasks;
            });
            LoadingDialog.hide(context);
          },
          getTasksByUserIdAndDateFailure: (e) {
            log("Lấy danh sách công việc thất bại! Message:");
            log(e.toString());
            LoadingDialog.hide(context);
          },
          filteredTaskLoading: () {
            log("Đang lọc công việc...");
            LoadingDialog.show(context, "Đang lọc công việc...");
          },
          filteredTasksSuccess: (filteredTasks) {
            log("Lọc công việc thành công!");
            setState(() {
              tasksByDate = filteredTasks;
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: MediaQuery.of(context).size.width * 0.4,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: InkWell(
              onTap: () => _selectDate(context), // Open date picker when tapped
              child: Chip(
                shape: const StadiumBorder(
                    side: BorderSide(width: 0, color: Colors.transparent)),
                label: Text(
                  formattedDate, // Display the formatted date
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                avatar: Icon(
                  Icons.calendar_month_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        context.push(RouteName.notification);
                      },
                      icon: const Badge(
                          label: Text('3'),
                          child: Icon(
                            Icons.notifications_outlined,
                          ))),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<TaskBloc>().add(TaskEvent.getTasksByUserIdAndDate(
                UserDataConstant.userId, selectedDate, null));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Update this to display either "Hôm nay" or the day of the week
                Text(
                  isToday ? 'Hôm nay' : dayOfWeek, // Show "Hôm nay" if today
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 22),
                ),

                const SizedBox(height: 8),
                if (availableLocations.isNotEmpty) ...[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        'Tất cả',
                        ...availableLocations
                            .where((location) => location != 'Tất cả'),
                      ].map((location) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterChip(
                            label: Text(location),
                            selected: selectedLocation == location,
                            onSelected: (bool selected) {
                              setState(() {
                                selectedLocation = location;
                              });
                              // Get the cageId for the selected location
                              final cageId = location == 'Tất cả'
                                  ? null
                                  : tasksByDate
                                      .expand((task) => task.cages)
                                      .firstWhere(
                                          (cage) => cage.cageName == location)
                                      .cageId;
                              // Call the API to fetch tasks for the selected cage
                              context.read<TaskBloc>().add(
                                  TaskEvent.getTasksByUserIdAndDate(
                                      UserDataConstant.userId,
                                      selectedDate,
                                      cageId));
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
                Expanded(
                  child: tasksByDate.isNotEmpty
                      ? ListView(
                          children: [
                            ..._buildSessionSections(groupedTasksBySession),
                            if (completedTasks.isNotEmpty) ...[
                              const SizedBox(height: 16),
                              Text('Đã hoàn thành (${completedTasks.length})',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontSize: 18)),
                              const SizedBox(height: 8),
                              TaskList(tasks: completedTasks),
                            ],
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
      ),
    );
  }

  List<Widget> _buildSessionSections(
      Map<String, List<TaskByUserResponse>> tasks) {
    return tasks.entries.map((entry) {
      final session = entry.key;
      final sessionTasks = entry.value;

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
            SectionHeader(
                title: '$sessionTitle (${sessionTasks.length})', image: image),
            const SizedBox(height: 4),
            TaskList(tasks: sessionTasks),
          ],
        ),
      );
    }).toList();
  }

  List<TaskByUserResponse> get completedTasks {
    return tasksByDate
        .where((task) => task.cages
            .any((cage) => cage.tasks.any((task) => task.status == 'Đã làm')))
        .toList();
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String image;

  const SectionHeader({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Image.asset(
          image,
          width: 24,
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}

class TaskList extends StatelessWidget {
  final List<TaskByUserResponse> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        final isInProgress = task.cages
            .any((cage) => cage.tasks.any((task) => task.status == 'Đang làm'));
        final isCompleted = task.cages
            .any((cage) => cage.tasks.any((task) => task.status == 'Đã làm'));

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: task.cages.expand((cage) {
            return cage.tasks.map((task) {
              return TaskCard(
                task: task,
                taskId: task.id,
                cageName: cage.cageName,
                isCompleted: isCompleted,
                isInProgress: isInProgress,
                isFirst: index == 0,
                borderColor: isInProgress
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondaryContainer,
                highlightName: task.assignedToUser.fullName == 'Staff Farm 1',
              );
            }).toList();
          }).toList(),
        );
      },
    );
  }
}
