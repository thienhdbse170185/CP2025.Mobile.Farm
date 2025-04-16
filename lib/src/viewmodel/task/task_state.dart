part of 'task_bloc.dart';

@freezed
class TaskState with _$TaskState {
  const factory TaskState.initial() = _Initial;
  const factory TaskState.loading() = _Loading;
  const factory TaskState.success() = _Success;
  const factory TaskState.failure(String error) = _Failure;
  const factory TaskState.taskCreated() = _TaskCreated;
  const factory TaskState.taskUpdated() = _TaskUpdated;
  const factory TaskState.taskDeleted() = _TaskDeleted;
  const factory TaskState.getTasksInProgress() = _GetTasksInProgress;
  const factory TaskState.getTasksSuccess(
      Map<String, List<TaskHaveCageName>> tasks,
      List<CageFilter> cageList,
      List<TaskType> taskTypeList) = _GetTasksSuccess;
  const factory TaskState.getTasksFailure(String error) = _GetTasksFailure;
  const factory TaskState.testConnectSuccess() = _TestConnectSuccess;
  const factory TaskState.getTasksByCageIdLoading() = _GetTasksByCageIdLoading;
  const factory TaskState.getTasksByCageIdSuccess(
      Map<String, List<TaskHaveCageName>> tasks) = _GetTasksByCageIdSuccess;
  const factory TaskState.getTaskByIdLoading() = _GetTaskByIdLoading;
  const factory TaskState.getTaskByIdSuccess(
    TaskHaveCageName task,
    String userId,
  ) = _GetTaskByIdSuccess;
  const factory TaskState.getTaskByIdFailure(String error) =
      _GetTaskByIdFailure;
  const factory TaskState.getNextTaskLoading() = _GetNextTaskLoading;
  const factory TaskState.getNextTaskSuccess(List<NextTask> task) =
      _GetNextTaskSuccess;
  const factory TaskState.getNextTaskFailure(String error) =
      _GetNextTaskFailure;
  const factory TaskState.getTasksByUserIdAndDateLoading() =
      _GetTasksByUserIdAndDateLoading;
  const factory TaskState.getTasksByUserIdAndDateSuccess(
      Map<String, List<TaskHaveCageName>> tasks,
      List<CageFilter> cageList) = _GetTasksByUserIdAndDateSuccess;
  const factory TaskState.getTasksByUserIdAndDateFailure(String error) =
      _GetTasksByUserIdAndDateFailure;
  const factory TaskState.filteredTaskLoading() = _FilteredTaskLoading;
  const factory TaskState.filteredTasksSuccess(
      Map<String, List<TaskHaveCageName>> tasks) = _FilteredTasksSuccess;
  const factory TaskState.filteredTasksFailure(String error) =
      _FilteredTasksFailure;
  const factory TaskState.updateStatusTaskLoading() = _UpdateStatusTaskLoading;
  const factory TaskState.updateStatusTaskSuccess() = _UpdateStatusTaskSuccess;
  const factory TaskState.updateStatusTaskFailure(String error) =
      _UpdateStatusTaskFailure;
  const factory TaskState.updateTaskAfterReportLoading() =
      _UpdateTaskAfterReportLoading;
  const factory TaskState.updateTaskAfterReportSuccess() =
      _UpdateTaskAfterReportSuccess;
  const factory TaskState.updateTaskAfterReportFailure(String error) =
      _UpdateTaskAfterReportFailure;
  const factory TaskState.createDailyFoodUsageLogLoading() =
      _CreateDailyFoodUsageLogLoading;
  const factory TaskState.createDailyFoodUsageLogSuccess() =
      _CreateDailyFoodUsageLogSuccess;
  const factory TaskState.createDailyFoodUsageLogFailure(String error) =
      _CreateDailyFoodUsageLogFailure;
  const factory TaskState.createHealthLogLoading() = _CreateHealthLogLoading;
  const factory TaskState.createHealthLogSuccess() = _CreateHealthLogSuccess;
  const factory TaskState.createHealthLogFailure(String error) =
      _CreateHealthLogFailure;
  const factory TaskState.createVaccinScheduleLogLoading() =
      _CreateVaccinScheduleLogLoading;
  const factory TaskState.createVaccinScheduleLogSuccess() =
      _CreateVaccinScheduleLogSuccess;
  const factory TaskState.createVaccinScheduleLogFailure(String error) =
      _CreateVaccinScheduleLogFailure;
  const factory TaskState.getDailyFoodUsageLogLoading() =
      _GetDailyFoodUsageLogLoading;
  const factory TaskState.getDailyFoodUsageLogSuccess(
      DailyFoodUsageLogDto log) = _GetDailyFoodUsageLogSuccess;
  const factory TaskState.getDailyFoodUsageLogFailure(String error) =
      _GetDailyFoodUsageLogFailure;
  const factory TaskState.getHealthLogLoading() = _GetHealthLogLoading;
  const factory TaskState.getHealthLogSuccess(HealthLogDto log) =
      _GetHealthLogSuccess;
  const factory TaskState.getHealthLogFailure(String error) =
      _GetHealthLogFailure;
  const factory TaskState.getVaccinScheduleLogLoading() =
      _GetVaccinScheduleLogLoading;
  const factory TaskState.getVaccinScheduleLogSuccess(
      VaccineScheduleLogDto log) = _GetVaccinScheduleLogSuccess;
  const factory TaskState.getVaccinScheduleLogFailure(String error) =
      _GetVaccinScheduleLogFailure;
  const factory TaskState.getHealthLogInformationLoading() =
      _GetHealthLogInformationLoading;
  const factory TaskState.getHealthLogInformationSuccess(HealthLogDto log) =
      _GetHealthLogInformationSuccess;
  const factory TaskState.getHealthLogInformationFailure(String error) =
      _GetHealthLogInformationFailure;

