part of 'time_bloc.dart';

@freezed
class TimeState with _$TimeState {
  const factory TimeState.initial() = _Initial;
  const factory TimeState.getServerTimeInProgress() = _GetServerTimeInProgress;
  const factory TimeState.getServerTimeSuccess(String serverTime) =
      _GetServerTimeSuccess;
  const factory TimeState.getServerTimeFailure(String error) =
      _GetServerTimeFailure;
}
