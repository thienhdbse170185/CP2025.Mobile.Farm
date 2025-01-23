part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.started() = _Started;
  const factory UserEvent.getUserProfile() = _GetUserProfile;
  const factory UserEvent.getServerTime() = _GetServerTime;
}
