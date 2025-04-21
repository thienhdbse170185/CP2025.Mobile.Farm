import 'package:freezed_annotation/freezed_annotation.dart';

part 'symptom.freezed.dart';
part 'symptom.g.dart';

@freezed
class SymptomDto with _$SymptomDto {
  const factory SymptomDto({
    required String id,
    required String symptomName,
  }) = _SymptomDto;

  factory SymptomDto.fromJson(Map<String, dynamic> json) =>
      _$SymptomDtoFromJson(json);
}
