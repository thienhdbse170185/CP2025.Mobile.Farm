// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'egg_harvest_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EggHarvestResponseImpl _$$EggHarvestResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EggHarvestResponseImpl(
      success: json['success'] as bool,
      result: (json['result'] as List<dynamic>)
          .map((e) => EggHarvestDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EggHarvestResponseImplToJson(
        _$EggHarvestResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
    };
