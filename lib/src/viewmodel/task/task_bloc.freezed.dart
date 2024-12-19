// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String task) createTask,
    required TResult Function(String taskId, String statusId) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
    required TResult Function() testConnect,
    required TResult Function(String cageId) getTasksByCageId,
    required TResult Function(String taskId) getTaskById,
    required TResult Function(String userId) getNextTask,
    required TResult Function(String userId, DateTime? date, String? cageId)
        getTasksByUserIdAndDate,
    required TResult Function(String location, List<TaskByUserResponse> tasks)
        filterTasksByLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String taskId, String statusId)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
    TResult? Function()? testConnect,
    TResult? Function(String cageId)? getTasksByCageId,
    TResult? Function(String taskId)? getTaskById,
    TResult? Function(String userId)? getNextTask,
    TResult? Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult? Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String taskId, String statusId)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
    TResult Function()? testConnect,
    TResult Function(String cageId)? getTasksByCageId,
    TResult Function(String taskId)? getTaskById,
    TResult Function(String userId)? getNextTask,
    TResult Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_GetTasks value) getTasks,
    required TResult Function(_TestConnect value) testConnect,
    required TResult Function(_GetTasksByCageId value) getTasksByCageId,
    required TResult Function(_GetTaskById value) getTaskById,
    required TResult Function(_GetNextTask value) getNextTask,
    required TResult Function(_GetTasksByUserIdAndDate value)
        getTasksByUserIdAndDate,
    required TResult Function(_FilterTasksByLocation value)
        filterTasksByLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_UpdateTask value)? updateTask,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_GetTasks value)? getTasks,
    TResult? Function(_TestConnect value)? testConnect,
    TResult? Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult? Function(_GetTaskById value)? getTaskById,
    TResult? Function(_GetNextTask value)? getNextTask,
    TResult? Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult? Function(_FilterTasksByLocation value)? filterTasksByLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetTasks value)? getTasks,
    TResult Function(_TestConnect value)? testConnect,
    TResult Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult Function(_GetTaskById value)? getTaskById,
    TResult Function(_GetNextTask value)? getNextTask,
    TResult Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult Function(_FilterTasksByLocation value)? filterTasksByLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEventCopyWith<$Res> {
  factory $TaskEventCopyWith(TaskEvent value, $Res Function(TaskEvent) then) =
      _$TaskEventCopyWithImpl<$Res, TaskEvent>;
}

/// @nodoc
class _$TaskEventCopyWithImpl<$Res, $Val extends TaskEvent>
    implements $TaskEventCopyWith<$Res> {
  _$TaskEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'TaskEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String task) createTask,
    required TResult Function(String taskId, String statusId) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
    required TResult Function() testConnect,
    required TResult Function(String cageId) getTasksByCageId,
    required TResult Function(String taskId) getTaskById,
    required TResult Function(String userId) getNextTask,
    required TResult Function(String userId, DateTime? date, String? cageId)
        getTasksByUserIdAndDate,
    required TResult Function(String location, List<TaskByUserResponse> tasks)
        filterTasksByLocation,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String taskId, String statusId)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
    TResult? Function()? testConnect,
    TResult? Function(String cageId)? getTasksByCageId,
    TResult? Function(String taskId)? getTaskById,
    TResult? Function(String userId)? getNextTask,
    TResult? Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult? Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String taskId, String statusId)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
    TResult Function()? testConnect,
    TResult Function(String cageId)? getTasksByCageId,
    TResult Function(String taskId)? getTaskById,
    TResult Function(String userId)? getNextTask,
    TResult Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_GetTasks value) getTasks,
    required TResult Function(_TestConnect value) testConnect,
    required TResult Function(_GetTasksByCageId value) getTasksByCageId,
    required TResult Function(_GetTaskById value) getTaskById,
    required TResult Function(_GetNextTask value) getNextTask,
    required TResult Function(_GetTasksByUserIdAndDate value)
        getTasksByUserIdAndDate,
    required TResult Function(_FilterTasksByLocation value)
        filterTasksByLocation,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_UpdateTask value)? updateTask,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_GetTasks value)? getTasks,
    TResult? Function(_TestConnect value)? testConnect,
    TResult? Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult? Function(_GetTaskById value)? getTaskById,
    TResult? Function(_GetNextTask value)? getNextTask,
    TResult? Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult? Function(_FilterTasksByLocation value)? filterTasksByLocation,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetTasks value)? getTasks,
    TResult Function(_TestConnect value)? testConnect,
    TResult Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult Function(_GetTaskById value)? getTaskById,
    TResult Function(_GetNextTask value)? getNextTask,
    TResult Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult Function(_FilterTasksByLocation value)? filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements TaskEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$CreateTaskImplCopyWith<$Res> {
  factory _$$CreateTaskImplCopyWith(
          _$CreateTaskImpl value, $Res Function(_$CreateTaskImpl) then) =
      __$$CreateTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String task});
}

/// @nodoc
class __$$CreateTaskImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$CreateTaskImpl>
    implements _$$CreateTaskImplCopyWith<$Res> {
  __$$CreateTaskImplCopyWithImpl(
      _$CreateTaskImpl _value, $Res Function(_$CreateTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$CreateTaskImpl(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateTaskImpl implements _CreateTask {
  const _$CreateTaskImpl(this.task);

  @override
  final String task;

  @override
  String toString() {
    return 'TaskEvent.createTask(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTaskImpl &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTaskImplCopyWith<_$CreateTaskImpl> get copyWith =>
      __$$CreateTaskImplCopyWithImpl<_$CreateTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String task) createTask,
    required TResult Function(String taskId, String statusId) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
    required TResult Function() testConnect,
    required TResult Function(String cageId) getTasksByCageId,
    required TResult Function(String taskId) getTaskById,
    required TResult Function(String userId) getNextTask,
    required TResult Function(String userId, DateTime? date, String? cageId)
        getTasksByUserIdAndDate,
    required TResult Function(String location, List<TaskByUserResponse> tasks)
        filterTasksByLocation,
  }) {
    return createTask(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String taskId, String statusId)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
    TResult? Function()? testConnect,
    TResult? Function(String cageId)? getTasksByCageId,
    TResult? Function(String taskId)? getTaskById,
    TResult? Function(String userId)? getNextTask,
    TResult? Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult? Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
  }) {
    return createTask?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String taskId, String statusId)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
    TResult Function()? testConnect,
    TResult Function(String cageId)? getTasksByCageId,
    TResult Function(String taskId)? getTaskById,
    TResult Function(String userId)? getNextTask,
    TResult Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (createTask != null) {
      return createTask(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_GetTasks value) getTasks,
    required TResult Function(_TestConnect value) testConnect,
    required TResult Function(_GetTasksByCageId value) getTasksByCageId,
    required TResult Function(_GetTaskById value) getTaskById,
    required TResult Function(_GetNextTask value) getNextTask,
    required TResult Function(_GetTasksByUserIdAndDate value)
        getTasksByUserIdAndDate,
    required TResult Function(_FilterTasksByLocation value)
        filterTasksByLocation,
  }) {
    return createTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_UpdateTask value)? updateTask,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_GetTasks value)? getTasks,
    TResult? Function(_TestConnect value)? testConnect,
    TResult? Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult? Function(_GetTaskById value)? getTaskById,
    TResult? Function(_GetNextTask value)? getNextTask,
    TResult? Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult? Function(_FilterTasksByLocation value)? filterTasksByLocation,
  }) {
    return createTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetTasks value)? getTasks,
    TResult Function(_TestConnect value)? testConnect,
    TResult Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult Function(_GetTaskById value)? getTaskById,
    TResult Function(_GetNextTask value)? getNextTask,
    TResult Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult Function(_FilterTasksByLocation value)? filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (createTask != null) {
      return createTask(this);
    }
    return orElse();
  }
}

abstract class _CreateTask implements TaskEvent {
  const factory _CreateTask(final String task) = _$CreateTaskImpl;

  String get task;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTaskImplCopyWith<_$CreateTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTaskImplCopyWith<$Res> {
  factory _$$UpdateTaskImplCopyWith(
          _$UpdateTaskImpl value, $Res Function(_$UpdateTaskImpl) then) =
      __$$UpdateTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId, String statusId});
}

/// @nodoc
class __$$UpdateTaskImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$UpdateTaskImpl>
    implements _$$UpdateTaskImplCopyWith<$Res> {
  __$$UpdateTaskImplCopyWithImpl(
      _$UpdateTaskImpl _value, $Res Function(_$UpdateTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? statusId = null,
  }) {
    return _then(_$UpdateTaskImpl(
      null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      null == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateTaskImpl implements _UpdateTask {
  const _$UpdateTaskImpl(this.taskId, this.statusId);

  @override
  final String taskId;
  @override
  final String statusId;

  @override
  String toString() {
    return 'TaskEvent.updateTask(taskId: $taskId, statusId: $statusId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTaskImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId, statusId);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTaskImplCopyWith<_$UpdateTaskImpl> get copyWith =>
      __$$UpdateTaskImplCopyWithImpl<_$UpdateTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String task) createTask,
    required TResult Function(String taskId, String statusId) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
    required TResult Function() testConnect,
    required TResult Function(String cageId) getTasksByCageId,
    required TResult Function(String taskId) getTaskById,
    required TResult Function(String userId) getNextTask,
    required TResult Function(String userId, DateTime? date, String? cageId)
        getTasksByUserIdAndDate,
    required TResult Function(String location, List<TaskByUserResponse> tasks)
        filterTasksByLocation,
  }) {
    return updateTask(taskId, statusId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String taskId, String statusId)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
    TResult? Function()? testConnect,
    TResult? Function(String cageId)? getTasksByCageId,
    TResult? Function(String taskId)? getTaskById,
    TResult? Function(String userId)? getNextTask,
    TResult? Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult? Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
  }) {
    return updateTask?.call(taskId, statusId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String taskId, String statusId)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
    TResult Function()? testConnect,
    TResult Function(String cageId)? getTasksByCageId,
    TResult Function(String taskId)? getTaskById,
    TResult Function(String userId)? getNextTask,
    TResult Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (updateTask != null) {
      return updateTask(taskId, statusId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_GetTasks value) getTasks,
    required TResult Function(_TestConnect value) testConnect,
    required TResult Function(_GetTasksByCageId value) getTasksByCageId,
    required TResult Function(_GetTaskById value) getTaskById,
    required TResult Function(_GetNextTask value) getNextTask,
    required TResult Function(_GetTasksByUserIdAndDate value)
        getTasksByUserIdAndDate,
    required TResult Function(_FilterTasksByLocation value)
        filterTasksByLocation,
  }) {
    return updateTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_UpdateTask value)? updateTask,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_GetTasks value)? getTasks,
    TResult? Function(_TestConnect value)? testConnect,
    TResult? Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult? Function(_GetTaskById value)? getTaskById,
    TResult? Function(_GetNextTask value)? getNextTask,
    TResult? Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult? Function(_FilterTasksByLocation value)? filterTasksByLocation,
  }) {
    return updateTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetTasks value)? getTasks,
    TResult Function(_TestConnect value)? testConnect,
    TResult Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult Function(_GetTaskById value)? getTaskById,
    TResult Function(_GetNextTask value)? getNextTask,
    TResult Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult Function(_FilterTasksByLocation value)? filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (updateTask != null) {
      return updateTask(this);
    }
    return orElse();
  }
}

