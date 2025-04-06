// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_vaccine_log_cubit_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateVaccineLogCubitParamsImpl _$$CreateVaccineLogCubitParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateVaccineLogCubitParamsImpl(
      vaccineScheduleLogRequest: VaccineScheduleLogRequest.fromJson(
          json['vaccineScheduleLogRequest'] as Map<String, dynamic>),
      afterSymptomReport: json['afterSymptomReport'] as bool,
    );

Map<String, dynamic> _$$CreateVaccineLogCubitParamsImplToJson(
        _$CreateVaccineLogCubitParamsImpl instance) =>
    <String, dynamic>{
      'vaccineScheduleLogRequest': instance.vaccineScheduleLogRequest,
      'afterSymptomReport': instance.afterSymptomReport,
    };
