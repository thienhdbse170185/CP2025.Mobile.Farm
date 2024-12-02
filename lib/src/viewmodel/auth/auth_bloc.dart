import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginStarted>(_onLoginStarted);
  }

  Future<void> _onLoginStarted(
      LoginStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoginInProgress());
    try {
      final userId = await authRepository.login(event.username, event.password);
      emit(AuthSuccess(userId));
    } catch (error) {
      emit(AuthFailure(error.toString()));
    }
  }
}
