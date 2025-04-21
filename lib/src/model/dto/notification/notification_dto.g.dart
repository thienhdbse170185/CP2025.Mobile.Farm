// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationDtoImpl _$$NotificationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationDtoImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      content: json['content'] as String,
      title: json['title'] as String,
      createdAt: json['createdAt'] as String,
      isRead: json['isRead'] as bool,
      taskId: json['taskId'] as String?,
      medicalSymptomId: json['medicalSymptomId'] as String?,
      cageId: json['cageId'] as String?,
    );

Map<String, dynamic> _$$NotificationDtoImplToJson(
        _$NotificationDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'content': instance.content,
      'title': instance.title,
      'createdAt': instance.createdAt,
      'isRead': instance.isRead,
      'taskId': instance.taskId,
      'medicalSymptomId': instance.medicalSymptomId,
      'cageId': instance.cageId,
    };
