// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VaccineDtoImpl _$$VaccineDtoImplFromJson(Map<String, dynamic> json) =>
    _$VaccineDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      method: json['method'] as String,
      price: (json['price'] as num).toInt(),
      ageStart: (json['ageStart'] as num).toInt(),
      ageEnd: (json['ageEnd'] as num).toInt(),
    );

Map<String, dynamic> _$$VaccineDtoImplToJson(_$VaccineDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'method': instance.method,
      'price': instance.price,
      'ageStart': instance.ageStart,
      'ageEnd': instance.ageEnd,
    };
