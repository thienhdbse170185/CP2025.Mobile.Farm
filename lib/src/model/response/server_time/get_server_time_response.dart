import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_server_time_response.freezed.dart';
part 'get_server_time_response.g.dart';

@freezed
class GetServerTimeResponse with _$GetServerTimeResponse {
  factory GetServerTimeResponse({
    required String serverTime,
    required int currentSession,
  }) = _GetServerTimeResponse;

  factory GetServerTimeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServerTimeResponseFromJson(json);
}
