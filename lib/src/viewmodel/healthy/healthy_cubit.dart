import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'healthy_state.dart';
part 'healthy_cubit.freezed.dart';

class HealthyCubit extends Cubit<HealthyState> {
  HealthyCubit() : super(const HealthyState.initial());
}
