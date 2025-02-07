import 'dart:developer';

import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          leading: Icon(Icons.search),
          hintText: 'Tìm kiếm theo tên công việc...',
          onChanged: (value) {
            log(value);
          },
          onSubmitted: (value) {
            log(value);
          },
          onTap: () {
            log('[ON_TAP_EVENT] onTap taped!');
          },
          onTapOutside: (event) {
            log('[ON_TAP_OUTSIDE_EVENT] onTapOutside taped!');
          },
        ),
      ),
    );
  }
}
