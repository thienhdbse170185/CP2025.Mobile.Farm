import 'package:dio/dio.dart';
import 'package:smart_farm/src/model/dto/prescription/prescription.dart';
import 'package:smart_farm/src/model/repository/prescription/prescription_api_client.dart';
import 'package:smart_farm/src/model/request/prescription/update_status_prescription_request.dart';

class PrescriptionRepository {
  final PrescriptionApiClient apiClient;
  const PrescriptionRepository({required this.apiClient});

  Future<PrescriptionDto> getPrescriptionById(String prescriptionId) async {
    try {
      return await apiClient.getPrescriptionById(prescriptionId);
    } on DioException {
      rethrow;
    }
  }

  Future<bool> updatePrescriptionStatus(
      {required String prescriptionId,
      required UpdateStatusPrescriptionRequest request}) async {
    try {
      return await apiClient.updatePrescriptionStatus(
          prescriptionId: prescriptionId, request: request);
    } on DioException {
      rethrow;
    }
  }

  Future<bool> checkPrescriptionLastSession({
    required String prescriptionId,
    required String taskId,
  }) async {
    try {
      return await apiClient.checkPrescriptionLastSession(
        prescriptionId: prescriptionId,
        taskId: taskId,
      );
    } on DioException {
      rethrow;
    }
  }
}
