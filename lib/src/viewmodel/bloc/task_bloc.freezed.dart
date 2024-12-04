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
    required TResult Function(String task) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String task)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String task)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateTask value)? createTask,
    TResult? Function(_UpdateTask value)? updateTask,
    TResult? Function(_DeleteTask value)? deleteTask,
    TResult? Function(_GetTasks value)? getTasks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateTask value)? createTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    TResult Function(_GetTasks value)? getTasks,
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
    required TResult Function(String task) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String task)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String task)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
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
    required TResult Function(String task) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
  }) {
    return createTask(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String task)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
  }) {
    return createTask?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String task)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
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
  $Res call({String task});
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
    Object? task = null,
  }) {
    return _then(_$UpdateTaskImpl(
      null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateTaskImpl implements _UpdateTask {
  const _$UpdateTaskImpl(this.task);

  @override
  final String task;

  @override
  String toString() {
    return 'TaskEvent.updateTask(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTaskImpl &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

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
    required TResult Function(String task) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
  }) {
    return updateTask(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String task)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
  }) {
    return updateTask?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String task)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
    required TResult orElse(),
  }) {
    if (updateTask != null) {
      return updateTask(task);
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
    required TResult orElse(),
  }) {
    if (updateTask != null) {
      return updateTask(this);
    }
    return orElse();
  }
}

abstract class _UpdateTask implements TaskEvent {
  const factory _UpdateTask(final String task) = _$UpdateTaskImpl;

  String get task;

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
    required TResult Function(String task) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
  }) {
    return deleteTask(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String task)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
  }) {
    return deleteTask?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String task)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
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
    required TResult Function(String task) updateTask,
    required TResult Function(String taskId) deleteTask,
    required TResult Function() getTasks,
  }) {
    return getTasks();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String task)? createTask,
    TResult? Function(String task)? updateTask,
    TResult? Function(String taskId)? deleteTask,
    TResult? Function()? getTasks,
  }) {
    return getTasks?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String task)? createTask,
    TResult Function(String task)? updateTask,
    TResult Function(String taskId)? deleteTask,
    TResult Function()? getTasks,
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
