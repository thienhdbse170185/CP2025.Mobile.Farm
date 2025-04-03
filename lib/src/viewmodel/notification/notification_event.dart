part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.started() = _Started;

  const factory NotificationEvent.getNotificationsByUserId() =
      _GetNotificationsByUserId;

  const factory NotificationEvent.markReadNotification({
    required String notificationId,
  }) = _MarkReadNotification;

  const factory NotificationEvent.markReadAllNotification() =
      _MarkReadAllNotification;
}
