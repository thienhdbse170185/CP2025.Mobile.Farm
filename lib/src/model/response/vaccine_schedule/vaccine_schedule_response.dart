import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/vaccine_schedule/vaccine_schedule_dto.dart';

part 'vaccine_schedule_response.freezed.dart';
part 'vaccine_schedule_response.g.dart';

@freezed
class VaccineScheduleResponse with _$VaccineScheduleResponse {
  const factory VaccineScheduleResponse({
    required bool success,
    required List<VaccineScheduleDto> result,
  }) = _VaccineScheduleResponse;

  factory VaccineScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$VaccineScheduleResponseFromJson(json);
}
