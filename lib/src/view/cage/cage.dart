import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:smart_farm/src/model/entity/cage/cage.dart';
import 'package:smart_farm/src/view/task/task_detail.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/view/widgets/task_list.dart';
import 'package:smart_farm/src/viewmodel/cage/cage_cubit.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';

class CageWidget extends StatefulWidget {
  final String cageId;
  const CageWidget({super.key, required this.cageId});

  @override
  State<CageWidget> createState() => _CageWidgetState();
}

class _CageWidgetState extends State<CageWidget> {
  DateTime selectedDate = TimeUtils.customNow();
  Map<String, List<TaskHaveCageName>> tasks = {};
  Cage? cage;
  bool _isLoading = false;

  String get formattedDate {
    return DateFormat('EEEE, dd/MM/yyyy', 'vi').format(selectedDate);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2024),
          lastDate: DateTime(2028),
        )) ??
        selectedDate;

    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      context
          .read<TaskBloc>()
          .add(TaskEvent.getTasksByCageId(picked, widget.cageId));
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(TaskEvent.getTasksByCageId(
          selectedDate,
          widget.cageId,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final doneTasks = tasks.values.expand((element) => element).where((task) {
      return task.status == StatusDataConstant.done;
    }).toList();
    final inProgressTasks =
        tasks.values.expand((element) => element).where((task) {
      return task.status == StatusDataConstant.inProgress;
    }).toList();
    final pendingTasks =
        tasks.values.expand((element) => element).where((task) {
      return task.status == StatusDataConstant.pending;
    }).toList();
    final overdueTasks =
        tasks.values.expand((element) => element).where((task) {
      return task.status == StatusDataConstant.overdue;
    }).toList();
    final canceledTasks =
        tasks.values.expand((element) => element).where((task) {
      return task.status == StatusDataConstant.cancelled;
    }).toList();

    final totalTasks = doneTasks.length +
        inProgressTasks.length +
        pendingTasks.length +
        overdueTasks.length +
        canceledTasks.length;
    final completionPercentage =
        totalTasks > 0 ? (doneTasks.length / totalTasks * 100).round() : 0;

    return MultiBlocListener(
      listeners: [
        BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () {
                // LoadingDialog.show(context, 'Đang tải công việc...');
                setState(() {
                  _isLoading = true;
                });
              },
              getTasksByCageIdSuccess: (tasksResponse) async {
                await Future.delayed(const Duration(seconds: 1));
                // LoadingDialog.hide(context);
                setState(() {
                  tasks = tasksResponse;
                });
                log('Lấy công việc theo chuồng thành công!');
                context.read<CageCubit>().getCageById(widget.cageId);
              },
              getTasksFailure: (e) {
                // LoadingDialog.hide(context);
                setState(() {
                  _isLoading = false;
                });
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
              // LoadingDialog.hide(context);
              setState(() {
                this.cage = cage;
                _isLoading = false;
              });
            },
            loadByIdInProgress: () {
              log('Đang lấy thông tin chuồng...');
              // LoadingDialog.show(context, 'Đang lấy thông tin chuồng...');
              setState(() {
                _isLoading = true;
              });
            },
            loadByIdFailure: (e) {
              log('Lấy thông tin chuồng thất bại!');
              setState(() {
                _isLoading = false;
              });
              // LoadingDialog.hide(context);
            },
            orElse: () {},
          );
        }),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: CustomAppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go(RouteName.home),
          ),
          appBarHeight: MediaQuery.of(context).size.height * 0.08,
          title: Column(
            children: [
              Text(
                cage?.name ?? 'Đang tải...',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    formattedDate,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () async {
                  context.read<TaskBloc>().add(TaskEvent.getTasksByCageId(
                        selectedDate,
                        widget.cageId,
                      ));
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Summary Card
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Theme.of(context).colorScheme.primary,
                                  Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.8),
                                ],
                              ),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/line_background.png'),
                                fit: BoxFit.cover,
                                opacity: 0.2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (totalTasks == 0) ...[
                                          const Text(
                                            'Không có công việc hôm nay',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ] else ...[
                                          const Text(
                                            'Tiến độ công việc',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              _buildStatusBadge(
                                                'Hoàn thành',
                                                doneTasks.length,
                                                Colors.green,
                                              ),
                                              const SizedBox(width: 8),
                                              _buildStatusBadge(
                                                'Đang làm',
                                                inProgressTasks.length,
                                                Colors.amber,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              _buildStatusBadge(
                                                'Chưa làm',
                                                pendingTasks.length,
                                                Colors.blue,
                                              ),
                                              const SizedBox(width: 8),
                                              _buildStatusBadge(
                                                'Hết hạn',
                                                overdueTasks.length,
                                                Colors.red,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              _buildStatusBadge(
                                                'Đã hủy',
                                                canceledTasks.length,
                                                Colors.grey,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                  if (totalTasks > 0) ...[
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                CircularProgressIndicator(
                                                  strokeWidth: 6,
                                                  value: completionPercentage /
                                                      100,
                                                  backgroundColor:
                                                      Colors.grey[300],
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  ),
                                                ),
                                                Text(
                                                  '$completionPercentage%',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ] else ...[
                                    Lottie.asset(
                                      'assets/animations/chicken_adult.json',
                                      width: 80,
                                      height: 80,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      if (tasks.values.every((tasks) => tasks.isEmpty)) ...[
                        _buildEmptyState(),
                      ] else ...[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Danh sách công việc',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Tổng: $totalTasks (công việc)',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        ..._buildSessionSections(tasks),
                        const SizedBox(height: 24),
                      ],
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildStatusBadge(String title, int count, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$count',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // Build empty state widget for no tasks
  Widget _buildEmptyState() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                color: Theme.of(context).primaryColor.withOpacity(0.4),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Không có công việc nào\n trong ngày này',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            TextButton.icon(
              onPressed: () {
                context.read<TaskBloc>().add(
                    TaskEvent.getTasksByCageId(selectedDate, widget.cageId));
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Làm mới'),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSessionSections(
      Map<String, List<TaskHaveCageName>> tasks) {
    final sessionOrder = ['Morning', 'Noon', 'Afternoon', 'Evening'];

    // Sort the entries by the custom order
    final sortedEntries = tasks.entries.toList()
      ..sort((a, b) {
        final indexA = sessionOrder.indexOf(a.key);
        final indexB = sessionOrder.indexOf(b.key);
        return indexA.compareTo(indexB);
      });

    final totalTasks = sortedEntries.fold<int>(0, (total, entry) {
      return total + entry.value.length;
    });

    return sortedEntries
        .map((entry) {
          final session = entry.key;
          final sessionTasks = entry.value;

          if (sessionTasks.isEmpty) return const SizedBox.shrink();

          String sessionTitle;
          String sessionImage;

          switch (session) {
            case 'Morning':
              sessionTitle = 'Buổi sáng';
              sessionImage = 'assets/images/morning.png';
              break;
            case 'Noon':
              sessionTitle = 'Buổi trưa';
              sessionImage = 'assets/images/noon.png';
              break;
            case 'Afternoon':
              sessionTitle = 'Buổi chiều';
              sessionImage = 'assets/images/afternoon.png';
              break;
            case 'Evening':
              sessionTitle = 'Buổi tối';
              sessionImage = 'assets/images/moon.png';
              break;
            default:
              sessionTitle = 'Khác';
              sessionImage = 'assets/images/default.png';
          }

          return totalTasks > 0
              ? Container(
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primaryContainer
                              .withOpacity(0.1),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              sessionImage,
                              width: 32,
                              height: 32,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              sessionTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<TaskBloc>()
                                    .add(TaskEvent.getTasksByCageId(
                                      selectedDate,
                                      widget.cageId,
                                    ));
                              },
                              child: Icon(Icons.refresh_outlined, size: 16),
                            ),
                            Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '${sessionTasks.length} công việc',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ...sessionTasks.map((task) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: GestureDetector(
                              onTap: () async {
                                // Navigate to task detail and pass 'cage' as source
                                final result = await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => TaskDetailWidget(
                                      taskId: task.id,
                                      source: 'cage', // Add this parameter
                                    ),
                                  ),
                                );

                                // Handle result when returning from task detail
                                if (result != null &&
                                    result is Map<String, dynamic>) {
                                  if (result['reload'] == true &&
                                      result['source'] == 'cage') {
                                    // Reload tasks for this cage
                                    context.read<TaskBloc>().add(
                                          TaskEvent.getTasksByCageId(
                                            selectedDate,
                                            widget.cageId,
                                          ),
                                        );
                                  }
                                }
                              },
                              child: TaskListWidget(
                                tasks: [task],
                                highlightWarning: true,
                              ),
                            ),
                          )),
                    ],
                  ),
                )
              : Container();
        })
        .where((widget) => widget is! SizedBox)
        .toList();
  }
}
