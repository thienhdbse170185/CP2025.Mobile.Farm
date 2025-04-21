import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_food_usage_log_dto.freezed.dart';
part 'daily_food_usage_log_dto.g.dart';

@freezed
class DailyFoodUsageLogDto with _$DailyFoodUsageLogDto {
  const factory DailyFoodUsageLogDto({
    required int recommendedWeight,
    required int actualWeight,
    required String notes,
    required DateTime logTime,
    required String photo,
    required String taskId,
  }) = _DailyFoodUsageLogDto;

  factory DailyFoodUsageLogDto.fromJson(Map<String, dynamic> json) =>
      _$DailyFoodUsageLogDtoFromJson(json);
}
