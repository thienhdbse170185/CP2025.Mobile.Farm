import 'package:smart_farm/src/model/dto/notification/notification_dto.dart';
import 'package:smart_farm/src/model/repository/notification/notification_api_client.dart';

class NotificationRepository {
  final NotificationApiClient notificationApiClient;
  const NotificationRepository({required this.notificationApiClient});

  Future<List<NotificationDto>> getNotificationsByUserId(
      {required String userId}) async {
    try {
      final response =
          await notificationApiClient.getNotificationsByUserId(userId: userId);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> markReadNotification({required String notificationId}) async {
    try {
      final response = await notificationApiClient.markReadNotifcation(
          notificationId: notificationId);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> markReadAllNotification({required String userId}) async {
    try {
      final response =
          await notificationApiClient.markAllReadNotifcation(userId: userId);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteNotificationById({required String notificationId}) async {
    try {
      final response = await notificationApiClient.deleteNotificationById(
          notificationId: notificationId);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
