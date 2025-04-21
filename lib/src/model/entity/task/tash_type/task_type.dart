import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_type.freezed.dart';
part 'task_type.g.dart';

@freezed
class TaskType with _$TaskType {
  const factory TaskType({
    required String taskTypeId,
    required String taskTypeName,
  }) = _TaskType;

  factory TaskType.fromJson(Map<String, dynamic> json) =>
      _$TaskTypeFromJson(json);
}
