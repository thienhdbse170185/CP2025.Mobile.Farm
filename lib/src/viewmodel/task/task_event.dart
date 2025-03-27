part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.started() = _Started;
  const factory TaskEvent.createTask(String task) = _CreateTask;
  const factory TaskEvent.updateTask(String taskId, String statusId,
      {@Default(false) bool afterSymptomReport}) = _UpdateTask;
  const factory TaskEvent.deleteTask(String taskId) = _DeleteTask;
  const factory TaskEvent.getTasks(
    String? keySearch,
    String? status,
    String? taskType,
    String? cageId,
    DateTime? date,
    int? session,
    int? pageNumber,
    int? pageSize,
  ) = _GetTasks;
  const factory TaskEvent.testConnect() = _TestConnect;
  const factory TaskEvent.getTasksByCageId(DateTime? date, String cageId) =
      _GetTasksByCageId;
  const factory TaskEvent.getTaskById(String taskId,
      {Function(TaskHaveCageName)? onSuccess}) = _GetTaskById;
  const factory TaskEvent.getNextTask() = _GetNextTask;
  const factory TaskEvent.getTasksByUserIdAndDate(
      DateTime? date, String? cageId) = _GetTasksByUserIdAndDate;
  const factory TaskEvent.filterTasksByLocation({
    required String? cageId,
    required DateTime date,
    required String cageName,
  }) = _FilterTasksByLocation;
  const factory TaskEvent.createDailyFoodUsageLog(
      {required String cageId,
      required DailyFoodUsageLogDto log,
      @Default(false) bool afterSymptomReport}) = _CreateDailyFoodUsageLog;
  const factory TaskEvent.createHealthLog(
      {required String prescriptionId,
      required HealthLogDto log,
      @Default(false) bool afterSymptomReport}) = _CreateHealthLog;
  const factory TaskEvent.createVaccinScheduleLog(
      {required String cageId,
      required VaccineScheduleLogDto log,
      @Default(false) bool afterSymptomReport}) = _CreateVaccinScheduleLog;
  const factory TaskEvent.getDailyFoodUsageLog(String taskId) =
      _GetDailyFoodUsageLog;
  const factory TaskEvent.getHealthLog(String taskId) = _GetHealthLog;
  const factory TaskEvent.getVaccinScheduleLog(String taskId) =
      _GetVaccinScheduleLog;
  const factory TaskEvent.getHealthLogInformation(String taskId) =
      _GetHealthLogInformation;
  const factory TaskEvent.getTasksByScanQRCode(
    String? keySearch,
    String? status,
    String? taskType,
    String cageId,
    int? pageNumber,
    int? pageSize,
  ) = _GetTasksByScanQRCode;
  const factory TaskEvent.updateMultipleTask(
      List<String> taskIds, String statusId) = _UpdateMultipleTask;

  const factory TaskEvent.setTaskIsTreatment({required String taskId}) =
      _SetTaskIsTreatment;
}
