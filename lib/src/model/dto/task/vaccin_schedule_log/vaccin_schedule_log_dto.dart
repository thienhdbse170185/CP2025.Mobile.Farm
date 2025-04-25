import 'package:freezed_annotation/freezed_annotation.dart';

part 'vaccin_schedule_log_dto.freezed.dart';
part 'vaccin_schedule_log_dto.g.dart';

@freezed
class VaccineScheduleLogDto with _$VaccineScheduleLogDto {
  const factory VaccineScheduleLogDto({
    required String id,
    required String scheduleId,
    required String date,
    required String notes,
    required String photo,
    required String taskId,
    required int quantity,
    required double toltalPrice,
  }) = _VaccinScheduleLogDto;

  factory VaccineScheduleLogDto.fromJson(Map<String, dynamic> json) =>
      _$VaccineScheduleLogDtoFromJson(json);
}
