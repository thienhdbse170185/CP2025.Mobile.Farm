import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_log.freezed.dart';
part 'status_log.g.dart';

@freezed
class StatusLog with _$StatusLog {
  factory StatusLog({
    required String status,
    required String updatedAt,
  }) = _StatusLog;

  factory StatusLog.fromJson(Map<String, dynamic> json) =>
      _$StatusLogFromJson(json);
}
