import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/symptom/symptom.dart';
import 'package:smart_farm/src/model/repository/symptom/symptom_repository.dart';

part 'symptom_cubit.freezed.dart';
part 'symptom_state.dart';

class SymptomCubit extends Cubit<SymptomState> {
  SymptomCubit({required this.symptomRepository})
      : super(const SymptomState.initial());

  final SymptomRepository symptomRepository;

  Future<void> getSymptoms() async {
    emit(const SymptomState.getSymptomsInProgress());
    try {
      final symptoms = await symptomRepository.getSymptoms();
      emit(SymptomState.getSymptomsSuccess(symptoms));
    } catch (e) {
      emit(SymptomState.getSymptomsFailure(e.toString()));
    }
  }
}
