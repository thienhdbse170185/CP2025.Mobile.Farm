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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: const Text('Cài đặt'),
      ),
      body: const Center(child: Text('Màn hình Setting')),
    );
  }
}
