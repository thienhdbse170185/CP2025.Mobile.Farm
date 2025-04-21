// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine_schedule_log_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VaccineScheduleLogResponseImpl _$$VaccineScheduleLogResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VaccineScheduleLogResponseImpl(
      success: json['success'] as bool,
      result: VaccineScheduleLogDto.fromJson(
          json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VaccineScheduleLogResponseImplToJson(
        _$VaccineScheduleLogResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
    };
