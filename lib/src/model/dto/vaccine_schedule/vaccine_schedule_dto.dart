import 'package:freezed_annotation/freezed_annotation.dart';

part 'vaccine_schedule_dto.freezed.dart';
part 'vaccine_schedule_dto.g.dart';

@freezed
class VaccineScheduleDto with _$VaccineScheduleDto {
  factory VaccineScheduleDto({
    required String vaccineScheduleId,
    required String stageId,
    required String vaccineId,
    required String vaccineName,
    required DateTime date,
    required int quantity,
    required int applicationAge,
    double? totalPrice,
    required int session,
    required String status,
  }) = _VaccineScheduleDto;

  factory VaccineScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$VaccineScheduleDtoFromJson(json);
}
