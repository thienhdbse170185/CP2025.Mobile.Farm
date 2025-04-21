import 'package:freezed_annotation/freezed_annotation.dart';

part 'next_task.freezed.dart';
part 'next_task.g.dart';

@freezed
class NextTask with _$NextTask {
  const factory NextTask({
    required String taskId,
    required String cageId,
    required String taskName,
    required String cagename,
    required String assignName,
    required int priorityNum,
    required String status,
    required String? dueDate,
    required int total,
    required int taskDone,
  }) = _NextTask;

  factory NextTask.fromJson(Map<String, dynamic> json) =>
      _$NextTaskFromJson(json);
}
