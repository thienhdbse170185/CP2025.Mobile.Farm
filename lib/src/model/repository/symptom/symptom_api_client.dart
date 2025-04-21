import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smart_farm/api_endpoints.dart';
import 'package:smart_farm/src/model/dto/symptom/symptom.dart';
import 'package:smart_farm/src/model/request/symptom/create_symptom/create_symptom_request.dart';

class SymptomApiClient {
  final Dio dio;
  SymptomApiClient({required this.dio});

  Future<bool> create(CreateSymptomRequest request) async {
    try {
      final response =
          await dio.post(ApiEndpoints.postSymptom, data: request.toJson());
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<SymptomDto>> getSymptoms() async {
    try {
      final response = await dio.get(ApiEndpoints.symptom, queryParameters: {
        'PageSize': 100,
      });
      if (response.statusCode == 200) {
        return (response.data['result']['items'] as List)
            .map((e) => SymptomDto.fromJson(e))
            .toList();
      }
      return [];
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