abstract class _UpdateTask implements TaskEvent {
  const factory _UpdateTask(final String taskId, final String statusId) =
      _$UpdateTaskImpl;

  String get taskId;
  String get statusId;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTaskImplCopyWith<_$UpdateTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteTaskImplCopyWith<$Res> {
  factory _$$DeleteTaskImplCopyWith(
          _$DeleteTaskImpl value, $Res Function(_$DeleteTaskImpl) then) =
      __$$DeleteTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$DeleteTaskImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$DeleteTaskImpl>
    implements _$$DeleteTaskImplCopyWith<$Res> {
  __$$DeleteTaskImplCopyWithImpl(
      _$DeleteTaskImpl _value, $Res Function(_$DeleteTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$DeleteTaskImpl(
      null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteTaskImpl implements _DeleteTask {
  const _$DeleteTaskImpl(this.taskId);

  @override
  final String taskId;

  @override
  String toString() {
    return 'TaskEvent.deleteTask(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTaskImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteTaskImplCopyWith<_$DeleteTaskImpl> get copyWith =>
      __$$DeleteTaskImplCopyWithImpl<_$DeleteTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String task) createTask,
    required TResult Function(String taskId, String statusId) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
    required TResult Function() testConnect,
    required TResult Function(String cageId) getTasksByCageId,
    required TResult Function(String taskId) getTaskById,
    required TResult Function(String userId) getNextTask,
    required TResult Function(String userId, DateTime? date, String? cageId)
        getTasksByUserIdAndDate,
    required TResult Function(String location, List<TaskByUserResponse> tasks)
        filterTasksByLocation,
  }) {
    return deleteTask(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String taskId, String statusId)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
    TResult? Function()? testConnect,
    TResult? Function(String cageId)? getTasksByCageId,
    TResult? Function(String taskId)? getTaskById,
    TResult? Function(String userId)? getNextTask,
    TResult? Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult? Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
  }) {
    return deleteTask?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String taskId, String statusId)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
    TResult Function()? testConnect,
    TResult Function(String cageId)? getTasksByCageId,
    TResult Function(String taskId)? getTaskById,
    TResult Function(String userId)? getNextTask,
    TResult Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (deleteTask != null) {
      return deleteTask(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_GetTasks value) getTasks,
    required TResult Function(_TestConnect value) testConnect,
    required TResult Function(_GetTasksByCageId value) getTasksByCageId,
    required TResult Function(_GetTaskById value) getTaskById,
    required TResult Function(_GetNextTask value) getNextTask,
    required TResult Function(_GetTasksByUserIdAndDate value)
        getTasksByUserIdAndDate,
    required TResult Function(_FilterTasksByLocation value)
        filterTasksByLocation,
  }) {
    return deleteTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_UpdateTask value)? updateTask,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_GetTasks value)? getTasks,
    TResult? Function(_TestConnect value)? testConnect,
    TResult? Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult? Function(_GetTaskById value)? getTaskById,
    TResult? Function(_GetNextTask value)? getNextTask,
    TResult? Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult? Function(_FilterTasksByLocation value)? filterTasksByLocation,
  }) {
    return deleteTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetTasks value)? getTasks,
    TResult Function(_TestConnect value)? testConnect,
    TResult Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult Function(_GetTaskById value)? getTaskById,
    TResult Function(_GetNextTask value)? getNextTask,
    TResult Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult Function(_FilterTasksByLocation value)? filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (deleteTask != null) {
      return deleteTask(this);
    }
    return orElse();
  }
}

abstract class _DeleteTask implements TaskEvent {
  const factory _DeleteTask(final String taskId) = _$DeleteTaskImpl;

  String get taskId;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteTaskImplCopyWith<_$DeleteTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetTasksImplCopyWith<$Res> {
  factory _$$GetTasksImplCopyWith(
          _$GetTasksImpl value, $Res Function(_$GetTasksImpl) then) =
      __$$GetTasksImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetTasksImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$GetTasksImpl>
    implements _$$GetTasksImplCopyWith<$Res> {
  __$$GetTasksImplCopyWithImpl(
      _$GetTasksImpl _value, $Res Function(_$GetTasksImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetTasksImpl implements _GetTasks {
  const _$GetTasksImpl();

  @override
  String toString() {
    return 'TaskEvent.getTasks()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetTasksImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String task) createTask,
    required TResult Function(String taskId, String statusId) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
    required TResult Function() testConnect,
    required TResult Function(String cageId) getTasksByCageId,
    required TResult Function(String taskId) getTaskById,
    required TResult Function(String userId) getNextTask,
    required TResult Function(String userId, DateTime? date, String? cageId)
        getTasksByUserIdAndDate,
    required TResult Function(String location, List<TaskByUserResponse> tasks)
        filterTasksByLocation,
  }) {
    return getTasks();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String taskId, String statusId)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
    TResult? Function()? testConnect,
    TResult? Function(String cageId)? getTasksByCageId,
    TResult? Function(String taskId)? getTaskById,
    TResult? Function(String userId)? getNextTask,
    TResult? Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult? Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
  }) {
    return getTasks?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String taskId, String statusId)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
    TResult Function()? testConnect,
    TResult Function(String cageId)? getTasksByCageId,
    TResult Function(String taskId)? getTaskById,
    TResult Function(String userId)? getNextTask,
    TResult Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (getTasks != null) {
      return getTasks();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_GetTasks value) getTasks,
    required TResult Function(_TestConnect value) testConnect,
    required TResult Function(_GetTasksByCageId value) getTasksByCageId,
    required TResult Function(_GetTaskById value) getTaskById,
    required TResult Function(_GetNextTask value) getNextTask,
    required TResult Function(_GetTasksByUserIdAndDate value)
        getTasksByUserIdAndDate,
    required TResult Function(_FilterTasksByLocation value)
        filterTasksByLocation,
  }) {
    return getTasks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_UpdateTask value)? updateTask,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_GetTasks value)? getTasks,
    TResult? Function(_TestConnect value)? testConnect,
    TResult? Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult? Function(_GetTaskById value)? getTaskById,
    TResult? Function(_GetNextTask value)? getNextTask,
    TResult? Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult? Function(_FilterTasksByLocation value)? filterTasksByLocation,
  }) {
    return getTasks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetTasks value)? getTasks,
    TResult Function(_TestConnect value)? testConnect,
    TResult Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult Function(_GetTaskById value)? getTaskById,
    TResult Function(_GetNextTask value)? getNextTask,
    TResult Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult Function(_FilterTasksByLocation value)? filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (getTasks != null) {
      return getTasks(this);
    }
    return orElse();
  }
}

abstract class _GetTasks implements TaskEvent {
  const factory _GetTasks() = _$GetTasksImpl;
}

/// @nodoc
abstract class _$$TestConnectImplCopyWith<$Res> {
  factory _$$TestConnectImplCopyWith(
          _$TestConnectImpl value, $Res Function(_$TestConnectImpl) then) =
      __$$TestConnectImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TestConnectImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$TestConnectImpl>
    implements _$$TestConnectImplCopyWith<$Res> {
  __$$TestConnectImplCopyWithImpl(
      _$TestConnectImpl _value, $Res Function(_$TestConnectImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TestConnectImpl implements _TestConnect {
  const _$TestConnectImpl();

  @override
  String toString() {
    return 'TaskEvent.testConnect()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TestConnectImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String task) createTask,
    required TResult Function(String taskId, String statusId) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
    required TResult Function() testConnect,
    required TResult Function(String cageId) getTasksByCageId,
    required TResult Function(String taskId) getTaskById,
    required TResult Function(String userId) getNextTask,
    required TResult Function(String userId, DateTime? date, String? cageId)
        getTasksByUserIdAndDate,
    required TResult Function(String location, List<TaskByUserResponse> tasks)
        filterTasksByLocation,
  }) {
    return testConnect();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String taskId, String statusId)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
    TResult? Function()? testConnect,
    TResult? Function(String cageId)? getTasksByCageId,
    TResult? Function(String taskId)? getTaskById,
    TResult? Function(String userId)? getNextTask,
    TResult? Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult? Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
  }) {
    return testConnect?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String taskId, String statusId)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
    TResult Function()? testConnect,
    TResult Function(String cageId)? getTasksByCageId,
    TResult Function(String taskId)? getTaskById,
    TResult Function(String userId)? getNextTask,
    TResult Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (testConnect != null) {
      return testConnect();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_GetTasks value) getTasks,
    required TResult Function(_TestConnect value) testConnect,
    required TResult Function(_GetTasksByCageId value) getTasksByCageId,
    required TResult Function(_GetTaskById value) getTaskById,
    required TResult Function(_GetNextTask value) getNextTask,
    required TResult Function(_GetTasksByUserIdAndDate value)
        getTasksByUserIdAndDate,
    required TResult Function(_FilterTasksByLocation value)
        filterTasksByLocation,
  }) {
    return testConnect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_UpdateTask value)? updateTask,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_GetTasks value)? getTasks,
    TResult? Function(_TestConnect value)? testConnect,
    TResult? Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult? Function(_GetTaskById value)? getTaskById,
    TResult? Function(_GetNextTask value)? getNextTask,
    TResult? Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult? Function(_FilterTasksByLocation value)? filterTasksByLocation,
  }) {
    return testConnect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetTasks value)? getTasks,
    TResult Function(_TestConnect value)? testConnect,
    TResult Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult Function(_GetTaskById value)? getTaskById,
    TResult Function(_GetNextTask value)? getNextTask,
    TResult Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult Function(_FilterTasksByLocation value)? filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (testConnect != null) {
      return testConnect(this);
    }
    return orElse();
  }
}

abstract class _TestConnect implements TaskEvent {
  const factory _TestConnect() = _$TestConnectImpl;
}

/// @nodoc
abstract class _$$GetTasksByCageIdImplCopyWith<$Res> {
  factory _$$GetTasksByCageIdImplCopyWith(_$GetTasksByCageIdImpl value,
          $Res Function(_$GetTasksByCageIdImpl) then) =
      __$$GetTasksByCageIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cageId});
}

