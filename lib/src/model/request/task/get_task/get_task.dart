import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_task.freezed.dart';
part 'get_task.g.dart';

@freezed
class GetTaskRequest with _$GetTaskRequest {
  const factory GetTaskRequest({
    String? KeySearch,
    String? Status,
    String? TaskTypeId,
    String? CageId,
    String? AssignedToUserId,
    String? DueDateFrom,
    String? DueDateTo,
    int? PriorityNum,
    int? Session,
    String? CompletedAt,
    String? CreatedAt,
    int? PageNumber,
    int? PageSize,
  }) = _GetTaskRequest;

  factory GetTaskRequest.fromJson(Map<String, dynamic> json) =>
      _$GetTaskRequestFromJson(json);
}
