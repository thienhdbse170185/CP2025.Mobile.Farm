import 'package:smart_farm/src/model/dto/medical_symptom/medical_symptom.dart';
import 'package:smart_farm/src/model/repository/healthy/healthy_api_client.dart';
import 'package:smart_farm/src/model/request/symptom/create_symptom/create_symptom_request.dart';

class HealthyRepository {
  final HealthyApiClient apiClient;

  HealthyRepository({required this.apiClient});

  Future<MedicalSymptomDto> create(CreateSymptomRequest request) async {
    try {
      return await apiClient.create(request);
    } catch (e) {
      rethrow;
    }
  }
}
