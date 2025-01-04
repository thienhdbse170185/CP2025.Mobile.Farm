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
}
