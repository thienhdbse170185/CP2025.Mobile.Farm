import 'package:flutter/material.dart';

class NewbieLoginWidget extends StatefulWidget {
  const NewbieLoginWidget({super.key});

  @override
  State<NewbieLoginWidget> createState() => _NewbieLoginWidgetState();
}

class _NewbieLoginWidgetState extends State<NewbieLoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Newbie Login'),
      ),
      body: const Center(child: Text('Newbie Login screen')),
    );
  }
}
