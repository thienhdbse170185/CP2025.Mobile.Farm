import 'dart:developer';

import 'package:data_layer/model/entity/cage/cage.dart';
import 'package:data_layer/model/entity/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/view/export.dart';
import 'package:smart_farm/src/view/widgets/task_card.dart';
import 'package:smart_farm/src/viewmodel/cage/cage_cubit.dart'; // Import the TaskCard widget
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';

class CageWidget extends StatefulWidget {
  final String cageId;
  final Color color;
  const CageWidget({super.key, required this.cageId, required this.color});

  @override
  State<CageWidget> createState() => _CageWidgetState();
}

class _CageWidgetState extends State<CageWidget> {
  DateTime selectedDate = DateTime.now(); // Store the selected date
  String loggedInUser = 'Staff Farm 1'; // Add this line

  List<Task> tasks = [];
  Cage? cage;

  List<String> cageNames = [
    "-- Chọn chuồng --",
    "Cage 1",
    "Cage 2",
    "Cage 3"
  ]; // Add this line
  String selectedCageName = "-- Chọn chuồng --"; // Add this line

  String get formattedDate {
    return DateFormat('MMM dd, yyyy').format(selectedDate);
  }

  // Function to filter tasks by status
  List<Task> getTasksByStatus(String status) {
    return tasks.where((task) => task.status == status).toList();
  }

  // Function to categorize tasks by time of day and sort by priorityNum
  Map<String, List<Task>> get tasksByTimeOfDay {
    final Map<String, List<Task>> categorizedTasks = {
      'Buổi sáng': [],
      'Buổi trưa': [],
      'Buổi chiều': [],
    };

    for (final task in tasks) {
      if (task.status != 'Done') {
        final session = task.session;
        if (session == 1) {
          categorizedTasks['Buổi sáng']?.add(task);
        } else if (session == 2) {
          categorizedTasks['Buổi trưa']?.add(task);
        } else if (session == 3) {
          categorizedTasks['Buổi chiều']?.add(task);
        }
      }
    }

    // Sort tasks by priorityNum
    categorizedTasks.forEach((key, value) {
      value.sort((a, b) => a.priorityNum.compareTo(b.priorityNum));
    });

    return categorizedTasks;
  }

  // Function to get completed tasks
  List<Task> get completedTasks {
    return tasks.where((task) => task.status == 'Done').toList();
  }

