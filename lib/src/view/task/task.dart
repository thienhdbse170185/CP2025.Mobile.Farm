import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/router.dart'; // For formatting the selected date

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  DateTime selectedDate = DateTime.now(); // Store the selected date

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    onPressed: () {},
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
            const SizedBox(height: 24),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.14,
              child: GridView.builder(
                itemCount: taskCards.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) {
                  final task = taskCards[index];
                  return Card(
                    color: task['color'],
                    child: Stack(
                      children: [
                        Positioned(
                          top: -20,
                          left: -20,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -20,
                          right: -20,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                task['icon'],
                                size: 32,
                                color: Colors.white,
                              ),
                              Text(
                                task['title'],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Danh sách công việc',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.sort_rounded)),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasksByDate[formattedDate]?.length ?? 0,
                itemBuilder: (context, index) {
                  final task = tasksByDate[formattedDate]![index];
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
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
