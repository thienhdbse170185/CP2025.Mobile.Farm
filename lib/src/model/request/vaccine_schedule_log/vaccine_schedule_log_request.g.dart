// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine_schedule_log_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VaccineScheduleLogRequestImpl _$$VaccineScheduleLogRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$VaccineScheduleLogRequestImpl(
      date: json['date'] as String,
      session: (json['session'] as num).toInt(),
      vaccineId: json['vaccineId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      notes: json['notes'] as String,
      photo: json['photo'] as String,
      taskId: json['taskId'] as String,
    );

Map<String, dynamic> _$$VaccineScheduleLogRequestImplToJson(
        _$VaccineScheduleLogRequestImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'session': instance.session,
      'vaccineId': instance.vaccineId,
      'quantity': instance.quantity,
      'notes': instance.notes,
      'photo': instance.photo,
      'taskId': instance.taskId,
    };