  final List<HomeFeatures> features = [
    HomeFeatures(
      icon: LinearIcons.aboutIcon,
      title: 'Báo cáo vấn đề',
      routeName: RouteName.createTicket,
    ),
    HomeFeatures(
      icon: LinearIcons.healthIconGreen,
      title: 'Vật nuôi bị bệnh',
      routeName: RouteName.symptom,
    ),
    HomeFeatures(
      title: 'Gọi khẩn cấp',
      icon: LinearIcons.phoneCallingIconGreen,
      routeName: RouteName.support,
    )
  ];

  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(TaskEvent.getTasksByCageId(widget.cageId));
  }

  @override
  Widget build(BuildContext context) {
    final doneTasks = tasks.where((task) => task.status == 'Done').toList();
    final inProgressTasks =
        tasks.where((task) => task.status == 'InProgress').toList();
    final pendingTasks =
        tasks.where((task) => task.status == 'Pending').toList();
    final tasksByTime = {
      'Buổi sáng': tasks
          .where((task) => task.session == 1 && task.status != 'Done')
          .toList(),
      'Buổi trưa': tasks
          .where((task) => task.session == 2 && task.status != 'Done')
          .toList(),
      'Buổi chiều': tasks
          .where((task) => task.session == 3 && task.status != 'Done')
          .toList(),
    };
    final completedTasksList =
        tasks.where((task) => task.status == 'Done').toList();

    return MultiBlocListener(
      listeners: [
        BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () {
                LoadingDialog.show(context, 'Đang tải công việc...');
              },
              getTasksByCageIdSuccess: (tasksResponse) async {
                await Future.delayed(const Duration(seconds: 1));
                LoadingDialog.hide(context);
                setState(() {
                  tasks = tasksResponse.items;
                });
                log('Lấy công việc theo chuồng thành công!');
                context.read<CageCubit>().getCageById(widget.cageId);
              },
              getTasksFailure: (e) {
                LoadingDialog.hide(context);
                SnackBar(content: Text(e.toString()));
                log('Lấy công việc theo chuồng thất bại!');
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<CageCubit, CageState>(listener: (context, state) {
          state.maybeWhen(
            loadByIdSuccess: (cage) async {
              await Future.delayed(const Duration(seconds: 2));
              log('Lấy thông tin chuồng thành công!');
              LoadingDialog.hide(context);
              setState(() {
                this.cage = cage;
              });
            },
            loadByIdInProgress: () {
              log('Đang lấy thông tin chuồng...');
              LoadingDialog.show(context, 'Đang lấy thông tin chuồng...');
            },
            loadByIdFailure: (e) {
              log('Lấy thông tin chuồng thất bại!');
              LoadingDialog.hide(context);
            },
            orElse: () {},
          );
        }),
      ],
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            cage?.name ?? 'Đang tải...',
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            // Refresh the task details
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    color: widget.color,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/line_background.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (inProgressTasks.isEmpty &&
                                      doneTasks.isEmpty &&
                                      pendingTasks.isEmpty) ...[
                                    const SizedBox(height: 8),
                                    Text('Không có Task',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(color: Colors.white)),
                                    const SizedBox(height: 8)
                                  ] else ...[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Tiến độ công việc',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                      color: Colors.white),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        color: Colors.white),
                                                children: [
                                                  const TextSpan(
                                                      text: 'Đã làm: '),
                                                  TextSpan(
                                                    text:
                                                        '${doneTasks.length}', // Số task đã làm
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        '/${doneTasks.length + inProgressTasks.length + pendingTasks.length} task.',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 16),
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 5,
                                                value: doneTasks.isNotEmpty
                                                    ? doneTasks.length /
                                                        (doneTasks.length +
                                                            inProgressTasks
                                                                .length +
                                                            pendingTasks.length)
                                                    : 0.0,
                                                backgroundColor: Colors.white30,
                                                valueColor:
                                                    const AlwaysStoppedAnimation<
                                                        Color>(Colors.white),
                                              ),
                                            ),
                                            Text(
                                              '${((doneTasks.length / (doneTasks.length + inProgressTasks.length + pendingTasks.length).clamp(1, double.infinity)) * 100).round()}%',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Lottie.asset(
                              'assets/animations/chicken_adult.json',
                              width: 100,
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  color: const Color(0xFFFFFFFF),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 32,
                                      crossAxisSpacing: 12,
                                      childAspectRatio: 1),
                              itemBuilder: (context, index) {
                                if (index < features.length) {
                                  final feature = features[index];
                                  return GestureDetector(
                                    onTap: () => context.push(feature.routeName,
                                        extra: {
                                          'cageName': cage?.name ?? ''
                                        }), // Update this line
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              width: 1,
                                            ),
                                          ),
                                          child: feature.icon,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          feature.title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                return null;
                              }),
                        ),
                      ],
                    ),
                  ),
                ),

                if (tasksByTime.values.every((tasks) => tasks.isEmpty) &&
                    completedTasksList.isEmpty) ...[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer
                                    .withOpacity(0.4)),
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
                            'Không có công việc nào\n trong hôm nay',
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
                ] else ...[
                  const SizedBox(height: 8),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Move the date display to be inline with the "Công việc" text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Công việc',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Chip(
                              shape: const StadiumBorder(
                                  side: BorderSide(
                                      width: 0, color: Colors.transparent)),
                              label: Row(
                                children: [
                                  Text(
                                    DateFormat('EEEE, MMM d, yyyy')
                                        .format(DateTime.now()),
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                ],
                              ),
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Morning tasks
                        if (tasksByTime['Buổi sáng']?.isNotEmpty ?? false) ...[
                          SectionHeader(
                              image: 'assets/images/morning.png',
                              title:
                                  'Buổi sáng (${tasksByTime['Buổi sáng']?.length ?? 0})'),
                          const SizedBox(height: 8),
                          TaskList(tasks: tasksByTime['Buổi sáng'] ?? []),
                        ],
                        if (tasksByTime['Buổi trưa']?.isNotEmpty ?? false) ...[
                          const SizedBox(height: 16),
                          SectionHeader(
                              image: 'assets/images/afternoon.png',
                              title:
                                  'Buổi trưa (${tasksByTime['Buổi trưa']?.length ?? 0})'),
                          const SizedBox(height: 8),
                          TaskList(tasks: tasksByTime['Buổi trưa'] ?? []),
                        ],
                        if (tasksByTime['Buổi chiều']?.isNotEmpty ?? false) ...[
                          const SizedBox(height: 16),
                          SectionHeader(
                              image: 'assets/images/moon.png',
                              title:
                                  'Buổi chiều (${tasksByTime['Buổi chiều']?.length ?? 0})'),
                          const SizedBox(height: 8),
                          TaskList(tasks: tasksByTime['Buổi chiều'] ?? []),
                        ],
                        if (completedTasksList.isNotEmpty) ...[
                          const SizedBox(height: 16),
                          Text(
                            'Đã hoàn thành (${completedTasksList.length})',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          TaskList(tasks: completedTasksList),
                        ],
                      ],
                    ),
                  )
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget for section headers
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

// Widget for task lists
class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    // Find the highest priority task with status 'InProgress'
    Task? highestPriorityInProgressTask;
    for (final task in tasks) {
      if (task.status == 'InProgress') {
        if (highestPriorityInProgressTask == null ||
            task.priorityNum < highestPriorityInProgressTask.priorityNum) {
          highestPriorityInProgressTask = task;
        }
      }
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        final isInProgress = task.status == 'InProgress';
        final isCompleted = task.status == 'Done';
        final isHighestPriorityInProgress =
            task == highestPriorityInProgressTask;

        return TaskCard(
          task: task,
          taskId: task.id,
          isCompleted: isCompleted,
          isInProgress: isInProgress,
          isFirst: index == 0,
          borderColor: isHighestPriorityInProgress
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondaryContainer,
          highlightName: task.assignedToUser.fullName == 'Staff Farm 1',
        );
      },
    );
  }
}
