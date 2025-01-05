part of 'symptom_cubit.dart';

@freezed
class SymptomState with _$SymptomState {
  const factory SymptomState.initial() = _Initial;
  const factory SymptomState.getSymptomsInProgress() = _GetSymptomsInProgress;
  const factory SymptomState.getSymptomsSuccess(List<SymptomDto> symptoms) =
      _GetSymptomsSuccess;
  const factory SymptomState.getSymptomsFailure(String message) =
      _GetSymptomsFailure;
}
