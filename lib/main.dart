import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:smart_farm/firebase_options.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/core/service/push_notification.dart';

import 'src/app.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.notification != null) {
    log('===== BACKGROUND MESSAGE =====');
    log('Background message: ${message.notification!.body}');
  }
}

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting('vi_VN', null);
  await Hive.initFlutter();
  await PushNotifications.init();

  if (!kIsWeb) {
    await PushNotifications.localNotiInit();
  }

  // Listen to background notifications
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // On background notification tapped
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    String payloadData = jsonEncode(message.data);
    if (message.notification != null) {
      log('===== ON MESSAGE OPENED APP =====');
      log('Message opened app: ${message.notification!.body}');
      log('Payload data: $payloadData');
      Navigator.of(rootNavigatorKey.currentContext!)
          .pushNamed(RouteName.testNotification);
    }
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    String payloadData = jsonEncode(message.data);
    log('===== ON MESSAGE =====');
    if (message.notification != null) {
      PushNotifications.showSimpleNotification(
          title: message.notification!.title!,
          body: message.notification!.body!,
          payload: payloadData);
    }
  });

  PushNotifications.getDeviceToken();
  runApp(const MyApp());
}
