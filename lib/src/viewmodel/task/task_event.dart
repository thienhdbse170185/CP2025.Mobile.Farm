part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.started() = _Started;
  const factory TaskEvent.createTask(String task) = _CreateTask;
  const factory TaskEvent.updateTask(String task) = _UpdateTask;
  const factory TaskEvent.deleteTask(String taskId) = _DeleteTask;
  const factory TaskEvent.getTasks() = _GetTasks;
  const factory TaskEvent.testConnect() = _TestConnect;
  const factory TaskEvent.getTasksByCageId(String cageId) = _GetTasksByCageId;
  const factory TaskEvent.getTaskById(String taskId) = _GetTaskById;
  const factory TaskEvent.getNextTask(String userId) = _GetNextTask;
  const factory TaskEvent.getTasksByUserIdAndDate(
      String userId, DateTime? date, String? cageId) = _GetTasksByUserIdAndDate;
  const factory TaskEvent.filterTasksByLocation({
    required String location,
    required List<TaskByUserResponse> tasks,
  }) = _FilterTasksByLocation;
}
