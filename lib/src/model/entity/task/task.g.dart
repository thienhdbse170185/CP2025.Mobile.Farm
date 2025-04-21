// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String,
      cageId: json['cageId'] as String,
      taskName: json['taskName'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      priorityNum: (json['priorityNum'] as num).toInt(),
      dueDate: json['dueDate'] as String,
      session: (json['session'] as num).toInt(),
      completedAt: json['completedAt'] as String?,
      cageAnimalName: json['cageAnimalName'] as String?,
      isWarning: json['isWarning'] as bool?,
      hasAnimalDesease: json['hasAnimalDesease'] as bool?,
      isTreatmentTask: json['isTreatmentTask'] as bool,
      prescriptionId: json['prescriptionId'] as String?,
      assignedToUser:
          User.fromJson(json['assignedToUser'] as Map<String, dynamic>),
      taskType: TaskType.fromJson(json['taskType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cageId': instance.cageId,
      'taskName': instance.taskName,
      'description': instance.description,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'priorityNum': instance.priorityNum,
      'dueDate': instance.dueDate,
      'session': instance.session,
      'completedAt': instance.completedAt,
      'cageAnimalName': instance.cageAnimalName,
      'isWarning': instance.isWarning,
      'hasAnimalDesease': instance.hasAnimalDesease,
      'isTreatmentTask': instance.isTreatmentTask,
      'prescriptionId': instance.prescriptionId,
      'assignedToUser': instance.assignedToUser,
      'taskType': instance.taskType,
    };
