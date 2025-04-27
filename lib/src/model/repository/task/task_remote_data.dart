import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smart_farm/api_endpoints.dart';
import 'package:smart_farm/src/model/dto/task/daily_food_usage_log/daily_food_usage_log_dto.dart';
import 'package:smart_farm/src/model/dto/task/health_log/health_log_dto.dart';
import 'package:smart_farm/src/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:smart_farm/src/model/dto/task/vaccin_schedule_log/vaccin_schedule_log_dto.dart';
import 'package:smart_farm/src/model/entity/task/next_task/next_task.dart';
import 'package:smart_farm/src/model/request/task/get_task/get_task.dart';
import 'package:smart_farm/src/model/response/task/get_task/get_task.dart';
import 'package:smart_farm/src/model/response/task/task_by_cage/tasks_by_cage_response.dart';
import 'package:smart_farm/src/model/response/task/task_by_user/task_by_user_response.dart';

class TaskRemoteData {
  final Dio dio;

  TaskRemoteData({required this.dio});

  Future<void> testConnect() async {
    try {
      final response = await dio.get(ApiEndpoints.testConnectAPI);
      if (response.statusCode == 200) {
        log('Connected to server');
      } else {
        log('Failed to connect to server');
      }
    } on DioException {
      rethrow;
    }
  }

