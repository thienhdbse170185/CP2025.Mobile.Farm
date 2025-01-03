part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.started() = _Started;
  const factory TaskEvent.createTask(String task) = _CreateTask;
  const factory TaskEvent.updateTask(String taskId, String statusId) =
      _UpdateTask;
  const factory TaskEvent.deleteTask(String taskId) = _DeleteTask;
  const factory TaskEvent.getTasks() = _GetTasks;
  const factory TaskEvent.testConnect() = _TestConnect;
  const factory TaskEvent.getTasksByCageId(DateTime? date, String cageId) = _GetTasksByCageId;
  const factory TaskEvent.getTaskById(String taskId) = _GetTaskById;
  const factory TaskEvent.getNextTask() = _GetNextTask;
  const factory TaskEvent.getTasksByUserIdAndDate(
      DateTime? date, String? cageId) = _GetTasksByUserIdAndDate;
  const factory TaskEvent.filterTasksByLocation({
    required String? cageId,
    required DateTime date,
    required String cageName,
  }) = _FilterTasksByLocation;
  const factory TaskEvent.createDailyFoodUsageLog({
    required String cageId,
    required DailyFoodUsageLogDto log,
  }) = _CreateDailyFoodUsageLog;
  const factory TaskEvent.createHealthLog({
    required String cageId,
    required HealthLogDto log,
  }) = _CreateHealthLog;
  const factory TaskEvent.createVaccinScheduleLog({
    required String cageId,
    required VaccinScheduleLogDto log,
  }) = _CreateVaccinScheduleLog;
  const factory TaskEvent.getDailyFoodUsageLog(String taskId) =
      _GetDailyFoodUsageLog;
  const factory TaskEvent.getHealthLog(String taskId) = _GetHealthLog;
  const factory TaskEvent.getVaccinScheduleLog(String taskId) =
      _GetVaccinScheduleLog;
}
