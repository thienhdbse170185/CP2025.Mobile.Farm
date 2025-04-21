import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/task/daily_food_usage_log/daily_food_usage_log_dto.dart';

part 'create_food_log_cubit_params.freezed.dart';
part 'create_food_log_cubit_params.g.dart';

@freezed
class CreateFoodLogCubitParams with _$CreateFoodLogCubitParams {
  factory CreateFoodLogCubitParams({
    required String cageId,
    required DailyFoodUsageLogDto log,
    required bool afterSymptomReport,
  }) = _CreateFoodLogCubitParams;

  factory CreateFoodLogCubitParams.fromJson(Map<String, dynamic> json) =>
      _$CreateFoodLogCubitParamsFromJson(json);
}
