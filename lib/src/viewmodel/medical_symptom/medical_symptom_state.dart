part of 'medical_symptom_cubit.dart';

@freezed
class MedicalSymptomState with _$MedicalSymptomState {
  const factory MedicalSymptomState.initial() = _Initial;

  const factory MedicalSymptomState.getMedicalSymptomsByBatchInProress() =
      _GetMedicalSymptomsByBatchInProress;
  const factory MedicalSymptomState.getMedicalSymptomsByBatchSuccess(
          List<MedicalSymptomDto> medicalSymptoms) =
      _GetMedicalSymptomsByBatchSuccess;
  const factory MedicalSymptomState.getMedicalSymptomsByBatchFailure(
      String message) = _GetMedicalSymptomsByBatchFailure;
}
