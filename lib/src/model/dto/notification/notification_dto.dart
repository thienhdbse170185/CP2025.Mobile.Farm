import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

@freezed
class NotificationDto with _$NotificationDto {
  factory NotificationDto({
    required String id,
    required String userId,
    required String content,
    required String title,
    required String createdAt,
    required bool isRead,
    required String? taskId,
    required String? medicalSymptomId,
    required String? cageId,
  }) = _NotificationDto;

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);
}