  const factory TaskState.getTasksByScanQRCodeLoading() =
      _GetTasksByScanQRCodeLoading;
  const factory TaskState.getTasksByScanQRCodeSuccess(
          List<TaskHaveCageName> tasks, List<TaskType> taskTypeList) =
      _GetTasksByScanQRCodeSuccess;
  const factory TaskState.getTasksByScanQRCodeFailure(String error) =
      _GetTasksByScanQRCodeFailure;

  const factory TaskState.updateMultipleTaskLoading() =
      _UpdateMultipleTaskLoading;
  const factory TaskState.updateMultipleTaskSuccess() =
      _UpdateMultipleTaskSuccess;
  const factory TaskState.updateMultipleTaskFailure(String error) =
      _UpdateMultipleTaskFailure;

  /*
  // Commented out since the API isn't ready yet
  // New states for marking tasks as having problems
  const factory TaskState.markTaskHasProblemLoading() =
      _MarkTaskHasProblemLoading;
  const factory TaskState.markTaskHasProblemSuccess() =
      _MarkTaskHasProblemSuccess;
  const factory TaskState.markTaskHasProblemFailure(String error) =
      _MarkTaskHasProblemFailure;

  const factory TaskState.markTaskAsCompleteLoading() =
      _MarkTaskAsCompleteLoading;
  const factory TaskState.markTaskAsCompleteSuccess() =
      _MarkTaskAsCompleteSuccess;
  const factory TaskState.markTaskAsCompleteFailure(String error) =
      _MarkTaskAsCompleteFailure;
  */

  const factory TaskState.setTaskIsTreatmentInProgress() =
      _SetTaskIsTreatmentInProgress;
  const factory TaskState.setTaskIsTreatmentSuccess() =
      _SetTaskIsTreatmentSuccess;
  const factory TaskState.setTaskIsTreatmentFailure(String error) =
      _SetTaskIsTreatmentFailure;
}
