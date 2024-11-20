import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_farm/src/core/router.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
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
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Thời tiết hôm nay',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Card(
                color: Theme.of(context).colorScheme.secondaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Thứ ba',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: 20),
                          ),
                          Text(
                            '12 Nov 2024',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryFixed),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(width: 4),
                                  Text(
                                    'Tp. Dĩ An, tỉnh Bình Dương',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '30',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '°C',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  )
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/weather.png',
                            width: 80,
                            height: 80,
                          )
                        ],
                      ),
                      Divider(
                        height: 1,
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                      const SizedBox(height: 8),
                      const Text('Thời tiết khá là nóng')
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text('Công việc hôm nay',
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
                                              ?.copyWith(color: Colors.white),
                                        ),
                                        Text(
                                          task['progress']!,
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
                                      value: double.parse(task['progress']!
                                              .replaceAll('%', '')) /
                                          100,
                                      backgroundColor: Colors.white30,
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                              Colors.white),
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
        ),
      ),
    );
  }
}
