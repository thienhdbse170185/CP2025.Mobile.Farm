import 'package:flutter/material.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({super.key});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: Text('Cài đặt'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text('Thông báo'),
              ),
              ListTile(
                title: Text('Ngôn ngữ'),
              ),
              ListTile(
                title: Text('Đổi mật khẩu'),
              ),
            ],
          ),
        ));
  }
}
