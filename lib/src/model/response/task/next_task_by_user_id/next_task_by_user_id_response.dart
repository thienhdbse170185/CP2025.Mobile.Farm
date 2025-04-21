import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/entity/task/next_task/next_task.dart';

part 'next_task_by_user_id_response.freezed.dart';
part 'next_task_by_user_id_response.g.dart';

@freezed
class NextTaskByUserIdResponse with _$NextTaskByUserIdResponse {
  const factory NextTaskByUserIdResponse({
    required List<NextTask> items,
  }) = _NextTaskByUserIdResponse;

  factory NextTaskByUserIdResponse.fromJson(Map<String, dynamic> json) =>
      _$NextTaskByUserIdResponseFromJson(json);
}
