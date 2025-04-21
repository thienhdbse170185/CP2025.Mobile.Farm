import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smart_farm/api_endpoints.dart';
import 'package:smart_farm/src/model/request/egg_harvest/egg_harvest_request.dart';
import 'package:smart_farm/src/model/response/egg_harvest/egg_harvest_response.dart';

class EggHarvestApiClient {
  final Dio dio;
  const EggHarvestApiClient({required this.dio});

  Future<bool> create({required EggHarvestRequest request}) async {
    try {
      log('[EGG_HARVEST_API_CLIENT] Đang tạo EggHarvest...');
      log('[EGG_HARVEST_API_CLIENT] request: ${request.toJson()}');
      final response =
          await dio.post(ApiEndpoints.eggHarvest, data: request.toJson());
      if (response.statusCode == 200) {
        log('EGG_HARVEST_API_CLIENT] Tạo EggHarvest thành công');
        return true;
      } else {
        throw Exception('create-egg-harvest-failed');
      }
    } on DioException catch (e) {
      log('EGG_HARVEST_API_CLIENT] Lấy thông tin EggHarvest thất bại!');
      log('Lỗi: ${e.toString()}');
      rethrow;
    }
  }

  Future<EggHarvestResponse> getByTaskId({required String taskId}) async {
    try {
      log('[EGG_HARVEST_API_CLIENT] Đang lấy thông tin EggHarvest...');
      final response = await dio
          .get('${ApiEndpoints.eggHarvest}/get-by-task', queryParameters: {
        'taskId': taskId,
      });
      if (response.statusCode == 200) {
        log('[EGG_HARVEST_API_CLIENT] Lấy thông tin EggHarvest thành công');
        return EggHarvestResponse.fromJson(response.data);
      } else {
        throw Exception('get-egg-harvest-failed');
      }
    } on DioException catch (e) {
      log('[EGG_HARVEST_API_CLIENT] Lấy thông tin EggHarvest thất bại!');
      log('Lỗi: ${e.toString()}');
      rethrow;
    }
  }
}
