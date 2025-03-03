part of 'upload_image_cubit.dart';

@freezed
class UploadImageState with _$UploadImageState {
  const factory UploadImageState.initial() = _Initial;

  const factory UploadImageState.uploadImageInProgress() =
      _UploadImageInProgress;
  const factory UploadImageState.uploadImageSuccess(UploadImageDto image) =
      _UploadImageSuccess;
  const factory UploadImageState.uploadImageFailure(String message) =
      _UploadImageFailure;

  const factory UploadImageState.deleteImageInProgress() =
      _DeleteImageInProgress;
  const factory UploadImageState.deleteImageSuccess() = _DeleteImageSuccess;
  const factory UploadImageState.deleteImageFailure(String message) =
      _DeleteImageFailure;
}
