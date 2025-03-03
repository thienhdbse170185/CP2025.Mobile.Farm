part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.success() = _Success;
  const factory AuthState.failure(String message) = _Failure;
  const factory AuthState.logoutSuccess() = _LogoutSuccess;

  const factory AuthState.appStartedInProgress() = _AppStartedInProgress;
  const factory AuthState.appStartedSuccess() = _AppStartedSuccess;
  const factory AuthState.appStartedFailure(String message) =
      _AppStartedFailure;
}
