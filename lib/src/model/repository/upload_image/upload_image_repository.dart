import 'dart:io';

import 'package:smart_farm/src/model/repository/upload_image/upload_image_api_client.dart';
import 'package:smart_farm/src/model/response/upload_image/upload_image_response.dart';
import 'package:smart_farm/src/model/response/upload_multiple_image/upload_multiple_image_response.dart';

class UploadImageRepository {
  final UploadImageApiClient _uploadImageApiClient;
  const UploadImageRepository(
      {required UploadImageApiClient uploadImageApiClient})
      : _uploadImageApiClient = uploadImageApiClient;

  Future<UploadImageResponse> uploadImage({required File file}) async {
    try {
      return _uploadImageApiClient.uploadImage(file: file);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteImage({required String imageId}) async {
    try {
      return _uploadImageApiClient.deleteImage(imageId: imageId);
    } catch (e) {
      rethrow;
    }
  }

  Future<UploadMultipleImageResponse> uploadImages(
      {required List<File> files}) async {
    try {
      return _uploadImageApiClient.uploadMultipleImage(images: files);
    } catch (e) {
      rethrow;
    }
  }
}
