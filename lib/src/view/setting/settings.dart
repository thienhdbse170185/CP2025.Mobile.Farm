import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({super.key});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(
          title: Text('Cài đặt'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  context.push(RouteName.timeSetting);
                },
                leading: const Icon(Icons.timelapse_rounded),
                title: const Text('Đổi ngày giờ'),
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
            ],
          ),
        ));
  }
}
