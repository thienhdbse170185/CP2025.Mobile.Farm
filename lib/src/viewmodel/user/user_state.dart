part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;

  const factory UserState.getUserProfileInProgress() =
      _GetUserProfileInProgress;
  const factory UserState.getUserProfileSuccess(String userName, String email) =
      _GetUserProfileSuccess;
  const factory UserState.getUserProfileFailure(String message) =
      _GetUserProfileFailure;

  const factory UserState.getServerTimeInProgress() = _GetServerTimeInProgress;
  const factory UserState.getServerTimeSuccess(String serverTime) =
      _GetServerTimeSuccess;
  const factory UserState.getServerTimeFailure(String message) =
      _GetServerTimeFailure;

  const factory UserState.updateDeviceTokenInProgress() =
      _UpdateDeviceTokenInProgress;
  const factory UserState.updateDeviceTokenSuccess() =
      _UpdateDeviceTokenSuccess;
  const factory UserState.updateDeviceTokenFailure(String message) =
      _UpdateDeviceTokenFailure;

  const factory UserState.sendOTPInProgress() = _SendOTPInProgress;
  const factory UserState.sendOTPSuccess(String email) = _SendOTPSuccess;
  const factory UserState.sendOTPFailure(String message) = _SendOTPFailure;

  const factory UserState.updatePasswordInProgress() =
      _UpdatePasswordInProgress;
  const factory UserState.updatePasswordSuccess() = _UpdatePasswordSuccess;
  const factory UserState.updatePasswordFailure(String message) =
      _UpdatePasswordFailure;

  const factory UserState.verifyOTPInProgress() = _VerifyOTPInProgress;
  const factory UserState.verifyOTPSuccess() = _VerifyOTPSuccess;
  const factory UserState.verifyOTPFailure(String message) = _VerifyOTPFailure;
}
