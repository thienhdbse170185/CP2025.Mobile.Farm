import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_event.dart';
part 'task_state.dart';
part 'task_bloc.freezed.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const _Initial()) {
    on<_Started>((event, emit) {
      // Handle started event
    });
    on<_CreateTask>((event, emit) async {
      emit(const TaskState.loading());
      try {
        // Add logic to create task
        emit(const TaskState.taskCreated());
      } catch (e) {
        emit(TaskState.failure(e.toString()));
      }
    });
    on<_UpdateTask>((event, emit) async {
      emit(const TaskState.loading());
      try {
        // Add logic to update task
        emit(const TaskState.taskUpdated());
      } catch (e) {
        emit(TaskState.failure(e.toString()));
      }
    });
    on<_DeleteTask>((event, emit) async {
      emit(const TaskState.loading());
      try {
        // Add logic to delete task
        emit(const TaskState.taskDeleted());
      } catch (e) {
        emit(TaskState.failure(e.toString()));
      }
    });
    on<_GetTasks>((evnet, emit) async {
      emit(const TaskState.loading());
      try {
        // Add logic to get tasks
        await Future.delayed(const Duration(seconds: 2));
        emit(const TaskState.getTasksSuccess({}));
      } catch (e) {
        emit(TaskState.getTasksFailure(e.toString()));
      }
    });
  }
}
