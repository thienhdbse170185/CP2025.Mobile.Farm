// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_log_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SaleLogDtoImpl _$$SaleLogDtoImplFromJson(Map<String, dynamic> json) =>
    _$SaleLogDtoImpl(
      saleType: json['saleType'] as String,
      totalQuantity: (json['totalQuantity'] as num).toInt(),
      totalRevenue: (json['totalRevenue'] as num).toInt(),
      unitPriceAverage: (json['unitPriceAverage'] as num).toInt(),
      logs: (json['logs'] as List<dynamic>)
          .map((e) => SaleDetailLogDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SaleLogDtoImplToJson(_$SaleLogDtoImpl instance) =>
    <String, dynamic>{
      'saleType': instance.saleType,
      'totalQuantity': instance.totalQuantity,
      'totalRevenue': instance.totalRevenue,
      'unitPriceAverage': instance.unitPriceAverage,
      'logs': instance.logs,
    };
