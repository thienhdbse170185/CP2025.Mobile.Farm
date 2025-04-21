import 'package:freezed_annotation/freezed_annotation.dart';

part 'vaccine_schedule.freezed.dart';
part 'vaccine_schedule.g.dart';

@freezed
class VaccineSchedule with _$VaccineSchedule {
  const factory VaccineSchedule({
    required String id,
    required String vaccineId,
    required String stageId,
    required DateTime? date,
    required int quantity,
    required String status,
    required int applicationAge,
  }) = _VaccineSchedule;

  factory VaccineSchedule.fromJson(Map<String, dynamic> json) =>
      _$VaccineScheduleFromJson(json);
}
