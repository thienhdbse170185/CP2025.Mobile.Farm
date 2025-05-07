// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine_schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VaccineScheduleDtoImpl _$$VaccineScheduleDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$VaccineScheduleDtoImpl(
      vaccineScheduleId: json['vaccineScheduleId'] as String,
      stageId: json['stageId'] as String,
      vaccineId: json['vaccineId'] as String,
      vaccineName: json['vaccineName'] as String,
      date: DateTime.parse(json['date'] as String),
      quantity: (json['quantity'] as num).toInt(),
      applicationAge: (json['applicationAge'] as num?)?.toInt(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      session: (json['session'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$VaccineScheduleDtoImplToJson(
        _$VaccineScheduleDtoImpl instance) =>
    <String, dynamic>{
      'vaccineScheduleId': instance.vaccineScheduleId,
      'stageId': instance.stageId,
      'vaccineId': instance.vaccineId,
      'vaccineName': instance.vaccineName,
      'date': instance.date.toIso8601String(),
      'quantity': instance.quantity,
      'applicationAge': instance.applicationAge,
      'totalPrice': instance.totalPrice,
      'session': instance.session,
      'status': instance.status,
    };