/// @nodoc
class __$$GetTasksByCageIdImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$GetTasksByCageIdImpl>
    implements _$$GetTasksByCageIdImplCopyWith<$Res> {
  __$$GetTasksByCageIdImplCopyWithImpl(_$GetTasksByCageIdImpl _value,
      $Res Function(_$GetTasksByCageIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cageId = null,
  }) {
    return _then(_$GetTasksByCageIdImpl(
      null == cageId
          ? _value.cageId
          : cageId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetTasksByCageIdImpl implements _GetTasksByCageId {
  const _$GetTasksByCageIdImpl(this.cageId);

  @override
  final String cageId;

  @override
  String toString() {
    return 'TaskEvent.getTasksByCageId(cageId: $cageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTasksByCageIdImpl &&
            (identical(other.cageId, cageId) || other.cageId == cageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cageId);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTasksByCageIdImplCopyWith<_$GetTasksByCageIdImpl> get copyWith =>
      __$$GetTasksByCageIdImplCopyWithImpl<_$GetTasksByCageIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String task) createTask,
    required TResult Function(String taskId, String statusId) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
    required TResult Function() testConnect,
    required TResult Function(String cageId) getTasksByCageId,
    required TResult Function(String taskId) getTaskById,
    required TResult Function(String userId) getNextTask,
    required TResult Function(String userId, DateTime? date, String? cageId)
        getTasksByUserIdAndDate,
    required TResult Function(String location, List<TaskByUserResponse> tasks)
        filterTasksByLocation,
  }) {
    return getTasksByCageId(cageId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String taskId, String statusId)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
    TResult? Function()? testConnect,
    TResult? Function(String cageId)? getTasksByCageId,
    TResult? Function(String taskId)? getTaskById,
    TResult? Function(String userId)? getNextTask,
    TResult? Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult? Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
  }) {
    return getTasksByCageId?.call(cageId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String taskId, String statusId)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
    TResult Function()? testConnect,
    TResult Function(String cageId)? getTasksByCageId,
    TResult Function(String taskId)? getTaskById,
    TResult Function(String userId)? getNextTask,
    TResult Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (getTasksByCageId != null) {
      return getTasksByCageId(cageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_GetTasks value) getTasks,
    required TResult Function(_TestConnect value) testConnect,
    required TResult Function(_GetTasksByCageId value) getTasksByCageId,
    required TResult Function(_GetTaskById value) getTaskById,
    required TResult Function(_GetNextTask value) getNextTask,
    required TResult Function(_GetTasksByUserIdAndDate value)
        getTasksByUserIdAndDate,
    required TResult Function(_FilterTasksByLocation value)
        filterTasksByLocation,
  }) {
    return getTasksByCageId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_UpdateTask value)? updateTask,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_GetTasks value)? getTasks,
    TResult? Function(_TestConnect value)? testConnect,
    TResult? Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult? Function(_GetTaskById value)? getTaskById,
    TResult? Function(_GetNextTask value)? getNextTask,
    TResult? Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult? Function(_FilterTasksByLocation value)? filterTasksByLocation,
  }) {
    return getTasksByCageId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetTasks value)? getTasks,
    TResult Function(_TestConnect value)? testConnect,
    TResult Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult Function(_GetTaskById value)? getTaskById,
    TResult Function(_GetNextTask value)? getNextTask,
    TResult Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult Function(_FilterTasksByLocation value)? filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (getTasksByCageId != null) {
      return getTasksByCageId(this);
    }
    return orElse();
  }
}

abstract class _GetTasksByCageId implements TaskEvent {
  const factory _GetTasksByCageId(final String cageId) = _$GetTasksByCageIdImpl;

  String get cageId;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTasksByCageIdImplCopyWith<_$GetTasksByCageIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetTaskByIdImplCopyWith<$Res> {
  factory _$$GetTaskByIdImplCopyWith(
          _$GetTaskByIdImpl value, $Res Function(_$GetTaskByIdImpl) then) =
      __$$GetTaskByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$GetTaskByIdImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$GetTaskByIdImpl>
    implements _$$GetTaskByIdImplCopyWith<$Res> {
  __$$GetTaskByIdImplCopyWithImpl(
      _$GetTaskByIdImpl _value, $Res Function(_$GetTaskByIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$GetTaskByIdImpl(
      null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetTaskByIdImpl implements _GetTaskById {
  const _$GetTaskByIdImpl(this.taskId);

  @override
  final String taskId;

  @override
  String toString() {
    return 'TaskEvent.getTaskById(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTaskByIdImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTaskByIdImplCopyWith<_$GetTaskByIdImpl> get copyWith =>
      __$$GetTaskByIdImplCopyWithImpl<_$GetTaskByIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String task) createTask,
    required TResult Function(String taskId, String statusId) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
    required TResult Function() testConnect,
    required TResult Function(String cageId) getTasksByCageId,
    required TResult Function(String taskId) getTaskById,
    required TResult Function(String userId) getNextTask,
    required TResult Function(String userId, DateTime? date, String? cageId)
        getTasksByUserIdAndDate,
    required TResult Function(String location, List<TaskByUserResponse> tasks)
        filterTasksByLocation,
  }) {
    return getTaskById(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String taskId, String statusId)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
    TResult? Function()? testConnect,
    TResult? Function(String cageId)? getTasksByCageId,
    TResult? Function(String taskId)? getTaskById,
    TResult? Function(String userId)? getNextTask,
    TResult? Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult? Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
  }) {
    return getTaskById?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String taskId, String statusId)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
    TResult Function()? testConnect,
    TResult Function(String cageId)? getTasksByCageId,
    TResult Function(String taskId)? getTaskById,
    TResult Function(String userId)? getNextTask,
    TResult Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (getTaskById != null) {
      return getTaskById(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_GetTasks value) getTasks,
    required TResult Function(_TestConnect value) testConnect,
    required TResult Function(_GetTasksByCageId value) getTasksByCageId,
    required TResult Function(_GetTaskById value) getTaskById,
    required TResult Function(_GetNextTask value) getNextTask,
    required TResult Function(_GetTasksByUserIdAndDate value)
        getTasksByUserIdAndDate,
    required TResult Function(_FilterTasksByLocation value)
        filterTasksByLocation,
  }) {
    return getTaskById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_UpdateTask value)? updateTask,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_GetTasks value)? getTasks,
    TResult? Function(_TestConnect value)? testConnect,
    TResult? Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult? Function(_GetTaskById value)? getTaskById,
    TResult? Function(_GetNextTask value)? getNextTask,
    TResult? Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult? Function(_FilterTasksByLocation value)? filterTasksByLocation,
  }) {
    return getTaskById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetTasks value)? getTasks,
    TResult Function(_TestConnect value)? testConnect,
    TResult Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult Function(_GetTaskById value)? getTaskById,
    TResult Function(_GetNextTask value)? getNextTask,
    TResult Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult Function(_FilterTasksByLocation value)? filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (getTaskById != null) {
      return getTaskById(this);
    }
    return orElse();
  }
}

abstract class _GetTaskById implements TaskEvent {
  const factory _GetTaskById(final String taskId) = _$GetTaskByIdImpl;

  String get taskId;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTaskByIdImplCopyWith<_$GetTaskByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetNextTaskImplCopyWith<$Res> {
  factory _$$GetNextTaskImplCopyWith(
          _$GetNextTaskImpl value, $Res Function(_$GetNextTaskImpl) then) =
      __$$GetNextTaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$GetNextTaskImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$GetNextTaskImpl>
    implements _$$GetNextTaskImplCopyWith<$Res> {
  __$$GetNextTaskImplCopyWithImpl(
      _$GetNextTaskImpl _value, $Res Function(_$GetNextTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$GetNextTaskImpl(
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetNextTaskImpl implements _GetNextTask {
  const _$GetNextTaskImpl(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'TaskEvent.getNextTask(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNextTaskImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNextTaskImplCopyWith<_$GetNextTaskImpl> get copyWith =>
      __$$GetNextTaskImplCopyWithImpl<_$GetNextTaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String task) createTask,
    required TResult Function(String taskId, String statusId) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
    required TResult Function() testConnect,
    required TResult Function(String cageId) getTasksByCageId,
    required TResult Function(String taskId) getTaskById,
    required TResult Function(String userId) getNextTask,
    required TResult Function(String userId, DateTime? date, String? cageId)
        getTasksByUserIdAndDate,
    required TResult Function(String location, List<TaskByUserResponse> tasks)
        filterTasksByLocation,
  }) {
    return getNextTask(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String taskId, String statusId)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
    TResult? Function()? testConnect,
    TResult? Function(String cageId)? getTasksByCageId,
    TResult? Function(String taskId)? getTaskById,
    TResult? Function(String userId)? getNextTask,
    TResult? Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult? Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
  }) {
    return getNextTask?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String taskId, String statusId)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
    TResult Function()? testConnect,
    TResult Function(String cageId)? getTasksByCageId,
    TResult Function(String taskId)? getTaskById,
    TResult Function(String userId)? getNextTask,
    TResult Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (getNextTask != null) {
      return getNextTask(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_GetTasks value) getTasks,
    required TResult Function(_TestConnect value) testConnect,
    required TResult Function(_GetTasksByCageId value) getTasksByCageId,
    required TResult Function(_GetTaskById value) getTaskById,
    required TResult Function(_GetNextTask value) getNextTask,
    required TResult Function(_GetTasksByUserIdAndDate value)
        getTasksByUserIdAndDate,
    required TResult Function(_FilterTasksByLocation value)
        filterTasksByLocation,
  }) {
    return getNextTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_UpdateTask value)? updateTask,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_GetTasks value)? getTasks,
    TResult? Function(_TestConnect value)? testConnect,
    TResult? Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult? Function(_GetTaskById value)? getTaskById,
    TResult? Function(_GetNextTask value)? getNextTask,
    TResult? Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult? Function(_FilterTasksByLocation value)? filterTasksByLocation,
  }) {
    return getNextTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetTasks value)? getTasks,
    TResult Function(_TestConnect value)? testConnect,
    TResult Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult Function(_GetTaskById value)? getTaskById,
    TResult Function(_GetNextTask value)? getNextTask,
    TResult Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult Function(_FilterTasksByLocation value)? filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (getNextTask != null) {
      return getNextTask(this);
    }
    return orElse();
  }
}

abstract class _GetNextTask implements TaskEvent {
  const factory _GetNextTask(final String userId) = _$GetNextTaskImpl;

