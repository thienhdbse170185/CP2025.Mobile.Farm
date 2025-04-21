import 'package:freezed_annotation/freezed_annotation.dart';

part 'medication.freezed.dart';
part 'medication.g.dart';

@freezed
class MedicationDto with _$MedicationDto {
  const factory MedicationDto({
    required String medicationId,
    required String medicationName,
    required int morning,
    required int afternoon,
    required int evening,
    required int noon,
  }) = _MedicationDto;

  factory MedicationDto.fromJson(Map<String, dynamic> json) =>
      _$MedicationDtoFromJson(json);
}
