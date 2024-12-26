// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_have_cage_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskHaveCageNameImpl _$$TaskHaveCageNameImplFromJson(
        Map<String, dynamic> json) =>
    _$TaskHaveCageNameImpl(
      id: json['id'] as String,
      cageId: json['cageId'] as String,
      cageName: json['cageName'] as String,
      taskName: json['taskName'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      priorityNum: (json['priorityNum'] as num).toInt(),
      dueDate: json['dueDate'] as String,
      session: (json['session'] as num).toInt(),
      completedAt: json['completedAt'] as String?,
      assignedToUser:
          User.fromJson(json['assignedToUser'] as Map<String, dynamic>),
      taskType: TaskType.fromJson(json['taskType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaskHaveCageNameImplToJson(
        _$TaskHaveCageNameImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cageId': instance.cageId,
      'cageName': instance.cageName,
      'taskName': instance.taskName,
      'description': instance.description,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'priorityNum': instance.priorityNum,
      'dueDate': instance.dueDate,
      'session': instance.session,
      'completedAt': instance.completedAt,
      'assignedToUser': instance.assignedToUser,
      'taskType': instance.taskType,
    };
