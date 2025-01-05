import 'package:bloc/bloc.dart';
import 'package:data_layer/model/dto/symptom/symptom.dart';
import 'package:data_layer/repository/symptom/symptom_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'symptom_cubit.freezed.dart';
part 'symptom_state.dart';

class SymptomCubit extends Cubit<SymptomState> {
  SymptomCubit({required this.symptomRepository})
      : super(SymptomState.initial());

  final SymptomRepository symptomRepository;

  Future<void> getSymptoms() async {
    emit(SymptomState.getSymptomsInProgress());
    try {
      final symptoms = await symptomRepository.getSymptoms();
      emit(SymptomState.getSymptomsSuccess(symptoms));
    } catch (e) {
      emit(SymptomState.getSymptomsFailure(e.toString()));
    }
  }
}