  Future<TasksByCageResponse> getTasksByCageId(String cageId) async {
    try {
      final response = await dio
          .get(ApiEndpoints.getTasks, queryParameters: {'CageId': cageId});
      if (response.statusCode == 200) {
        return TasksByCageResponse.fromJson(response.data['result']);
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<GetTaskResponse> fetchTasks(GetTaskRequest request) async {
    try {
      final reqParam = request.toJson();
      log(reqParam.toString());
      final response =
          await dio.get(ApiEndpoints.getTasks, queryParameters: reqParam);
      if (response.statusCode == 200) {
        return GetTaskResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load tasks');
      }
    } on DioException catch (e) {
      log(e.response?.data.toString() ?? '');
      rethrow;
    }
  }

  Future<List<NextTask>> getNextTask(String userId) async {
    try {
      final response = await dio
          .get(ApiEndpoints.getNextTask, queryParameters: {'userId': userId});
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((task) => NextTask.fromJson(task))
            .toList();
      } else {
        throw Exception('Failed to load next task');
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<TaskHaveCageName> read(String id) async {
    try {
      final response = await dio.get('${ApiEndpoints.getTasks}/$id');
      if (response.statusCode == 200) {
        return TaskHaveCageName.fromJson(response.data['result']);
      } else {
        throw Exception('Failed to load task');
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<bool> update(String taskId, String statusId) async {
    try {
      log('[UPDATE_TASK_STATUS] req: $taskId - $statusId');
      final response =
          await dio.put('${ApiEndpoints.getTasks}/$taskId/status/$statusId');
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to update task status');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw Exception('task-overdue');
      }
      log('[UPDATE_TASK_STATUS] Cập nhật công việc thất bại!');
      log('[UPDATE_TASK_STATUS] Error: ${e.toString()}');
      if (e.response?.data != null) {
        log('[UPDATE_TASK_STATUS] Error body: ${e.response?.data}');
      }
      rethrow;
    }
  }

  Future<List<TaskByUserResponse>> getTasksByUserIdAndDate(
      String userId, String date, String? cageId) async {
    try {
      final response = await dio.get(
        '${ApiEndpoints.getUsers}/$userId/tasks',
        queryParameters: {'filterDate': date, 'cageId': cageId},
      );
      if (response.statusCode == 200) {
        final result = response.data['result'];
        if (result is List) {
          return result
              .map((task) => TaskByUserResponse.fromJson(task))
              .toList();
        } else {
          throw Exception('Failed to load tasks: unexpected response format');
        }
      } else {
        throw Exception('Failed to load tasks');
      }
    } on DioException catch (e) {
      log(e.toString());
      if (e.response?.statusCode == 404) {
        throw Exception('no-task-found');
      }
      rethrow;
    }
  }

  Future<bool> createDailyFoodUsageLog(
      String cageId, DailyFoodUsageLogDto request) async {
    try {
      log('[TASK_REMOTE_DATA] createDailyFoodUsageLog: $request');
      log('[TASK_REMOTE_DATA] cageid: $cageId');
      final response = await dio.post(
          '${ApiEndpoints.dailyFoodUsageLog}/$cageId',
          data: request.toJson());
      if (response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Tạo log cho ăn thất bại!');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('growstage-not-found');
      }
      rethrow;
    }
  }

  Future<bool> createHealthLog(
      String prescriptionId, HealthLogDto request) async {
    try {
      final data = request.toJson();
      log(data.toString());
      final response = await dio.post(
          '${ApiEndpoints.healthLog}/$prescriptionId/health-log',
          data: request.toJson());
      if (response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Tạo log sức khỏe thất bại!');
      }
    } on DioException catch (e) {
      log(e.response?.data.toString() ?? '');
      if (e.response?.statusCode == 404) {
        throw Exception('growstage-not-found');
      }
      rethrow;
    }
  }

  Future<bool> createVaccinScheduleLog(
      String cageId, VaccineScheduleLogDto request) async {
    try {
      final response = await dio.post(
          '${ApiEndpoints.vaccineScheduleLog}/$cageId',
          data: request.toJson());
      if (response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Tạo log lịch tiêm chủng thất bại!');
      }
    } on DioException catch (e) {
      log(e.response?.data.toString() ?? '');
      if (e.response?.statusCode == 404) {
        throw Exception('vaccinschedule-not-found');
      }
      rethrow;
    }
  }

  Future<DailyFoodUsageLogDto> getDailyFoodUsageLog(String taskId) async {
    try {
      final response =
          await dio.get('${ApiEndpoints.dailyFoodUsageLog}/task/$taskId');
      if (response.statusCode == 200) {
        return DailyFoodUsageLogDto.fromJson(response.data['result']);
      } else {
        throw Exception('Failed to load daily food usage log');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('growstage-not-found');
      }
      rethrow;
    }
  }

  Future<HealthLogDto> getHealthLog(String taskId) async {
    try {
      final response = await dio.get('${ApiEndpoints.healthLog}/task/$taskId');
      if (response.statusCode == 200) {
        return HealthLogDto.fromJson(response.data['result']);
      } else {
        throw Exception('Failed to load health log');
      }
    } on DioException catch (e) {
      log(e.response!.data.toString());
      if (e.response?.statusCode == 404) {
        throw Exception('growstage-not-found');
      }
      rethrow;
    }
  }

  Future<VaccineScheduleLogDto> getVaccinScheduleLog(String taskId) async {
    try {
      final response =
          await dio.get('${ApiEndpoints.vaccineScheduleLog}/task/$taskId');
      if (response.statusCode == 200) {
        return VaccineScheduleLogDto.fromJson(response.data['result']);
      } else {
        throw Exception('Failed to load vaccin schedule log');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('growstage-not-found');
      }
      rethrow;
    }
  }

  Future<bool> setTaskIsTreatment({
    required String taskId,
    required String medicalSymptomId,
  }) async {
    try {
      log('[TASK_REMOTE_DATA] Set task is treatment: $taskId');
      log('[TASK_REMOTE_DATA] medicalSymptomId: $medicalSymptomId');
      log('[TASK_REMOTE_DATA] Đang chuyển trạng thái task có vấn đề...');
      final response = await dio.put(
          '${ApiEndpoints.getTasks}/$taskId/set-treatment',
          queryParameters: {
            'medicalSymptomId': medicalSymptomId,
          });
      if (response.statusCode == 200) {
        log('[TASK_REMOTE_DATA] Set task is treatment thành công');
        return true;
      } else {
        throw Exception('set-task-is-treatment-error-occured');
      }
    } on DioException catch (e) {
      log('[TASK_REMOTE_DATA] Set task có vấn đề thất bại');
      log('[TASK_REMOTE_DATA] Error: ${e.toString()}');
      throw Exception('set-task-is-treatment-failure');
    }
  }
}
