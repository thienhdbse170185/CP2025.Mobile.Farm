// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_health_log_cubit_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateHealthLogCubitParamsImpl _$$CreateHealthLogCubitParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateHealthLogCubitParamsImpl(
      prescriptionId: json['prescriptionId'] as String,
      log: HealthLogDto.fromJson(json['log'] as Map<String, dynamic>),
      afterSymptomReport: json['afterSymptomReport'] as bool,
    );

Map<String, dynamic> _$$CreateHealthLogCubitParamsImplToJson(
        _$CreateHealthLogCubitParamsImpl instance) =>
    <String, dynamic>{
      'prescriptionId': instance.prescriptionId,
      'log': instance.log,
      'afterSymptomReport': instance.afterSymptomReport,
    };
