import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/constants/session_data_constant.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/model/entity/task/next_task/next_task.dart';
import 'package:smart_farm/src/view/widgets/avatar_round.dart';
import 'package:smart_farm/src/viewmodel/index.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';
import 'package:smart_farm/src/viewmodel/time/time_bloc.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class HomeFeatures {
  final Widget icon;
  final String title;
  final Map<String, dynamic>? extra;
  final String routeName;

  HomeFeatures(
      {required this.icon,
      required this.title,
      this.extra,
      required this.routeName});
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  final List<NextTask> _nextTaskList = [];
  bool? _isProcessing = false;
  bool? _isError = false;
  String? _userName = '';

  late AnimationController _controller;

  final List<HomeFeatures> features = [
    HomeFeatures(
      title: 'Báo cáo\ntriệu chứng',
      routeName: RouteName.symptom,
      icon: LinearIcons.healthIconGreen,
    ),
    // Add more features here in the future
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    context.read<AuthBloc>().add(const AuthEvent.appStarted());
    context.read<TimeBloc>().add(const TimeEvent.getServerTime());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _handleSessionMessage() {
    final currentSession = TimeUtils.getCurrentSession();
    switch (currentSession) {
      case SessionDataConstant.MORNING_INDEX:
        return SessionDataConstant.MORNING_MESSAGE;
      case SessionDataConstant.NOON_INDEX:
        return SessionDataConstant.NOON_MESSAGE;
      case SessionDataConstant.AFTERNOON_INDEX:
        return SessionDataConstant.AFTERNOON_MESSAGE;
      case SessionDataConstant.EVENING_INDEX:
        return SessionDataConstant.EVENING_MESSAGE;
      default:
        return 'Chúc bạn ngủ ngon';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(listener: (context, state) {
          state.maybeWhen(
            appStartedInProgress: () {
              setState(() {
                _isProcessing = true;
              });
            },
            appStartedSuccess: () {
              log('App started successfully!');
              context
                  .read<UserBloc>()
                  .add(const UserEvent.getUserProfile(isAppStart: true));
            },
            appStartedFailure: (error) {
              log('App started failed: $error');
              setState(() {
                _isProcessing = false;
              });
            },
            orElse: () {},
          );
        }),
        BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            state.maybeWhen(
              updateDeviceTokenInProgress: () {
                log('Đang cập nhật token thiết bị...');
              },
              updateDeviceTokenSuccess: () {
                log('Cập nhật token thiết bị thành công!');
                SnackBar(
                  content: const Text('Cập nhật token thiết bị thành công!'),
                  backgroundColor: Colors.green,
                );
                context.read<TaskBloc>().add(const TaskEvent.getNextTask());
              },
              updateDeviceTokenFailure: (error) {
                log('Lỗi khi cập nhật token thiết bị: $error');
              },
              getUserProfileInProgress: () {
                log('Đang lấy thông tin user...');
              },
              getUserProfileSuccess: (userName, email, isAppStart) {
                log('Lấy thông tin user thành công: $userName - $email');
                setState(() {
                  _userName = userName;
                });
                if (isAppStart && !Platform.isIOS) {
                  context
                      .read<UserBloc>()
                      .add(const UserEvent.updateDeviceToken());
                } else {
                  context.read<TaskBloc>().add(const TaskEvent.getNextTask());
                }
              },
              getUserProfileFailure: (error) {
                log('Lấy thông tin user thất bại: $error');
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
            state.maybeWhen(
              getNextTaskLoading: () {
                log('Đang tải danh sách các công việc tiếp theo...');
                setState(() {
                  _isProcessing = true;
                });
              },
              getNextTaskSuccess: (nextTaskList) {
                log('Tải danh sách công việc tiếp theo thành công!');
                setState(() {
                  _nextTaskList.clear();
                  _nextTaskList.addAll(nextTaskList);
                  _isProcessing = false;
                });
              },
              getNextTaskFailure: (error) {
                log('Lỗi khi tải danh sách công việc tiếp theo: $error');
                setState(() {
                  _isProcessing = false;
                  _isError = true;
                });
              },
              orElse: () {},
            );
          },
        )
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.11,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                image: DecorationImage(
                  image: const AssetImage('assets/images/leaf.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.dstATop,
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.059,
              left: 16,
              right: 16,
              child: Card(
                color: Colors.white,
                shape: const StadiumBorder(),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.asset(TimeUtils.getCurrentSessionPathImage(),
                          width: 32, height: 32),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_handleSessionMessage(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline)),
                            Text(_userName ?? 'Đang tải...',
                                style: Theme.of(context).textTheme.titleSmall),
                            // Display the formatted date here
                            StreamBuilder(
                              stream:
                                  Stream.periodic(const Duration(seconds: 1)),
                              builder: (context, snapshot) {
                                return Text(
                                  DateFormat('HH:mm, dd/MM/yyyy')
                                      .format(TimeUtils.customNow()),
                                  style: Theme.of(context).textTheme.bodySmall,
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        AvatarRoundWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.165),
              child: RefreshIndicator(
                onRefresh: () async {
                  setState(() {
                    _isError = false;
                  });
                  context.read<TimeBloc>().add(const TimeEvent.getServerTime());
                  context.read<TaskBloc>().add(const TaskEvent.getNextTask());
                  return;
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Features Grid Section
                      Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.fromLTRB(24, 8, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tiện ích nhanh',
                                style: Theme.of(context).textTheme.titleMedium),
                            const SizedBox(height: 16),
                            InkWell(
                              onTap: () => context.push(RouteName.symptom),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outline
                                        .withOpacity(0.1),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LinearIcons.healthIconGreen,
                                    const SizedBox(height: 8),
                                    Text(
                                      'Báo cáo \ntriệu chứng',
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      Container(
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withOpacity(0.05),
                        height: 8,
                        width: MediaQuery.of(context).size.width,
                      ),

                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Công việc tiếp theo',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isError = false;
                                      });
                                      context
                                          .read<TaskBloc>()
                                          .add(const TaskEvent.getNextTask());
                                      context.read<UserBloc>().add(
                                          const UserEvent.getUserProfile(
                                              isAppStart: true));
                                      context
                                          .read<TimeBloc>()
                                          .add(const TimeEvent.getServerTime());
                                      context.read<UserBloc>().add(
                                          const UserEvent.updateDeviceToken());
                                    },
                                    icon: LinearIcons.refreshIcon)
                              ],
                            ),
                            if (_isProcessing == true)
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child:
                                    Center(child: CircularProgressIndicator()),
                              )
                            else if (_nextTaskList.isNotEmpty)
                              _buildNextTaskList(nextTaskList: _nextTaskList)
                            else if (_isError == true)
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.error_outline,
                                          color: Colors.red, size: 48),
                                      const SizedBox(height: 16),
                                      Text(
                                        'Lỗi khi tải dữ liệu. Vui lòng thử lại.',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 16),
                                      ElevatedButton(
                                        onPressed: () {
                                          context.read<TaskBloc>().add(
                                                const TaskEvent.getNextTask(),
                                              );
                                        },
                                        child: const Text('Thử lại'),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            else if (_isError == false)
                              Center(
                                  child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 24),
                                    LinearIcons.emptyBoxIcon,
                                    const SizedBox(height: 16),
                                    Text('Danh sách trống',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Bạn không có công việc tiếp theo.',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ))
                            else
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(),
                                      const SizedBox(height: 24),
                                      const Text(
                                          'Đang chuẩn bị dữ liệu, vui lòng đợi...')
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        // )
      ),
    );
  }

  Widget _buildNextTaskList({required List<NextTask> nextTaskList}) {
    // Check if there are actual tasks to display
    bool hasActiveTasks = nextTaskList.isNotEmpty &&
        nextTaskList.any((task) => task.taskName != "No Task Available");

    if (!hasActiveTasks) {
      // No tasks available state
      return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                LinearIcons.emptyBoxIcon,
                const SizedBox(height: 16),
                Text('Danh sách trống',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 4),
                Text(
                  'Bạn không có công việc tiếp theo.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Tasks available state - display task list
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: nextTaskList.length,
      itemBuilder: (context, index) {
        final nextTask = nextTaskList[index];
        if (nextTask.taskName == 'No Task Available') {
          return const SizedBox.shrink();
        }

        return Column(
          children: [
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/line_background.png'),
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
                            Row(
                              children: [
                                LinearIcons.chickenIcon,
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    context.push(RouteName.cage, extra: {
                                      'cageId': nextTask.cageId,
                                    });
                                  },
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    child: Text(
                                      nextTask.cagename,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Công việc tiếp theo:',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.white70),
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Row(
                                children: [
                                  const Icon(Icons.circle,
                                      size: 8, color: Colors.white),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: () {
                                      context.push(RouteName.taskDetail,
                                          extra: nextTask.taskId);
                                    },
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(
                                        nextTask.taskName,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tiến độ công việc',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                                Text(
                                  "${nextTask.taskDone}/${nextTask.total}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              borderRadius: BorderRadius.circular(10),
                              value: nextTask.taskDone / nextTask.total,
                              backgroundColor: Colors.white30,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.white),
                            ),
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
            const SizedBox(height: 8)
          ],
        );
      },
    );
  }
}
