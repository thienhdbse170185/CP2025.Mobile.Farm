import 'package:smart_farm/src/model/dto/growth_stage/growth_stage_dto.dart';
import 'package:smart_farm/src/model/repository/growth_stage/growth_stage_api_client.dart';
import 'package:smart_farm/src/model/request/growth_stage/update_weight/update_weight_request.dart';

class GrowthStageRepository {
  final GrowthStageApiClient apiClient;
  const GrowthStageRepository({required this.apiClient});

  Future<GrowthStageDto> getGrowthStageByCageId(String cageId) async {
    try {
      return apiClient.getGrowthStageByCageId(cageId);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateWeight({required UpdateWeightRequest request}) async {
    try {
      return apiClient.updateWeight(request: request);
    } catch (e) {
      rethrow;
    }
  }
}
