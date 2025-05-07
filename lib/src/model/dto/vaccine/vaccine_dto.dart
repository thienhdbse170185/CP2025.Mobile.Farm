import 'package:freezed_annotation/freezed_annotation.dart';

part 'vaccine_dto.freezed.dart';
part 'vaccine_dto.g.dart';

@freezed
class VaccineDto with _$VaccineDto {
  factory VaccineDto({
    required String id,
    required String name,
    required String method,
    required int price,
    required int pricePerDose,
    required int ageStart,
    required int ageEnd,
  }) = _VaccineDto;

  factory VaccineDto.fromJson(Map<String, dynamic> json) =>
      _$VaccineDtoFromJson(json);
}
