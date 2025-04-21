import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/medication/medication.dart';

part 'prescription.freezed.dart';
part 'prescription.g.dart';

@freezed
class PrescriptionDto with _$PrescriptionDto {
  const factory PrescriptionDto({
    required String id,
    required DateTime prescribedDate,
    required String notes,
    required int quantityAnimal,
    required String status,
    required double? price,
    required String cageId,
    required int daysToTake,
    required DateTime? endDate,
    required List<MedicationDto>? medications,
  }) = _PrescriptionDto;

  factory PrescriptionDto.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionDtoFromJson(json);
}
