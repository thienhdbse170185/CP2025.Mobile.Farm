import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/prescription/prescription.dart';
import 'package:smart_farm/src/model/dto/symptom/symptom.dart';
import 'package:smart_farm/src/model/request/symptom/create_symptom/create_symptom_request.dart';

part 'medical_symptom_response.freezed.dart';
part 'medical_symptom_response.g.dart';

@freezed
class MedicalSymptomResponse with _$MedicalSymptomResponse {
  factory MedicalSymptomResponse({
    required String id,
    required String farmingBatchId,
    required String? symtom,
    required String? diagnosis,
    required DateTime createAt,
    required String status,
    required int affectedQuantity,
    required int? quantity,
    required String? nameAnimal,
    required String notes,
    required List<PictureSymptom>? pictures,
    required List<SymptomDto>? medicalSymptomDetails,
    required List<PrescriptionDto>? prescriptions,
  }) = _MedicalSymptomResponse;

  factory MedicalSymptomResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicalSymptomResponseFromJson(json);
}
