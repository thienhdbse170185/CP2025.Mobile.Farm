// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PushNotificationDtoImpl _$$PushNotificationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PushNotificationDtoImpl(
      customData:
          CustomData.fromJson(json['customData'] as Map<String, dynamic>),
      title: json['title'] as String,
    );

Map<String, dynamic> _$$PushNotificationDtoImplToJson(
        _$PushNotificationDtoImpl instance) =>
    <String, dynamic>{
      'customData': instance.customData,
      'title': instance.title,
    };
