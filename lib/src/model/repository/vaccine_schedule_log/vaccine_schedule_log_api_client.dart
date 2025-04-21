import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smart_farm/api_endpoints.dart';
import 'package:smart_farm/src/model/request/vaccine_schedule_log/vaccine_schedule_log_request.dart';
import 'package:smart_farm/src/model/response/vaccine_schedule_log/vaccine_schedule_log_response.dart';

class VaccineScheduleLogApiClient {
  final Dio dio;
  const VaccineScheduleLogApiClient({required this.dio});

  Future<bool> create(VaccineScheduleLogRequest request) async {
    try {
      log('VACCINE_SCHEDULE_LOG_API_CLIENT] request: ${request.toJson()}');
      final response = await dio.post(
          '${ApiEndpoints.vaccineScheduleLog}/vaccine-log/create',
          data: request.toJson());
      if (response.statusCode == 200) {
        log('[VACCINE_SCHEDULE_LOG_API_CLIENT] Lưu thành công');
        return true;
      } else {
        log('[VACCINE_SCHEDULE_LOG_API_CLIENT] Lưu thất bại');
        return false;
      }
    } on DioException catch (e) {
      log('[VACCINE_SCHEDULE_LOG_API_CLIENT] Lưu thất bại!');
      log('Lỗi: ${e.toString()}');
      rethrow;
    }
  }

  Future<VaccineScheduleLogResponse> getVaccineScheduleLogByTaskId(
      String taskId) async {
    try {
      final response =
          await dio.get('${ApiEndpoints.vaccineScheduleLog}/task/$taskId');
      if (response.statusCode == 200) {
        log('[VACCINE_SCHEDULE_LOG_API_CLIENT] Lấy thông tin VaccineScheduleLog thành công');
        return VaccineScheduleLogResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load vaccine schedule log');
      }
    } on DioException catch (e) {
      log('[VACCINE_SCHEDULE_LOG_API_CLIENT] Lấy thông tin VaccineScheduleLog thất bại!');
      log('Lỗi: ${e.toString()}');
      rethrow;
    }
  }
}
