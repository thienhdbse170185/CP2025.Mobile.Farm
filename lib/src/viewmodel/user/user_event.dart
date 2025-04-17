part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.started() = _Started;
  const factory UserEvent.getUserProfile({@Default(false) bool isAppStart}) =
      _GetUserProfile;
  const factory UserEvent.getServerTime() = _GetServerTime;
  const factory UserEvent.updateDeviceToken() = _UpdateDeviceToken;
  const factory UserEvent.sendOTP(
      {required String username,
      required bool isResend,
      String? email}) = _SendOTP;
  const factory UserEvent.sendOTPSms(
      {String? phoneNumber,
      required String username,
      required bool isResend}) = _SendOTPSms;
  const factory UserEvent.updatePassword({
    required String oldPassword,
    required String newPassword,
  }) = _UpdatePassword;
  const factory UserEvent.verifyOTP(
      {required String email, required String otp}) = _VerifyOTP;
  const factory UserEvent.getUserProfileByUserId() = _GetUserProfileByUserId;
}
