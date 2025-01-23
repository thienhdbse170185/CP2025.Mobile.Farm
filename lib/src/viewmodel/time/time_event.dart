part of 'time_bloc.dart';

@freezed
class TimeEvent with _$TimeEvent {
  const factory TimeEvent.started() = _Started;
  const factory TimeEvent.getServerTime() = _GetServerTime;
}
