import 'package:freezed_annotation/freezed_annotation.dart';

part 'egg_harvest_dto.freezed.dart';
part 'egg_harvest_dto.g.dart';

@freezed
class EggHarvestDto with _$EggHarvestDto {
  factory EggHarvestDto({
    required String id,
    required String growthStageId,
    required String growthStageName,
    required String dateCollected,
    required int eggCount,
    required String notes,
    required String taskId,
  }) = _EggHarvestDto;

  factory EggHarvestDto.fromJson(Map<String, dynamic> json) =>
      _$EggHarvestDtoFromJson(json);
}
