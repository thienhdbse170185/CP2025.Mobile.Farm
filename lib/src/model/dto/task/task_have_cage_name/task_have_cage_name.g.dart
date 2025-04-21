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
      cageAnimalName: json['cageAnimalName'] as String?,
      hasAnimalDesease: json['hasAnimalDesease'] as bool?,
      isWarning: json['isWarning'] as bool,
      assignedToUser:
          User.fromJson(json['assignedToUser'] as Map<String, dynamic>),
      taskType: TaskType.fromJson(json['taskType'] as Map<String, dynamic>),
      prescriptionId: json['prescriptionId'] as String?,
      isTreatmentTask: json['isTreatmentTask'] as bool,
      statusLogs: (json['statusLogs'] as List<dynamic>?)
          ?.map((e) => StatusLog.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'cageAnimalName': instance.cageAnimalName,
      'hasAnimalDesease': instance.hasAnimalDesease,
      'isWarning': instance.isWarning,
      'assignedToUser': instance.assignedToUser,
      'taskType': instance.taskType,
      'prescriptionId': instance.prescriptionId,
      'isTreatmentTask': instance.isTreatmentTask,
      'statusLogs': instance.statusLogs,
    };
