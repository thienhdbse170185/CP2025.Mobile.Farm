// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farming_batch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FarmingBatchDtoImpl _$$FarmingBatchDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$FarmingBatchDtoImpl(
      id: json['id'] as String,
      farmingbatchCode: json['farmingbatchCode'] as String?,
      name: json['name'] as String,
      species: json['species'] as String?,
      startDate: json['startDate'] as String?,
      completeAt: json['completeAt'] as String?,
      estimatedTimeStart: json['estimatedTimeStart'] as String?,
      endDate: json['endDate'] as String?,
      status: json['status'] as String,
      cleaningFrequency: (json['cleaningFrequency'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      affectedQuantity: (json['affectedQuantity'] as num?)?.toInt(),
      growthStageDetails: json['growthStageDetails'] == null
          ? null
          : GrowthStageDto.fromJson(
              json['growthStageDetails'] as Map<String, dynamic>),
      cage: json['cage'] == null
          ? null
          : CageDto.fromJson(json['cage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FarmingBatchDtoImplToJson(
        _$FarmingBatchDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'farmingbatchCode': instance.farmingbatchCode,
      'name': instance.name,
      'species': instance.species,
      'startDate': instance.startDate,
      'completeAt': instance.completeAt,
      'estimatedTimeStart': instance.estimatedTimeStart,
      'endDate': instance.endDate,
      'status': instance.status,
      'cleaningFrequency': instance.cleaningFrequency,
      'quantity': instance.quantity,
      'affectedQuantity': instance.affectedQuantity,
      'growthStageDetails': instance.growthStageDetails,
      'cage': instance.cage,
    };
