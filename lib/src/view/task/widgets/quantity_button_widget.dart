import 'package:flutter/material.dart';

class QuantityButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool isAdd;
  final bool isDisable;

  const QuantityButtonWidget({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.isAdd = false,
    this.isDisable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisable ? 0.5 : 1,
      child: Container(
        decoration: BoxDecoration(
          color:
              isAdd ? Theme.of(context).colorScheme.primary : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          onPressed: isDisable ? null : onPressed,
          icon: Icon(
            icon,
            color: isAdd ? Colors.white : Colors.grey[700],
          ),
          iconSize: 24,
        ),
      ),
    );
  }
}
