import 'package:flutter/services.dart';

class NativeService {
  static const MethodChannel _channel =
      MethodChannel('com.example.signalr_service');

  static Future<void> startService() async {
    await _channel.invokeMethod('startService');
  }

  static Future<void> stopService() async {
    await _channel.invokeMethod('stopService');
  }
}
