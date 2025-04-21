import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/push_notification/custom_data.dart';

part 'push_notification_dto.freezed.dart';
part 'push_notification_dto.g.dart';

@freezed
class PushNotificationDto with _$PushNotificationDto {
  factory PushNotificationDto({
    required CustomData customData,
    required String title,
  }) = _PushNotificationDto;

  factory PushNotificationDto.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationDtoFromJson(json);
}
