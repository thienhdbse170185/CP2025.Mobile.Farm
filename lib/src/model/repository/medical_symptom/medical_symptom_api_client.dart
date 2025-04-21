import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smart_farm/api_endpoints.dart';
import 'package:smart_farm/src/model/response/medical_symptom/medical_symptom_response.dart';

class MedicalSymptomApiClient {
  final Dio dio;
  const MedicalSymptomApiClient({required this.dio});

  Future<List<MedicalSymptomResponse>?> getSymptomsByBatch(
      String userId, String? farmingBatchId) async {
    try {
      log('[MEDICAL_SYMPTOM_API_CLIENT] Chuẩn bị thực hiện lấy báo cáo triệu chứng...');
      log('[MEDICAL_SYMPTOM_API_CLIENT] userId: $userId');
      log('[MEDICAL_SYMPTOM_API_CLIENT] farmingBatchId: $farmingBatchId');
      // Comment out the actual API call
      final response = await dio
          .get(ApiEndpoints.getMedicalSymptomsByBatch, queryParameters: {
        'staffId': userId,
        'farmBatchId': farmingBatchId,
      });
      if (response.statusCode == 200) {
        log('[MEDICAL_SYMPTOM_API_CLIENT] Lấy báo cáo triệu chứng thành công!');
        return (response.data['result'] as List)
            .map((e) => MedicalSymptomResponse.fromJson(e))
            .toList();
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        log('[MEDICAL_SYMPTOM_API_CLIENT] Vụ nuôi này không có báo cáo triệu chứng.');
        return null;
      }
      log('[MEDICAL_SYMPTOM_API_CLIENT] Lỗi khi lấy báo cáo triệu chứng');
      log('[MEDICAL_SYMPTOM_API_CLIENT] Error: ${e.message}');
      throw Exception(e.response?.data['result']['message']);
    }
  }
}
