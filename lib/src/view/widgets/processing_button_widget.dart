import 'package:flutter/material.dart';

class ProcessingButtonWidget extends StatelessWidget {
  final String loadingMessage;
  const ProcessingButtonWidget({super.key, required this.loadingMessage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
          ),
        ),
        const SizedBox(width: 16),
        Text(loadingMessage)
      ],
    );
  }
}
