// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CageImpl _$$CageImplFromJson(Map<String, dynamic> json) => _$CageImpl(
      id: json['id'] as String,
      penCode: json['penCode'] as String,
      farmId: json['farmId'] as String,
      name: json['name'] as String,
      area: (json['area'] as num?)?.toInt(),
      location: json['location'] as String?,
      capacity: (json['capacity'] as num?)?.toInt(),
      boardCode: json['boardCode'] as String,
      boardStatus: json['boardStatus'] as bool?,
      createdDate: json['createdDate'] as String,
      modifiedDate: json['modifiedDate'] as String?,
      cameraUrl: json['cameraUrl'] as String,
    );

Map<String, dynamic> _$$CageImplToJson(_$CageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'penCode': instance.penCode,
      'farmId': instance.farmId,
      'name': instance.name,
      'area': instance.area,
      'location': instance.location,
      'capacity': instance.capacity,
      'boardCode': instance.boardCode,
      'boardStatus': instance.boardStatus,
      'createdDate': instance.createdDate,
      'modifiedDate': instance.modifiedDate,
      'cameraUrl': instance.cameraUrl,
    };
