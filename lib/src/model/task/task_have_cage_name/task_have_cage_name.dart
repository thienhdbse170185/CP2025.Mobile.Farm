import 'package:data_layer/model/entity/task/tash_type/task_type.dart';
import 'package:data_layer/model/entity/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_have_cage_name.freezed.dart';
part 'task_have_cage_name.g.dart';

@freezed
class TaskHaveCageName with _$TaskHaveCageName {
  const factory TaskHaveCageName({
    required String id,
    required String cageId,
    required String cageName,
    required String taskName,
    required String description,
    required String status,
    required String createdAt,
    required int priorityNum,
    required String dueDate,
    required int session,
    String? completedAt,
    required User assignedToUser,
    required TaskType taskType,
  }) = _TaskHaveCageName;

  factory TaskHaveCageName.fromJson(Map<String, dynamic> json) =>
      _$TaskHaveCageNameFromJson(json);
}
