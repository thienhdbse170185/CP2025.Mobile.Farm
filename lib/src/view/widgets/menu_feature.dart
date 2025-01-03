import 'package:flutter/material.dart';

class MenuFeatureWidget extends StatelessWidget {
  final String title;
  final Widget icon;
  const MenuFeatureWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Theme.of(context).colorScheme.primaryContainer,
              width: 1,
            ),
            color:
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
          ),
          child: icon,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13),
        ),
      ],
    );
  }
}
