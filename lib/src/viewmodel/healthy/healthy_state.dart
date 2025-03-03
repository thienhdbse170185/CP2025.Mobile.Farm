part of 'healthy_cubit.dart';

@freezed
class HealthyState with _$HealthyState {
  const factory HealthyState.initial() = _Initial;

  const factory HealthyState.createLoading() = _Loading;
  const factory HealthyState.createSuccess(MedicalSymptomDto medicalSymptom) =
      _Success;
  const factory HealthyState.createFailure(String error) = _Failure;
}
