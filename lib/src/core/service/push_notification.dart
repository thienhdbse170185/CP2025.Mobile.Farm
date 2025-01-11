import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/view/notification/test.dart';

class PushNotifications {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // Request notification permission
  static Future<void> init() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );
  }

  // Get the FCM device token
  static Future<String?> getDeviceToken({int maxRetries = 3}) async {
    try {
      String? token = await _firebaseMessaging.getToken();
      log('===== DEVICE TOKEN =====');
      log("FCM device token: $token");
      return token;
    } catch (e) {
      log("Failed to get device token: $e");
      if (maxRetries > 0) {
        log("Retrying in 10 seconds...");
        await Future.delayed(const Duration(seconds: 10));
        return getDeviceToken(maxRetries: maxRetries - 1);
      } else {
        return null;
      }
    }
  }

  // Initialize local notifications
  static Future<void> localNotiInit() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    // Request notification permissions for Android 13 or above
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onNotificationTap,
      onDidReceiveBackgroundNotificationResponse: onNotificationTap,
    );
  }

  // Handle notification tap
  static void onNotificationTap(NotificationResponse notificationResponse) {
    // navigatorKey.currentState?.pushNamed("/cage");
    log('===== NOTIFICATION TAP =====');
    log('Payload: ${notificationResponse.payload}');
    Navigator.push(
        rootNavigatorKey.currentState!.context,
        MaterialPageRoute(
            builder: (context) => const TestNotificationWidget()));
  }

  // Show a simple notification
  static Future<void> showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      icon: '@mipmap/ic_launcher',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }
}
