// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_sale_log_cubit_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateSaleLogCubitParamsImpl _$$CreateSaleLogCubitParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateSaleLogCubitParamsImpl(
      growthStageId: json['growthStageId'] as String,
      saleDate: json['saleDate'] as String,
      unitPrice: (json['unitPrice'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      weight: (json['weight'] as num).toDouble(),
      saleTypeId: json['saleTypeId'] as String,
      taskId: json['taskId'] as String,
    );

Map<String, dynamic> _$$CreateSaleLogCubitParamsImplToJson(
        _$CreateSaleLogCubitParamsImpl instance) =>
    <String, dynamic>{
      'growthStageId': instance.growthStageId,
      'saleDate': instance.saleDate,
      'unitPrice': instance.unitPrice,
      'quantity': instance.quantity,
      'weight': instance.weight,
      'saleTypeId': instance.saleTypeId,
      'taskId': instance.taskId,
    };
