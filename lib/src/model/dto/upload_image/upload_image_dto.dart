import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_image_dto.freezed.dart';
part 'upload_image_dto.g.dart';

@freezed
class UploadImageDto with _$UploadImageDto {
  factory UploadImageDto({
    required String id,
    required String originalName,
    required String path,
    required int size,
    required String mimeType,
    required int width,
    required int height,
    required String createdAt,
  }) = _UploadImageDto;

  factory UploadImageDto.fromJson(Map<String, dynamic> json) =>
      _$UploadImageDtoFromJson(json);
}
