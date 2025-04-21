import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:smart_farm/api_endpoints.dart';
import 'package:smart_farm/environment.dart';
import 'package:smart_farm/src/model/response/upload_image/upload_image_response.dart';
import 'package:smart_farm/src/model/response/upload_multiple_image/upload_multiple_image_response.dart';

class UploadImageApiClient {
  final Dio dio;
  const UploadImageApiClient({required this.dio});

  Future<UploadImageResponse> uploadImage({required File file}) async {
    try {
      log('[UPLOAD_IMAGE_API_CLIENT] Uploading image...');
      log('[UPLOAD_IMAGE_API_CLIENT] File path: ${file.path}');
      final response = await dio.post(ApiEndpoints.imageUpload,
          data: FormData.fromMap({
            'image': await MultipartFile.fromFile(file.path,
                filename: file.path.split('/').last,
                contentType: MediaType(
                    'image', file.path.endsWith('.png') ? 'png' : 'jpeg')),
          }),
          options: Options(
            contentType: 'multipart/form-data',
            headers: {
              'x-api-key': Environment.apiKey,
            },
          ));
      if (response.statusCode == 201) {
        log('[UPLOAD_IMAGE_API_CLIENT] Upload ảnh thành công!');
        return UploadImageResponse.fromJson(response.data);
      } else {
        log('[UPLOAD_IMAGE_API_CLIENT] Upload ảnh thất bại!');
        throw Exception('upload-image-failure');
      }
    } on DioException catch (e) {
      log('[UPLOAD_IMAGE_API_CLIENT] Upload ảnh thất bại!');
      log('[UPLOAD_IMAGE_API_CLIENT] Error: ${e.message}');
      rethrow;
    }
  }

  Future<bool> deleteImage({required String imageId}) async {
    try {
      log('[UPLOAD_IMAGE_API_CLIENT] Deleting image...');
      log('[UPLOAD_IMAGE_API_CLIENT] Id: $imageId');
      final response = await dio.delete('${ApiEndpoints.imageUpload}/$imageId',
          options: Options(
            headers: {
              'x-api-key': Environment.apiKey,
            },
          ));
      if (response.statusCode == 200) {
        log('[UPLOAD_IMAGE_API_CLIENT] Xóa ảnh thành công!');
        return true;
      }
      return false;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        log('[UPLOAD_IMAGE_API_CLIENT] Xóa ảnh không tồn tại!');
        throw Exception('delete-image-not-found');
      }
      log('[UPLOAD_IMAGE_API_CLIENT] Xóa ảnh thất bại!');
      log(e.toString());
      rethrow;
    }
  }

  Future<UploadMultipleImageResponse> uploadMultipleImage(
      {required List<File> images}) async {
    try {
      log('[UPLOAD_IMAGE_API_CLIENT] Uploading multiple image...');
      // log('[UPLOAD_IMAGE_API_CLIENT] File path: ${file.path}');
      final formData = FormData();
      for (var image in images) {
        formData.files.add(MapEntry(
          'images',
          await MultipartFile.fromFile(image.path,
              filename: image.path.split('/').last,
              contentType: MediaType(
                  'image', image.path.endsWith('.png') ? 'png' : 'jpeg')),
        ));
      }

      final response = await dio.post('${ApiEndpoints.imageUpload}/batch',
          data: formData,
          options: Options(
            contentType: 'multipart/form-data',
            headers: {
              'x-api-key': Environment.apiKey,
            },
          ));
      if (response.statusCode == 201) {
        log('[UPLOAD_IMAGE_API_CLIENT] Upload multiple success!');
        return UploadMultipleImageResponse.fromJson(response.data);
      } else {
        log('[UPLOAD_IMAGE_API_CLIENT] Upload ảnh thất bại!');
        throw Exception('upload-image-failure');
      }
    } on DioException catch (e) {
      log('[UPLOAD_IMAGE_API_CLIENT] Upload ảnh thất bại!');
      log('[UPLOAD_IMAGE_API_CLIENT] Error: ${e.message}');
      rethrow;
    }
  }
}
