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
  const factory TaskState.getTaskByIdSuccess(Map<String, dynamic> task) = _GetTaskByIdSuccess;
  const factory TaskState.getTaskByIdFailure(String error) = _GetTaskByIdFailure;
}
