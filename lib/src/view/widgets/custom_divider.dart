import 'package:flutter/material.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.outline.withOpacity(0.05),
      height: 4,
      width: MediaQuery.of(context).size.width,
    );
  }
}
