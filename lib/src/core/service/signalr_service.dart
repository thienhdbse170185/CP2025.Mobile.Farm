import 'dart:convert';
import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:signalr_core/signalr_core.dart';

class SignalRService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  SignalRService(this.flutterLocalNotificationsPlugin);

  Future<void> connect(String accessToken, String serverUrl) async {
    log("[CONNECTION_STATUS] Starting SignalR connection...");
    final hubConnection = HubConnectionBuilder()
        .withUrl(
            serverUrl,
            HttpConnectionOptions(logging: (level, message) {
              log("[LOG_CONNECTION_OPTION] $level: $message");
            }, accessTokenFactory: () async {
              return accessToken;
            })) // Replace with your SignalR URL
        .build(); // Initialize SignalR connection

    hubConnection.on('ReceiveNotification', (message) async {
      String payloadData = jsonEncode(message);
      log("[FOREGROUND_NOTIFICATION] Got a message in foreground");
      try {
        if (message != null) {
          log("[FOREGROUND_NOTIFICATION] Notification: ${message[0]}");
          log("[FOREGROUND_NOTIFICATION] Payload: $payloadData");

          // Create a push notification
          const AndroidNotificationDetails androidPlatformChannelSpecifics =
              AndroidNotificationDetails(
            'test_channel_id',
            'Test notifications',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false,
          );
          const NotificationDetails platformChannelSpecifics =
              NotificationDetails(android: androidPlatformChannelSpecifics);
          await flutterLocalNotificationsPlugin.show(
            0,
            'Có thông báo mới!',
            message[0],
            platformChannelSpecifics,
            payload: payloadData,
          );
        } else {
          log("[FOREGROUND_NOTIFICATION] Message is null");
        }
      } catch (e) {
        log("[FOREGROUND_NOTIFICATION] Error: $e");
      }
    });

    try {
      await hubConnection.start(); // Start SignalR connection
      log("[CONNECTION_STATUS] SignalR connection started successfully");
    } catch (e) {
      log("[CONNECTION_STATUS] Error starting SignalR connection: $e");
    }
  }
}
