// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetTaskRequestImpl _$$GetTaskRequestImplFromJson(Map<String, dynamic> json) =>
    _$GetTaskRequestImpl(
      KeySearch: json['KeySearch'] as String?,
      Status: json['Status'] as String?,
      TaskTypeId: json['TaskTypeId'] as String?,
      CageId: json['CageId'] as String?,
      AssignedToUserId: json['AssignedToUserId'] as String?,
      DueDateFrom: json['DueDateFrom'] as String?,
      DueDateTo: json['DueDateTo'] as String?,
      PriorityNum: (json['PriorityNum'] as num?)?.toInt(),
      Session: (json['Session'] as num?)?.toInt(),
      CompletedAt: json['CompletedAt'] as String?,
      CreatedAt: json['CreatedAt'] as String?,
      PageNumber: (json['PageNumber'] as num?)?.toInt(),
      PageSize: (json['PageSize'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$GetTaskRequestImplToJson(
        _$GetTaskRequestImpl instance) =>
    <String, dynamic>{
      'KeySearch': instance.KeySearch,
      'Status': instance.Status,
      'TaskTypeId': instance.TaskTypeId,
      'CageId': instance.CageId,
      'AssignedToUserId': instance.AssignedToUserId,
      'DueDateFrom': instance.DueDateFrom,
      'DueDateTo': instance.DueDateTo,
      'PriorityNum': instance.PriorityNum,
      'Session': instance.Session,
      'CompletedAt': instance.CompletedAt,
      'CreatedAt': instance.CreatedAt,
      'PageNumber': instance.PageNumber,
      'PageSize': instance.PageSize,
    };
