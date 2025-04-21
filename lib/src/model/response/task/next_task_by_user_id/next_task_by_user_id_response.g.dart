// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_task_by_user_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NextTaskByUserIdResponseImpl _$$NextTaskByUserIdResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NextTaskByUserIdResponseImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => NextTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NextTaskByUserIdResponseImplToJson(
        _$NextTaskByUserIdResponseImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
