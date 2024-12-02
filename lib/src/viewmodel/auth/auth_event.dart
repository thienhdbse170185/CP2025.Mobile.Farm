part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

// Sự kiện khi người dùng bắt đầu quá trình đăng nhập
class LoginStarted extends AuthEvent {
  final String username;
  final String password;

  LoginStarted(this.username, this.password);
}

// Sự kiện khi người dùng đăng xuất
class LogoutRequested extends AuthEvent {}

// Sự kiện khi quá trình đăng nhập thành công
class LoginSucceeded extends AuthEvent {
  final String userId;

  LoginSucceeded(this.userId);
}

// Sự kiện khi quá trình đăng nhập thất bại
class LoginFailed extends AuthEvent {
  final String error;

  LoginFailed(this.error);
}
