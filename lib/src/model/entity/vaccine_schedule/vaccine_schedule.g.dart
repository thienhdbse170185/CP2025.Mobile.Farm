// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VaccineScheduleImpl _$$VaccineScheduleImplFromJson(
        Map<String, dynamic> json) =>
    _$VaccineScheduleImpl(
      id: json['id'] as String,
      vaccineId: json['vaccineId'] as String,
      stageId: json['stageId'] as String,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      quantity: (json['quantity'] as num).toInt(),
      status: json['status'] as String,
      applicationAge: (json['applicationAge'] as num).toInt(),
    );

Map<String, dynamic> _$$VaccineScheduleImplToJson(
        _$VaccineScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vaccineId': instance.vaccineId,
      'stageId': instance.stageId,
      'date': instance.date?.toIso8601String(),
      'quantity': instance.quantity,
      'status': instance.status,
      'applicationAge': instance.applicationAge,
    };
