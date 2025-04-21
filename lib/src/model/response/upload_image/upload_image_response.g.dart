// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadImageResponseImpl _$$UploadImageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadImageResponseImpl(
      message: json['message'] as String,
      image: UploadImageDto.fromJson(json['image'] as Map<String, dynamic>),
      path: json['path'] as String,
    );

Map<String, dynamic> _$$UploadImageResponseImplToJson(
        _$UploadImageResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'image': instance.image,
      'path': instance.path,
    };
