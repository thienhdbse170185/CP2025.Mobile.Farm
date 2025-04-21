// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine_schedule_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VaccineScheduleRequestImpl _$$VaccineScheduleRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$VaccineScheduleRequestImpl(
      stageId: json['stageId'] as String,
      date: json['date'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$VaccineScheduleRequestImplToJson(
        _$VaccineScheduleRequestImpl instance) =>
    <String, dynamic>{
      'stageId': instance.stageId,
      'date': instance.date,
      'status': instance.status,
    };
