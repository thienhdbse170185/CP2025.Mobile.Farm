// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadImageDtoImpl _$$UploadImageDtoImplFromJson(Map<String, dynamic> json) =>
    _$UploadImageDtoImpl(
      id: json['id'] as String,
      originalName: json['originalName'] as String,
      path: json['path'] as String,
      size: (json['size'] as num).toInt(),
      mimeType: json['mimeType'] as String,
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$UploadImageDtoImplToJson(
        _$UploadImageDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'originalName': instance.originalName,
      'path': instance.path,
      'size': instance.size,
      'mimeType': instance.mimeType,
      'width': instance.width,
      'height': instance.height,
      'createdAt': instance.createdAt,
    };
