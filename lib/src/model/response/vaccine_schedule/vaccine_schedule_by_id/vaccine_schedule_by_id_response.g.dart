// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine_schedule_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VaccineScheduleByIdResponseImpl _$$VaccineScheduleByIdResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VaccineScheduleByIdResponseImpl(
      success: json['success'] as bool,
      result:
          VaccineScheduleDto.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VaccineScheduleByIdResponseImplToJson(
        _$VaccineScheduleByIdResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
    };
