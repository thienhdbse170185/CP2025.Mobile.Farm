import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/cage/cage_dto.dart';

part 'task_by_user_response.freezed.dart';
part 'task_by_user_response.g.dart';

@freezed
class TaskByUserResponse with _$TaskByUserResponse {
  const factory TaskByUserResponse({
    required String sessionName,
    required List<CageDto> cages,
  }) = _TaskByUserResponse;

  factory TaskByUserResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskByUserResponseFromJson(json);
}
