import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/view/home/home.dart';
import 'package:smart_farm/src/view/profile/profile.dart';
import 'package:smart_farm/src/view/symptom/cage_option.dart';
import 'package:smart_farm/src/view/task/task.dart';
import 'package:smart_farm/src/view/ticket/ticket.dart';
import 'package:smart_farm/src/view/widgets/qr_scanner.dart';

class TabsWidget extends StatefulWidget {
  const TabsWidget({super.key});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;
  final List<CageOption> _cages = [];

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
    if (index == 2) {
      // Show QR Scanner in dialog
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => QRScannerWidget(
            title: 'Quét mã QR chuồng',
            instruction: 'Đặt mã QR vào khung hình để quét',
            helperText: 'Mã QR được dán trên chuồng',
            onScanned: (String qrCode) {
              log("QR Code: $qrCode");
              final cage = _cages.firstWhere(
                (cage) => cage.id == qrCode,
                orElse: () => CageOption(id: '', name: ''),
              );

              if (cage.id.isNotEmpty) {
                context.push(RouteName.taskQRCode, extra: cage);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Icon(Icons.error_outline, color: Colors.white),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                              'Không tìm thấy thông tin chuồng, hãy thử lại.'),
                        ),
                      ],
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Theme.of(context).colorScheme.error,
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height - 150,
                      left: 16,
                      right: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    dismissDirection: DismissDirection.horizontal,
                    action: SnackBarAction(
                      label: 'Đóng',
                      textColor: Colors.white,
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
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
          // QR Scanner button
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
                size: 24,
              ),
            ),
            label: 'Quét QR',
          ),
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
