part of 'vaccine_schedule_cubit.dart';

@freezed
class VaccineScheduleState with _$VaccineScheduleState {
  const factory VaccineScheduleState.initial() = _Initial;

  const factory VaccineScheduleState.getVaccineScheduleByStageIdInProgress() =
      _GetVaccineScheduleByStageIdInProgress;
  const factory VaccineScheduleState.getVaccineScheduleByStageIdSuccess(
          List<VaccineScheduleDto> vaccineSchedule) =
      _GetVaccineScheduleByStageIdSuccess;
  const factory VaccineScheduleState.getVaccineScheduleByStageIdFailure(
      String error) = _GetVaccineScheduleByStageIdFailure;

  const factory VaccineScheduleState.getVaccineScheduleByIdInProgress() =
      _GetVaccineScheduleByIdInProgress;
  const factory VaccineScheduleState.getVaccineScheduleByIdSuccess(
      VaccineScheduleDto vaccineSchedule) = _GetVaccineScheduleByIdSuccess;
  const factory VaccineScheduleState.getVaccineScheduleByIdFailure(
      String error) = _GetVaccineScheduleByIdFailure;
}
