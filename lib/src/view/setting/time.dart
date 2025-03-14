import 'package:flutter/material.dart';
import 'package:smart_farm/src/core/utils/date_util.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';

class TimeSettingWidget extends StatefulWidget {
  const TimeSettingWidget({super.key});

  @override
  State<TimeSettingWidget> createState() => _TimeSettingWidgetState();
}

class _TimeSettingWidgetState extends State<TimeSettingWidget> {
  DateTime _currentDateTime = TimeUtils.customNow();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đổi ngày giờ'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Chọn ngày giờ muốn đổi'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _currentDateTime,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(_currentDateTime),
                  );
                  if (pickedTime != null) {
                    setState(() {
                      _currentDateTime = DateTime(
                        pickedDate.year,
                        pickedDate.month,
                        pickedDate.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                    });
                  }
                }
              },
              child: Text('Chọn ngày giờ'),
            ),
            const SizedBox(height: 16),
            Text(
                'Ngày giờ hiện tại: ${CustomDateUtils.formatDate(_currentDateTime)}'),
          ],
        ),
      ),
    );
  }
}
