import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_farm/src/core/constants/user_data_constant.dart';
import 'package:smart_farm/src/model/dto/notification/notification_dto.dart';
import 'package:smart_farm/src/model/repository/notification/notification_repository.dart';

part 'notification_bloc.freezed.dart';
part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository notificationRepository;
  NotificationBloc({required this.notificationRepository}) : super(_Initial()) {
    on<_GetNotificationsByUserId>(_getNotificationsByUserId);
    on<_MarkReadNotification>(_markReadNotification);
    on<_MarkReadAllNotification>(_markReadAllNotification);
    on<_DeleteNotificationById>(_deleteNotificationById);
  }

  Future<void> _getNotificationsByUserId(
    _GetNotificationsByUserId event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationState.getNotificationsByUserIdInProgress());
    try {
      final userBox = await Hive.openBox(UserDataConstant.userBoxName);
      final userId = await userBox.get(UserDataConstant.userIdKey);
      final notifications =
          await notificationRepository.getNotificationsByUserId(userId: userId);
      emit(NotificationState.getNotificationsByUserIdSuccess(
          notifications: notifications));
    } catch (e) {
      emit(NotificationState.getNotificationsByUserIdFailure(
          error: e.toString()));
    }
  }

  Future<void> _markReadNotification(
    _MarkReadNotification event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationState.markReadNotificationInProgress());
    try {
      await notificationRepository.markReadNotification(
          notificationId: event.notification.id);
      emit(NotificationState.markReadNotificationSuccess(
          notification: event.notification));
    } catch (e) {
      emit(NotificationState.markReadNotificationFailure(error: e.toString()));
    }
  }

  Future<void> _markReadAllNotification(
    _MarkReadAllNotification event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationState.markReadAllNotificationInProgress());
    try {
      final userBox = await Hive.openBox(UserDataConstant.userBoxName);
      final userId = await userBox.get(UserDataConstant.userIdKey);
      await notificationRepository.markReadAllNotification(userId: userId);
      emit(const NotificationState.markReadAllNotificationSuccess());
    } catch (e) {
      emit(NotificationState.markReadAllNotificationFailure(
          error: e.toString()));
    }
  }

  Future<void> _deleteNotificationById(
    _DeleteNotificationById event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationState.deleteNotificationByIdInProgress());
    try {
      await notificationRepository.deleteNotificationById(
          notificationId: event.notificationId);
      emit(const NotificationState.deleteNotificationByIdSuccess());
    } catch (e) {
      emit(
          NotificationState.deleteNotificationByIdFailure(error: e.toString()));
    }
  }
}
