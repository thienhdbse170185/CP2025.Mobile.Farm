import 'package:smart_farm/src/model/dto/task/daily_food_usage_log/daily_food_usage_log_dto.dart';
import 'package:smart_farm/src/model/dto/task/health_log/health_log_dto.dart';
import 'package:smart_farm/src/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:smart_farm/src/model/dto/task/vaccin_schedule_log/vaccin_schedule_log_dto.dart';
import 'package:smart_farm/src/model/entity/task/next_task/next_task.dart';
import 'package:smart_farm/src/model/repository/task/task_remote_data.dart';
import 'package:smart_farm/src/model/request/task/get_task/get_task.dart';
import 'package:smart_farm/src/model/response/task/task_by_user/task_by_user_response.dart';

class TaskRepository {
  final TaskRemoteData apiClient;
  const TaskRepository({required this.apiClient});

  Future<void> testConnect() async {
    try {
      await apiClient.testConnect();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TaskHaveCageName>> fetchTasks(GetTaskRequest request) async {
    try {
      final data = await apiClient.fetchTasks(request);
      if (data.success) {
        return data.result.items;
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<TaskHaveCageName> getById(String id) async {
    try {
      return await apiClient.read(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> update(String taskId, String statusId) async {
    try {
      await apiClient.update(taskId, statusId);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TaskByUserResponse>> getTasksByCageId(
      String userId, String date, String cageId) async {
    try {
      final response =
          await apiClient.getTasksByUserIdAndDate(userId, date, cageId);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<NextTask>> getNextTask(String userId) async {
    try {
      return await apiClient.getNextTask(userId);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TaskByUserResponse>> getTasksByUserIdAndDate(
      String userId, String date, String? cageId) async {
    try {
      return await apiClient.getTasksByUserIdAndDate(userId, date, cageId);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> createDailyFoodUsageLog(
      String cageId, DailyFoodUsageLogDto request) {
    try {
      return apiClient.createDailyFoodUsageLog(cageId, request);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> createHealthLog(
      String prescriptionId, HealthLogDto request) async {
    try {
      await apiClient.createHealthLog(prescriptionId, request);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> createVaccinScheduleLog(
      String cageId, VaccineScheduleLogDto request) async {
    try {
      await apiClient.createVaccinScheduleLog(cageId, request);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<DailyFoodUsageLogDto> getDailyFoodUsageLog(String taskId) async {
    try {
      return await apiClient.getDailyFoodUsageLog(taskId);
    } catch (e) {
      rethrow;
    }
  }

  Future<HealthLogDto> getHealthLog(String taskId) async {
    try {
      return await apiClient.getHealthLog(taskId);
    } catch (e) {
      rethrow;
    }
  }

  Future<VaccineScheduleLogDto> getVaccinScheduleLog(String taskId) async {
    try {
      return await apiClient.getVaccinScheduleLog(taskId);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> setTaskIsTreatment({
    required String taskId,
    required String medicalSymptomId,
  }) async {
    try {
      return await apiClient.setTaskIsTreatment(
        taskId: taskId,
        medicalSymptomId: medicalSymptomId,
      );
    } catch (e) {
      rethrow;
    }
  }
}
