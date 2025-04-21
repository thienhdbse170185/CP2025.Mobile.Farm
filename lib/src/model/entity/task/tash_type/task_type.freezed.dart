// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskType _$TaskTypeFromJson(Map<String, dynamic> json) {
  return _TaskType.fromJson(json);
}

/// @nodoc
mixin _$TaskType {
  String get taskTypeId => throw _privateConstructorUsedError;
  String get taskTypeName => throw _privateConstructorUsedError;

  /// Serializes this TaskType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskTypeCopyWith<TaskType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskTypeCopyWith<$Res> {
  factory $TaskTypeCopyWith(TaskType value, $Res Function(TaskType) then) =
      _$TaskTypeCopyWithImpl<$Res, TaskType>;
  @useResult
  $Res call({String taskTypeId, String taskTypeName});
}

/// @nodoc
class _$TaskTypeCopyWithImpl<$Res, $Val extends TaskType>
    implements $TaskTypeCopyWith<$Res> {
  _$TaskTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskTypeId = null,
    Object? taskTypeName = null,
  }) {
    return _then(_value.copyWith(
      taskTypeId: null == taskTypeId
          ? _value.taskTypeId
          : taskTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      taskTypeName: null == taskTypeName
          ? _value.taskTypeName
          : taskTypeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskTypeImplCopyWith<$Res>
    implements $TaskTypeCopyWith<$Res> {
  factory _$$TaskTypeImplCopyWith(
          _$TaskTypeImpl value, $Res Function(_$TaskTypeImpl) then) =
      __$$TaskTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String taskTypeId, String taskTypeName});
}

/// @nodoc
class __$$TaskTypeImplCopyWithImpl<$Res>
    extends _$TaskTypeCopyWithImpl<$Res, _$TaskTypeImpl>
    implements _$$TaskTypeImplCopyWith<$Res> {
  __$$TaskTypeImplCopyWithImpl(
      _$TaskTypeImpl _value, $Res Function(_$TaskTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskTypeId = null,
    Object? taskTypeName = null,
  }) {
    return _then(_$TaskTypeImpl(
      taskTypeId: null == taskTypeId
          ? _value.taskTypeId
          : taskTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      taskTypeName: null == taskTypeName
          ? _value.taskTypeName
          : taskTypeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskTypeImpl implements _TaskType {
  const _$TaskTypeImpl({required this.taskTypeId, required this.taskTypeName});

  factory _$TaskTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskTypeImplFromJson(json);

  @override
  final String taskTypeId;
  @override
  final String taskTypeName;

  @override
  String toString() {
    return 'TaskType(taskTypeId: $taskTypeId, taskTypeName: $taskTypeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskTypeImpl &&
            (identical(other.taskTypeId, taskTypeId) ||
                other.taskTypeId == taskTypeId) &&
            (identical(other.taskTypeName, taskTypeName) ||
                other.taskTypeName == taskTypeName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, taskTypeId, taskTypeName);

  /// Create a copy of TaskType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskTypeImplCopyWith<_$TaskTypeImpl> get copyWith =>
      __$$TaskTypeImplCopyWithImpl<_$TaskTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskTypeImplToJson(
      this,
    );
  }
}

abstract class _TaskType implements TaskType {
  const factory _TaskType(
      {required final String taskTypeId,
      required final String taskTypeName}) = _$TaskTypeImpl;

  factory _TaskType.fromJson(Map<String, dynamic> json) =
      _$TaskTypeImpl.fromJson;

  @override
  String get taskTypeId;
  @override
  String get taskTypeName;

  /// Create a copy of TaskType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskTypeImplCopyWith<_$TaskTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
