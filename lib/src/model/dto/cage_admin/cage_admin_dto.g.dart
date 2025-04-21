// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cage_admin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CageAdminDtoImpl _$$CageAdminDtoImplFromJson(Map<String, dynamic> json) =>
    _$CageAdminDtoImpl(
      id: json['id'] as String,
      penCode: json['penCode'] as String,
      farmId: json['farmId'] as String,
      name: json['name'] as String,
      area: (json['area'] as num).toInt(),
      animalType: json['animalType'] as String?,
      location: json['location'] as String,
      capacity: (json['capacity'] as num).toInt(),
      boardCode: json['boardCode'] as String,
      boardStatus: json['boardStatus'] as bool,
      endDateOfFarmingBatch: json['endDateOfFarmingBatch'] as String?,
      createdDate: json['createdDate'] as String,
      cameraUrl: json['cameraUrl'] as String,
      staffId: json['staffId'] as String,
      staffName: json['staffName'] as String,
      isSolationCage: json['isSolationCage'] as bool?,
      farmingBatchStageModel: json['farmingBatchStageModel'] == null
          ? null
          : FarmingBatchDto.fromJson(
              json['farmingBatchStageModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CageAdminDtoImplToJson(_$CageAdminDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'penCode': instance.penCode,
      'farmId': instance.farmId,
      'name': instance.name,
      'area': instance.area,
      'animalType': instance.animalType,
      'location': instance.location,
      'capacity': instance.capacity,
      'boardCode': instance.boardCode,
      'boardStatus': instance.boardStatus,
      'endDateOfFarmingBatch': instance.endDateOfFarmingBatch,
      'createdDate': instance.createdDate,
      'cameraUrl': instance.cameraUrl,
      'staffId': instance.staffId,
      'staffName': instance.staffName,
      'isSolationCage': instance.isSolationCage,
      'farmingBatchStageModel': instance.farmingBatchStageModel,
    };
