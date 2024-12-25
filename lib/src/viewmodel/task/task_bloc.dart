import 'package:bloc/bloc.dart';
import 'package:data_layer/model/entity/task/next_task/next_task.dart';
import 'package:data_layer/model/entity/task/task.dart';
import 'package:data_layer/model/response/task/task_by_cage/tasks_by_cage_response.dart';
import 'package:data_layer/model/response/task/task_by_user/task_by_user_response.dart';
import 'package:data_layer/repository/task/task_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:smart_farm/src/core/constants/user_data_constant.dart';
import 'package:smart_farm/src/model/task/cage_filter.dart';

part 'task_bloc.freezed.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository repository;

  TaskBloc({required this.repository}) : super(const _Initial()) {
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
      emit(const TaskState.updateStatusTaskLoading());
      try {
        // Add logic to update task
        await repository.update(event.taskId, event.statusId);
        emit(const TaskState.updateStatusTaskSuccess());
      } catch (e) {
        emit(TaskState.updateStatusTaskFailure(e.toString()));
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
    on<_GetTasks>((event, emit) async {
      emit(const TaskState.loading());
      try {
        // Add logic to get tasks
        await Future.delayed(const Duration(seconds: 2));
        emit(const TaskState.getTasksSuccess({}));
      } catch (e) {
        emit(TaskState.getTasksFailure(e.toString()));
      }
    });
    on<_TestConnect>((event, emit) async {
      emit(const TaskState.loading());
      try {
        // Add logic to test connection
        await repository.testConnect();
        emit(const TaskState.testConnectSuccess());
      } catch (e) {
        emit(TaskState.failure(e.toString()));
      }
    });
    on<_GetTasksByCageId>((event, emit) async {
      emit(const TaskState.loading());
      try {
        final tasks = await (repository).getTasksByCageId(event.cageId);
        emit(TaskState.getTasksByCageIdSuccess(tasks));
      } catch (e) {
        emit(TaskState.getTasksFailure(e.toString()));
      }
    });
    on<_GetTaskById>((event, emit) async {
      emit(const TaskState.getTaskByIdLoading());
      try {
        final task = await repository.getById(event.taskId);
        emit(TaskState.getTaskByIdSuccess(task));
      } catch (e) {
        emit(TaskState.getTaskByIdFailure(e.toString()));
      }
    });
    on<_GetNextTask>((event, emit) async {
      emit(const TaskState.getNextTaskLoading());
      try {
        final box = await Hive.openBox(UserDataConstant.userBoxName);
        final userId = box.get(UserDataConstant.userId);
        final task = await (repository).getNextTask(userId);
        emit(TaskState.getNextTaskSuccess(task));
      } catch (e) {
        emit(TaskState.getNextTaskFailure(e.toString()));
      }
    });
    on<_GetTasksByUserIdAndDate>((event, emit) async {
      emit(const TaskState.getTasksByUserIdAndDateLoading());
      try {
        final formattedDate =
            "${event.date?.year}/${event.date?.month.toString().padLeft(2, '0')}/${event.date?.day.toString().padLeft(2, '0')}";
        final String userId = Hive.box(UserDataConstant.userBoxName)
            .get(UserDataConstant.userIdKey);
        final tasks = await (repository)
            .getTasksByUserIdAndDate(userId, formattedDate, event.cageId);

        // Create a list of cage names and types without duplicates
        List<CageFilter> cageList = [
          CageFilter(cageName: 'Tất cả', cageType: 'all', cageId: null)
        ];
        final cageNamesSet = <String>{'Tất cả'};
        for (var task in tasks) {
          for (var cage in task.cages) {
            if (!cageNamesSet.contains(cage.cageName)) {
              cageList.add(CageFilter(
                  cageName: cage.cageName,
                  cageType: 'chicken',
                  cageId: cage.cageId));
              cageNamesSet.add(cage.cageName);
            }
          }
        }

        emit(TaskState.getTasksByUserIdAndDateSuccess(tasks, cageList));
      } catch (e) {
        emit(TaskState.getTasksByUserIdAndDateFailure(e.toString()));
      }
    });
    on<_FilterTasksByLocation>((event, emit) async {
      emit(const TaskState.filteredTaskLoading());
      try {
        final formattedDate =
            "${event.date.year}/${event.date.month.toString().padLeft(2, '0')}/${event.date.day.toString().padLeft(2, '0')}";
        final String userId = Hive.box(UserDataConstant.userBoxName)
            .get(UserDataConstant.userIdKey);
        // Lọc công việc
        final filteredTasks = await repository.getTasksByUserIdAndDate(
            userId, formattedDate, event.cageId);

        emit(TaskState.filteredTasksSuccess(filteredTasks));
      } catch (e) {
        // Xử lý lỗi nếu có
        emit(TaskState.filteredTasksFailure(e.toString()));
      }
    });
  }
}
