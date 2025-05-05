import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smart_farm/api_endpoints.dart';
import 'package:smart_farm/src/model/dto/prescription/prescription.dart';
import 'package:smart_farm/src/model/request/prescription/update_status_prescription_request.dart';

class PrescriptionApiClient {
  final Dio dio;
  const PrescriptionApiClient({required this.dio});

  Future<PrescriptionDto> getPrescriptionById(String prescriptionId) async {
    try {
      log('[PRESCRIPTION_API_CLIENT] Lấy thông tin đơn thuốc theo prescriptionId: $prescriptionId');
      final response = await dio
          .get('${ApiEndpoints.prescription}/$prescriptionId/prescription');
      if (response.statusCode == 200) {
        log('[PRESCRIPTION_API_CLIENT] Lấy thông tin đơn thuốc thành công!');
        return PrescriptionDto.fromJson(response.data['result']);
      } else {
        log(response.data.toString());
        throw Exception('Failed to fetch prescription');
      }
    } on DioException catch (e) {
      log('[PRESCRIPTION_API_CLIENT] Lỗi khi lấy thông tin đơn thuốc: ${e.message}');
      log(e.response!.data.toString());
      rethrow;
    }
  }

  Future<bool> updatePrescriptionStatus(
      {required String prescriptionId,
      required UpdateStatusPrescriptionRequest request}) async {
    try {
      final response = await dio.put(
          '${ApiEndpoints.prescription}/$prescriptionId/status',
          data: request.toJson());
      if (response.statusCode == 200) {
        log('[PRESCRIPTION_API_CLIENT] Cập nhật trạng thái đơn thuốc thành công!');
        return true;
      } else {
        log(response.data.toString());
        throw Exception('Failed to update prescription status');
      }
    } on DioException catch (e) {
      log('[PRESCRIPTION_API_CLIENT] Lỗi khi cập nhật trạng thái đơn thuốc: ${e.message}');
      log(e.toString());
      rethrow;
    }
  }

  Future<bool> checkPrescriptionLastSession({
    required String prescriptionId,
    required String taskId,
  }) async {
    try {
      final response = await dio.get(
          '${ApiEndpoints.prescription}/$prescriptionId/$taskId/is-last-session');
      if (response.statusCode == 200) {
        return response.data['result'];
      } else {
        log(response.data.toString());
        throw Exception('Failed to check last session');
      }
    } on DioException catch (e) {
      log('[PRESCRIPTION_API_CLIENT] Lỗi khi kiểm tra phiên cuối cùng: ${e.message}');
      log(e.toString());
      rethrow;
    }
  }
}
