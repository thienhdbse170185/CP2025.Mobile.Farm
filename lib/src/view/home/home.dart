import 'dart:developer';

import 'package:data_layer/model/entity/task/next_task/next_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class HomeFeatures {
  final IconData icon;
  final String title;
  final String routeName;

  HomeFeatures(
      {required this.icon, required this.title, required this.routeName});
}

class _HomeWidgetState extends State<HomeWidget> {
  List<NextTask> cages = [];
  String userId = '604df876-6e3e-4f34-92a0-2aeaa1238a39';

  final List<Color> cardColors = [
    Colors.blueAccent,
    Colors.pinkAccent,
    Colors.purpleAccent,
  ];

  final List<HomeFeatures> features = [
    HomeFeatures(
      title: 'Thời tiết nông vụ',
      icon: Icons.sunny_snowing,
      routeName: RouteName.home,
    ),
    HomeFeatures(
      title: 'Các loại đơn từ',
      routeName: RouteName.home,
      icon: Icons.menu_open_outlined,
    ),
    HomeFeatures(
      title: 'Gọi khẩn cấp',
      icon: Icons.phone_outlined,
      routeName: RouteName.support,
    )
  ];

  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(TaskEvent.getNextTask(userId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskBloc, TaskState>(
      listener: (context, state) {
        state.maybeWhen(
          getNextTaskSuccess: (tasks) {
            log('Lấy danh sách công việc thành công!');
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
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFFFFF),
          leading: IconButton(
            onPressed: () {
              context.push(RouteName.notification);
            },
            icon: const Badge(
              label: Text('3'),
              child: Icon(Icons.notifications_outlined),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
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
                                  color:
                                      Theme.of(context).colorScheme.outline)),
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
            context.read<TaskBloc>().add(TaskEvent.getNextTask(userId));
            return;
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // OutlinedButton(
                //   onPressed: () {
                //     context.read<TaskBloc>().add(const TaskEvent.testConnect());
                //   },
                //   child: const Text('Test connect'),
                // ),
                Container(
                  color: const Color(0xFFFFFFFF),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.13,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 8,
                                      childAspectRatio: 1.5),
                              itemBuilder: (context, index) {
                                if (index < features.length) {
                                  final feature = features[index];
                                  return GestureDetector(
                                    onTap: () =>
                                        context.push(feature.routeName),
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
                                                  .primaryContainer,
                                              width: 1,
                                            ),
                                          ),
                                          child: Icon(feature.icon,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(feature.title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium),
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
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Chuồng được cung cấp',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 16),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cages.length,
                        itemBuilder: (context, index) {
                          final cage = cages[index];
                          final color = cardColors[index % cardColors.length];
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                      color: Colors.white),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              'Task tiếp theo:',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      color: Colors.white70),
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              children: [
                                                const Icon(Icons.circle,
                                                    size: 8,
                                                    color: Colors.white),
                                                const SizedBox(width: 8),
                                                Text(
                                                  cage.taskName,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
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
                                                          color: Colors.white),
                                                ),
                                                Text(
                                                  "${cage.taskDone}/${cage.total}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.copyWith(
                                                          color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            LinearProgressIndicator(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              value: int.parse((cage.taskDone /
                                                          cage.total)
                                                      .toString()
                                                      .replaceAll('%', '')) /
                                                  100,
                                              backgroundColor: Colors.white30,
                                              valueColor:
                                                  const AlwaysStoppedAnimation<
                                                      Color>(Colors.white),
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
    );
  }
}
