import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smart_farm/api_endpoints.dart';
import 'package:smart_farm/src/model/dto/medical_symptom/medical_symptom.dart';
import 'package:smart_farm/src/model/request/symptom/create_symptom/create_symptom_request.dart';

class HealthyApiClient {
  final Dio dio;
  HealthyApiClient({required this.dio});
  Future<MedicalSymptomDto> create(CreateSymptomRequest request) async {
    try {
      final data = request.toJson();
      log('[HEALTHY_API_CLIENT] request: $data');
      final response = await dio.post(ApiEndpoints.postSymptom, data: data);
      if (response.statusCode == 201) {
        return MedicalSymptomDto.fromJson(response.data['result']);
      } else {
        log('[HEALTHY_API_CLIENT] Mã code chưa được xác định: ${response.statusCode}');
        log('[HEALTHY_API_CLIENT] Error: ${response.data['message']}');
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      log('[HEALTHY_API_CLIENT] Lỗi khi tạo triệu chứng: ${e.message}');
      log(e.toString());
      rethrow;
    }
  }
}
