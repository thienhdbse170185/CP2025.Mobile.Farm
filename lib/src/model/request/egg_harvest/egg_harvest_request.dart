import 'package:freezed_annotation/freezed_annotation.dart';

part 'egg_harvest_request.freezed.dart';
part 'egg_harvest_request.g.dart';

@freezed
class EggHarvestRequest with _$EggHarvestRequest {
  factory EggHarvestRequest({
    required String growthStageId,
    required int eggCount,
    required String notes,
    required String taskId,
  }) = _EggHarvestRequest;

  factory EggHarvestRequest.fromJson(Map<String, dynamic> json) =>
      _$EggHarvestRequestFromJson(json);
}
