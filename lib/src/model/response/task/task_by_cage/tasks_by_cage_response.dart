import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../entity/task/task.dart';

part 'tasks_by_cage_response.freezed.dart';
part 'tasks_by_cage_response.g.dart';

@freezed
class TasksByCageResponse with _$TasksByCageResponse {
  const factory TasksByCageResponse({
    required List<Task> items,
    required int totalItems,
    required int totalPages,
    required int currentPage,
    required int pageSize,
    required bool hasNextPage,
    required bool hasPreviousPage,
  }) = _TasksByCageResponse;

  factory TasksByCageResponse.fromJson(Map<String, dynamic> json) =>
      _$TasksByCageResponseFromJson(json);
}
