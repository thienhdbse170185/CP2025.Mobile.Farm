// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_log_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthLogDtoImpl _$$HealthLogDtoImplFromJson(Map<String, dynamic> json) =>
    _$HealthLogDtoImpl(
      id: json['id'] as String?,
      prescriptionId: json['prescriptionId'] as String?,
      date: DateTime.parse(json['date'] as String),
      notes: json['notes'] as String,
      photo: json['photo'] as String?,
      taskId: json['taskId'] as String,
    );

Map<String, dynamic> _$$HealthLogDtoImplToJson(_$HealthLogDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prescriptionId': instance.prescriptionId,
      'date': instance.date.toIso8601String(),
      'notes': instance.notes,
      'photo': instance.photo,
      'taskId': instance.taskId,
    };
