import 'package:flutter/material.dart';

class TaskInfoGridItem extends StatelessWidget {
  final Widget? icon;
  final String label;
  final String value;
  final Color? color;
  final bool isDot;
  final int maxLength;

  const TaskInfoGridItem({
    super.key,
    this.icon,
    required this.label,
    required this.value,
    this.color,
    this.isDot = true,
    this.maxLength = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null)
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color ?? Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: icon,
          ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.outline,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value.length > maxLength && isDot
                  ? '${value.substring(0, maxLength)}...'
                  : value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
