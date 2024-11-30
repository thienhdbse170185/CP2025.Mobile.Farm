import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:signalr_core/signalr_core.dart';

import 'src/app.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final hubConnection = HubConnectionBuilder()
    .withUrl('YOUR_SIGNALR_URL') // Replace with your SignalR URL
    .build(); // Initialize SignalR connection

// function to listen to background changes
void _signalRBackgroundMessage(List<Object?>? message) {
  if (message != null &&
      (message[0] as Map<String, dynamic>)['notification'] != null) {
    log("Some notification Received in background...");
  }
}

// to handle notification on foreground on web platform
void showNotification({required String title, required String body}) {
  showDialog(
    context: navigatorKey.currentContext!,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Ok"))
      ],
    ),
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('vi_VN', null);
  await Hive.initFlutter();

  await hubConnection.start(); // Start SignalR connection

  hubConnection.on('ReceiveMessage', (message) {
    String payloadData = jsonEncode(message);
    log("Got a message in foreground");
    if (message != null) {
      if (kIsWeb) {
        showNotification(title: message[0]['title'], body: message[0]['body']);
      } else {
        // Replace with your local notification logic
        log("Notification: ${message[0]['title']} - ${message[0]['body']}");
      }
    }
  });

  // Listen to background notifications
  hubConnection.on(
      'BackgroundMessage', (message) => _signalRBackgroundMessage(message));

  // on background notification tapped
  hubConnection.on('MessageOpenedApp', (message) {
    if (message != null) {
      log("Background Notification Tapped");
      navigatorKey.currentState!.pushNamed("/cage");
    }
  });

  // for handling in terminated state
  // Implement your logic to handle terminated state notifications if needed

  runApp(const MyApp());
}
