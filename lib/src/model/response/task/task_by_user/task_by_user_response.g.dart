// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_by_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskByUserResponseImpl _$$TaskByUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TaskByUserResponseImpl(
      sessionName: json['sessionName'] as String,
      cages: (json['cages'] as List<dynamic>)
          .map((e) => CageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TaskByUserResponseImplToJson(
        _$TaskByUserResponseImpl instance) =>
    <String, dynamic>{
      'sessionName': instance.sessionName,
      'cages': instance.cages,
    };
