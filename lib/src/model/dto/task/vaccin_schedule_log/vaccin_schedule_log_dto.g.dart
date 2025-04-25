// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccin_schedule_log_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VaccinScheduleLogDtoImpl _$$VaccinScheduleLogDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$VaccinScheduleLogDtoImpl(
      id: json['id'] as String,
      scheduleId: json['scheduleId'] as String,
      date: json['date'] as String,
      notes: json['notes'] as String,
      photo: json['photo'] as String,
      taskId: json['taskId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      toltalPrice: (json['toltalPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$VaccinScheduleLogDtoImplToJson(
        _$VaccinScheduleLogDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scheduleId': instance.scheduleId,
      'date': instance.date,
      'notes': instance.notes,
      'photo': instance.photo,
      'taskId': instance.taskId,
      'quantity': instance.quantity,
      'toltalPrice': instance.toltalPrice,
    };
