import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:smart_farm/src/core/constants/auth_data_constant.dart';
import 'package:smart_farm/src/core/constants/user_data_constant.dart';
import 'package:smart_farm/src/core/service/push_notification.dart';
import 'package:smart_farm/src/core/utils/jwt_decoder.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(const UserState.initial()) {
    on<UserEvent>((event, emit) {});
    on<_GetUserProfile>((event, emit) async {
      emit(const UserState.getUserProfileInProgress());
      try {
        log('[GET_USER_PROFILE] Đang lấy thông tin user...');
        final userBox = await Hive.openBox(UserDataConstant.userBoxName);
        final userName = userBox.get(UserDataConstant.userNameKey);
        final email = userBox.get(UserDataConstant.emailKey);
        final userId = userBox.get(UserDataConstant.userIdKey);
        log('[GET_USER_PROFILE] Lấy thông tin user thành công: $userName - $email - $userId');
        emit(
            UserState.getUserProfileSuccess(userName, email, event.isAppStart));
      } catch (e) {
        log('[GET_USER_PROFILE] Lấy thông tin user thất bại: $e');
        emit(UserState.getUserProfileFailure(e.toString()));
      }
    });
    on<_GetServerTime>((event, emit) async {
      emit(const UserState.getServerTimeInProgress());
      try {
        final userBox = await Hive.openBox(UserDataConstant.userBoxName);
        final serverTime = userBox.get(UserDataConstant.serverTimeKey);
        emit(UserState.getServerTimeSuccess(serverTime));
      } catch (e) {
        emit(UserState.getServerTimeFailure(e.toString()));
      }
    });
    on<_UpdateDeviceToken>((event, emit) async {
      emit(const UserState.updateDeviceTokenInProgress());
      try {
        final userBox = await Hive.openBox(UserDataConstant.userBoxName);
        final userId = userBox.get(UserDataConstant.userIdKey);
        // await PushNotifications.forceRefreshToken();
        final deviceToken = await PushNotifications.getDeviceToken();
        if (deviceToken == null) {
          throw Exception('Failed to get device token');
        }
        final result =
            await userRepository.updateDeviceToken(userId, deviceToken);
        if (result) {
          log('[UPDATE_DEVICE_TOKEN] Device token updated');
          emit(const UserState.updateDeviceTokenSuccess());
        } else {
          emit(const UserState.updateDeviceTokenFailure(
              'Failed to update device token'));
        }
      } catch (e) {
        emit(UserState.updateDeviceTokenFailure(e.toString()));
      }
    });
    on<_SendOTP>((event, emit) async {
      emit(const UserState.sendOTPInProgress());
      try {
        log('[Send_OTP]: Đang lấy email để gửi OTP...');
        String email = '';
        if (event.email == null) {
          final authBox = await Hive.openBox(AuthDataConstant.authBoxName);
          final accessToken = authBox.get(AuthDataConstant.accessTokenKey);
          final decodedToken = JwtDecoder.decode(accessToken);
          email = decodedToken['email'];
        } else {
          email = event.email!;
        }

        log('[Email Send_OTP]: $email');
        final result =
            await userRepository.sendOTP(email, event.username, event.isResend);
        if (result) {
          emit(UserState.sendOTPSuccess(email));
        } else {
          emit(const UserState.sendOTPFailure('Failed to send OTP'));
        }
      } catch (e) {
        emit(UserState.sendOTPFailure(e.toString()));
      }
    });
    on<_VerifyOTP>((event, emit) async {
      emit(const UserState.verifyOTPInProgress());
      try {
        final result =
            await userRepository.verifyOTP(email: event.email, otp: event.otp);
        if (result) {
          emit(const UserState.verifyOTPSuccess());
        } else {
          emit(const UserState.verifyOTPFailure('Failed to verify OTP'));
        }
      } catch (e) {
        emit(UserState.verifyOTPFailure(e.toString()));
      }
    });
    on<_UpdatePassword>((event, emit) async {
      emit(const UserState.updatePasswordInProgress());
      try {
        final authBox = await Hive.openBox(AuthDataConstant.authBoxName);
        final accessToken = authBox.get(AuthDataConstant.accessTokenKey);
        final decodedToken = JwtDecoder.decode(accessToken);
        final userId = decodedToken['nameid'];
        final result = await userRepository.updatePassword(
            userId: userId,
            oldPassword: event.oldPassword,
            newPassword: event.newPassword);
        if (result) {
          emit(const UserState.updatePasswordSuccess());
        } else {
          emit(const UserState.updatePasswordFailure(
              'Failed to update password'));
        }
      } catch (e) {
        emit(UserState.updatePasswordFailure(e.toString()));
      }
    });
  }
}
