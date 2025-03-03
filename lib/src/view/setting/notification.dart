import 'package:flutter/material.dart';

class NotificationSettingWidget extends StatefulWidget {
  const NotificationSettingWidget({super.key});

  @override
  State<NotificationSettingWidget> createState() =>
      _NotificationSettingWidgetState();
}

class _NotificationSettingWidgetState extends State<NotificationSettingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Cài đặt thông báo'),
      ),
      body: const Center(child: Text('Notification Setting screen')),
    );
  }
}
