part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.appStarted() = _AppStarted;
  const factory AuthEvent.login(
      {required String username, required String password}) = _Login;
  const factory AuthEvent.logout() = _Logout;
}
