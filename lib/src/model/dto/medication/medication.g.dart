// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedicationDtoImpl _$$MedicationDtoImplFromJson(Map<String, dynamic> json) =>
    _$MedicationDtoImpl(
      medicationId: json['medicationId'] as String,
      medicationName: json['medicationName'] as String,
      morning: (json['morning'] as num).toInt(),
      afternoon: (json['afternoon'] as num).toInt(),
      evening: (json['evening'] as num).toInt(),
      noon: (json['noon'] as num).toInt(),
    );

Map<String, dynamic> _$$MedicationDtoImplToJson(_$MedicationDtoImpl instance) =>
    <String, dynamic>{
      'medicationId': instance.medicationId,
      'medicationName': instance.medicationName,
      'morning': instance.morning,
      'afternoon': instance.afternoon,
      'evening': instance.evening,
      'noon': instance.noon,
    };
