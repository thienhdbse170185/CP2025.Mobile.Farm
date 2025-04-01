part of 'vaccine_cubit.dart';

@freezed
class VaccineState with _$VaccineState {
  const factory VaccineState.initial() = _Initial;

  const factory VaccineState.getVaccineByIdInProgress() =
      _GetVaccineByIdInProgress;
  const factory VaccineState.getVaccineByIdSuccess(VaccineDto vaccine) =
      _GetVaccineByIdSuccess;
  const factory VaccineState.getVaccineByIdFailure(String error) =
      _GetVaccineByIdFailure;
}
