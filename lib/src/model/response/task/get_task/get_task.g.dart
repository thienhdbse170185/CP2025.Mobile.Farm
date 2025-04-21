// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetTaskResponseImpl _$$GetTaskResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetTaskResponseImpl(
      success: json['success'] as bool,
      result: GetTaskResponseResult.fromJson(
          json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetTaskResponseImplToJson(
        _$GetTaskResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
    };

_$GetTaskResponseResultImpl _$$GetTaskResponseResultImplFromJson(
        Map<String, dynamic> json) =>
    _$GetTaskResponseResultImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => TaskHaveCageName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetTaskResponseResultImplToJson(
        _$GetTaskResponseResultImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
