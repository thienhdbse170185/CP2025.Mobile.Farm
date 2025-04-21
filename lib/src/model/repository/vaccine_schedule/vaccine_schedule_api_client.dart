import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smart_farm/api_endpoints.dart';
import 'package:smart_farm/src/model/request/vaccine_schedule/vaccine_schedule_request.dart';
import 'package:smart_farm/src/model/response/vaccine_schedule/vaccine_schedule_by_id/vaccine_schedule_by_id_response.dart';
import 'package:smart_farm/src/model/response/vaccine_schedule/vaccine_schedule_response.dart';

class VaccineScheduleApiClient {
  final Dio dio;
  const VaccineScheduleApiClient({required this.dio});

  Future<VaccineScheduleResponse> getVaccineScheduleByStageId({
    required VaccineScheduleRequest request,
  }) async {
    try {
      log('VACCINE_SCHEDULE_API_CLIENT] request: ${request.toJson()}');
      final response = await dio.get(
          '${ApiEndpoints.vaccineSchedule}/vaccine-schedules',
          queryParameters: request.toJson());
      if (response.statusCode == 200) {
        log('[VACCINE_SCHEDULE_API_CLIENT] Lấy thông tin VaccineSchedule thành công');
        return VaccineScheduleResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load vaccine schedule');
      }
    } on DioException catch (e) {
      log('[VACCINE_SCHEDULE_API_CLIENT] Lấy thông tin VaccineSchedule thất bại!');
      if (e.response?.statusCode == 404) {
        log('[VACCINE_SCHEDULE_API_CLIENT] Không tìm thấy lịch tiêm chủng');
        throw Exception('vaccine_schedule_not_found');
      }
      log('Lỗi: ${e.toString()}');
      rethrow;
    }
  }

  Future<VaccineScheduleByIdResponse> getVaccineScheduleById(
      {required String id}) async {
    try {
      final response = await dio.get('${ApiEndpoints.vaccineSchedule}/$id');
      if (response.statusCode == 200) {
        log('[VACCINE_SCHEDULE_API_CLIENT] Lấy thông tin VaccineSchedule thành công');
        return VaccineScheduleByIdResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load vaccine schedule');
      }
    } on DioException catch (e) {
      log('[VACCINE_SCHEDULE_API_CLIENT] Lấy thông tin VaccineSchedule thất bại!');
      log('Lỗi: ${e.toString()}');
      rethrow;
    }
  }
}
