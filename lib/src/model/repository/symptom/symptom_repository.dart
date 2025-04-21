import 'package:smart_farm/src/model/dto/symptom/symptom.dart';
import 'package:smart_farm/src/model/repository/symptom/symptom_api_client.dart';
import 'package:smart_farm/src/model/request/symptom/create_symptom/create_symptom_request.dart';

class SymptomRepository {
  final SymptomApiClient apiClient;
  SymptomRepository({required this.apiClient});

  Future<List> getAll() async {
    throw UnimplementedError();
  }

  Future<bool> insert(CreateSymptomRequest request) async {
    try {
      await apiClient.create(request);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SymptomDto>> getSymptoms() async {
    try {
      return await apiClient.getSymptoms();
    } catch (e) {
      rethrow;
    }
  }
}
