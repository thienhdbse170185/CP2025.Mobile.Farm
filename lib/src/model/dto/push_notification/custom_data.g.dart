// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomDataImpl _$$CustomDataImplFromJson(Map<String, dynamic> json) =>
    _$CustomDataImpl(
      Id: json['Id'] as String,
      NotiTypeId: json['NotiTypeId'] as String?,
      UserId: json['UserId'] as String,
      Content: json['Content'] as String,
      Title: json['Title'] as String,
      CreatedAt: json['CreatedAt'] as String,
      IsRead: json['IsRead'] as bool,
      TaskId: json['TaskId'] as String?,
      MedicalSymptomId: json['MedicalSymptomId'] as String?,
      CageId: json['CageId'] as String?,
    );

Map<String, dynamic> _$$CustomDataImplToJson(_$CustomDataImpl instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'NotiTypeId': instance.NotiTypeId,
      'UserId': instance.UserId,
      'Content': instance.Content,
      'Title': instance.Title,
      'CreatedAt': instance.CreatedAt,
      'IsRead': instance.IsRead,
      'TaskId': instance.TaskId,
      'MedicalSymptomId': instance.MedicalSymptomId,
      'CageId': instance.CageId,
    };
