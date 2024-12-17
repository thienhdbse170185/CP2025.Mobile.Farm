import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'src/app.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('vi_VN', null);
  await Hive.initFlutter();

  // Initialize flutter_local_notifications
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@drawable/ic_launcher_foreground');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Check notification permission
  final bool? granted = await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.areNotificationsEnabled();

  if (granted != null && !granted) {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  final bool? permissionGranted = await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.areNotificationsEnabled();

  if (permissionGranted != null && !permissionGranted) {
    log("[NOTIFICATION_PERMISSION] Notification permission not granted");
    return;
  }

  log("[CONNECTION_STATUS] Starting SignalR connection...");
  String serverUrl = "${dotenv.env['BASE_SIGNALR_URL']}";
  String accessToken = "${dotenv.env['SIGNALR_ACCESS_TOKEN']}";
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

        if (granted != null && granted) {
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
          log("[FOREGROUND_NOTIFICATION] Notification permission not granted");
        }
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

  runApp(const MyApp());
}
