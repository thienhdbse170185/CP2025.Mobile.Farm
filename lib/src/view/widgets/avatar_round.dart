import 'package:flutter/material.dart';

class AvatarRoundWidget extends StatelessWidget {
  const AvatarRoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      child: const CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage('assets/images/avatar.png'),
      ),
    );
  }
}
