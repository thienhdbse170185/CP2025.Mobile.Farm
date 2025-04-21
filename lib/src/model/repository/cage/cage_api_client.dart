import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smart_farm/api_endpoints.dart';
import 'package:smart_farm/src/model/dto/cage_admin/cage_admin_dto.dart';
import 'package:smart_farm/src/model/entity/cage/cage.dart';
import 'package:smart_farm/src/model/response/cage/get_all/get_all_cage_response.dart';

class CageApiClient {
  final Dio dio;
  const CageApiClient({required this.dio});

  Future<GetAllCageResponse> fetchAllCages() async {
    try {
      final response = await dio.get(ApiEndpoints.getCages);
      return GetAllCageResponse.fromJson(response.data['result']);
    } on DioException {
      rethrow;
    }
  }

  Future<Cage> fetchCageById(String id) async {
    try {
      final response = await dio.get('${ApiEndpoints.getCages}/$id');
      return Cage.fromJson(response.data['result']);
    } on DioException {
      rethrow;
    }
  }

  Future<CageAdminDto> getCageAdminById({required String cageId}) async {
    try {
      log('[CAGE_API_CLIENT] Đang call API lấy thông tin cage id $cageId');
      final response = await dio
          .get('${ApiEndpoints.farmingBatch}/$cageId/current-farming-stage');
      log('[CAGE_API_CLIENT] Lấy thông tin cage id $cageId thành công');
      return CageAdminDto.fromJson(response.data['result']);
    } on DioException catch (e) {
      log('[CAGE_API_CLIENT] Lấy thông tin cage id $cageId thất bại');
      log('[CAGE_API_CLIENT] Error: $e');
      rethrow;
    }
  }

  Future<List<Cage>> fetchCagesByUserId(String userId) async {
    try {
      log('[CAGE_API_CLIENT] Đang call API lấy thông tin chuồng theo userId $userId');
      final response = await dio.get('${ApiEndpoints.getUsers}/$userId/cages');
      if (response.statusCode == 200) {
        log('[CAGE_API_CLIENT] Lấy thông tin chuồng theo userId $userId thành công');
        return (response.data['result'] as List)
            .map((e) => Cage.fromJson(e))
            .toList();
      } else {
        log('[CAGE_API_CLIENT] Lỗi không xác định khi lấy thông tin chuồng theo userId $userId');
        throw Exception('get-cage-by-user-id-failed');
      }
    } on DioException catch (e) {
      log('[CAGE_API_CLIENT] Lấy thông tin chuồng theo userId $userId thất bại');
      log('[CAGE_API_CLIENT] Error: $e');
      if (e.response?.data != null) {
        if (e.response?.statusCode == 400) {
          final errorMessage = e.response?.data['result']['message'] as String;
          if (errorMessage.contains('No cages found')) {
            throw Exception('no-cages-found');
          }
        }
      }
      rethrow;
    }
  }
}
