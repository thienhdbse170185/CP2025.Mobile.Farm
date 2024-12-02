import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/viewmodel/task/task_cubit.dart';

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
  final List<Map<String, String>> tasks = [
    {
      'title': 'Chuồng gà Trưởng Thành',
      'task': 'Thu hoạch trứng',
      'progress': '50%',
      'image': 'assets/animations/chicken_adult.json',
    },
    {
      'title': 'Chuồng gà Con',
      'task': 'Cho gà ăn',
      'progress': '0%',
      'image': 'assets/animations/chicken_adult.json',
    },
    {
      'title': 'Chuồng gà Đông Tảo',
      'task': 'Kiểm tra sức khỏe',
      'progress': '75%',
      'image': 'assets/animations/chicken_adult.json',
    },
  ];

  final List<Color> cardColors = [
    Colors.blueAccent,
    Colors.pinkAccent,
    Colors.purpleAccent,
  ];

  final List<HomeFeatures> features = [
    HomeFeatures(
      icon: Icons.task_alt_outlined,
      title: 'Công việc',
      routeName: RouteName.task,
    ),
    HomeFeatures(
      icon: Icons.info_outline_rounded,
      title: 'Báo cáo vấn đề',
      routeName: RouteName.createTicket,
    ),
    HomeFeatures(
      icon: Icons.warehouse_outlined,
      title: 'Vật nuôi bị bệnh',
      routeName: RouteName.report,
    ),
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
    context.read<TaskCubit>().fetchItems();
    final taskState = context.read<TaskCubit>().state;
    if (taskState is TaskLoading) {
      LoadingDialog.show(context);
    } else if (taskState is TaskSuccess) {
      LoadingDialog.hide(context);
    } else if (taskState is TaskError) {
      LoadingDialog.hide(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                color: Theme.of(context).colorScheme.outline)),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color(0xFFFFFFFF),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.22,
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
                                onTap: () => context.push(feature.routeName),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
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
              color: const Color(0xFFFFFFFF),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tin thời tiết',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontSize: 20)),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_rounded,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "25/12/2024", // Display the formatted date
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                ],
                              )
                            ],
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Chi tiết >',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary),
                              ))
                        ],
                      ),
                      const SizedBox(height: 8),
                      Card(
                        color: Theme.of(context).primaryColorLight,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          children: [
                                            Icon(Icons.location_on),
                                            SizedBox(width: 4),
                                            Text(
                                              'Xã Bình An',
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '25',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge,
                                                ),
                                                Text(
                                                  '°C',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge,
                                                )
                                              ],
                                            ),
                                            const SizedBox(width: 8),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 8),
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface
                                                    .withOpacity(0.4),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons
                                                            .trending_up_rounded,
                                                        color: Color.fromARGB(
                                                            255, 252, 55, 0),
                                                      ),
                                                      const SizedBox(width: 2),
                                                      Text(
                                                        '32°',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium,
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons
                                                            .trending_down_rounded,
                                                        color: Color.fromARGB(
                                                            255, 0, 67, 252),
                                                      ),
                                                      const SizedBox(width: 2),
                                                      Text(
                                                        '24°',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'Trời nắng',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        const SizedBox(height: 8)
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Image.asset(
                                    'assets/images/weather.png',
                                    width: 80,
                                    height: 80,
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Card(
                                elevation: 0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 16.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Badge(
                                            label: Text('1'),
                                            child: Icon(
                                                Icons.notifications_outlined),
                                          ),
                                          const SizedBox(width: 12),
                                          Text(
                                            'Khuyến cáo nông vụ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .tertiary),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                          'Đón không khí lạnh, miền Bắc có nơi dưới 10 độ C.')
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(height: 8),
            Container(
              color: const Color(0xFFFFFFFF),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Chuồng được cung cấp',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 16),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      final color = cardColors[index % cardColors.length];
                      return GestureDetector(
                        onTap: () {
                          context.push(RouteName.cage);
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
                                          task['title']!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(color: Colors.white),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Task tiếp theo:',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(color: Colors.white70),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            const Icon(Icons.circle,
                                                size: 8, color: Colors.white),
                                            const SizedBox(width: 8),
                                            Text(
                                              task['task']!,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                              task['progress']!,
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
                                          value: double.parse(task['progress']!
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
                                    task['image']!,
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
    );
  }
}
