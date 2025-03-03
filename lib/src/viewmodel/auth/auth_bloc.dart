import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:data_layer/repository/auth/auth_repository.dart';
import 'package:data_layer/repository/user/local/user_repository.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:smart_farm/src/core/constants/auth_data_constant.dart';
import 'package:smart_farm/src/core/constants/user_data_constant.dart';
import 'package:smart_farm/src/core/utils/jwt_decoder.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  AuthBloc({
    required this.authRepository,
    required this.userRepository,
  }) : super(const _Initial()) {
    on<_AppStarted>((event, emit) async {
      emit(const AuthState.appStartedInProgress());
      log('[APP_STARTED] Đang khởi tạo dữ liệu cần thiết...');
      try {
        // get user info
        final authBox = await Hive.openBox(AuthDataConstant.authBoxName);
        final accessToken = authBox.get(AuthDataConstant.accessTokenKey);
        final decodedToken = JwtDecoder.decode(accessToken);

        // put userInfo to userBox
        final userBox = await Hive.openBox(UserDataConstant.userBoxName);
        userBox.putAll({
          UserDataConstant.userIdKey: decodedToken['nameid'],
          UserDataConstant.emailKey: decodedToken['email'],
          UserDataConstant.roleKey: decodedToken['role'],
          UserDataConstant.userNameKey: decodedToken['unique_name'],
          // UserDataConstant.serverTimeKey: dateTime,
        });

        if (accessToken != null && accessToken.isNotEmpty) {
          // await setupNotifications();
          // final signalRService =
          //     SignalRService(flutterLocalNotificationsPlugin);
          // await signalRService.connect(
          //     accessToken, dotenv.env['BASE_SIGNALR_URL']!);
          emit(const AuthState.appStartedSuccess());
        } else {
          emit(const AuthState.appStartedFailure(
              'Có lỗi xảy ra khi giải mã token'));
        }
      } catch (e) {
        log("Error: $e");
        emit(AuthState.appStartedFailure(e.toString()));
      }
    });

    on<_Login>((event, emit) async {
      emit(const AuthState.loading());
      try {
        final loginTokens =
            await authRepository.login(event.username, event.password);
        final box = await Hive.openBox(AuthDataConstant.authBoxName);
        log('[LOGIN] accessToken: ${loginTokens.accessToken}');
        log('[LOGIN] refreshToken: ${loginTokens.refreshToken}');
        await box.put(AuthDataConstant.accessTokenKey, loginTokens.accessToken);
        await box.put(
          AuthDataConstant.refreshTokenKey,
          loginTokens.refreshToken,
        );
        emit(const AuthState.success());
      } catch (e) {
        emit(AuthState.failure(e.toString()));
      }
    });

    on<_Logout>((event, emit) async {
      emit(const AuthState.loading());

      final box = await Hive.openBox(AuthDataConstant.authBoxName);
      box.deleteAll([
        AuthDataConstant.accessTokenKey,
        AuthDataConstant.refreshTokenKey,
      ]);

      final userBox = await Hive.openBox(UserDataConstant.userBoxName);
      userBox.deleteAll([
        UserDataConstant.userIdKey,
        UserDataConstant.emailKey,
        UserDataConstant.roleKey,
        UserDataConstant.userNameKey
      ]);

      emit(const AuthState.logoutSuccess());
    });
  }
}
