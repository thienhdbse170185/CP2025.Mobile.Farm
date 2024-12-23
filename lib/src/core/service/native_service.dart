import 'package:flutter/services.dart';

const platform = MethodChannel('com.smartfarm/foreground_service');

Future<void> startForegroundService() async {
  try {
    await platform.invokeMethod('startForegroundService');
  } on PlatformException catch (e) {
    print("Failed to start service: ${e.message}");
  }
}

Future<void> stopForegroundService() async {
  try {
    await platform.invokeMethod('stopForegroundService');
  } on PlatformException catch (e) {
    print("Failed to stop service: ${e.message}");
  }
}
