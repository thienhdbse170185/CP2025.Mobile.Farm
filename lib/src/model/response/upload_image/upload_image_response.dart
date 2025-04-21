import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/upload_image/upload_image_dto.dart';

part 'upload_image_response.freezed.dart';
part 'upload_image_response.g.dart';

@freezed
class UploadImageResponse with _$UploadImageResponse {
  factory UploadImageResponse({
    required String message,
    required UploadImageDto image,
    required String path,
  }) = _UploadImageResponse;

  factory UploadImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponseFromJson(json);
}
