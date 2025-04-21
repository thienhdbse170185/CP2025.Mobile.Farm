import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smart_farm/api_endpoints.dart';
import 'package:smart_farm/src/model/response/sale_type/sale_type_by_name_response.dart';

class SaleTypeApiClient {
  final Dio dio;
  const SaleTypeApiClient({required this.dio});

  Future<SaleTypeByNameResponse> getByName(
      {required String saleTypeName}) async {
    try {
      log('[SALE_TYPE_API_CLIENT] Chuẩn bị lấy thông tin loại bán hàng theo tên');
      log('Tên loại bán hàng: $saleTypeName');
      final response = await dio.get(ApiEndpoints.saleType, queryParameters: {
        'StageTypeName': saleTypeName,
      });
      if (response.statusCode == 200) {
        log('[SALE_TYPE_API_CLIENT] Lấy thông tin loại bán hàng theo tên thành công!');
        return SaleTypeByNameResponse.fromJson(response.data);
      }
      throw Exception('Failed to get sale type by name');
    } on DioException catch (e) {
      log('[SALE_TYPE_API_CLIENT] Lấy thông tin loại bán hàng theo tên thất bại!');
      log('Lỗi: ${e.toString()}');
      rethrow;
    }
  }
}
