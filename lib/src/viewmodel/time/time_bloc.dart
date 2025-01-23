import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:data_layer/repository/user/local/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_bloc.freezed.dart';
part 'time_event.dart';
part 'time_state.dart';

class TimeUtils {
  static DateTime Function()? customNow;

  static DateTime now() {
    if (customNow != null) {
      return customNow!();
    }
    return DateTime.now();
  }
}

class TimeBloc extends Bloc<TimeEvent, TimeState> {
  final UserRepository userRepository;
  TimeBloc({required this.userRepository}) : super(_Initial()) {
    on<TimeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<_GetServerTime>((event, emit) async {
      try {
        // get server time
        final serverTimeResponse = await userRepository.getServerTime();
        log("[SERVER_TIME] Before convert: $serverTimeResponse");

        // Convert serverTimeResponse to DateTime
        // [Response] "2025-01-23T10:31:34.2105781+00:00"
        final serverTimeFormat = serverTimeResponse.replaceFirstMapped(
            RegExp(r'\.\d+'), (match) => '');
        final serverTime = DateTime.parse(serverTimeFormat);

        // Calculate the timeZoneOffset of the server time
        final localTime = DateTime.now();
        final localOffset = localTime.timeZoneOffset;
        final serverOffset = serverTime.timeZoneOffset;
        final timeZoneOffset = localOffset - serverOffset;
        final adjustedServerTime = serverTime.add(timeZoneOffset);

        log("[SERVER_TIME] Server time: $serverTime");
        log("[SERVER_TIME] Local time: $localTime");
        log("[SERVER_TIME] Server time zone offset: $serverOffset");
        log("[SERVER_TIME] Local time zone offset: $localOffset");
        log("[SERVER_TIME] Calculated time zone offset: $timeZoneOffset");
        log("[SERVER_TIME] Adjusted server time: $adjustedServerTime");

        // Override DateTime.now() to return the adjusted server time
        TimeUtils.customNow = () => serverTime;
      } catch (e) {
        log("[SERVER_TIME] Error: $e");
        emit(TimeState.getServerTimeFailure(e.toString()));
      }
    });
  }
}
