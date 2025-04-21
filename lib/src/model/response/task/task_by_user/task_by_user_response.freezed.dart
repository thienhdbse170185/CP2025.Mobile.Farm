// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_by_user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskByUserResponse _$TaskByUserResponseFromJson(Map<String, dynamic> json) {
  return _TaskByUserResponse.fromJson(json);
}

/// @nodoc
mixin _$TaskByUserResponse {
  String get sessionName => throw _privateConstructorUsedError;
  List<CageDto> get cages => throw _privateConstructorUsedError;

  /// Serializes this TaskByUserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskByUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskByUserResponseCopyWith<TaskByUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskByUserResponseCopyWith<$Res> {
  factory $TaskByUserResponseCopyWith(
          TaskByUserResponse value, $Res Function(TaskByUserResponse) then) =
      _$TaskByUserResponseCopyWithImpl<$Res, TaskByUserResponse>;
  @useResult
  $Res call({String sessionName, List<CageDto> cages});
}

/// @nodoc
class _$TaskByUserResponseCopyWithImpl<$Res, $Val extends TaskByUserResponse>
    implements $TaskByUserResponseCopyWith<$Res> {
  _$TaskByUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskByUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionName = null,
    Object? cages = null,
  }) {
    return _then(_value.copyWith(
      sessionName: null == sessionName
          ? _value.sessionName
          : sessionName // ignore: cast_nullable_to_non_nullable
              as String,
      cages: null == cages
          ? _value.cages
          : cages // ignore: cast_nullable_to_non_nullable
              as List<CageDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskByUserResponseImplCopyWith<$Res>
    implements $TaskByUserResponseCopyWith<$Res> {
  factory _$$TaskByUserResponseImplCopyWith(_$TaskByUserResponseImpl value,
          $Res Function(_$TaskByUserResponseImpl) then) =
      __$$TaskByUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sessionName, List<CageDto> cages});
}

/// @nodoc
class __$$TaskByUserResponseImplCopyWithImpl<$Res>
    extends _$TaskByUserResponseCopyWithImpl<$Res, _$TaskByUserResponseImpl>
    implements _$$TaskByUserResponseImplCopyWith<$Res> {
  __$$TaskByUserResponseImplCopyWithImpl(_$TaskByUserResponseImpl _value,
      $Res Function(_$TaskByUserResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskByUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionName = null,
    Object? cages = null,
  }) {
    return _then(_$TaskByUserResponseImpl(
      sessionName: null == sessionName
          ? _value.sessionName
          : sessionName // ignore: cast_nullable_to_non_nullable
              as String,
      cages: null == cages
          ? _value._cages
          : cages // ignore: cast_nullable_to_non_nullable
              as List<CageDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskByUserResponseImpl implements _TaskByUserResponse {
  const _$TaskByUserResponseImpl(
      {required this.sessionName, required final List<CageDto> cages})
      : _cages = cages;

  factory _$TaskByUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskByUserResponseImplFromJson(json);

  @override
  final String sessionName;
  final List<CageDto> _cages;
  @override
  List<CageDto> get cages {
    if (_cages is EqualUnmodifiableListView) return _cages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cages);
  }

  @override
  String toString() {
    return 'TaskByUserResponse(sessionName: $sessionName, cages: $cages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskByUserResponseImpl &&
            (identical(other.sessionName, sessionName) ||
                other.sessionName == sessionName) &&
            const DeepCollectionEquality().equals(other._cages, _cages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, sessionName, const DeepCollectionEquality().hash(_cages));

  /// Create a copy of TaskByUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskByUserResponseImplCopyWith<_$TaskByUserResponseImpl> get copyWith =>
      __$$TaskByUserResponseImplCopyWithImpl<_$TaskByUserResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskByUserResponseImplToJson(
      this,
    );
  }
}

abstract class _TaskByUserResponse implements TaskByUserResponse {
  const factory _TaskByUserResponse(
      {required final String sessionName,
      required final List<CageDto> cages}) = _$TaskByUserResponseImpl;

  factory _TaskByUserResponse.fromJson(Map<String, dynamic> json) =
      _$TaskByUserResponseImpl.fromJson;

  @override
  String get sessionName;
  @override
  List<CageDto> get cages;

  /// Create a copy of TaskByUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskByUserResponseImplCopyWith<_$TaskByUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
