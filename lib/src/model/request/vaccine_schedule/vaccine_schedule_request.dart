import 'package:freezed_annotation/freezed_annotation.dart';

part 'vaccine_schedule_request.freezed.dart';
part 'vaccine_schedule_request.g.dart';

@freezed
class VaccineScheduleRequest with _$VaccineScheduleRequest {
  const factory VaccineScheduleRequest({
    required String stageId,
    required String? date,
    required String status,
  }) = _VaccineScheduleRequest;

  factory VaccineScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$VaccineScheduleRequestFromJson(json);
}
