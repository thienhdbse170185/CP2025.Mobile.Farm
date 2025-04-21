// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_by_id_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskByIdResponse _$TaskByIdResponseFromJson(Map<String, dynamic> json) {
  return _TaskByIdResponse.fromJson(json);
}

/// @nodoc
mixin _$TaskByIdResponse {
  Task get task => throw _privateConstructorUsedError;

  /// Serializes this TaskByIdResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskByIdResponseCopyWith<TaskByIdResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskByIdResponseCopyWith<$Res> {
  factory $TaskByIdResponseCopyWith(
          TaskByIdResponse value, $Res Function(TaskByIdResponse) then) =
      _$TaskByIdResponseCopyWithImpl<$Res, TaskByIdResponse>;
  @useResult
  $Res call({Task task});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class _$TaskByIdResponseCopyWithImpl<$Res, $Val extends TaskByIdResponse>
    implements $TaskByIdResponseCopyWith<$Res> {
  _$TaskByIdResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_value.copyWith(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ) as $Val);
  }

  /// Create a copy of TaskByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskByIdResponseImplCopyWith<$Res>
    implements $TaskByIdResponseCopyWith<$Res> {
  factory _$$TaskByIdResponseImplCopyWith(_$TaskByIdResponseImpl value,
          $Res Function(_$TaskByIdResponseImpl) then) =
      __$$TaskByIdResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Task task});

  @override
  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$TaskByIdResponseImplCopyWithImpl<$Res>
    extends _$TaskByIdResponseCopyWithImpl<$Res, _$TaskByIdResponseImpl>
    implements _$$TaskByIdResponseImplCopyWith<$Res> {
  __$$TaskByIdResponseImplCopyWithImpl(_$TaskByIdResponseImpl _value,
      $Res Function(_$TaskByIdResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = null,
  }) {
    return _then(_$TaskByIdResponseImpl(
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskByIdResponseImpl implements _TaskByIdResponse {
  const _$TaskByIdResponseImpl({required this.task});

  factory _$TaskByIdResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskByIdResponseImplFromJson(json);

  @override
  final Task task;

  @override
  String toString() {
    return 'TaskByIdResponse(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskByIdResponseImpl &&
            (identical(other.task, task) || other.task == task));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, task);

  /// Create a copy of TaskByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskByIdResponseImplCopyWith<_$TaskByIdResponseImpl> get copyWith =>
      __$$TaskByIdResponseImplCopyWithImpl<_$TaskByIdResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskByIdResponseImplToJson(
      this,
    );
  }
}

abstract class _TaskByIdResponse implements TaskByIdResponse {
  const factory _TaskByIdResponse({required final Task task}) =
      _$TaskByIdResponseImpl;

  factory _TaskByIdResponse.fromJson(Map<String, dynamic> json) =
      _$TaskByIdResponseImpl.fromJson;

  @override
  Task get task;

  /// Create a copy of TaskByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskByIdResponseImplCopyWith<_$TaskByIdResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
