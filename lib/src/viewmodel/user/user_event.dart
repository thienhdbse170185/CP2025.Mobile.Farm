part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.started() = _Started;
  const factory UserEvent.getUserProfile() = _GetUserProfile;
  const factory UserEvent.getServerTime() = _GetServerTime;
  const factory UserEvent.updateDeviceToken() = _UpdateDeviceToken;
  const factory UserEvent.sendOTP({required bool isResend}) = _SendOTP;
  const factory UserEvent.updatePassword({
    required String oldPassword,
    required String newPassword,
  }) = _UpdatePassword;
  const factory UserEvent.verifyOTP(
      {required String email, required String otp}) = _VerifyOTP;
}
