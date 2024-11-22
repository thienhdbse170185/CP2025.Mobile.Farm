import 'package:flutter/material.dart';

class WarehouseWidget extends StatefulWidget {
  const WarehouseWidget({super.key});

  @override
  State<WarehouseWidget> createState() => _WarehouseWidgetState();
}

class _WarehouseWidgetState extends State<WarehouseWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kho của bạn')),
      body: const Center(
        child: Text('Màn hình kho'),
      ),
    );
  }
}
