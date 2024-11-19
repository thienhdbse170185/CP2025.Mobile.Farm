import 'package:flutter/material.dart';
import 'package:smart_farm/src/view/home/home.dart';
import 'package:smart_farm/src/view/profile/profile.dart';
import 'package:smart_farm/src/view/task/task.dart';
import 'package:smart_farm/src/view/ticket/ticket.dart';

class TabsWidget extends StatefulWidget {
  const TabsWidget({super.key});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const HomeWidget(),
      const TaskWidget(),
      const TicketWidget(),
      const ProfileWidget(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _widgetOptions),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? const Icon(Icons.home_rounded)
                  : const Icon(Icons.home_outlined),
              label: 'Trang chủ'),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? const Icon(Icons.task_rounded)
                  : const Icon(Icons.task_outlined),
              label: 'Task'),
          BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? const Icon(Icons.info)
                  : const Icon(Icons.info_outline_rounded),
              label: 'Vấn đề'),
          BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? const Icon(Icons.account_circle_rounded)
                  : const Icon(Icons.account_circle_outlined),
              label: 'Cá nhân'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedFontSize: 12,
        unselectedFontSize: 12,
      ),
    );
  }
}
