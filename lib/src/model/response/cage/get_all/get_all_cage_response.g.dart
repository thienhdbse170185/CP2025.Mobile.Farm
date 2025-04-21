// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_cage_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetAllCageResponseImpl _$$GetAllCageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetAllCageResponseImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => CageAdminDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetAllCageResponseImplToJson(
        _$GetAllCageResponseImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
