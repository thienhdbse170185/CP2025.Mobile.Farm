import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_weight_request.freezed.dart';
part 'update_weight_request.g.dart';

@freezed
class UpdateWeightRequest with _$UpdateWeightRequest {
  const factory UpdateWeightRequest({
    required String growthStageId,
    required double weightAnimal,
    required String taskId,
  }) = _UpdateWeightRequest;

  factory UpdateWeightRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateWeightRequestFromJson(json);
}
