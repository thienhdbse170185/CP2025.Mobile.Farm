// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_detail_log_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SaleDetailLogDtoImpl _$$SaleDetailLogDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SaleDetailLogDtoImpl(
      saleDate: json['saleDate'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unitPrice'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$SaleDetailLogDtoImplToJson(
        _$SaleDetailLogDtoImpl instance) =>
    <String, dynamic>{
      'saleDate': instance.saleDate,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'total': instance.total,
    };
