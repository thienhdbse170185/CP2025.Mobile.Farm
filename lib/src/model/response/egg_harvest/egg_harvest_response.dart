import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/egg_harvest/egg_harvest_dto.dart';

part 'egg_harvest_response.freezed.dart';
part 'egg_harvest_response.g.dart';

@freezed
class EggHarvestResponse with _$EggHarvestResponse {
  factory EggHarvestResponse({
    required bool success,
    required List<EggHarvestDto> result,
  }) = _EggHarvestResponse;

  factory EggHarvestResponse.fromJson(Map<String, dynamic> json) =>
      _$EggHarvestResponseFromJson(json);
}
