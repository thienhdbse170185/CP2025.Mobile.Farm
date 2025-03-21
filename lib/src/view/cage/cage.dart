import 'dart:developer';

import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:data_layer/model/entity/cage/cage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/constants/status_data_constant.dart';
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
  DateTime selectedDate = DateTime.now();
  Map<String, List<TaskHaveCageName>> tasks = {};
  Cage? cage;

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

    final totalTasks =
        doneTasks.length + inProgressTasks.length + pendingTasks.length;
    final completionPercentage =
        totalTasks > 0 ? (doneTasks.length / totalTasks * 100).round() : 0;

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
                  tasks = tasksResponse;
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
        backgroundColor: Colors.grey[50],
        appBar: CustomAppBar(
          leading: IconButton(
            icon: LinearIcons.arrowBackIcon,
            onPressed: () {
              Navigator.of(context).pop();
            },
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
              InkWell(
                onTap: () => _selectDate(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      formattedDate,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: RefreshIndicator(
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
                          image:
                              AssetImage('assets/images/line_background.png'),
                          fit: BoxFit.cover,
                          opacity: 0.2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        const SizedBox(width: 8),
                                        _buildStatusBadge(
                                          'Chưa làm',
                                          pendingTasks.length,
                                          Colors.red,
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
                                            value: completionPercentage / 100,
                                            backgroundColor: Colors.grey[300],
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer
                                  .withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.assignment_outlined,
                              size: 72,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.7),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Không có công việc hôm nay',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const SizedBox(height: 12),
                          TextButton.icon(
                            onPressed: () {
                              context.read<TaskBloc>().add(
                                  TaskEvent.getTasksByCageId(
                                      selectedDate, widget.cageId));
                            },
                            icon: const Icon(Icons.refresh),
                            label: const Text('Làm mới'),
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ] else ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Danh sách công việc',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          'Tổng: $totalTasks',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
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

    return sortedEntries
        .map((entry) {
          final session = entry.key;
          final sessionTasks = entry.value;

          if (sessionTasks.isEmpty) return const SizedBox.shrink();

          String sessionTitle;
          IconData sessionIcon;
          Color sessionColor;

          switch (session) {
            case 'Morning':
              sessionTitle = 'Buổi sáng';
              sessionIcon = Icons.wb_sunny;
              sessionColor = Colors.orange;
              break;
            case 'Noon':
              sessionTitle = 'Buổi trưa';
              sessionIcon = Icons.wb_sunny_outlined;
              sessionColor = Colors.amber;
              break;
            case 'Afternoon':
              sessionTitle = 'Buổi chiều';
              sessionIcon = Icons.brightness_4;
              sessionColor = Colors.deepOrange;
              break;
            case 'Evening':
              sessionTitle = 'Buổi tối';
              sessionIcon = Icons.nights_stay;
              sessionColor = Colors.indigo;
              break;
            default:
              sessionTitle = 'Khác';
              sessionIcon = Icons.access_time;
              sessionColor = Colors.grey;
          }

          return Container(
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
                    color: sessionColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        color: sessionColor.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        sessionIcon,
                        color: sessionColor,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        sessionTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: sessionColor,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: sessionColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: sessionColor.withOpacity(0.3)),
                        ),
                        child: Text(
                          '${sessionTasks.length} công việc',
                          style: TextStyle(
                            fontSize: 12,
                            color: sessionColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ...sessionTasks.map((task) => TaskListWidget(tasks: [task])),
              ],
            ),
          );
        })
        .where((widget) => widget is! SizedBox)
        .toList();
  }
}
