import 'package:flutter/material.dart';

class StatusNotificationWidget extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String message;
  final Color? backgroundColor;

  const StatusNotificationWidget({
    super.key,
    required this.iconData,
    required this.iconColor,
    required this.message,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            color: iconColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: iconColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
