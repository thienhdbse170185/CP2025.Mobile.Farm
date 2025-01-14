import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:data_layer/model/entity/task/next_task/next_task.dart';
import 'package:data_layer/model/request/task/get_task/get_task.dart';
import 'package:data_layer/model/response/task/task_by_user/task_by_user_response.dart';
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
        final request = GetTaskRequest();
        final tasks = await repository.fetchTasks(request);
        emit(TaskState.getTasksSuccess(tasks));
      } catch (e) {
        emit(TaskState.getTasksFailure(e.toString()));
      }
    });
    on<_GetTasksByScanQRCode>((event, emit) async {
      emit(const TaskState.getTasksByScanQRCodeLoading());
      try {
        // Get current session based on time
        final now = DateTime.now();
        final hour = now.hour;
        int currentSession;

        if (hour >= 6 && hour < 12) {
          currentSession = 1;
        } else if (hour >= 12 && hour < 14) {
          currentSession = 2;
        } else if (hour >= 14 && hour < 18) {
          currentSession = 3;
        } else if (hour >= 18 && hour < 23) {
          currentSession = 4;
        } else {
          currentSession = -1;
        }

        final request = GetTaskRequest(
          CageId: event.cageId,
          DueDateFrom: _formatDateSlash(DateTime.now()),
          DueDateTo: _formatDateSlash(DateTime.now()),
          Session: currentSession,
          PageNumber: 1,
          PageSize: 10,
        );
        final tasks = await repository.fetchTasks(request);
        _sortTasksByStatusWithoutSession(tasks);
        emit(TaskState.getTasksByScanQRCodeSuccess(tasks));
      } catch (e) {
        emit(TaskState.getTasksByScanQRCodeFailure(e.toString()));
      }
    });
    on<_UpdateMultipleTask>((event, emit) async {
      emit(const TaskState.updateStatusTaskLoading());
      try {
        // Add logic to update multiple tasks
        for (var taskId in event.taskIds) {
          await repository.update(taskId, event.statusId);
        }
        emit(const TaskState.updateStatusTaskSuccess());
      } catch (e) {
        emit(TaskState.updateStatusTaskFailure(e.toString()));
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
        final formattedDate =
            "${event.date?.year}/${event.date?.month.toString().padLeft(2, '0')}/${event.date?.day.toString().padLeft(2, '0')}";
        final box = await Hive.openBox(UserDataConstant.userBoxName);
        final userId = box.get(UserDataConstant.userIdKey);
        final tasks = await repository.getTasksByCageId(
            userId, formattedDate, event.cageId);
        final tasksMap = _convertTasksToTaskMap(tasks);
        _sortTasksByStatus(tasksMap);
        emit(TaskState.getTasksByCageIdSuccess(tasksMap));
      } catch (e) {
        emit(TaskState.getTasksFailure(e.toString()));
      }
    });
    on<_GetTaskById>((event, emit) async {
      emit(const TaskState.getTaskByIdLoading());
      try {
        final task = await repository.getById(event.taskId);
        final box = await Hive.openBox(UserDataConstant.userBoxName);
        final userId = box.get(UserDataConstant.userIdKey);
        emit(TaskState.getTaskByIdSuccess(task, userId));
      } catch (e) {
        emit(TaskState.getTaskByIdFailure(e.toString()));
      }
    });
    on<_GetNextTask>((event, emit) async {
      emit(const TaskState.getNextTaskLoading());
      try {
        final box = await Hive.openBox(UserDataConstant.userBoxName);
        final userId = box.get(UserDataConstant.userIdKey);
        final task = await (repository).getNextTask(userId);
        emit(TaskState.getNextTaskSuccess(task));
      } catch (e) {
        emit(TaskState.getNextTaskFailure(e.toString()));
      }
    });
    on<_GetTasksByUserIdAndDate>((event, emit) async {
      emit(const TaskState.getTasksByUserIdAndDateLoading());

      try {
        final formattedDate = _formatDate(event.date);
        final String userId = Hive.box(UserDataConstant.userBoxName)
            .get(UserDataConstant.userIdKey);
        final tasks = await (repository)
            .getTasksByUserIdAndDate(userId, formattedDate, event.cageId);

        // Refactor the conversion logic into a separate function
        final taskSortedData = _convertTasksToTaskMap(tasks);
        _sortTasksByStatus(taskSortedData);

        // Tạo danh sách cage không trùng lặp
        List<CageFilter> cageList = [
          const CageFilter(cageName: 'Tất cả', cageType: 'all', cageId: null)
        ];
        for (var task in taskSortedData.values.expand((element) => element)) {
          if (!cageList.any((element) => element.cageName == task.cageName)) {
            cageList.add(CageFilter(
                cageName: task.cageName,
                cageType: 'cage',
                cageId: task.cageId));
          }
        }

        // Đẩy state với taskSorted và danh sách cage đã sắp xếp
        emit(
            TaskState.getTasksByUserIdAndDateSuccess(taskSortedData, cageList));
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
        final mappedTasks = _convertTasksToTaskMap(filteredTasks);
        _sortTasksByStatus(mappedTasks);

        emit(TaskState.filteredTasksSuccess(mappedTasks));
      } catch (e) {
        // Xử lý lỗi nếu có
        emit(TaskState.filteredTasksFailure(e.toString()));
      }
    });
    on<_CreateDailyFoodUsageLog>((event, emit) async {
      emit(const TaskState.createDailyFoodUsageLogLoading());
      try {
        final request = DailyFoodUsageLogDto(
            recommendedWeight: event.log.recommendedWeight,
            actualWeight: event.log.actualWeight,
            notes: event.log.notes,
            logTime: DateTime.now(),
            photo: event.log.photo,
            taskId: event.log.taskId);
        final result =
            await repository.createDailyFoodUsageLog(event.cageId, request);
        if (result) {
          emit(const TaskState.createDailyFoodUsageLogSuccess());
        } else {
          emit(const TaskState.createDailyFoodUsageLogFailure(
              'Tạo log cho ăn thất bại!'));
        }
      } catch (e) {
        emit(TaskState.createDailyFoodUsageLogFailure(e.toString()));
      }
    });
    on<_CreateHealthLog>((event, emit) async {
      emit(const TaskState.createHealthLogLoading());
      try {
        final request = HealthLogDto(
            prescriptionId: event.prescriptionId,
            notes: event.log.notes,
            date: DateTime.now(),
            photo: event.log.photo,
            taskId: event.log.taskId);
        final result =
            await repository.createHealthLog(event.prescriptionId, request);
        if (result) {
          emit(const TaskState.createHealthLogSuccess());
        } else {
          emit(const TaskState.createHealthLogFailure(
              'Tạo log cho sức khỏe thất bại!'));
        }
      } catch (e) {
        emit(TaskState.createHealthLogFailure(e.toString()));
      }
    });
    on<_CreateVaccinScheduleLog>((event, emit) async {
      emit(const TaskState.createVaccinScheduleLogLoading());
      try {
        final request = VaccinScheduleLogDto(
            notes: event.log.notes,
            date: event.log.date,
            photo: event.log.photo,
            taskId: event.log.taskId);
        final result =
            await repository.createVaccinScheduleLog(event.cageId, request);
        if (result) {
          emit(const TaskState.createVaccinScheduleLogSuccess());
        } else {
          emit(const TaskState.createVaccinScheduleLogFailure(
              'Tạo log cho lịch tiêm chủng thất bại!'));
        }
      } catch (e) {
        emit(TaskState.createVaccinScheduleLogFailure(e.toString()));
      }
    });
    on<_GetDailyFoodUsageLog>((event, emit) async {
      emit(const TaskState.getDailyFoodUsageLogLoading());
      try {
        final log = await repository.getDailyFoodUsageLog(event.taskId);
        emit(TaskState.getDailyFoodUsageLogSuccess(log));
      } catch (e) {
        emit(TaskState.getDailyFoodUsageLogFailure(e.toString()));
      }
    });
    on<_GetHealthLog>((event, emit) async {
      emit(const TaskState.getHealthLogLoading());
      try {
        final log = await repository.getHealthLog(event.taskId);
        emit(TaskState.getHealthLogSuccess(log));
      } catch (e) {
        emit(TaskState.getHealthLogFailure(e.toString()));
      }
    });
    on<_GetVaccinScheduleLog>((event, emit) async {
      emit(const TaskState.getVaccinScheduleLogLoading());
      try {
        final log = await repository.getVaccinScheduleLog(event.taskId);
        emit(TaskState.getVaccinScheduleLogSuccess(log));
      } catch (e) {
        emit(TaskState.getVaccinScheduleLogFailure(e.toString()));
      }
    });
  }

  String _formatDate(DateTime? date) {
    return "${date?.year}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}";
  }

  String _formatDateSlash(DateTime? date) {
    return "${date?.year}/${date?.month.toString().padLeft(2, '0')}/${date?.day.toString().padLeft(2, '0')}";
  }

  // Tách hàm chuyển đổi tasks sang taskSorted
  Map<String, List<TaskHaveCageName>> _convertTasksToTaskMap(
      List<TaskByUserResponse> tasks) {
    Map<String, List<TaskHaveCageName>> taskSorted = {};

    // Chuyển đổi tasks từ TaskByUserResponse sang TaskHaveCageName và nhóm theo session
    for (var task in tasks) {
      // Lặp qua từng cage trong task
      for (var cage in task.cages) {
        String cageName = cage.cageName;
        String cageId = cage.cageId;
        for (var taskItem in cage.tasks) {
          // Chuyển đổi task sang TaskHaveCageName
          final taskHaveCageName = TaskHaveCageName(
            id: taskItem.id,
            cageId: cageId,
            cageName: cageName, // Thêm cageName vào TaskHaveCageName
            taskName: taskItem.taskName,
            description: taskItem.description,
            status: taskItem.status,
            createdAt: taskItem.createdAt,
            priorityNum: taskItem.priorityNum,
            dueDate: taskItem.dueDate,
            session: taskItem.session,
            completedAt: taskItem.completedAt,
            assignedToUser: taskItem.assignedToUser,
            taskType: taskItem.taskType,
            prescriptionId: taskItem.prescriptionId,
            isTreatmentTask: taskItem.isTreatmentTask,
          );

          // Đưa task vào đúng session
          if (!taskSorted.containsKey(task.sessionName)) {
            taskSorted[task.sessionName] = [];
          }
          taskSorted[task.sessionName]?.add(taskHaveCageName);
        }
      }
    }

    return taskSorted;
  }

  // Hàm sắp xếp các công việc, chuyển các công việc 'done' và 'OverSchedules' xuống cuối
  void _sortTasksByStatus(Map<String, List<TaskHaveCageName>> taskSorted) {
    for (var sessionTasks in taskSorted.values) {
      sessionTasks.sort((a, b) {
        // Ánh xạ trạng thái thành giá trị số để sắp xếp
        int priorityA = _getStatusPriority(a.status);
        int priorityB = _getStatusPriority(b.status);

        return priorityA.compareTo(priorityB);
      });
    }
  }

  // Hàm sắp xếp các công việc trong một danh sách theo trạng thái
  void _sortTasksByStatusWithoutSession(List<TaskHaveCageName> tasks) {
    tasks.sort((a, b) {
      // Ánh xạ trạng thái thành giá trị số để sắp xếp
      int priorityA = _getStatusPriority(a.status);
      int priorityB = _getStatusPriority(b.status);

      return priorityA.compareTo(priorityB);
    });
  }

// Hàm ánh xạ trạng thái task thành giá trị số
  int _getStatusPriority(String status) {
    switch (status.toLowerCase()) {
      case 'overschedules': // Task hết hạn
        return 2; // Ưu tiên thấp nhất
      case 'done': // Task đã hoàn thành
        return 1; // Ưu tiên trung bình
      default: // Các trạng thái khác
        return 0; // Ưu tiên cao nhất
    }
  }
}
