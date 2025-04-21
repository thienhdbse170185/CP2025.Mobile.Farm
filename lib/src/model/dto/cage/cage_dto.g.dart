// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cage_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CageDtoImpl _$$CageDtoImplFromJson(Map<String, dynamic> json) =>
    _$CageDtoImpl(
      cageId: json['cageId'] as String,
      cageName: json['cageName'] as String,
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CageDtoImplToJson(_$CageDtoImpl instance) =>
    <String, dynamic>{
      'cageId': instance.cageId,
      'cageName': instance.cageName,
      'tasks': instance.tasks,
    };
