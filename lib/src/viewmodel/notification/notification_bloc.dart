import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
import 'package:meta/meta.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository notificationRepository;
  NotificationBloc({required this.notificationRepository})
      : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) {});
  }
}
