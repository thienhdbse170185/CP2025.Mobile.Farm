import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_status_prescription_request.freezed.dart';
part 'update_status_prescription_request.g.dart';

@freezed
class UpdateStatusPrescriptionRequest with _$UpdateStatusPrescriptionRequest {
  factory UpdateStatusPrescriptionRequest({
    required String status,
    required int remainingQuantity,
  }) = _UpdateStatusPrescriptionRequest;

  factory UpdateStatusPrescriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateStatusPrescriptionRequestFromJson(json);
}
