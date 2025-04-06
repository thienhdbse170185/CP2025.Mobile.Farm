import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_image_cubit.freezed.dart';
part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  final UploadImageRepository _uploadImageRepository;
  UploadImageCubit({required UploadImageRepository uploadImageRepository})
      : _uploadImageRepository = uploadImageRepository,
        super(UploadImageState.initial());

  Future<void> uploadImage(
      {required File file, required bool isTaskImage}) async {
    emit(UploadImageState.uploadImageInProgress(isTaskImage));
    try {
      log('[UPLOAD_IMAGE_CUBIT] Uploading image...');
      final response = await _uploadImageRepository.uploadImage(file: file);
      emit(UploadImageState.uploadImageSuccess(response.image, isTaskImage));
    } catch (e) {
      emit(UploadImageState.uploadImageFailure(e.toString(), isTaskImage));
    }
  }

  Future<void> deleteImage({required String id}) async {
    emit(UploadImageState.deleteImageInProgress());
    try {
      log('[UPLOAD_IMAGE_CUBIT] Deleting image...');
      final response = await _uploadImageRepository.deleteImage(imageId: id);
      if (response) {
        emit(UploadImageState.deleteImageSuccess());
      } else {
        emit(UploadImageState.deleteImageFailure('delete-image-failure'));
      }
    } catch (e) {
      emit(UploadImageState.deleteImageFailure(e.toString()));
    }
  }

  Future<void> uploadImages({required List<File> files}) async {
    emit(UploadImageState.uploadMultipleImageInProgress());
    try {
      log('[UPLOAD_IMAGE_CUBIT] Uploading images...');
      final response = await _uploadImageRepository.uploadImages(files: files);
      emit(UploadImageState.uploadMultipleImageSuccess(response.images));
    } catch (e) {
      log('[UPLOAD_IMAGE_CUBIT] Error: $e');
      emit(UploadImageState.uploadMultipleImageFailure(e.toString()));
    }
  }
}
