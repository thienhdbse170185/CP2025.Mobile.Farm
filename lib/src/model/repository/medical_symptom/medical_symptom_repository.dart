import 'package:smart_farm/src/model/repository/medical_symptom/medical_symptom_api_client.dart';
import 'package:smart_farm/src/model/response/medical_symptom/medical_symptom_response.dart';

class MedicalSymptomRepository {
  final MedicalSymptomApiClient apiClient;
  const MedicalSymptomRepository({required this.apiClient});

  Future<List<MedicalSymptomResponse>?> getSymptomsByBatch(
      String userId, String? farmingBatchId) async {
    try {
      return await apiClient.getSymptomsByBatch(userId, farmingBatchId);
    } catch (e) {
      rethrow;
    }
  }
}
