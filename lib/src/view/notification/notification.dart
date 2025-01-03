import 'package:flutter/material.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: Text(
          'Thông báo',
          style:
              Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 22),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.4)),
                width: 180,
                height: 180,
                child: Icon(
                  Icons.inbox_outlined,
                  color: Theme.of(context).primaryColor.withOpacity(0.4),
                  size: 100,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Chưa có thông báo',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.outlineVariant),
              )
            ],
          ),
        ),
      ),
    );
  }
}
