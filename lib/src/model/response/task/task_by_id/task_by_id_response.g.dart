// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskByIdResponseImpl _$$TaskByIdResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TaskByIdResponseImpl(
      task: Task.fromJson(json['task'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaskByIdResponseImplToJson(
        _$TaskByIdResponseImpl instance) =>
    <String, dynamic>{
      'task': instance.task,
    };
