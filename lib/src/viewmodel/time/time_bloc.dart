import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:data_layer/repository/user/local/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_bloc.freezed.dart';
part 'time_event.dart';
part 'time_state.dart';

class TimeUtils {
  static DateTime Function() customNow = () => DateTime.now();
}

class TimeBloc extends Bloc<TimeEvent, TimeState> {
  final UserRepository userRepository;
  Timer? timer;
  DateTime? serverTimeAtSync;
  DateTime? localTimeAtSync;
  TimeBloc({required this.userRepository}) : super(_Initial()) {
    on<TimeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<_GetServerTime>((event, emit) async {
      try {
        // Lấy thời gian từ server
        final serverTimeResponse = await userRepository.getServerTime();
        log("[SERVER_TIME] Before convert: $serverTimeResponse");

        final serverTime = DateTime.parse(serverTimeResponse).toLocal();
        log("[SERVER_TIME] Server time: $serverTime");

        // Lưu lại thời gian đồng bộ
        serverTimeAtSync = serverTime;
        localTimeAtSync = DateTime.now();

        // Override DateTime.now() để trả về thời gian server đã cộng thêm
        TimeUtils.customNow = () {
          final elapsed = DateTime.now().difference(localTimeAtSync!);
          return serverTimeAtSync!.add(elapsed);
        };

        // Cập nhật mỗi giây
        timer?.cancel(); // Dừng timer cũ nếu có
        timer = Timer.periodic(Duration(minutes: 1), (timer) {
          log("[SERVER_TIME] Updated time: ${TimeUtils.customNow()}");
        });
      } catch (e) {
        log("[SERVER_TIME] Error: $e");
        emit(TimeState.getServerTimeFailure(e.toString()));
      }
    });
  }
}
