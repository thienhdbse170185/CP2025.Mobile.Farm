import 'dart:convert';
import 'dart:developer';

import 'package:data_layer/model/dto/push_notification/custom_data.dart';
import 'package:data_layer/model/dto/push_notification/push_notification_dto.dart';
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
    // Request permission for both Android and iOS
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    // Set up iOS foreground notification presentation options
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
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
    // Android initialization settings
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS initialization settings
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    // Combined initialization settings
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    // Request notification permissions for Android 13 or above
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onNotificationTap,
      onDidReceiveBackgroundNotificationResponse: onNotificationTap,
    );

    // Set up Firebase message handlers
    setupFirebaseMessageHandlers();
  }

  // Set up Firebase message handlers for different app states
  static void setupFirebaseMessageHandlers() {
    // Handle messages when app is in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('===== FOREGROUND MESSAGE =====');
      log('Notification: ${message.notification?.title}');
      log('Data: ${message.data}');

      final customDataPayload = jsonDecode(message.data['customData']);
      final notiData = PushNotificationDto(
        customData: CustomData.fromJson(customDataPayload),
        title: message.data['title'],
      );

      // Show local notification
      showSimpleNotification(
        title: notiData.title,
        body: notiData.customData.Content,
        payload: notiData.customData.toJson().toString(),
      );
    });

    // Handle when notification is opened and app was in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('===== BACKGROUND MESSAGE OPENED =====');
      log('Notification: ${message.notification?.title}');
      log('Data: ${message.data}');

      // Navigate to notification screen
      Navigator.push(
        rootNavigatorKey.currentState!.context,
        MaterialPageRoute(builder: (context) => const TestNotificationWidget()),
      );
    });

    // Handle initial message (app was terminated)
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        log('===== INITIAL MESSAGE =====');
        log('Notification: ${message.notification?.title}');
        log('Data: ${message.data}');

        // Handle navigation after app launch from notification
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.push(
            rootNavigatorKey.currentState!.context,
            MaterialPageRoute(
                builder: (context) => const TestNotificationWidget()),
          );
        });
      }
    });
  }

  // Handle notification tap
  static void onNotificationTap(NotificationResponse notificationResponse) {
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
    // Android notification details
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

    // iOS notification details
    const DarwinNotificationDetails iosNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      sound: 'default',
      badgeNumber: 1,
    );

    // Combined notification details
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }
}
