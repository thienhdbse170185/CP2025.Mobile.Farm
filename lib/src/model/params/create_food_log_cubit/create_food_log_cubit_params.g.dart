// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_food_log_cubit_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateFoodLogCubitParamsImpl _$$CreateFoodLogCubitParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateFoodLogCubitParamsImpl(
      cageId: json['cageId'] as String,
      log: DailyFoodUsageLogDto.fromJson(json['log'] as Map<String, dynamic>),
      afterSymptomReport: json['afterSymptomReport'] as bool,
    );

Map<String, dynamic> _$$CreateFoodLogCubitParamsImplToJson(
        _$CreateFoodLogCubitParamsImpl instance) =>
    <String, dynamic>{
      'cageId': instance.cageId,
      'log': instance.log,
      'afterSymptomReport': instance.afterSymptomReport,
    };
