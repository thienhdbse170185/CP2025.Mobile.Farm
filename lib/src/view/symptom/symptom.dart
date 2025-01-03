import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';

class SymptomWidget extends StatefulWidget {
  const SymptomWidget({super.key});

  @override
  State<SymptomWidget> createState() => _SymptomWidgetState();
}

class _SymptomWidgetState extends State<SymptomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('D/s triệu chứng đã tạo'),
        leading: IconButton(
          icon: LinearIcons.arrowBackIcon,
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Center(
        child: Text('List symptom screen'),
      ),
    );
  }
}
