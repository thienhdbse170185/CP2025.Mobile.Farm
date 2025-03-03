part of 'vaccine_schedule_log_cubit.dart';

@freezed
class VaccineScheduleLogState with _$VaccineScheduleLogState {
  const factory VaccineScheduleLogState.initial() = _Initial;

  const factory VaccineScheduleLogState.createVaccineScheduleLogInProgress() =
      _CreateVaccineScheduleLogInProgress;
  const factory VaccineScheduleLogState.createVaccineScheduleLogSuccess() =
      _CreateVaccineScheduleLogSuccess;
  const factory VaccineScheduleLogState.createVaccineScheduleLogFailure(
      String error) = _CreateVaccineScheduleLogFailure;

  const factory VaccineScheduleLogState.getVaccineScheduleLogByTaskIdInProgress() =
      _GetVaccineScheduleLogByTaskIdInProgress;
  const factory VaccineScheduleLogState.getVaccineScheduleLogByTaskIdSuccess(
          VaccineScheduleLogDto vaccineScheduleLog) =
      _GetVaccineScheduleLogByTaskIdSuccess;
  const factory VaccineScheduleLogState.getVaccineScheduleLogByTaskIdFailure(
      String error) = _GetVaccineScheduleLogByTaskIdFailure;
}
