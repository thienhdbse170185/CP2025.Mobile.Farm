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
  const factory TaskState.getTasksSuccess(Map<String, dynamic> tasks) =
      _GetTasksSuccess;
  const factory TaskState.getTasksFailure(String error) = _GetTasksFailure;
  const factory TaskState.testConnectSuccess() = _TestConnectSuccess;
  const factory TaskState.getTasksByCageIdLoading() = _GetTasksByCageIdLoading;
  const factory TaskState.getTasksByCageIdSuccess(TasksByCageResponse tasks) =
      _GetTasksByCageIdSuccess;
  const factory TaskState.getTaskByIdLoading() = _GetTaskByIdLoading;
  const factory TaskState.getTaskByIdSuccess(Task task) = _GetTaskByIdSuccess;
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
}
