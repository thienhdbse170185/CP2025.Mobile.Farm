import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_log_dto.freezed.dart';
part 'health_log_dto.g.dart';

@freezed
class HealthLogDto with _$HealthLogDto {
  const factory HealthLogDto({
    String? id,
    String? prescriptionId,
    required DateTime date,
    required String notes,
    required String? photo,
    required String taskId,
  }) = _HealthLogDto;

  factory HealthLogDto.fromJson(Map<String, dynamic> json) =>
      _$HealthLogDtoFromJson(json);
}
