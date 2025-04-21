// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'egg_harvest_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EggHarvestRequestImpl _$$EggHarvestRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$EggHarvestRequestImpl(
      growthStageId: json['growthStageId'] as String,
      eggCount: (json['eggCount'] as num).toInt(),
      notes: json['notes'] as String,
      taskId: json['taskId'] as String,
    );

Map<String, dynamic> _$$EggHarvestRequestImplToJson(
        _$EggHarvestRequestImpl instance) =>
    <String, dynamic>{
      'growthStageId': instance.growthStageId,
      'eggCount': instance.eggCount,
      'notes': instance.notes,
      'taskId': instance.taskId,
    };
