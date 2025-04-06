part of 'upload_image_cubit.dart';

@freezed
class UploadImageState with _$UploadImageState {
  const factory UploadImageState.initial() = _Initial;

  const factory UploadImageState.uploadImageInProgress(bool isImageTask) =
      _UploadImageInProgress;
  const factory UploadImageState.uploadImageSuccess(
      UploadImageDto image, bool isImageTask) = _UploadImageSuccess;
  const factory UploadImageState.uploadImageFailure(
      String message, bool isImageTask) = _UploadImageFailure;

  const factory UploadImageState.uploadMultipleImageInProgress() =
      _UploadMultipleImageInProgress;
  const factory UploadImageState.uploadMultipleImageSuccess(
      List<UploadImageDto> images) = _UploadMultipleImageSuccess;
  const factory UploadImageState.uploadMultipleImageFailure(String message) =
      _UploadMultipleImageFailure;

  const factory UploadImageState.deleteImageInProgress() =
      _DeleteImageInProgress;
  const factory UploadImageState.deleteImageSuccess() = _DeleteImageSuccess;
  const factory UploadImageState.deleteImageFailure(String message) =
      _DeleteImageFailure;
}
