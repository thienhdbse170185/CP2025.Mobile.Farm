// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'egg_harvest_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EggHarvestDtoImpl _$$EggHarvestDtoImplFromJson(Map<String, dynamic> json) =>
    _$EggHarvestDtoImpl(
      id: json['id'] as String,
      growthStageId: json['growthStageId'] as String,
      growthStageName: json['growthStageName'] as String,
      dateCollected: json['dateCollected'] as String,
      eggCount: (json['eggCount'] as num).toInt(),
      notes: json['notes'] as String,
      taskId: json['taskId'] as String,
    );

Map<String, dynamic> _$$EggHarvestDtoImplToJson(_$EggHarvestDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'growthStageId': instance.growthStageId,
      'growthStageName': instance.growthStageName,
      'dateCollected': instance.dateCollected,
      'eggCount': instance.eggCount,
      'notes': instance.notes,
      'taskId': instance.taskId,
    };
