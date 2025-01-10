import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:smart_farm/src/core/constants/user_data_constant.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(const UserState.initial()) {
    on<UserEvent>((event, emit) {});
    on<_GetUserProfile>((event, emit) async {
      emit(const UserState.getUserProfileInProgress());
      try {
        final userBox = await Hive.openBox(UserDataConstant.userBoxName);
        final userName = userBox.get(UserDataConstant.userNameKey);
        final email = userBox.get(UserDataConstant.emailKey);
        emit(UserState.getUserProfileSuccess(userName, email));
      } catch (e) {
        emit(UserState.getUserProfileFailure(e.toString()));
      }
    });
  }
}