  String get userId;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetNextTaskImplCopyWith<_$GetNextTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetTasksByUserIdAndDateImplCopyWith<$Res> {
  factory _$$GetTasksByUserIdAndDateImplCopyWith(
          _$GetTasksByUserIdAndDateImpl value,
          $Res Function(_$GetTasksByUserIdAndDateImpl) then) =
      __$$GetTasksByUserIdAndDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, DateTime? date, String? cageId});
}

/// @nodoc
class __$$GetTasksByUserIdAndDateImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$GetTasksByUserIdAndDateImpl>
    implements _$$GetTasksByUserIdAndDateImplCopyWith<$Res> {
  __$$GetTasksByUserIdAndDateImplCopyWithImpl(
      _$GetTasksByUserIdAndDateImpl _value,
      $Res Function(_$GetTasksByUserIdAndDateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? date = freezed,
    Object? cageId = freezed,
  }) {
    return _then(_$GetTasksByUserIdAndDateImpl(
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      freezed == cageId
          ? _value.cageId
          : cageId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GetTasksByUserIdAndDateImpl implements _GetTasksByUserIdAndDate {
  const _$GetTasksByUserIdAndDateImpl(this.userId, this.date, this.cageId);

  @override
  final String userId;
  @override
  final DateTime? date;
  @override
  final String? cageId;

  @override
  String toString() {
    return 'TaskEvent.getTasksByUserIdAndDate(userId: $userId, date: $date, cageId: $cageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTasksByUserIdAndDateImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.cageId, cageId) || other.cageId == cageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, date, cageId);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTasksByUserIdAndDateImplCopyWith<_$GetTasksByUserIdAndDateImpl>
      get copyWith => __$$GetTasksByUserIdAndDateImplCopyWithImpl<
          _$GetTasksByUserIdAndDateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String task) createTask,
    required TResult Function(String taskId, String statusId) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
    required TResult Function() testConnect,
    required TResult Function(String cageId) getTasksByCageId,
    required TResult Function(String taskId) getTaskById,
    required TResult Function(String userId) getNextTask,
    required TResult Function(String userId, DateTime? date, String? cageId)
        getTasksByUserIdAndDate,
    required TResult Function(String location, List<TaskByUserResponse> tasks)
        filterTasksByLocation,
  }) {
    return getTasksByUserIdAndDate(userId, date, cageId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String taskId, String statusId)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
    TResult? Function()? testConnect,
    TResult? Function(String cageId)? getTasksByCageId,
    TResult? Function(String taskId)? getTaskById,
    TResult? Function(String userId)? getNextTask,
    TResult? Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult? Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
  }) {
    return getTasksByUserIdAndDate?.call(userId, date, cageId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String taskId, String statusId)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
    TResult Function()? testConnect,
    TResult Function(String cageId)? getTasksByCageId,
    TResult Function(String taskId)? getTaskById,
    TResult Function(String userId)? getNextTask,
    TResult Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (getTasksByUserIdAndDate != null) {
      return getTasksByUserIdAndDate(userId, date, cageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_GetTasks value) getTasks,
    required TResult Function(_TestConnect value) testConnect,
    required TResult Function(_GetTasksByCageId value) getTasksByCageId,
    required TResult Function(_GetTaskById value) getTaskById,
    required TResult Function(_GetNextTask value) getNextTask,
    required TResult Function(_GetTasksByUserIdAndDate value)
        getTasksByUserIdAndDate,
    required TResult Function(_FilterTasksByLocation value)
        filterTasksByLocation,
  }) {
    return getTasksByUserIdAndDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_UpdateTask value)? updateTask,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_GetTasks value)? getTasks,
    TResult? Function(_TestConnect value)? testConnect,
    TResult? Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult? Function(_GetTaskById value)? getTaskById,
    TResult? Function(_GetNextTask value)? getNextTask,
    TResult? Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult? Function(_FilterTasksByLocation value)? filterTasksByLocation,
  }) {
    return getTasksByUserIdAndDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetTasks value)? getTasks,
    TResult Function(_TestConnect value)? testConnect,
    TResult Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult Function(_GetTaskById value)? getTaskById,
    TResult Function(_GetNextTask value)? getNextTask,
    TResult Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult Function(_FilterTasksByLocation value)? filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (getTasksByUserIdAndDate != null) {
      return getTasksByUserIdAndDate(this);
    }
    return orElse();
  }
}

abstract class _GetTasksByUserIdAndDate implements TaskEvent {
  const factory _GetTasksByUserIdAndDate(
          final String userId, final DateTime? date, final String? cageId) =
      _$GetTasksByUserIdAndDateImpl;

  String get userId;
  DateTime? get date;
  String? get cageId;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTasksByUserIdAndDateImplCopyWith<_$GetTasksByUserIdAndDateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterTasksByLocationImplCopyWith<$Res> {
  factory _$$FilterTasksByLocationImplCopyWith(
          _$FilterTasksByLocationImpl value,
          $Res Function(_$FilterTasksByLocationImpl) then) =
      __$$FilterTasksByLocationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String location, List<TaskByUserResponse> tasks});
}

/// @nodoc
class __$$FilterTasksByLocationImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$FilterTasksByLocationImpl>
    implements _$$FilterTasksByLocationImplCopyWith<$Res> {
  __$$FilterTasksByLocationImplCopyWithImpl(_$FilterTasksByLocationImpl _value,
      $Res Function(_$FilterTasksByLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? tasks = null,
  }) {
    return _then(_$FilterTasksByLocationImpl(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskByUserResponse>,
    ));
  }
}

/// @nodoc

class _$FilterTasksByLocationImpl implements _FilterTasksByLocation {
  const _$FilterTasksByLocationImpl(
      {required this.location, required final List<TaskByUserResponse> tasks})
      : _tasks = tasks;

  @override
  final String location;
  final List<TaskByUserResponse> _tasks;
  @override
  List<TaskByUserResponse> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TaskEvent.filterTasksByLocation(location: $location, tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterTasksByLocationImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, location, const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterTasksByLocationImplCopyWith<_$FilterTasksByLocationImpl>
      get copyWith => __$$FilterTasksByLocationImplCopyWithImpl<
          _$FilterTasksByLocationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String task) createTask,
    required TResult Function(String taskId, String statusId) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
    required TResult Function() testConnect,
    required TResult Function(String cageId) getTasksByCageId,
    required TResult Function(String taskId) getTaskById,
    required TResult Function(String userId) getNextTask,
    required TResult Function(String userId, DateTime? date, String? cageId)
        getTasksByUserIdAndDate,
    required TResult Function(String location, List<TaskByUserResponse> tasks)
        filterTasksByLocation,
  }) {
    return filterTasksByLocation(location, tasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String taskId, String statusId)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
    TResult? Function()? testConnect,
    TResult? Function(String cageId)? getTasksByCageId,
    TResult? Function(String taskId)? getTaskById,
    TResult? Function(String userId)? getNextTask,
    TResult? Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult? Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
  }) {
    return filterTasksByLocation?.call(location, tasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String taskId, String statusId)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
    TResult Function()? testConnect,
    TResult Function(String cageId)? getTasksByCageId,
    TResult Function(String taskId)? getTaskById,
    TResult Function(String userId)? getNextTask,
    TResult Function(String userId, DateTime? date, String? cageId)?
        getTasksByUserIdAndDate,
    TResult Function(String location, List<TaskByUserResponse> tasks)?
        filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (filterTasksByLocation != null) {
      return filterTasksByLocation(location, tasks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateTask value) createTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
    required TResult Function(_GetTasks value) getTasks,
    required TResult Function(_TestConnect value) testConnect,
    required TResult Function(_GetTasksByCageId value) getTasksByCageId,
    required TResult Function(_GetTaskById value) getTaskById,
    required TResult Function(_GetNextTask value) getNextTask,
    required TResult Function(_GetTasksByUserIdAndDate value)
        getTasksByUserIdAndDate,
    required TResult Function(_FilterTasksByLocation value)
        filterTasksByLocation,
  }) {
    return filterTasksByLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_UpdateTask value)? updateTask,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_GetTasks value)? getTasks,
    TResult? Function(_TestConnect value)? testConnect,
    TResult? Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult? Function(_GetTaskById value)? getTaskById,
    TResult? Function(_GetNextTask value)? getNextTask,
    TResult? Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult? Function(_FilterTasksByLocation value)? filterTasksByLocation,
  }) {
    return filterTasksByLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetTasks value)? getTasks,
    TResult Function(_TestConnect value)? testConnect,
    TResult Function(_GetTasksByCageId value)? getTasksByCageId,
    TResult Function(_GetTaskById value)? getTaskById,
    TResult Function(_GetNextTask value)? getNextTask,
    TResult Function(_GetTasksByUserIdAndDate value)? getTasksByUserIdAndDate,
    TResult Function(_FilterTasksByLocation value)? filterTasksByLocation,
    required TResult orElse(),
  }) {
    if (filterTasksByLocation != null) {
      return filterTasksByLocation(this);
    }
    return orElse();
  }
}

abstract class _FilterTasksByLocation implements TaskEvent {
  const factory _FilterTasksByLocation(
          {required final String location,
          required final List<TaskByUserResponse> tasks}) =
      _$FilterTasksByLocationImpl;

