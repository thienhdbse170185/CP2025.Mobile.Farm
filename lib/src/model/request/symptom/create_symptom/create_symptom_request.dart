import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/request/symptom/symptom/get_symptom_request.dart';

part 'create_symptom_request.freezed.dart';
part 'create_symptom_request.g.dart';

@freezed
class CreateSymptomRequest with _$CreateSymptomRequest {
  const factory CreateSymptomRequest(
          {required String farmingBatchId,
          required String symptoms,
          required String status,
          required int affectedQuantity,
          required bool isEmergency,
          required int quantityInCage,
          required String notes,
          required List<PictureSymptom> pictures,
          required List<GetSymptomRequest> medicalSymptomDetails}) =
      _CreateSymptomRequest;

  factory CreateSymptomRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSymptomRequestFromJson(json);
}

@freezed
class PictureSymptom with _$PictureSymptom {
  const factory PictureSymptom(
      {required String image,
      required DateTime dateCaptured}) = _PictureSymptom;

  factory PictureSymptom.fromJson(Map<String, dynamic> json) =>
      _$PictureSymptomFromJson(json);
}
