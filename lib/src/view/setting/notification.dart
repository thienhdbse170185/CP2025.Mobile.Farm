import 'package:flutter/material.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';

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
      appBar: CustomAppBar(
        leading: IconButton(
          icon: LinearIcons.arrowBackIcon,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Cài đặt thông báo'),
        centerTitle: true,
      ),
      body: const Center(child: Text('Notification Setting screen')),
    );
  }
}
