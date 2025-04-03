part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;

  const factory NotificationState.getNotificationsByUserIdInProgress() =
      _GetNotificationsByUserIdInProgress;
  const factory NotificationState.getNotificationsByUserIdSuccess({
    required List<NotificationDto> notifications,
  }) = _GetNotificationsByUserIdSuccess;
  const factory NotificationState.getNotificationsByUserIdFailure({
    required String error,
  }) = _GetNotificationsByUserIdFailure;

  const factory NotificationState.markReadNotificationInProgress() =
      _MarkReadNotificationInProgress;
  const factory NotificationState.markReadNotificationSuccess({
    required NotificationDto notification,
  }) = _MarkReadNotificationSuccess;
  const factory NotificationState.markReadNotificationFailure({
    required String error,
  }) = _MarkReadNotificationFailure;

  const factory NotificationState.markReadAllNotificationInProgress() =
      _MarkReadAllNotificationInProgress;
  const factory NotificationState.markReadAllNotificationSuccess() =
      _MarkReadAllNotificationSuccess;
  const factory NotificationState.markReadAllNotificationFailure({
    required String error,
  }) = _MarkReadAllNotificationFailure;

  const factory NotificationState.deleteNotificationByIdInProgress() =
      _DeleteNotificationByIdInProgress;
  const factory NotificationState.deleteNotificationByIdSuccess() =
      _DeleteNotificationByIdSuccess;
  const factory NotificationState.deleteNotificationByIdFailure({
    required String error,
  }) = _DeleteNotificationByIdFailure;
}
