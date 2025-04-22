// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_food_usage_log_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyFoodUsageLogDtoImpl _$$DailyFoodUsageLogDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyFoodUsageLogDtoImpl(
      recommendedWeight: (json['recommendedWeight'] as num).toDouble(),
      actualWeight: (json['actualWeight'] as num).toDouble(),
      notes: json['notes'] as String,
      logTime: DateTime.parse(json['logTime'] as String),
      photo: json['photo'] as String,
      taskId: json['taskId'] as String,
    );

Map<String, dynamic> _$$DailyFoodUsageLogDtoImplToJson(
        _$DailyFoodUsageLogDtoImpl instance) =>
    <String, dynamic>{
      'recommendedWeight': instance.recommendedWeight,
      'actualWeight': instance.actualWeight,
      'notes': instance.notes,
      'logTime': instance.logTime.toIso8601String(),
      'photo': instance.photo,
      'taskId': instance.taskId,
    };
