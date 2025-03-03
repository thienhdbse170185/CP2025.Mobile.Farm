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

  Future<void> uploadImage({required File file}) async {
    emit(UploadImageState.uploadImageInProgress());
    try {
      log('[UPLOAD_IMAGE_CUBIT] Uploading image...');
      final response = await _uploadImageRepository.uploadImage(file: file);
      emit(UploadImageState.uploadImageSuccess(response.image));
    } catch (e) {
      emit(UploadImageState.uploadImageFailure(e.toString()));
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
}
