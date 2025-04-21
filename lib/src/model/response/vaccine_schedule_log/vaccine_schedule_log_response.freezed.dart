// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vaccine_schedule_log_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VaccineScheduleLogResponse _$VaccineScheduleLogResponseFromJson(
    Map<String, dynamic> json) {
  return _VaccineScheduleLogResponse.fromJson(json);
}

/// @nodoc
mixin _$VaccineScheduleLogResponse {
  bool get success => throw _privateConstructorUsedError;
  VaccineScheduleLogDto get result => throw _privateConstructorUsedError;

  /// Serializes this VaccineScheduleLogResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VaccineScheduleLogResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaccineScheduleLogResponseCopyWith<VaccineScheduleLogResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineScheduleLogResponseCopyWith<$Res> {
  factory $VaccineScheduleLogResponseCopyWith(VaccineScheduleLogResponse value,
          $Res Function(VaccineScheduleLogResponse) then) =
      _$VaccineScheduleLogResponseCopyWithImpl<$Res,
          VaccineScheduleLogResponse>;
  @useResult
  $Res call({bool success, VaccineScheduleLogDto result});

  $VaccineScheduleLogDtoCopyWith<$Res> get result;
}

/// @nodoc
class _$VaccineScheduleLogResponseCopyWithImpl<$Res,
        $Val extends VaccineScheduleLogResponse>
    implements $VaccineScheduleLogResponseCopyWith<$Res> {
  _$VaccineScheduleLogResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaccineScheduleLogResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as VaccineScheduleLogDto,
    ) as $Val);
  }

  /// Create a copy of VaccineScheduleLogResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VaccineScheduleLogDtoCopyWith<$Res> get result {
    return $VaccineScheduleLogDtoCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VaccineScheduleLogResponseImplCopyWith<$Res>
    implements $VaccineScheduleLogResponseCopyWith<$Res> {
  factory _$$VaccineScheduleLogResponseImplCopyWith(
          _$VaccineScheduleLogResponseImpl value,
          $Res Function(_$VaccineScheduleLogResponseImpl) then) =
      __$$VaccineScheduleLogResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, VaccineScheduleLogDto result});

  @override
  $VaccineScheduleLogDtoCopyWith<$Res> get result;
}

/// @nodoc
class __$$VaccineScheduleLogResponseImplCopyWithImpl<$Res>
    extends _$VaccineScheduleLogResponseCopyWithImpl<$Res,
        _$VaccineScheduleLogResponseImpl>
    implements _$$VaccineScheduleLogResponseImplCopyWith<$Res> {
  __$$VaccineScheduleLogResponseImplCopyWithImpl(
      _$VaccineScheduleLogResponseImpl _value,
      $Res Function(_$VaccineScheduleLogResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VaccineScheduleLogResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? result = null,
  }) {
    return _then(_$VaccineScheduleLogResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as VaccineScheduleLogDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VaccineScheduleLogResponseImpl implements _VaccineScheduleLogResponse {
  const _$VaccineScheduleLogResponseImpl(
      {required this.success, required this.result});

  factory _$VaccineScheduleLogResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VaccineScheduleLogResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final VaccineScheduleLogDto result;

  @override
  String toString() {
    return 'VaccineScheduleLogResponse(success: $success, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaccineScheduleLogResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, result);

  /// Create a copy of VaccineScheduleLogResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaccineScheduleLogResponseImplCopyWith<_$VaccineScheduleLogResponseImpl>
      get copyWith => __$$VaccineScheduleLogResponseImplCopyWithImpl<
          _$VaccineScheduleLogResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaccineScheduleLogResponseImplToJson(
      this,
    );
  }
}

abstract class _VaccineScheduleLogResponse
    implements VaccineScheduleLogResponse {
  const factory _VaccineScheduleLogResponse(
          {required final bool success,
          required final VaccineScheduleLogDto result}) =
      _$VaccineScheduleLogResponseImpl;

  factory _VaccineScheduleLogResponse.fromJson(Map<String, dynamic> json) =
      _$VaccineScheduleLogResponseImpl.fromJson;

  @override
  bool get success;
  @override
  VaccineScheduleLogDto get result;

  /// Create a copy of VaccineScheduleLogResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaccineScheduleLogResponseImplCopyWith<_$VaccineScheduleLogResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
