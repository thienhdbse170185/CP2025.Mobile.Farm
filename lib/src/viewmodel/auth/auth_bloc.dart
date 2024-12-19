import 'package:bloc/bloc.dart';
import 'package:data_layer/repository/auth/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:data_layer/model/entity/user/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const AuthState.loading());
      try {
        final user = await authRepository.login(event.username, event.password);
        emit(AuthState.success(user));
      } catch (e) {
        emit(AuthState.failure(e.toString()));
      }
    });
  }
}
