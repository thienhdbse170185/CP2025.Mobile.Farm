// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_type_by_name_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SaleTypeByNameResponseImpl _$$SaleTypeByNameResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SaleTypeByNameResponseImpl(
      success: json['success'] as bool,
      result:
          SaleTypeByNameResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SaleTypeByNameResponseImplToJson(
        _$SaleTypeByNameResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
    };

_$SaleTypeByNameResultImpl _$$SaleTypeByNameResultImplFromJson(
        Map<String, dynamic> json) =>
    _$SaleTypeByNameResultImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => SaleTypeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalItems: (json['totalItems'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      hasNextPage: json['hasNextPage'] as bool,
      hasPreviousPage: json['hasPreviousPage'] as bool,
    );

Map<String, dynamic> _$$SaleTypeByNameResultImplToJson(
        _$SaleTypeByNameResultImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'hasNextPage': instance.hasNextPage,
      'hasPreviousPage': instance.hasPreviousPage,
    };
