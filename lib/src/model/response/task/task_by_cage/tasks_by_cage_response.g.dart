// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_by_cage_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TasksByCageResponseImpl _$$TasksByCageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TasksByCageResponseImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalItems: (json['totalItems'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      hasNextPage: json['hasNextPage'] as bool,
      hasPreviousPage: json['hasPreviousPage'] as bool,
    );

Map<String, dynamic> _$$TasksByCageResponseImplToJson(
        _$TasksByCageResponseImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'hasNextPage': instance.hasNextPage,
      'hasPreviousPage': instance.hasPreviousPage,
    };
