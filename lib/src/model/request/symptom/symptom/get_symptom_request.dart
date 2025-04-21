import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_symptom_request.freezed.dart';
part 'get_symptom_request.g.dart';

@freezed
class GetSymptomRequest with _$GetSymptomRequest {
  const factory GetSymptomRequest({
    required String symptomId,
    required String notes,
  }) = _GetSymptomRequest;

  factory GetSymptomRequest.fromJson(Map<String, dynamic> json) =>
      _$GetSymptomRequestFromJson(json);
}
