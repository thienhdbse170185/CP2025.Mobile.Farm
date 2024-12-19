import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:data_layer/repository/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:smart_farm/main.dart';
import 'package:smart_farm/src/core/constants/auth_data_constant.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/core/signalr_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_farm/src/view/export.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(const _Initial()) {
    on<_AppStarted>((event, emit) async {
      final box = await Hive.openBox(AuthDataConstant.authBoxName);
      final accessToken = box.get(AuthDataConstant.accessTokenKey);
      if (accessToken != null && accessToken.isNotEmpty) {
        await _setupNotifications();
        await _connectSignalR(accessToken);
        emit(const AuthState.success());
      } else {
        emit(const AuthState.initial());
      }
    });

    on<_Login>((event, emit) async {
      emit(const AuthState.loading());
      try {
        final loginTokens =
            await authRepository.login(event.username, event.password);
        final box = await Hive.openBox(AuthDataConstant.authBoxName);
        await box.put(AuthDataConstant.accessTokenKey, loginTokens.accessToken);
        await box.put(
            AuthDataConstant.refreshTokenKey, loginTokens.refreshToken);
        emit(const AuthState.success());
      } catch (e) {
        emit(AuthState.failure(e.toString()));
      }
    });

    on<_Logout>((event, emit) async {
      emit(const AuthState.loading());
      final box = await Hive.openBox(AuthDataConstant.authBoxName);
      await box.delete(AuthDataConstant.accessTokenKey);
      await box.delete(AuthDataConstant.refreshTokenKey);
      emit(const AuthState.logoutSuccess());
    });
  }

  Future<void> _setupNotifications() async {
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
          // rootNavigatorKey.currentState?.pushNamed(RouteName.taskDetail);
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

  Future<void> _connectSignalR(String accessToken) async {
    final signalRService = SignalRService(flutterLocalNotificationsPlugin);
    await signalRService.connect(
        accessToken, "${dotenv.env['BASE_SIGNALR_URL']}");
  }
}
