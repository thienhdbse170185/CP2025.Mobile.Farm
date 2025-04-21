import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/upload_image/upload_image_dto.dart';

part 'upload_multiple_image_response.freezed.dart';
part 'upload_multiple_image_response.g.dart';

@freezed
class UploadMultipleImageResponse with _$UploadMultipleImageResponse {
  factory UploadMultipleImageResponse({
    required String message,
    required List<UploadImageDto> images,
  }) = _UploadMultipleImageResponse;

  factory UploadMultipleImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadMultipleImageResponseFromJson(json);
}
