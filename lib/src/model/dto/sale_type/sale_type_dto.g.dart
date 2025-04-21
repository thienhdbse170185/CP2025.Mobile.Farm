// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SaleTypeDtoImpl _$$SaleTypeDtoImplFromJson(Map<String, dynamic> json) =>
    _$SaleTypeDtoImpl(
      id: json['id'] as String,
      stageTypeName: json['stageTypeName'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$SaleTypeDtoImplToJson(_$SaleTypeDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stageTypeName': instance.stageTypeName,
      'description': instance.description,
    };
