import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smart_farm/src/model/dto/notification/notification_dto.dart';

class NotificationApiClient {
  final Dio dio;
  const NotificationApiClient({required this.dio});

  Future<List<NotificationDto>> getNotificationsByUserId(
      {required String userId}) async {
    try {
      log('[NOTIFICATION_API_CLIENT] Đang lấy thông báo...');
      log('[NOTIFICATION_API_CLIENT] userId: $userId');
      final response = await dio.get('/notification/$userId');
      if (response.statusCode == 200) {
        log('[NOTIFICATION_API_CLIENT] Lấy thông báo thành công!');
        return (response.data['result'] as List)
            .map((notification) => NotificationDto.fromJson(notification))
            .toList();
      }
      throw Exception('Lỗi không xác định!');
    } on DioException catch (e) {
      log('[NOTIFICATION_API_CLIENT] Lấy thông báo thất bại!');
      log('Lỗi: ${e.toString()}');
      rethrow;
    }
  }

  Future<bool> markReadNotifcation({required String notificationId}) async {
    try {
      log('[NOTIFICATION_API_CLIENT] Đang đánh dấu thông báo đã đọc...');
      log('[NOTIFICATION_API_CLIENT] notificationId: $notificationId');
      final response = await dio.put('/notification/$notificationId/mark-read');
      if (response.statusCode == 200) {
        log('[NOTIFICATION_API_CLIENT] Đánh dấu thông báo đã đọc thành công!');
        return true;
      }
      throw Exception('Lỗi không xác định!');
    } on DioException catch (e) {
      log('[NOTIFICATION_API_CLIENT] Đánh dấu thông báo đã đọc thất bại!');
      log('Lỗi: ${e.toString()}');
      rethrow;
    }
  }

  Future<bool> markAllReadNotifcation({required String userId}) async {
    try {
      log('[NOTIFICATION_API_CLIENT] Đang đánh dấu tất cả thông báo đã đọc...');
      log('[NOTIFICATION_API_CLIENT] userId: $userId');
      final response = await dio.put('/notification/$userId/mark-all-read');
      if (response.statusCode == 200) {
        log('[NOTIFICATION_API_CLIENT] Đánh dấu tất cả thông báo đã đọc thành công!');
        return true;
      }
      throw Exception('Lỗi không xác định!');
    } on DioException catch (e) {
      log('[NOTIFICATION_API_CLIENT] Đánh dấu tất cả thông báo đã đọc thất bại!');
      log('Lỗi: ${e.toString()}');
      rethrow;
    }
  }

  Future<bool> deleteNotificationById({required String notificationId}) async {
    try {
      log('[NOTIFICATION_API_CLIENT] Đang xóa thông báo...');
      log('[NOTIFICATION_API_CLIENT] notificationId: $notificationId');
      final response = await dio.delete('/notification/$notificationId');
      if (response.statusCode == 200) {
        log('[NOTIFICATION_API_CLIENT] Xóa thông báo thành công!');
        return true;
      }
      throw Exception('Lỗi không xác định!');
    } on DioException catch (e) {
      log('[NOTIFICATION_API_CLIENT] Xóa thông báo thất bại!');
      log('Lỗi: ${e.toString()}');
      rethrow;
    }
  }
}
