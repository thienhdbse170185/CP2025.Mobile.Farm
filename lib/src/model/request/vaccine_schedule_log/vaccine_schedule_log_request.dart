import 'package:freezed_annotation/freezed_annotation.dart';

part 'vaccine_schedule_log_request.freezed.dart';
part 'vaccine_schedule_log_request.g.dart';

@freezed
class VaccineScheduleLogRequest with _$VaccineScheduleLogRequest {
  const factory VaccineScheduleLogRequest({
    required String date,
    required int session,
    required String vaccineId,
    required int quantity,
    required String notes,
    required String photo,
    required String taskId,
  }) = _VaccineScheduleLogRequest;

  factory VaccineScheduleLogRequest.fromJson(Map<String, dynamic> json) =>
      _$VaccineScheduleLogRequestFromJson(json);
}
