import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
          child: Column(children: [
        CircularProgressIndicator(),
        const SizedBox(height: 8),
        const Text('Đang tải báo cáo...')
      ])),
    );
  }
}
