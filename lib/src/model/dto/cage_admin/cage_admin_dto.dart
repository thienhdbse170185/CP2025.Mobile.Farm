import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/farming_batch/farming_batch_dto.dart';

part 'cage_admin_dto.freezed.dart';
part 'cage_admin_dto.g.dart';

@freezed
class CageAdminDto with _$CageAdminDto {
  factory CageAdminDto({
    required String id,
    required String penCode,
    required String farmId,
    required String name,
    required int area,
    required String? animalType,
    required String location,
    required int capacity,
    required String boardCode,
    required bool boardStatus,
    required String? endDateOfFarmingBatch,
    required String createdDate,
    required String cameraUrl,
    required String staffId,
    required String staffName,
    required bool? isSolationCage,
    required FarmingBatchDto? farmingBatchStageModel,
  }) = _CageAdminDto;

  factory CageAdminDto.fromJson(Map<String, dynamic> json) =>
      _$CageAdminDtoFromJson(json);
}
