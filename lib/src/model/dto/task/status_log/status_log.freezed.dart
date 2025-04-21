// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StatusLog _$StatusLogFromJson(Map<String, dynamic> json) {
  return _StatusLog.fromJson(json);
}

/// @nodoc
mixin _$StatusLog {
  String get status => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this StatusLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatusLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusLogCopyWith<StatusLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusLogCopyWith<$Res> {
  factory $StatusLogCopyWith(StatusLog value, $Res Function(StatusLog) then) =
      _$StatusLogCopyWithImpl<$Res, StatusLog>;
  @useResult
  $Res call({String status, String updatedAt});
}

/// @nodoc
class _$StatusLogCopyWithImpl<$Res, $Val extends StatusLog>
    implements $StatusLogCopyWith<$Res> {
  _$StatusLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusLogImplCopyWith<$Res>
    implements $StatusLogCopyWith<$Res> {
  factory _$$StatusLogImplCopyWith(
          _$StatusLogImpl value, $Res Function(_$StatusLogImpl) then) =
      __$$StatusLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String updatedAt});
}

/// @nodoc
class __$$StatusLogImplCopyWithImpl<$Res>
    extends _$StatusLogCopyWithImpl<$Res, _$StatusLogImpl>
    implements _$$StatusLogImplCopyWith<$Res> {
  __$$StatusLogImplCopyWithImpl(
      _$StatusLogImpl _value, $Res Function(_$StatusLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatusLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? updatedAt = null,
  }) {
    return _then(_$StatusLogImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusLogImpl implements _StatusLog {
  _$StatusLogImpl({required this.status, required this.updatedAt});

  factory _$StatusLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusLogImplFromJson(json);

  @override
  final String status;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'StatusLog(status: $status, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusLogImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, updatedAt);

  /// Create a copy of StatusLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusLogImplCopyWith<_$StatusLogImpl> get copyWith =>
      __$$StatusLogImplCopyWithImpl<_$StatusLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusLogImplToJson(
      this,
    );
  }
}

abstract class _StatusLog implements StatusLog {
  factory _StatusLog(
      {required final String status,
      required final String updatedAt}) = _$StatusLogImpl;

  factory _StatusLog.fromJson(Map<String, dynamic> json) =
      _$StatusLogImpl.fromJson;

  @override
  String get status;
  @override
  String get updatedAt;

  /// Create a copy of StatusLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusLogImplCopyWith<_$StatusLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
