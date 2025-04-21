// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NextTaskImpl _$$NextTaskImplFromJson(Map<String, dynamic> json) =>
    _$NextTaskImpl(
      taskId: json['taskId'] as String,
      cageId: json['cageId'] as String,
      taskName: json['taskName'] as String,
      cagename: json['cagename'] as String,
      assignName: json['assignName'] as String,
      priorityNum: (json['priorityNum'] as num).toInt(),
      status: json['status'] as String,
      dueDate: json['dueDate'] as String?,
      total: (json['total'] as num).toInt(),
      taskDone: (json['taskDone'] as num).toInt(),
    );

Map<String, dynamic> _$$NextTaskImplToJson(_$NextTaskImpl instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'cageId': instance.cageId,
      'taskName': instance.taskName,
      'cagename': instance.cagename,
      'assignName': instance.assignName,
      'priorityNum': instance.priorityNum,
      'status': instance.status,
      'dueDate': instance.dueDate,
      'total': instance.total,
      'taskDone': instance.taskDone,
    };
