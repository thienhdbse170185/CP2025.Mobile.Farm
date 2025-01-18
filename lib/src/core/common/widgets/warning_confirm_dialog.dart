import 'package:flutter/material.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';

class WarningConfirmationDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final String secondaryButtonText;
  final String primaryButtonText;
  final VoidCallback onPrimaryButtonPressed;
  final VoidCallback onSecondaryButtonPressed;
  const WarningConfirmationDialog({
    super.key,
    required this.title,
    required this.content,
    required this.secondaryButtonText,
    required this.primaryButtonText,
    required this.onPrimaryButtonPressed,
    required this.onSecondaryButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: LinearIcons.warningAboutIcon,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          content,
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: OutlinedButton(
                  onPressed: onSecondaryButtonPressed,
                  child: Text(secondaryButtonText),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.32,
                child: FilledButton(
                  onPressed: onPrimaryButtonPressed,
                  child: Text(primaryButtonText),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
