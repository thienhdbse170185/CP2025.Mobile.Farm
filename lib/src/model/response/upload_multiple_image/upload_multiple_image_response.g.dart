// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_multiple_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadMultipleImageResponseImpl _$$UploadMultipleImageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadMultipleImageResponseImpl(
      message: json['message'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => UploadImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UploadMultipleImageResponseImplToJson(
        _$UploadMultipleImageResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'images': instance.images,
    };
