import 'package:flutter/material.dart';

class TicketWidget extends StatefulWidget {
  const TicketWidget({super.key});

  @override
  State<TicketWidget> createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ticket')),
      body: const Center(child: Text('Ticket')),
    );
  }
}
