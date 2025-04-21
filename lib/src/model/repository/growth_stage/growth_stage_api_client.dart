import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smart_farm/api_endpoints.dart';
import 'package:smart_farm/src/model/dto/growth_stage/growth_stage_dto.dart';
import 'package:smart_farm/src/model/request/growth_stage/update_weight/update_weight_request.dart';

class GrowthStageApiClient {
  final Dio dio;
  const GrowthStageApiClient({required this.dio});

  Future<GrowthStageDto> getGrowthStageByCageId(String cageId) async {
    try {
      log('[GROWTH_STAGE_API_CLIENT] Chuẩn bị lấy thông tin growth stage cho cageId: $cageId');
      final response = await dio
          .get('${ApiEndpoints.growthStageInCage}/$cageId/active-growth-stage');
      if (response.statusCode == 200) {
        log('[GROWTH_STAGE_API_CLIENT] Lấy thông tin growth stage thành công!');
        return GrowthStageDto.fromJson(response.data['result']);
      } else {
        throw Exception('Failed to load growth stage');
      }
    } on DioException catch (e) {
      log('[GROWTH_STAGE_API_CLIENT] Lấy thông tin growth stage thất bại!');
      log('Lỗi: ${e.toString()}');
      if (e.response?.statusCode == 404) {
        throw Exception('growth-stage-not-found');
      }
      rethrow;
    }
  }

  Future<bool> updateWeight({required UpdateWeightRequest request}) async {
    try {
      log('[GROWTH_STAGE_API_CLIENT] Chuẩn bị cập nhật cân nặng cho growthStageId: ${request.growthStageId}');
      log('Request: ${request.toJson()}');
      final response = await dio.put(ApiEndpoints.growthStageUpdateWeight,
          data: request.toJson());
      if (response.statusCode == 200) {
        log('[GROWTH_STAGE_API_CLIENT] Cập nhật cân nặng thành công!');
        return true;
      } else {
        throw Exception('update-weight-failed');
      }
    } on DioException catch (e) {
      log('[GROWTH_STAGE_API_CLIENT] Cập nhật cân nặng thất bại!');
      log('Lỗi: ${e.toString()}');
      rethrow;
    }
  }
}
