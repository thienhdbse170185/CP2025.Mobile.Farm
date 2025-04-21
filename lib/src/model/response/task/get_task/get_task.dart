import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/task/task_have_cage_name/task_have_cage_name.dart';

part 'get_task.freezed.dart';
part 'get_task.g.dart';

@freezed
class GetTaskResponse with _$GetTaskResponse {
  const factory GetTaskResponse(
      {required bool success,
      required GetTaskResponseResult result}) = _GetTaskResponse;

  factory GetTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTaskResponseFromJson(json);
}

@freezed
class GetTaskResponseResult with _$GetTaskResponseResult {
  const factory GetTaskResponseResult({required List<TaskHaveCageName> items}) =
      _GetTaskResponseResult;

  factory GetTaskResponseResult.fromJson(Map<String, dynamic> json) =>
      _$GetTaskResponseResultFromJson(json);
}
