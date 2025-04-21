import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/entity/task/task.dart';

part 'cage_dto.freezed.dart';
part 'cage_dto.g.dart';

@freezed
class CageDto with _$CageDto {
  const factory CageDto({
    required String cageId,
    required String cageName,
    required List<Task> tasks,
  }) = _CageDto;

  factory CageDto.fromJson(Map<String, dynamic> json) =>
      _$CageDtoFromJson(json);
}
