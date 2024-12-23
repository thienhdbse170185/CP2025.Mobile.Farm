import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/view/export.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> setupNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@drawable/ic_launcher_foreground');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) async {
      if (notificationResponse.payload != null) {
        log("[NOTIFICATION_CLICK] Payload: ${notificationResponse.payload}");
        Navigator.push(
            rootNavigatorKey.currentState!.context,
            MaterialPageRoute(
                builder: (context) => const TaskDetailWidget(
                      taskId: 'ee9d45db-671c-4904-86f2-76a77fd40ea5',
                    )));
      }
    },
  );

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
}
