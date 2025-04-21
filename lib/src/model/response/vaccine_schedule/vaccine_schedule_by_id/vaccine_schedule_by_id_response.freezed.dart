// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vaccine_schedule_by_id_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VaccineScheduleByIdResponse _$VaccineScheduleByIdResponseFromJson(
    Map<String, dynamic> json) {
  return _VaccineScheduleByIdResponse.fromJson(json);
}

/// @nodoc
mixin _$VaccineScheduleByIdResponse {
  bool get success => throw _privateConstructorUsedError;
  VaccineScheduleDto get result => throw _privateConstructorUsedError;

  /// Serializes this VaccineScheduleByIdResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VaccineScheduleByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaccineScheduleByIdResponseCopyWith<VaccineScheduleByIdResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineScheduleByIdResponseCopyWith<$Res> {
  factory $VaccineScheduleByIdResponseCopyWith(
          VaccineScheduleByIdResponse value,
          $Res Function(VaccineScheduleByIdResponse) then) =
      _$VaccineScheduleByIdResponseCopyWithImpl<$Res,
          VaccineScheduleByIdResponse>;
  @useResult
  $Res call({bool success, VaccineScheduleDto result});

  $VaccineScheduleDtoCopyWith<$Res> get result;
}

/// @nodoc
class _$VaccineScheduleByIdResponseCopyWithImpl<$Res,
        $Val extends VaccineScheduleByIdResponse>
    implements $VaccineScheduleByIdResponseCopyWith<$Res> {
  _$VaccineScheduleByIdResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaccineScheduleByIdResponse
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
              as VaccineScheduleDto,
    ) as $Val);
  }

  /// Create a copy of VaccineScheduleByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VaccineScheduleDtoCopyWith<$Res> get result {
    return $VaccineScheduleDtoCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VaccineScheduleByIdResponseImplCopyWith<$Res>
    implements $VaccineScheduleByIdResponseCopyWith<$Res> {
  factory _$$VaccineScheduleByIdResponseImplCopyWith(
          _$VaccineScheduleByIdResponseImpl value,
          $Res Function(_$VaccineScheduleByIdResponseImpl) then) =
      __$$VaccineScheduleByIdResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, VaccineScheduleDto result});

  @override
  $VaccineScheduleDtoCopyWith<$Res> get result;
}

/// @nodoc
class __$$VaccineScheduleByIdResponseImplCopyWithImpl<$Res>
    extends _$VaccineScheduleByIdResponseCopyWithImpl<$Res,
        _$VaccineScheduleByIdResponseImpl>
    implements _$$VaccineScheduleByIdResponseImplCopyWith<$Res> {
  __$$VaccineScheduleByIdResponseImplCopyWithImpl(
      _$VaccineScheduleByIdResponseImpl _value,
      $Res Function(_$VaccineScheduleByIdResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VaccineScheduleByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? result = null,
  }) {
    return _then(_$VaccineScheduleByIdResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as VaccineScheduleDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VaccineScheduleByIdResponseImpl
    implements _VaccineScheduleByIdResponse {
  const _$VaccineScheduleByIdResponseImpl(
      {required this.success, required this.result});

  factory _$VaccineScheduleByIdResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VaccineScheduleByIdResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final VaccineScheduleDto result;

  @override
  String toString() {
    return 'VaccineScheduleByIdResponse(success: $success, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaccineScheduleByIdResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, result);

  /// Create a copy of VaccineScheduleByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaccineScheduleByIdResponseImplCopyWith<_$VaccineScheduleByIdResponseImpl>
      get copyWith => __$$VaccineScheduleByIdResponseImplCopyWithImpl<
          _$VaccineScheduleByIdResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaccineScheduleByIdResponseImplToJson(
      this,
    );
  }
}

abstract class _VaccineScheduleByIdResponse
    implements VaccineScheduleByIdResponse {
  const factory _VaccineScheduleByIdResponse(
          {required final bool success,
          required final VaccineScheduleDto result}) =
      _$VaccineScheduleByIdResponseImpl;

  factory _VaccineScheduleByIdResponse.fromJson(Map<String, dynamic> json) =
      _$VaccineScheduleByIdResponseImpl.fromJson;

  @override
  bool get success;
  @override
  VaccineScheduleDto get result;

  /// Create a copy of VaccineScheduleByIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaccineScheduleByIdResponseImplCopyWith<_$VaccineScheduleByIdResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
