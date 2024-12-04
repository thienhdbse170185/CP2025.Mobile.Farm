part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.started() = _Started;
  const factory TaskEvent.createTask(String task) = _CreateTask;
  const factory TaskEvent.updateTask(String task) = _UpdateTask;
  const factory TaskEvent.deleteTask(String taskId) = _DeleteTask;
  const factory TaskEvent.getTasks() = _GetTasks;
}