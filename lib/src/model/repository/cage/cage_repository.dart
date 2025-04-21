import 'package:smart_farm/src/model/dto/cage_admin/cage_admin_dto.dart';
import 'package:smart_farm/src/model/entity/cage/cage.dart';
import 'package:smart_farm/src/model/repository/cage/cage_api_client.dart';
import 'package:smart_farm/src/model/response/cage/get_all/get_all_cage_response.dart';

class CageRepository {
  final CageApiClient cageApiClient;
  const CageRepository({required this.cageApiClient});

  Future<GetAllCageResponse> getAllCages() async {
    try {
      return await cageApiClient.fetchAllCages();
    } catch (e) {
      rethrow;
    }
  }

  Future<Cage> getCageById(String id) async {
    try {
      return await cageApiClient.fetchCageById(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<CageAdminDto> getCageAdminById({required String cageId}) async {
    try {
      return await cageApiClient.getCageAdminById(cageId: cageId);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Cage>> getCagesByUserId(String userId) async {
    try {
      return await cageApiClient.fetchCagesByUserId(userId);
    } catch (e) {
      rethrow;
    }
  }
}
