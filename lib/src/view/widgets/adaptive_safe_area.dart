import 'package:flutter/material.dart';

class AdaptiveSafeArea extends StatelessWidget {
  final Widget child;
  const AdaptiveSafeArea({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    bool hasNavigationBar = MediaQuery.of(context).viewInsets.bottom > 0;
    if (hasNavigationBar) {
      return SafeArea(
        top: false,
        child: child,
      );
    }
    return child;
  }
}
