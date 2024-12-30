import 'dart:developer';

import 'package:data_layer/model/entity/task/next_task/next_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/view/widgets/menu_feature.dart';
import 'package:smart_farm/src/viewmodel/auth/auth_bloc.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';

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

class _HomeWidgetState extends State<HomeWidget> {
  List<NextTask> cages = [];

  final List<Color> cardColors = [
    Colors.blueAccent,
    Colors.pinkAccent,
    Colors.purpleAccent,
  ];

  final List<HomeFeatures> features = [
    HomeFeatures(
      title: 'Báo cáo \ntriệu chứng',
      routeName: RouteName.createSymptom,
      extra: {'cageName': ''},
      icon: LinearIcons.healthIconGreen,
    ),
  ];

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(const AuthEvent.appStarted());
    context.read<TaskBloc>().add(const TaskEvent.getNextTask());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskBloc, TaskState>(
      listener: (context, state) {
        state.maybeWhen(
          getNextTaskSuccess: (tasks) {
            log('Lấy danh sách chuồng thành công!');
            LoadingDialog.hide(context);
            setState(() {
              cages = tasks;
            });
          },
          getNextTaskLoading: () {
            log('Đang tải dữ liệu...');
            LoadingDialog.show(context, "Đang tải dữ liệu...");
          },
          getNextTaskFailure: (error) {
            log('Lỗi khi tải dữ liệu: $error');
            LoadingDialog.hide(context);
          },
          testConnectSuccess: () {
            log('Kết nối thành công!');
            LoadingDialog.hide(context);
          },
          orElse: () {},
        );
      },
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
                  image: AssetImage('assets/images/leaf.jpg'),
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
                shape: StadiumBorder(),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () {
                        context.push(RouteName.notification);
                      },
                      icon: Image.asset('assets/images/morning.png',
                          width: 32, height: 32),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Chào buổi sáng',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline)),
                            Text('Bảo Thiên',
                                style: Theme.of(context).textTheme.titleSmall),
                          ],
                        ),
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
                            backgroundImage:
                                AssetImage('assets/images/avatar.png'),
                          ),
                        ),
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
                  context.read<TaskBloc>().add(const TaskEvent.getNextTask());
                  return;
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: const Color(0xFFFFFFFF),
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.16,
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          childAspectRatio: 0.8),
                                  itemBuilder: (context, index) {
                                    if (index < features.length) {
                                      final feature = features[index];
                                      return GestureDetector(
                                          onTap: () {
                                            if (feature.extra!.isNotEmpty) {
                                              context.push(feature.routeName,
                                                  extra: feature.extra);
                                            } else {
                                              context.push(feature.routeName);
                                            }
                                          },
                                          child: MenuFeatureWidget(
                                            title: feature.title,
                                            icon: feature.icon,
                                          ));
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withOpacity(0.05),
                        height: 4,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Chuồng được cung cấp',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                IconButton(
                                    onPressed: () {
                                      context
                                          .read<TaskBloc>()
                                          .add(TaskEvent.getNextTask());
                                    },
                                    icon: LinearIcons.refreshIcon)
                              ],
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cages.isEmpty ? 1 : cages.length,
                              itemBuilder: (context, index) {
                                if (cages.isEmpty) {
                                  return Center(
                                    child: Text(
                                      'Bạn chưa được gán chuồng nào.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  );
                                }
                                final cage = cages[index];
                                final color =
                                    cardColors[index % cardColors.length];
                                return GestureDetector(
                                  onTap: () {
                                    context.push(RouteName.cage, extra: {
                                      'cageId': cage.cageId,
                                      'color': color,
                                    });
                                  },
                                  child: Card(
                                    color: color,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/line_background.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    cage.cagename,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium
                                                        ?.copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    'Task tiếp theo:',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                            color:
                                                                Colors.white70),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                    child: Row(
                                                      children: [
                                                        const Icon(Icons.circle,
                                                            size: 8,
                                                            color:
                                                                Colors.white),
                                                        const SizedBox(
                                                            width: 8),
                                                        Expanded(
                                                          child: Text(
                                                            cage.taskName,
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                            overflow:
                                                                TextOverflow
                                                                    .visible,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Tiến độ công việc',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium
                                                            ?.copyWith(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                      Text(
                                                        "${cage.taskDone}/${cage.total}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium
                                                            ?.copyWith(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  LinearProgressIndicator(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    value: cage.taskDone /
                                                        cage.total,
                                                    backgroundColor:
                                                        Colors.white30,
                                                    valueColor:
                                                        const AlwaysStoppedAnimation<
                                                                Color>(
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
                                );
                              },
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
      ),
    );
  }
}