  String get location;
  List<TaskByUserResponse> get tasks;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterTasksByLocationImplCopyWith<_$FilterTasksByLocationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TaskState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStateCopyWith<$Res> {
  factory $TaskStateCopyWith(TaskState value, $Res Function(TaskState) then) =
      _$TaskStateCopyWithImpl<$Res, TaskState>;
}

/// @nodoc
class _$TaskStateCopyWithImpl<$Res, $Val extends TaskState>
    implements $TaskStateCopyWith<$Res> {
  _$TaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'TaskState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TaskState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'TaskState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements TaskState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'TaskState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements TaskState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'TaskState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements TaskState {
  const factory _Failure(final String error) = _$FailureImpl;

  String get error;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskCreatedImplCopyWith<$Res> {
  factory _$$TaskCreatedImplCopyWith(
          _$TaskCreatedImpl value, $Res Function(_$TaskCreatedImpl) then) =
      __$$TaskCreatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskCreatedImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskCreatedImpl>
    implements _$$TaskCreatedImplCopyWith<$Res> {
  __$$TaskCreatedImplCopyWithImpl(
      _$TaskCreatedImpl _value, $Res Function(_$TaskCreatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskCreatedImpl implements _TaskCreated {
  const _$TaskCreatedImpl();

  @override
  String toString() {
    return 'TaskState.taskCreated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskCreatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return taskCreated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return taskCreated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (taskCreated != null) {
      return taskCreated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return taskCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return taskCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (taskCreated != null) {
      return taskCreated(this);
    }
    return orElse();
  }
}

abstract class _TaskCreated implements TaskState {
  const factory _TaskCreated() = _$TaskCreatedImpl;
}

/// @nodoc
abstract class _$$TaskUpdatedImplCopyWith<$Res> {
  factory _$$TaskUpdatedImplCopyWith(
          _$TaskUpdatedImpl value, $Res Function(_$TaskUpdatedImpl) then) =
      __$$TaskUpdatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskUpdatedImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskUpdatedImpl>
    implements _$$TaskUpdatedImplCopyWith<$Res> {
  __$$TaskUpdatedImplCopyWithImpl(
      _$TaskUpdatedImpl _value, $Res Function(_$TaskUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskUpdatedImpl implements _TaskUpdated {
  const _$TaskUpdatedImpl();

  @override
  String toString() {
    return 'TaskState.taskUpdated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskUpdatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return taskUpdated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return taskUpdated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (taskUpdated != null) {
      return taskUpdated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return taskUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return taskUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (taskUpdated != null) {
      return taskUpdated(this);
    }
    return orElse();
  }
}

abstract class _TaskUpdated implements TaskState {
  const factory _TaskUpdated() = _$TaskUpdatedImpl;
}

/// @nodoc
abstract class _$$TaskDeletedImplCopyWith<$Res> {
  factory _$$TaskDeletedImplCopyWith(
          _$TaskDeletedImpl value, $Res Function(_$TaskDeletedImpl) then) =
      __$$TaskDeletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskDeletedImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskDeletedImpl>
    implements _$$TaskDeletedImplCopyWith<$Res> {
  __$$TaskDeletedImplCopyWithImpl(
      _$TaskDeletedImpl _value, $Res Function(_$TaskDeletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskDeletedImpl implements _TaskDeleted {
  const _$TaskDeletedImpl();

  @override
  String toString() {
    return 'TaskState.taskDeleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskDeletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return taskDeleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return taskDeleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (taskDeleted != null) {
      return taskDeleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return taskDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return taskDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (taskDeleted != null) {
      return taskDeleted(this);
    }
    return orElse();
  }
}

abstract class _TaskDeleted implements TaskState {
  const factory _TaskDeleted() = _$TaskDeletedImpl;
}

/// @nodoc
abstract class _$$GetTasksSuccessImplCopyWith<$Res> {
  factory _$$GetTasksSuccessImplCopyWith(_$GetTasksSuccessImpl value,
          $Res Function(_$GetTasksSuccessImpl) then) =
      __$$GetTasksSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> tasks});
}

/// @nodoc
class __$$GetTasksSuccessImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$GetTasksSuccessImpl>
    implements _$$GetTasksSuccessImplCopyWith<$Res> {
  __$$GetTasksSuccessImplCopyWithImpl(
      _$GetTasksSuccessImpl _value, $Res Function(_$GetTasksSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$GetTasksSuccessImpl(
      null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$GetTasksSuccessImpl implements _GetTasksSuccess {
  const _$GetTasksSuccessImpl(final Map<String, dynamic> tasks)
      : _tasks = tasks;

  final Map<String, dynamic> _tasks;
  @override
  Map<String, dynamic> get tasks {
    if (_tasks is EqualUnmodifiableMapView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tasks);
  }

  @override
  String toString() {
    return 'TaskState.getTasksSuccess(tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTasksSuccessImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTasksSuccessImplCopyWith<_$GetTasksSuccessImpl> get copyWith =>
      __$$GetTasksSuccessImplCopyWithImpl<_$GetTasksSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return getTasksSuccess(tasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return getTasksSuccess?.call(tasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTasksSuccess != null) {
      return getTasksSuccess(tasks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return getTasksSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return getTasksSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTasksSuccess != null) {
      return getTasksSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetTasksSuccess implements TaskState {
  const factory _GetTasksSuccess(final Map<String, dynamic> tasks) =
      _$GetTasksSuccessImpl;

  Map<String, dynamic> get tasks;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTasksSuccessImplCopyWith<_$GetTasksSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetTasksFailureImplCopyWith<$Res> {
  factory _$$GetTasksFailureImplCopyWith(_$GetTasksFailureImpl value,
          $Res Function(_$GetTasksFailureImpl) then) =
      __$$GetTasksFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetTasksFailureImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$GetTasksFailureImpl>
    implements _$$GetTasksFailureImplCopyWith<$Res> {
  __$$GetTasksFailureImplCopyWithImpl(
      _$GetTasksFailureImpl _value, $Res Function(_$GetTasksFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetTasksFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetTasksFailureImpl implements _GetTasksFailure {
  const _$GetTasksFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'TaskState.getTasksFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTasksFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTasksFailureImplCopyWith<_$GetTasksFailureImpl> get copyWith =>
      __$$GetTasksFailureImplCopyWithImpl<_$GetTasksFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return getTasksFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return getTasksFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTasksFailure != null) {
      return getTasksFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return getTasksFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return getTasksFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTasksFailure != null) {
      return getTasksFailure(this);
    }
    return orElse();
  }
}

abstract class _GetTasksFailure implements TaskState {
  const factory _GetTasksFailure(final String error) = _$GetTasksFailureImpl;

  String get error;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTasksFailureImplCopyWith<_$GetTasksFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TestConnectSuccessImplCopyWith<$Res> {
  factory _$$TestConnectSuccessImplCopyWith(_$TestConnectSuccessImpl value,
          $Res Function(_$TestConnectSuccessImpl) then) =
      __$$TestConnectSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TestConnectSuccessImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TestConnectSuccessImpl>
    implements _$$TestConnectSuccessImplCopyWith<$Res> {
  __$$TestConnectSuccessImplCopyWithImpl(_$TestConnectSuccessImpl _value,
      $Res Function(_$TestConnectSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TestConnectSuccessImpl implements _TestConnectSuccess {
  const _$TestConnectSuccessImpl();

  @override
  String toString() {
    return 'TaskState.testConnectSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TestConnectSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return testConnectSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return testConnectSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (testConnectSuccess != null) {
      return testConnectSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return testConnectSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return testConnectSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (testConnectSuccess != null) {
      return testConnectSuccess(this);
    }
    return orElse();
  }
}

abstract class _TestConnectSuccess implements TaskState {
  const factory _TestConnectSuccess() = _$TestConnectSuccessImpl;
}

/// @nodoc
abstract class _$$GetTasksByCageIdLoadingImplCopyWith<$Res> {
  factory _$$GetTasksByCageIdLoadingImplCopyWith(
          _$GetTasksByCageIdLoadingImpl value,
          $Res Function(_$GetTasksByCageIdLoadingImpl) then) =
      __$$GetTasksByCageIdLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetTasksByCageIdLoadingImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$GetTasksByCageIdLoadingImpl>
    implements _$$GetTasksByCageIdLoadingImplCopyWith<$Res> {
  __$$GetTasksByCageIdLoadingImplCopyWithImpl(
      _$GetTasksByCageIdLoadingImpl _value,
      $Res Function(_$GetTasksByCageIdLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetTasksByCageIdLoadingImpl implements _GetTasksByCageIdLoading {
  const _$GetTasksByCageIdLoadingImpl();

  @override
  String toString() {
    return 'TaskState.getTasksByCageIdLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTasksByCageIdLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return getTasksByCageIdLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return getTasksByCageIdLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTasksByCageIdLoading != null) {
      return getTasksByCageIdLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return getTasksByCageIdLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return getTasksByCageIdLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTasksByCageIdLoading != null) {
      return getTasksByCageIdLoading(this);
    }
    return orElse();
  }
}

abstract class _GetTasksByCageIdLoading implements TaskState {
  const factory _GetTasksByCageIdLoading() = _$GetTasksByCageIdLoadingImpl;
}

/// @nodoc
abstract class _$$GetTasksByCageIdSuccessImplCopyWith<$Res> {
  factory _$$GetTasksByCageIdSuccessImplCopyWith(
          _$GetTasksByCageIdSuccessImpl value,
          $Res Function(_$GetTasksByCageIdSuccessImpl) then) =
      __$$GetTasksByCageIdSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TasksByCageResponse tasks});

  $TasksByCageResponseCopyWith<$Res> get tasks;
}

/// @nodoc
class __$$GetTasksByCageIdSuccessImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$GetTasksByCageIdSuccessImpl>
    implements _$$GetTasksByCageIdSuccessImplCopyWith<$Res> {
  __$$GetTasksByCageIdSuccessImplCopyWithImpl(
      _$GetTasksByCageIdSuccessImpl _value,
      $Res Function(_$GetTasksByCageIdSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$GetTasksByCageIdSuccessImpl(
      null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as TasksByCageResponse,
    ));
  }

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TasksByCageResponseCopyWith<$Res> get tasks {
    return $TasksByCageResponseCopyWith<$Res>(_value.tasks, (value) {
      return _then(_value.copyWith(tasks: value));
    });
  }
}

/// @nodoc

class _$GetTasksByCageIdSuccessImpl implements _GetTasksByCageIdSuccess {
  const _$GetTasksByCageIdSuccessImpl(this.tasks);

  @override
  final TasksByCageResponse tasks;

  @override
  String toString() {
    return 'TaskState.getTasksByCageIdSuccess(tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTasksByCageIdSuccessImpl &&
            (identical(other.tasks, tasks) || other.tasks == tasks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tasks);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTasksByCageIdSuccessImplCopyWith<_$GetTasksByCageIdSuccessImpl>
      get copyWith => __$$GetTasksByCageIdSuccessImplCopyWithImpl<
          _$GetTasksByCageIdSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return getTasksByCageIdSuccess(tasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return getTasksByCageIdSuccess?.call(tasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTasksByCageIdSuccess != null) {
      return getTasksByCageIdSuccess(tasks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return getTasksByCageIdSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return getTasksByCageIdSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTasksByCageIdSuccess != null) {
      return getTasksByCageIdSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetTasksByCageIdSuccess implements TaskState {
  const factory _GetTasksByCageIdSuccess(final TasksByCageResponse tasks) =
      _$GetTasksByCageIdSuccessImpl;

  TasksByCageResponse get tasks;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTasksByCageIdSuccessImplCopyWith<_$GetTasksByCageIdSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetTaskByIdLoadingImplCopyWith<$Res> {
  factory _$$GetTaskByIdLoadingImplCopyWith(_$GetTaskByIdLoadingImpl value,
          $Res Function(_$GetTaskByIdLoadingImpl) then) =
      __$$GetTaskByIdLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetTaskByIdLoadingImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$GetTaskByIdLoadingImpl>
    implements _$$GetTaskByIdLoadingImplCopyWith<$Res> {
  __$$GetTaskByIdLoadingImplCopyWithImpl(_$GetTaskByIdLoadingImpl _value,
      $Res Function(_$GetTaskByIdLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetTaskByIdLoadingImpl implements _GetTaskByIdLoading {
  const _$GetTaskByIdLoadingImpl();

  @override
  String toString() {
    return 'TaskState.getTaskByIdLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetTaskByIdLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return getTaskByIdLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return getTaskByIdLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTaskByIdLoading != null) {
      return getTaskByIdLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return getTaskByIdLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return getTaskByIdLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTaskByIdLoading != null) {
      return getTaskByIdLoading(this);
    }
    return orElse();
  }
}

abstract class _GetTaskByIdLoading implements TaskState {
  const factory _GetTaskByIdLoading() = _$GetTaskByIdLoadingImpl;
}

/// @nodoc
abstract class _$$GetTaskByIdSuccessImplCopyWith<$Res> {
  factory _$$GetTaskByIdSuccessImplCopyWith(_$GetTaskByIdSuccessImpl value,
          $Res Function(_$GetTaskByIdSuccessImpl) then) =
      __$$GetTaskByIdSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Task task});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$GetTaskByIdSuccessImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$GetTaskByIdSuccessImpl>
    implements _$$GetTaskByIdSuccessImplCopyWith<$Res> {
  __$$GetTaskByIdSuccessImplCopyWithImpl(_$GetTaskByIdSuccessImpl _value,
      $Res Function(_$GetTaskByIdSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$GetTaskByIdSuccessImpl(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$GetTaskByIdSuccessImpl implements _GetTaskByIdSuccess {
  const _$GetTaskByIdSuccessImpl(this.task);

  @override
  final Task task;

  @override
  String toString() {
    return 'TaskState.getTaskByIdSuccess(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTaskByIdSuccessImpl &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTaskByIdSuccessImplCopyWith<_$GetTaskByIdSuccessImpl> get copyWith =>
      __$$GetTaskByIdSuccessImplCopyWithImpl<_$GetTaskByIdSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return getTaskByIdSuccess(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return getTaskByIdSuccess?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTaskByIdSuccess != null) {
      return getTaskByIdSuccess(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return getTaskByIdSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return getTaskByIdSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTaskByIdSuccess != null) {
      return getTaskByIdSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetTaskByIdSuccess implements TaskState {
  const factory _GetTaskByIdSuccess(final Task task) = _$GetTaskByIdSuccessImpl;

  Task get task;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTaskByIdSuccessImplCopyWith<_$GetTaskByIdSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetTaskByIdFailureImplCopyWith<$Res> {
  factory _$$GetTaskByIdFailureImplCopyWith(_$GetTaskByIdFailureImpl value,
          $Res Function(_$GetTaskByIdFailureImpl) then) =
      __$$GetTaskByIdFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetTaskByIdFailureImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$GetTaskByIdFailureImpl>
    implements _$$GetTaskByIdFailureImplCopyWith<$Res> {
  __$$GetTaskByIdFailureImplCopyWithImpl(_$GetTaskByIdFailureImpl _value,
      $Res Function(_$GetTaskByIdFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetTaskByIdFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetTaskByIdFailureImpl implements _GetTaskByIdFailure {
  const _$GetTaskByIdFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'TaskState.getTaskByIdFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTaskByIdFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTaskByIdFailureImplCopyWith<_$GetTaskByIdFailureImpl> get copyWith =>
      __$$GetTaskByIdFailureImplCopyWithImpl<_$GetTaskByIdFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return getTaskByIdFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return getTaskByIdFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTaskByIdFailure != null) {
      return getTaskByIdFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return getTaskByIdFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return getTaskByIdFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTaskByIdFailure != null) {
      return getTaskByIdFailure(this);
    }
    return orElse();
  }
}

abstract class _GetTaskByIdFailure implements TaskState {
  const factory _GetTaskByIdFailure(final String error) =
      _$GetTaskByIdFailureImpl;

  String get error;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTaskByIdFailureImplCopyWith<_$GetTaskByIdFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetNextTaskLoadingImplCopyWith<$Res> {
  factory _$$GetNextTaskLoadingImplCopyWith(_$GetNextTaskLoadingImpl value,
          $Res Function(_$GetNextTaskLoadingImpl) then) =
      __$$GetNextTaskLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNextTaskLoadingImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$GetNextTaskLoadingImpl>
    implements _$$GetNextTaskLoadingImplCopyWith<$Res> {
  __$$GetNextTaskLoadingImplCopyWithImpl(_$GetNextTaskLoadingImpl _value,
      $Res Function(_$GetNextTaskLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetNextTaskLoadingImpl implements _GetNextTaskLoading {
  const _$GetNextTaskLoadingImpl();

  @override
  String toString() {
    return 'TaskState.getNextTaskLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetNextTaskLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return getNextTaskLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return getNextTaskLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getNextTaskLoading != null) {
      return getNextTaskLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return getNextTaskLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return getNextTaskLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getNextTaskLoading != null) {
      return getNextTaskLoading(this);
    }
    return orElse();
  }
}

abstract class _GetNextTaskLoading implements TaskState {
  const factory _GetNextTaskLoading() = _$GetNextTaskLoadingImpl;
}

/// @nodoc
abstract class _$$GetNextTaskSuccessImplCopyWith<$Res> {
  factory _$$GetNextTaskSuccessImplCopyWith(_$GetNextTaskSuccessImpl value,
          $Res Function(_$GetNextTaskSuccessImpl) then) =
      __$$GetNextTaskSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NextTask> task});
}

/// @nodoc
class __$$GetNextTaskSuccessImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$GetNextTaskSuccessImpl>
    implements _$$GetNextTaskSuccessImplCopyWith<$Res> {
  __$$GetNextTaskSuccessImplCopyWithImpl(_$GetNextTaskSuccessImpl _value,
      $Res Function(_$GetNextTaskSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$GetNextTaskSuccessImpl(
      null == task
          ? _value._task
          : task // ignore: cast_nullable_to_non_nullable
              as List<NextTask>,
    ));
  }
}

/// @nodoc

class _$GetNextTaskSuccessImpl implements _GetNextTaskSuccess {
  const _$GetNextTaskSuccessImpl(final List<NextTask> task) : _task = task;

  final List<NextTask> _task;
  @override
  List<NextTask> get task {
    if (_task is EqualUnmodifiableListView) return _task;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_task);
  }

  @override
  String toString() {
    return 'TaskState.getNextTaskSuccess(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNextTaskSuccessImpl &&
            const DeepCollectionEquality().equals(other._task, _task));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_task));

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNextTaskSuccessImplCopyWith<_$GetNextTaskSuccessImpl> get copyWith =>
      __$$GetNextTaskSuccessImplCopyWithImpl<_$GetNextTaskSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return getNextTaskSuccess(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return getNextTaskSuccess?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getNextTaskSuccess != null) {
      return getNextTaskSuccess(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return getNextTaskSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return getNextTaskSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getNextTaskSuccess != null) {
      return getNextTaskSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetNextTaskSuccess implements TaskState {
  const factory _GetNextTaskSuccess(final List<NextTask> task) =
      _$GetNextTaskSuccessImpl;

  List<NextTask> get task;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetNextTaskSuccessImplCopyWith<_$GetNextTaskSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetNextTaskFailureImplCopyWith<$Res> {
  factory _$$GetNextTaskFailureImplCopyWith(_$GetNextTaskFailureImpl value,
          $Res Function(_$GetNextTaskFailureImpl) then) =
      __$$GetNextTaskFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetNextTaskFailureImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$GetNextTaskFailureImpl>
    implements _$$GetNextTaskFailureImplCopyWith<$Res> {
  __$$GetNextTaskFailureImplCopyWithImpl(_$GetNextTaskFailureImpl _value,
      $Res Function(_$GetNextTaskFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetNextTaskFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetNextTaskFailureImpl implements _GetNextTaskFailure {
  const _$GetNextTaskFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'TaskState.getNextTaskFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNextTaskFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNextTaskFailureImplCopyWith<_$GetNextTaskFailureImpl> get copyWith =>
      __$$GetNextTaskFailureImplCopyWithImpl<_$GetNextTaskFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return getNextTaskFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return getNextTaskFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getNextTaskFailure != null) {
      return getNextTaskFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return getNextTaskFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return getNextTaskFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getNextTaskFailure != null) {
      return getNextTaskFailure(this);
    }
    return orElse();
  }
}

abstract class _GetNextTaskFailure implements TaskState {
  const factory _GetNextTaskFailure(final String error) =
      _$GetNextTaskFailureImpl;

  String get error;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetNextTaskFailureImplCopyWith<_$GetNextTaskFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetTasksByUserIdAndDateLoadingImplCopyWith<$Res> {
  factory _$$GetTasksByUserIdAndDateLoadingImplCopyWith(
          _$GetTasksByUserIdAndDateLoadingImpl value,
          $Res Function(_$GetTasksByUserIdAndDateLoadingImpl) then) =
      __$$GetTasksByUserIdAndDateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetTasksByUserIdAndDateLoadingImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$GetTasksByUserIdAndDateLoadingImpl>
    implements _$$GetTasksByUserIdAndDateLoadingImplCopyWith<$Res> {
  __$$GetTasksByUserIdAndDateLoadingImplCopyWithImpl(
      _$GetTasksByUserIdAndDateLoadingImpl _value,
      $Res Function(_$GetTasksByUserIdAndDateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetTasksByUserIdAndDateLoadingImpl
    implements _GetTasksByUserIdAndDateLoading {
  const _$GetTasksByUserIdAndDateLoadingImpl();

  @override
  String toString() {
    return 'TaskState.getTasksByUserIdAndDateLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTasksByUserIdAndDateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return getTasksByUserIdAndDateLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return getTasksByUserIdAndDateLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTasksByUserIdAndDateLoading != null) {
      return getTasksByUserIdAndDateLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return getTasksByUserIdAndDateLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return getTasksByUserIdAndDateLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTasksByUserIdAndDateLoading != null) {
      return getTasksByUserIdAndDateLoading(this);
    }
    return orElse();
  }
}

abstract class _GetTasksByUserIdAndDateLoading implements TaskState {
  const factory _GetTasksByUserIdAndDateLoading() =
      _$GetTasksByUserIdAndDateLoadingImpl;
}

/// @nodoc
abstract class _$$GetTasksByUserIdAndDateSuccessImplCopyWith<$Res> {
  factory _$$GetTasksByUserIdAndDateSuccessImplCopyWith(
          _$GetTasksByUserIdAndDateSuccessImpl value,
          $Res Function(_$GetTasksByUserIdAndDateSuccessImpl) then) =
      __$$GetTasksByUserIdAndDateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TaskByUserResponse> tasks});
}

/// @nodoc
class __$$GetTasksByUserIdAndDateSuccessImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$GetTasksByUserIdAndDateSuccessImpl>
    implements _$$GetTasksByUserIdAndDateSuccessImplCopyWith<$Res> {
  __$$GetTasksByUserIdAndDateSuccessImplCopyWithImpl(
      _$GetTasksByUserIdAndDateSuccessImpl _value,
      $Res Function(_$GetTasksByUserIdAndDateSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$GetTasksByUserIdAndDateSuccessImpl(
      null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskByUserResponse>,
    ));
  }
}

/// @nodoc

class _$GetTasksByUserIdAndDateSuccessImpl
    implements _GetTasksByUserIdAndDateSuccess {
  const _$GetTasksByUserIdAndDateSuccessImpl(
      final List<TaskByUserResponse> tasks)
      : _tasks = tasks;

  final List<TaskByUserResponse> _tasks;
  @override
  List<TaskByUserResponse> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TaskState.getTasksByUserIdAndDateSuccess(tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTasksByUserIdAndDateSuccessImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTasksByUserIdAndDateSuccessImplCopyWith<
          _$GetTasksByUserIdAndDateSuccessImpl>
      get copyWith => __$$GetTasksByUserIdAndDateSuccessImplCopyWithImpl<
          _$GetTasksByUserIdAndDateSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return getTasksByUserIdAndDateSuccess(tasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return getTasksByUserIdAndDateSuccess?.call(tasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTasksByUserIdAndDateSuccess != null) {
      return getTasksByUserIdAndDateSuccess(tasks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return getTasksByUserIdAndDateSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return getTasksByUserIdAndDateSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTasksByUserIdAndDateSuccess != null) {
      return getTasksByUserIdAndDateSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetTasksByUserIdAndDateSuccess implements TaskState {
  const factory _GetTasksByUserIdAndDateSuccess(
          final List<TaskByUserResponse> tasks) =
      _$GetTasksByUserIdAndDateSuccessImpl;

  List<TaskByUserResponse> get tasks;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTasksByUserIdAndDateSuccessImplCopyWith<
          _$GetTasksByUserIdAndDateSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetTasksByUserIdAndDateFailureImplCopyWith<$Res> {
  factory _$$GetTasksByUserIdAndDateFailureImplCopyWith(
          _$GetTasksByUserIdAndDateFailureImpl value,
          $Res Function(_$GetTasksByUserIdAndDateFailureImpl) then) =
      __$$GetTasksByUserIdAndDateFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetTasksByUserIdAndDateFailureImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$GetTasksByUserIdAndDateFailureImpl>
    implements _$$GetTasksByUserIdAndDateFailureImplCopyWith<$Res> {
  __$$GetTasksByUserIdAndDateFailureImplCopyWithImpl(
      _$GetTasksByUserIdAndDateFailureImpl _value,
      $Res Function(_$GetTasksByUserIdAndDateFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetTasksByUserIdAndDateFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetTasksByUserIdAndDateFailureImpl
    implements _GetTasksByUserIdAndDateFailure {
  const _$GetTasksByUserIdAndDateFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'TaskState.getTasksByUserIdAndDateFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTasksByUserIdAndDateFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTasksByUserIdAndDateFailureImplCopyWith<
          _$GetTasksByUserIdAndDateFailureImpl>
      get copyWith => __$$GetTasksByUserIdAndDateFailureImplCopyWithImpl<
          _$GetTasksByUserIdAndDateFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return getTasksByUserIdAndDateFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return getTasksByUserIdAndDateFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTasksByUserIdAndDateFailure != null) {
      return getTasksByUserIdAndDateFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return getTasksByUserIdAndDateFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return getTasksByUserIdAndDateFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (getTasksByUserIdAndDateFailure != null) {
      return getTasksByUserIdAndDateFailure(this);
    }
    return orElse();
  }
}

abstract class _GetTasksByUserIdAndDateFailure implements TaskState {
  const factory _GetTasksByUserIdAndDateFailure(final String error) =
      _$GetTasksByUserIdAndDateFailureImpl;

  String get error;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTasksByUserIdAndDateFailureImplCopyWith<
          _$GetTasksByUserIdAndDateFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilteredTaskLoadingImplCopyWith<$Res> {
  factory _$$FilteredTaskLoadingImplCopyWith(_$FilteredTaskLoadingImpl value,
          $Res Function(_$FilteredTaskLoadingImpl) then) =
      __$$FilteredTaskLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FilteredTaskLoadingImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$FilteredTaskLoadingImpl>
    implements _$$FilteredTaskLoadingImplCopyWith<$Res> {
  __$$FilteredTaskLoadingImplCopyWithImpl(_$FilteredTaskLoadingImpl _value,
      $Res Function(_$FilteredTaskLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FilteredTaskLoadingImpl implements _FilteredTaskLoading {
  const _$FilteredTaskLoadingImpl();

  @override
  String toString() {
    return 'TaskState.filteredTaskLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilteredTaskLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return filteredTaskLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return filteredTaskLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (filteredTaskLoading != null) {
      return filteredTaskLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return filteredTaskLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return filteredTaskLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (filteredTaskLoading != null) {
      return filteredTaskLoading(this);
    }
    return orElse();
  }
}

abstract class _FilteredTaskLoading implements TaskState {
  const factory _FilteredTaskLoading() = _$FilteredTaskLoadingImpl;
}

/// @nodoc
abstract class _$$FilteredTasksSuccessImplCopyWith<$Res> {
  factory _$$FilteredTasksSuccessImplCopyWith(_$FilteredTasksSuccessImpl value,
          $Res Function(_$FilteredTasksSuccessImpl) then) =
      __$$FilteredTasksSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TaskByUserResponse> tasks});
}

/// @nodoc
class __$$FilteredTasksSuccessImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$FilteredTasksSuccessImpl>
    implements _$$FilteredTasksSuccessImplCopyWith<$Res> {
  __$$FilteredTasksSuccessImplCopyWithImpl(_$FilteredTasksSuccessImpl _value,
      $Res Function(_$FilteredTasksSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$FilteredTasksSuccessImpl(
      null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskByUserResponse>,
    ));
  }
}

/// @nodoc

class _$FilteredTasksSuccessImpl implements _FilteredTasksSuccess {
  const _$FilteredTasksSuccessImpl(final List<TaskByUserResponse> tasks)
      : _tasks = tasks;

  final List<TaskByUserResponse> _tasks;
  @override
  List<TaskByUserResponse> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TaskState.filteredTasksSuccess(tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilteredTasksSuccessImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilteredTasksSuccessImplCopyWith<_$FilteredTasksSuccessImpl>
      get copyWith =>
          __$$FilteredTasksSuccessImplCopyWithImpl<_$FilteredTasksSuccessImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return filteredTasksSuccess(tasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return filteredTasksSuccess?.call(tasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (filteredTasksSuccess != null) {
      return filteredTasksSuccess(tasks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return filteredTasksSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return filteredTasksSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (filteredTasksSuccess != null) {
      return filteredTasksSuccess(this);
    }
    return orElse();
  }
}

abstract class _FilteredTasksSuccess implements TaskState {
  const factory _FilteredTasksSuccess(final List<TaskByUserResponse> tasks) =
      _$FilteredTasksSuccessImpl;

  List<TaskByUserResponse> get tasks;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilteredTasksSuccessImplCopyWith<_$FilteredTasksSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilteredTasksFailureImplCopyWith<$Res> {
  factory _$$FilteredTasksFailureImplCopyWith(_$FilteredTasksFailureImpl value,
          $Res Function(_$FilteredTasksFailureImpl) then) =
      __$$FilteredTasksFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FilteredTasksFailureImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$FilteredTasksFailureImpl>
    implements _$$FilteredTasksFailureImplCopyWith<$Res> {
  __$$FilteredTasksFailureImplCopyWithImpl(_$FilteredTasksFailureImpl _value,
      $Res Function(_$FilteredTasksFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FilteredTasksFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FilteredTasksFailureImpl implements _FilteredTasksFailure {
  const _$FilteredTasksFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'TaskState.filteredTasksFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilteredTasksFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilteredTasksFailureImplCopyWith<_$FilteredTasksFailureImpl>
      get copyWith =>
          __$$FilteredTasksFailureImplCopyWithImpl<_$FilteredTasksFailureImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return filteredTasksFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return filteredTasksFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (filteredTasksFailure != null) {
      return filteredTasksFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return filteredTasksFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return filteredTasksFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (filteredTasksFailure != null) {
      return filteredTasksFailure(this);
    }
    return orElse();
  }
}

abstract class _FilteredTasksFailure implements TaskState {
  const factory _FilteredTasksFailure(final String error) =
      _$FilteredTasksFailureImpl;

  String get error;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilteredTasksFailureImplCopyWith<_$FilteredTasksFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateStatusTaskLoadingImplCopyWith<$Res> {
  factory _$$UpdateStatusTaskLoadingImplCopyWith(
          _$UpdateStatusTaskLoadingImpl value,
          $Res Function(_$UpdateStatusTaskLoadingImpl) then) =
      __$$UpdateStatusTaskLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateStatusTaskLoadingImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$UpdateStatusTaskLoadingImpl>
    implements _$$UpdateStatusTaskLoadingImplCopyWith<$Res> {
  __$$UpdateStatusTaskLoadingImplCopyWithImpl(
      _$UpdateStatusTaskLoadingImpl _value,
      $Res Function(_$UpdateStatusTaskLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdateStatusTaskLoadingImpl implements _UpdateStatusTaskLoading {
  const _$UpdateStatusTaskLoadingImpl();

  @override
  String toString() {
    return 'TaskState.updateStatusTaskLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStatusTaskLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return updateStatusTaskLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return updateStatusTaskLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (updateStatusTaskLoading != null) {
      return updateStatusTaskLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return updateStatusTaskLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return updateStatusTaskLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (updateStatusTaskLoading != null) {
      return updateStatusTaskLoading(this);
    }
    return orElse();
  }
}

abstract class _UpdateStatusTaskLoading implements TaskState {
  const factory _UpdateStatusTaskLoading() = _$UpdateStatusTaskLoadingImpl;
}

/// @nodoc
abstract class _$$UpdateStatusTaskSuccessImplCopyWith<$Res> {
  factory _$$UpdateStatusTaskSuccessImplCopyWith(
          _$UpdateStatusTaskSuccessImpl value,
          $Res Function(_$UpdateStatusTaskSuccessImpl) then) =
      __$$UpdateStatusTaskSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateStatusTaskSuccessImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$UpdateStatusTaskSuccessImpl>
    implements _$$UpdateStatusTaskSuccessImplCopyWith<$Res> {
  __$$UpdateStatusTaskSuccessImplCopyWithImpl(
      _$UpdateStatusTaskSuccessImpl _value,
      $Res Function(_$UpdateStatusTaskSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdateStatusTaskSuccessImpl implements _UpdateStatusTaskSuccess {
  const _$UpdateStatusTaskSuccessImpl();

  @override
  String toString() {
    return 'TaskState.updateStatusTaskSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStatusTaskSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return updateStatusTaskSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return updateStatusTaskSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (updateStatusTaskSuccess != null) {
      return updateStatusTaskSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return updateStatusTaskSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return updateStatusTaskSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (updateStatusTaskSuccess != null) {
      return updateStatusTaskSuccess(this);
    }
    return orElse();
  }
}

abstract class _UpdateStatusTaskSuccess implements TaskState {
  const factory _UpdateStatusTaskSuccess() = _$UpdateStatusTaskSuccessImpl;
}

/// @nodoc
abstract class _$$UpdateStatusTaskFailureImplCopyWith<$Res> {
  factory _$$UpdateStatusTaskFailureImplCopyWith(
          _$UpdateStatusTaskFailureImpl value,
          $Res Function(_$UpdateStatusTaskFailureImpl) then) =
      __$$UpdateStatusTaskFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$UpdateStatusTaskFailureImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$UpdateStatusTaskFailureImpl>
    implements _$$UpdateStatusTaskFailureImplCopyWith<$Res> {
  __$$UpdateStatusTaskFailureImplCopyWithImpl(
      _$UpdateStatusTaskFailureImpl _value,
      $Res Function(_$UpdateStatusTaskFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$UpdateStatusTaskFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateStatusTaskFailureImpl implements _UpdateStatusTaskFailure {
  const _$UpdateStatusTaskFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'TaskState.updateStatusTaskFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStatusTaskFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateStatusTaskFailureImplCopyWith<_$UpdateStatusTaskFailureImpl>
      get copyWith => __$$UpdateStatusTaskFailureImplCopyWithImpl<
          _$UpdateStatusTaskFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) failure,
    required TResult Function() taskCreated,
    required TResult Function() taskUpdated,
    required TResult Function() taskDeleted,
    required TResult Function(Map<String, dynamic> tasks) getTasksSuccess,
    required TResult Function(String error) getTasksFailure,
    required TResult Function() testConnectSuccess,
    required TResult Function() getTasksByCageIdLoading,
    required TResult Function(TasksByCageResponse tasks)
        getTasksByCageIdSuccess,
    required TResult Function() getTaskByIdLoading,
    required TResult Function(Task task) getTaskByIdSuccess,
    required TResult Function(String error) getTaskByIdFailure,
    required TResult Function() getNextTaskLoading,
    required TResult Function(List<NextTask> task) getNextTaskSuccess,
    required TResult Function(String error) getNextTaskFailure,
    required TResult Function() getTasksByUserIdAndDateLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(String error) getTasksByUserIdAndDateFailure,
    required TResult Function() filteredTaskLoading,
    required TResult Function(List<TaskByUserResponse> tasks)
        filteredTasksSuccess,
    required TResult Function(String error) filteredTasksFailure,
    required TResult Function() updateStatusTaskLoading,
    required TResult Function() updateStatusTaskSuccess,
    required TResult Function(String error) updateStatusTaskFailure,
  }) {
    return updateStatusTaskFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? failure,
    TResult? Function()? taskCreated,
    TResult? Function()? taskUpdated,
    TResult? Function()? taskDeleted,
    TResult? Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult? Function(String error)? getTasksFailure,
    TResult? Function()? testConnectSuccess,
    TResult? Function()? getTasksByCageIdLoading,
    TResult? Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult? Function()? getTaskByIdLoading,
    TResult? Function(Task task)? getTaskByIdSuccess,
    TResult? Function(String error)? getTaskByIdFailure,
    TResult? Function()? getNextTaskLoading,
    TResult? Function(List<NextTask> task)? getNextTaskSuccess,
    TResult? Function(String error)? getNextTaskFailure,
    TResult? Function()? getTasksByUserIdAndDateLoading,
    TResult? Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(String error)? getTasksByUserIdAndDateFailure,
    TResult? Function()? filteredTaskLoading,
    TResult? Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult? Function(String error)? filteredTasksFailure,
    TResult? Function()? updateStatusTaskLoading,
    TResult? Function()? updateStatusTaskSuccess,
    TResult? Function(String error)? updateStatusTaskFailure,
  }) {
    return updateStatusTaskFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? failure,
    TResult Function()? taskCreated,
    TResult Function()? taskUpdated,
    TResult Function()? taskDeleted,
    TResult Function(Map<String, dynamic> tasks)? getTasksSuccess,
    TResult Function(String error)? getTasksFailure,
    TResult Function()? testConnectSuccess,
    TResult Function()? getTasksByCageIdLoading,
    TResult Function(TasksByCageResponse tasks)? getTasksByCageIdSuccess,
    TResult Function()? getTaskByIdLoading,
    TResult Function(Task task)? getTaskByIdSuccess,
    TResult Function(String error)? getTaskByIdFailure,
    TResult Function()? getNextTaskLoading,
    TResult Function(List<NextTask> task)? getNextTaskSuccess,
    TResult Function(String error)? getNextTaskFailure,
    TResult Function()? getTasksByUserIdAndDateLoading,
    TResult Function(List<TaskByUserResponse> tasks)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(String error)? getTasksByUserIdAndDateFailure,
    TResult Function()? filteredTaskLoading,
    TResult Function(List<TaskByUserResponse> tasks)? filteredTasksSuccess,
    TResult Function(String error)? filteredTasksFailure,
    TResult Function()? updateStatusTaskLoading,
    TResult Function()? updateStatusTaskSuccess,
    TResult Function(String error)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (updateStatusTaskFailure != null) {
      return updateStatusTaskFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_TaskCreated value) taskCreated,
    required TResult Function(_TaskUpdated value) taskUpdated,
    required TResult Function(_TaskDeleted value) taskDeleted,
    required TResult Function(_GetTasksSuccess value) getTasksSuccess,
    required TResult Function(_GetTasksFailure value) getTasksFailure,
    required TResult Function(_TestConnectSuccess value) testConnectSuccess,
    required TResult Function(_GetTasksByCageIdLoading value)
        getTasksByCageIdLoading,
    required TResult Function(_GetTasksByCageIdSuccess value)
        getTasksByCageIdSuccess,
    required TResult Function(_GetTaskByIdLoading value) getTaskByIdLoading,
    required TResult Function(_GetTaskByIdSuccess value) getTaskByIdSuccess,
    required TResult Function(_GetTaskByIdFailure value) getTaskByIdFailure,
    required TResult Function(_GetNextTaskLoading value) getNextTaskLoading,
    required TResult Function(_GetNextTaskSuccess value) getNextTaskSuccess,
    required TResult Function(_GetNextTaskFailure value) getNextTaskFailure,
    required TResult Function(_GetTasksByUserIdAndDateLoading value)
        getTasksByUserIdAndDateLoading,
    required TResult Function(_GetTasksByUserIdAndDateSuccess value)
        getTasksByUserIdAndDateSuccess,
    required TResult Function(_GetTasksByUserIdAndDateFailure value)
        getTasksByUserIdAndDateFailure,
    required TResult Function(_FilteredTaskLoading value) filteredTaskLoading,
    required TResult Function(_FilteredTasksSuccess value) filteredTasksSuccess,
    required TResult Function(_FilteredTasksFailure value) filteredTasksFailure,
    required TResult Function(_UpdateStatusTaskLoading value)
        updateStatusTaskLoading,
    required TResult Function(_UpdateStatusTaskSuccess value)
        updateStatusTaskSuccess,
    required TResult Function(_UpdateStatusTaskFailure value)
        updateStatusTaskFailure,
  }) {
    return updateStatusTaskFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_TaskCreated value)? taskCreated,
    TResult? Function(_TaskUpdated value)? taskUpdated,
    TResult? Function(_TaskDeleted value)? taskDeleted,
    TResult? Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult? Function(_GetTasksFailure value)? getTasksFailure,
    TResult? Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult? Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult? Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult? Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult? Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult? Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult? Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult? Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult? Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult? Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult? Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult? Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult? Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult? Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult? Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult? Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult? Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult? Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
  }) {
    return updateStatusTaskFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_TaskCreated value)? taskCreated,
    TResult Function(_TaskUpdated value)? taskUpdated,
    TResult Function(_TaskDeleted value)? taskDeleted,
    TResult Function(_GetTasksSuccess value)? getTasksSuccess,
    TResult Function(_GetTasksFailure value)? getTasksFailure,
    TResult Function(_TestConnectSuccess value)? testConnectSuccess,
    TResult Function(_GetTasksByCageIdLoading value)? getTasksByCageIdLoading,
    TResult Function(_GetTasksByCageIdSuccess value)? getTasksByCageIdSuccess,
    TResult Function(_GetTaskByIdLoading value)? getTaskByIdLoading,
    TResult Function(_GetTaskByIdSuccess value)? getTaskByIdSuccess,
    TResult Function(_GetTaskByIdFailure value)? getTaskByIdFailure,
    TResult Function(_GetNextTaskLoading value)? getNextTaskLoading,
    TResult Function(_GetNextTaskSuccess value)? getNextTaskSuccess,
    TResult Function(_GetNextTaskFailure value)? getNextTaskFailure,
    TResult Function(_GetTasksByUserIdAndDateLoading value)?
        getTasksByUserIdAndDateLoading,
    TResult Function(_GetTasksByUserIdAndDateSuccess value)?
        getTasksByUserIdAndDateSuccess,
    TResult Function(_GetTasksByUserIdAndDateFailure value)?
        getTasksByUserIdAndDateFailure,
    TResult Function(_FilteredTaskLoading value)? filteredTaskLoading,
    TResult Function(_FilteredTasksSuccess value)? filteredTasksSuccess,
    TResult Function(_FilteredTasksFailure value)? filteredTasksFailure,
    TResult Function(_UpdateStatusTaskLoading value)? updateStatusTaskLoading,
    TResult Function(_UpdateStatusTaskSuccess value)? updateStatusTaskSuccess,
    TResult Function(_UpdateStatusTaskFailure value)? updateStatusTaskFailure,
    required TResult orElse(),
  }) {
    if (updateStatusTaskFailure != null) {
      return updateStatusTaskFailure(this);
    }
    return orElse();
  }
}

abstract class _UpdateStatusTaskFailure implements TaskState {
  const factory _UpdateStatusTaskFailure(final String error) =
      _$UpdateStatusTaskFailureImpl;

  String get error;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateStatusTaskFailureImplCopyWith<_$UpdateStatusTaskFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
