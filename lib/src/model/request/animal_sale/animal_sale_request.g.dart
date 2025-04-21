// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_sale_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimalSaleRequestImpl _$$AnimalSaleRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AnimalSaleRequestImpl(
      growthStageId: json['growthStageId'] as String,
      saleDate: json['saleDate'] as String,
      unitPrice: (json['unitPrice'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      weight: (json['weight'] as num).toDouble(),
      staffId: json['staffId'] as String,
      saleTypeId: json['saleTypeId'] as String,
      taskId: json['taskId'] as String,
    );

Map<String, dynamic> _$$AnimalSaleRequestImplToJson(
        _$AnimalSaleRequestImpl instance) =>
    <String, dynamic>{
      'growthStageId': instance.growthStageId,
      'saleDate': instance.saleDate,
      'unitPrice': instance.unitPrice,
      'quantity': instance.quantity,
      'weight': instance.weight,
      'staffId': instance.staffId,
      'saleTypeId': instance.saleTypeId,
      'taskId': instance.taskId,
    };
