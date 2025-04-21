import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smart_farm/api_endpoints.dart';
import 'package:smart_farm/src/model/dto/sale_log_detail/sale_log_detail_dto.dart';
import 'package:smart_farm/src/model/dto/task/sale_log/sale_log_dto.dart';
import 'package:smart_farm/src/model/request/animal_sale/animal_sale_request.dart';

class AnimalSaleApiClient {
  final Dio dio;
  const AnimalSaleApiClient({required this.dio});

  Future<bool> create(AnimalSaleRequest request) async {
    try {
      log('[ANIMAL_SALE_API_CLIENT] Chuẩn bị tạo thông tin bán gia cầm');
      log('Request: ${request.toJson()}');
      final response =
          await dio.post(ApiEndpoints.animalSale, data: request.toJson());
      if (response.statusCode == 200) {
        log('[ANIMAL_SALE_API_CLIENT] Tạo thông tin bán gia cầm thành công!');
        return true;
      }
      return false;
    } on DioException catch (e) {
      log('[ANIMAL_SALE_API_CLIENT] Tạo thông tin bán gia cầm thất bại!');
      log('Lỗi: ${e.toString()}');
      rethrow;
    }
  }

  Future<List<SaleLogDto>> getSaleLogByGrowthStageId(
      {required String growthStageId}) async {
    try {
      log('[ANIMAL_SALE_API_CLIENT] Chuẩn bị lấy thông tin bán gia cầm theo ID giai đoạn phát triển');
      final response = await dio
          .get('${ApiEndpoints.growthStage}/growth-stage/$growthStageId/sales');
      if (response.statusCode == 200) {
        log('[ANIMAL_SALE_API_CLIENT] Lấy thông tin bán gia cầm thành công!');
        return (response.data['result'] as List)
            .map((saleLog) => SaleLogDto.fromJson(saleLog))
            .toList();
      }
      throw Exception('Lỗi không xác định!');
    } on DioException catch (e) {
      log('[ANIMAL_SALE_API_CLIENT] Lấy thông tin bán gia cầm thất bại!');
      log('Lỗi: ${e.toString()}');
      rethrow;
    }
  }

  Future<SaleLogDetailDto> getSaleLogByTaskId({required String taskId}) async {
    try {
      log('[ANIMAL_SALE_API_CLIENT] Chuẩn bị lấy thông tin bán gia cầm theo ID công việc');
      final response = await dio.get('/animalsale/$taskId');
      if (response.statusCode == 200) {
        log('[ANIMAL_SALE_API_CLIENT] Lấy thông tin bán gia cầm theo ID công việc thành công!');
        return SaleLogDetailDto.fromJson(response.data['result']);
      }
      throw Exception('Lỗi không xác định!');
    } on DioException catch (e) {
      log('[ANIMAL_SALE_API_CLIENT] Lấy thông tin bán gia cầm theo ID công việc thất bại!');
      log('Lỗi: ${e.toString()}');
      rethrow;
    }
  }
}
