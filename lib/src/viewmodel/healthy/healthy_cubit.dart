import 'package:bloc/bloc.dart';
import 'package:data_layer/model/dto/medical_symptom/medical_symptom.dart';
import 'package:data_layer/model/request/symptom/create_symptom/create_symptom_request.dart';
import 'package:data_layer/repository/healthy/healthy_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'healthy_cubit.freezed.dart';
part 'healthy_state.dart';

class HealthyCubit extends Cubit<HealthyState> {
  final HealthyRepository healthyRepository;

  HealthyCubit({required this.healthyRepository})
      : super(const HealthyState.initial());

  Future<void> createSymptom(CreateSymptomRequest request) async {
    try {
      emit(const HealthyState.createLoading());
      final response = await healthyRepository.create(request);
      emit(HealthyState.createSuccess(response));
    } catch (e) {
      emit(HealthyState.createFailure(e.toString()));
    }
  }
}
