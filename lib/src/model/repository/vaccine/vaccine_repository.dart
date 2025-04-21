import 'package:smart_farm/src/model/dto/vaccine/vaccine_dto.dart';
import 'package:smart_farm/src/model/repository/vaccine/vaccine_api_client.dart';

class VaccineRepository {
  final VaccineApiClient _vaccineApiClient;
  const VaccineRepository({required VaccineApiClient vaccineApiClient})
      : _vaccineApiClient = vaccineApiClient;

  Future<VaccineDto> getVaccineById({required String id}) async {
    try {
      final response = await _vaccineApiClient.getVaccineById(id: id);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
