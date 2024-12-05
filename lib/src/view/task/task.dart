import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/view/widgets/task_card_map.dart'; // Import the TaskCard widget

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  DateTime selectedDate = DateTime.now(); // Store the selected date
  String selectedFilter = 'Phân công cho tôi'; // Default filter

  final List<Map<String, dynamic>> taskCards = [
    {
      'color': Colors.orange[800],
      'icon': Icons.access_time,
      'title': 'Đang làm',
    },
    {
      'color': Colors.green[800],
      'icon': Icons.assignment_turned_in_outlined,
      'title': 'Đã làm',
    },
  ];

  final Map<String, List<Map<String, dynamic>>> tasksByDate = {
    'Dec 06, 2024': [
      {
        'title': 'Cho gà ăn',
        'status': 'Đang làm',
        'location': 'Chuồng gà Trưởng Thành',
        'session': 1,
      },
      {
        'title': 'Làm sạch chuồng',
        'status': 'Đang làm',
        'location': 'Chuồng gà Con',
        'session': 2,
      },
      {
        'title': 'Kiểm tra sức khỏe gà',
        'status': 'Đang làm',
        'location': 'Chuồng gà Con',
        'session': 2,
      },
      {
        'title': 'Cho gà ăn',
        'status': 'Đang làm',
        'location': 'Chuồng gà Đông Tảo',
        'session': 3,
      },
    ],
  };

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

  // Function to group tasks by location
  Map<String, List<Map<String, dynamic>>> get groupedTasks {
    final tasks = tasksByDate[formattedDate] ?? [];
    final grouped = <String, List<Map<String, dynamic>>>{};

    for (final task in tasks) {
      final location = task['location'] as String;
      grouped.putIfAbsent(location, () => []).add(task);
    }
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
    }
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.account_circle_outlined),
              title: const Text('Phân công cho tôi'),
              onTap: () {
                setState(() {
                  selectedFilter = 'Phân công cho tôi';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.people_outline_outlined),
              title: const Text('Tất cả công việc'),
              onTap: () {
                setState(() {
                  selectedFilter = 'Tất cả công việc';
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
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
            Expanded(
              child: tasksByDate[formattedDate]?.isNotEmpty ?? false
                  ? Column(
                      children: [
                        GestureDetector(
                          onTap: () => _showFilterBottomSheet(context),
                          child: Card.outlined(
                            child: ListTile(
                                leading: Icon(
                                  selectedFilter == 'Phân công cho tôi'
                                      ? Icons.account_circle_outlined
                                      : Icons.people_outline_outlined,
                                ),
                                title: Text(selectedFilter,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                subtitle: Text(
                                    '${tasksByDate[formattedDate]?.length} kết quả'),
                                trailing: const Icon(Icons.arrow_drop_down)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: ListView(
                            children: [
                              ..._buildExpansionTiles(groupedTasks),
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
                          ),
                        )
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
    );
  }

  List<Widget> _buildExpansionTiles(
      Map<String, List<Map<String, dynamic>>> tasks) {
    return tasks.entries.map((entry) {
      final location = entry.key;
      final locationTasks = entry.value;

      final morningTasks =
          locationTasks.where((task) => task['session'] == 1).toList();
      final noonTasks =
          locationTasks.where((task) => task['session'] == 2).toList();
      final afternoonTasks =
          locationTasks.where((task) => task['session'] == 3).toList();

      return Container(
        color: Colors.white,
        padding: const EdgeInsets.only(bottom: 16.0),
        child: ExpansionTile(
          title: Text(
            '$location (${locationTasks.where((task) => task['status'] == 'Đã làm').length}/${locationTasks.length})',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          children: [
            if (morningTasks.isNotEmpty) ...[
              SectionHeader(title: 'Buổi sáng (${morningTasks.length})'),
              TaskList(tasks: morningTasks),
            ],
            if (noonTasks.isNotEmpty) ...[
              SectionHeader(title: 'Buổi trưa (${noonTasks.length})'),
              TaskList(tasks: noonTasks),
            ],
            if (afternoonTasks.isNotEmpty) ...[
              SectionHeader(title: 'Buổi chiều (${afternoonTasks.length})'),
              TaskList(tasks: afternoonTasks),
            ],
          ],
        ),
      );
    }).toList();
  }

  List<Map<String, dynamic>> get completedTasks {
    final tasks = tasksByDate[formattedDate] ?? [];
    return tasks.where((task) => task['status'] == 'Đã làm').toList();
  }
}

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
        final isInProgress = task['status'] == 'Đang làm';
        final isCompleted = task['status'] == 'Đã làm';

        return TaskCardMap(
          task: task,
          isCompleted: isCompleted,
          isInProgress: isInProgress,
        );
      },
    );
  }
}
