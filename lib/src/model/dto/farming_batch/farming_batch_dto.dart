import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/cage/cage_dto.dart';
import 'package:smart_farm/src/model/dto/growth_stage/growth_stage_dto.dart';

part 'farming_batch_dto.freezed.dart';
part 'farming_batch_dto.g.dart';

@freezed
class FarmingBatchDto with _$FarmingBatchDto {
  const factory FarmingBatchDto({
    required String id,
    required String? farmingbatchCode,
    required String name,
    required String? species,
    required String? startDate,
    required String? completeAt,
    required String? estimatedTimeStart,
    required String? endDate,
    required String status,
    required int cleaningFrequency,
    required int quantity,
    required int? affectedQuantity,
    String? cageName,
    int? currentQuantity,
    required GrowthStageDto? growthStageDetails,
    required CageDto? cage,
  }) = _FarmingBatchDto;

  factory FarmingBatchDto.fromJson(Map<String, dynamic> json) =>
      _$FarmingBatchDtoFromJson(json);
}
