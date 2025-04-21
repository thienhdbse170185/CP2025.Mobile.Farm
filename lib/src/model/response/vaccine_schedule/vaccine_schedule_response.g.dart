// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine_schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VaccineScheduleResponseImpl _$$VaccineScheduleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VaccineScheduleResponseImpl(
      success: json['success'] as bool,
      result: (json['result'] as List<dynamic>)
          .map((e) => VaccineScheduleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VaccineScheduleResponseImplToJson(
        _$VaccineScheduleResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
    };
