import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String? title;
  const LoadingWidget({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      CircularProgressIndicator(),
      const SizedBox(height: 8),
      Text(title ?? 'Đang tải...',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ))
    ]));
  }
}
