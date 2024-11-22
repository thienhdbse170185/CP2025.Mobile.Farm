import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_farm/src/core/router.dart';

class CageWidget extends StatefulWidget {
  const CageWidget({super.key});

  @override
  State<CageWidget> createState() => _CageWidgetState();
}

class _CageWidgetState extends State<CageWidget> {
  DateTime selectedDate = DateTime.now(); // Store the selected date

  final Map<String, List<Map<String, dynamic>>> tasksByDate = {
    'Nov 19, 2024': [
      {
        'title': 'Cho gà ăn',
        'status': 'Đã làm',
        'location': 'Chuồng gà Trưởng Thành',
      },
      {
        'title': 'Làm sạch chuồng',
        'status': 'Đã làm',
        'location': 'Chuồng gà Non',
      },
    ],
    'Nov 20, 2024': [
      {
        'title': 'Cho gà ăn',
        'status': 'Đã làm',
        'location': 'Chuồng gà Trưởng Thành',
      },
      {
        'title': 'Vệ sinh chuồng',
        'status': 'Đang làm',
        'location': 'Chuồng gà Trưởng Thành',
      },
      {
        'title': 'Thu hoạch trứng',
        'status': 'Đang làm',
        'location': 'Chuồng gà Trưởng Thành',
      },
      {
        'title': 'Kiểm tra sức khỏe gà',
        'status': 'Đang làm',
        'location': 'Chuồng gà Trưởng Thành',
      },
    ],
  };

  String get formattedDate {
    return DateFormat('MMM dd, yyyy').format(selectedDate);
  }

  // Function to filter tasks by status
  List<Map<String, dynamic>> getTasksByStatus(String status) {
    final tasks = tasksByDate[formattedDate];
    if (tasks == null) return [];
    return tasks.where((task) => task['status'] == status).toList();
  }

  @override
  Widget build(BuildContext context) {
    final doneTasks = getTasksByStatus('Đã làm');
    final inProgressTasks = getTasksByStatus('Đang làm');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết chuồng'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Refresh the task details
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 80, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Card(
                color: Colors.blueAccent,
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
                              Text(
                                'Chuồng gà Trưởng Thành',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                              if (inProgressTasks.isEmpty &&
                                  doneTasks.isEmpty) ...[
                                const SizedBox(height: 8),
                                Text('Không có Task',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.white)),
                                const SizedBox(height: 8)
                              ] else ...[
                                const SizedBox(height: 20),
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
                                              ?.copyWith(color: Colors.white),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(color: Colors.white),
                                            children: [
                                              const TextSpan(text: 'Đã done: '),
                                              TextSpan(
                                                text:
                                                    '${doneTasks.length}', // Số task đã làm
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              TextSpan(
                                                text:
                                                    '/${doneTasks.length + inProgressTasks.length} task.',
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
                                                        inProgressTasks.length)
                                                : 0.0,
                                            backgroundColor: Colors.white30,
                                            valueColor:
                                                const AlwaysStoppedAnimation<
                                                    Color>(Colors.white),
                                          ),
                                        ),
                                        Text(
                                          '${((doneTasks.length / (doneTasks.length + inProgressTasks.length).clamp(1, double.infinity)) * 100).round()}%',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                              const SizedBox(height: 8),
                              ElevatedButton(
                                  onPressed: () {
                                    context.push(RouteName.report);
                                  },
                                  child: const Text('Báo cáo sức khỏe'))
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
              const SizedBox(height: 16),

              if (inProgressTasks.isEmpty && doneTasks.isEmpty) ...[
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
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.4),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Không có công việc nào\n trong hôm nay',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
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
                // In-progress tasks
                SectionHeader(title: 'Đang làm (${inProgressTasks.length})'),
                const SizedBox(height: 8),
                TaskList(tasks: inProgressTasks),

                // Done tasks
                const SizedBox(height: 16),
                SectionHeader(title: 'Đã làm (${doneTasks.length})'),
                const SizedBox(height: 8),
                TaskList(tasks: doneTasks),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// Widget for section headers
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 1,
          color: Theme.of(context).colorScheme.outlineVariant,
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
        Expanded(
          child: Divider(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

// Widget for task lists
class TaskList extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return GestureDetector(
          onTap: () {
            context.push(RouteName.taskDetail);
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Theme.of(context).colorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListTile(
                leading: const Icon(Icons.task_alt_outlined),
                title: Text(task['title'],
                    style: Theme.of(context).textTheme.titleMedium),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trạng thái: ${task['status']}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      task['location'],
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.chevron_right_outlined,
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 24,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
