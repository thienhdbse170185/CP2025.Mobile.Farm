// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vaccine_schedule_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VaccineScheduleResponse _$VaccineScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return _VaccineScheduleResponse.fromJson(json);
}

/// @nodoc
mixin _$VaccineScheduleResponse {
  bool get success => throw _privateConstructorUsedError;
  List<VaccineScheduleDto> get result => throw _privateConstructorUsedError;

  /// Serializes this VaccineScheduleResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VaccineScheduleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaccineScheduleResponseCopyWith<VaccineScheduleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineScheduleResponseCopyWith<$Res> {
  factory $VaccineScheduleResponseCopyWith(VaccineScheduleResponse value,
          $Res Function(VaccineScheduleResponse) then) =
      _$VaccineScheduleResponseCopyWithImpl<$Res, VaccineScheduleResponse>;
  @useResult
  $Res call({bool success, List<VaccineScheduleDto> result});
}

/// @nodoc
class _$VaccineScheduleResponseCopyWithImpl<$Res,
        $Val extends VaccineScheduleResponse>
    implements $VaccineScheduleResponseCopyWith<$Res> {
  _$VaccineScheduleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaccineScheduleResponse
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
              as List<VaccineScheduleDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VaccineScheduleResponseImplCopyWith<$Res>
    implements $VaccineScheduleResponseCopyWith<$Res> {
  factory _$$VaccineScheduleResponseImplCopyWith(
          _$VaccineScheduleResponseImpl value,
          $Res Function(_$VaccineScheduleResponseImpl) then) =
      __$$VaccineScheduleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<VaccineScheduleDto> result});
}

/// @nodoc
class __$$VaccineScheduleResponseImplCopyWithImpl<$Res>
    extends _$VaccineScheduleResponseCopyWithImpl<$Res,
        _$VaccineScheduleResponseImpl>
    implements _$$VaccineScheduleResponseImplCopyWith<$Res> {
  __$$VaccineScheduleResponseImplCopyWithImpl(
      _$VaccineScheduleResponseImpl _value,
      $Res Function(_$VaccineScheduleResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VaccineScheduleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? result = null,
  }) {
    return _then(_$VaccineScheduleResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<VaccineScheduleDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VaccineScheduleResponseImpl implements _VaccineScheduleResponse {
  const _$VaccineScheduleResponseImpl(
      {required this.success, required final List<VaccineScheduleDto> result})
      : _result = result;

  factory _$VaccineScheduleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VaccineScheduleResponseImplFromJson(json);

  @override
  final bool success;
  final List<VaccineScheduleDto> _result;
  @override
  List<VaccineScheduleDto> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'VaccineScheduleResponse(success: $success, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaccineScheduleResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, const DeepCollectionEquality().hash(_result));

  /// Create a copy of VaccineScheduleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaccineScheduleResponseImplCopyWith<_$VaccineScheduleResponseImpl>
      get copyWith => __$$VaccineScheduleResponseImplCopyWithImpl<
          _$VaccineScheduleResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaccineScheduleResponseImplToJson(
      this,
    );
  }
}

abstract class _VaccineScheduleResponse implements VaccineScheduleResponse {
  const factory _VaccineScheduleResponse(
          {required final bool success,
          required final List<VaccineScheduleDto> result}) =
      _$VaccineScheduleResponseImpl;

  factory _VaccineScheduleResponse.fromJson(Map<String, dynamic> json) =
      _$VaccineScheduleResponseImpl.fromJson;

  @override
  bool get success;
  @override
  List<VaccineScheduleDto> get result;

  /// Create a copy of VaccineScheduleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaccineScheduleResponseImplCopyWith<_$VaccineScheduleResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
