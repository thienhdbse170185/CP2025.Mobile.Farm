// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_vaccine_log_cubit_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateVaccineLogCubitParams _$CreateVaccineLogCubitParamsFromJson(
    Map<String, dynamic> json) {
  return _CreateVaccineLogCubitParams.fromJson(json);
}

/// @nodoc
mixin _$CreateVaccineLogCubitParams {
  VaccineScheduleLogRequest get vaccineScheduleLogRequest =>
      throw _privateConstructorUsedError;
  bool get afterSymptomReport => throw _privateConstructorUsedError;

  /// Serializes this CreateVaccineLogCubitParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateVaccineLogCubitParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateVaccineLogCubitParamsCopyWith<CreateVaccineLogCubitParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateVaccineLogCubitParamsCopyWith<$Res> {
  factory $CreateVaccineLogCubitParamsCopyWith(
          CreateVaccineLogCubitParams value,
          $Res Function(CreateVaccineLogCubitParams) then) =
      _$CreateVaccineLogCubitParamsCopyWithImpl<$Res,
          CreateVaccineLogCubitParams>;
  @useResult
  $Res call(
      {VaccineScheduleLogRequest vaccineScheduleLogRequest,
      bool afterSymptomReport});

  $VaccineScheduleLogRequestCopyWith<$Res> get vaccineScheduleLogRequest;
}

/// @nodoc
class _$CreateVaccineLogCubitParamsCopyWithImpl<$Res,
        $Val extends CreateVaccineLogCubitParams>
    implements $CreateVaccineLogCubitParamsCopyWith<$Res> {
  _$CreateVaccineLogCubitParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateVaccineLogCubitParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vaccineScheduleLogRequest = null,
    Object? afterSymptomReport = null,
  }) {
    return _then(_value.copyWith(
      vaccineScheduleLogRequest: null == vaccineScheduleLogRequest
          ? _value.vaccineScheduleLogRequest
          : vaccineScheduleLogRequest // ignore: cast_nullable_to_non_nullable
              as VaccineScheduleLogRequest,
      afterSymptomReport: null == afterSymptomReport
          ? _value.afterSymptomReport
          : afterSymptomReport // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of CreateVaccineLogCubitParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VaccineScheduleLogRequestCopyWith<$Res> get vaccineScheduleLogRequest {
    return $VaccineScheduleLogRequestCopyWith<$Res>(
        _value.vaccineScheduleLogRequest, (value) {
      return _then(_value.copyWith(vaccineScheduleLogRequest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateVaccineLogCubitParamsImplCopyWith<$Res>
    implements $CreateVaccineLogCubitParamsCopyWith<$Res> {
  factory _$$CreateVaccineLogCubitParamsImplCopyWith(
          _$CreateVaccineLogCubitParamsImpl value,
          $Res Function(_$CreateVaccineLogCubitParamsImpl) then) =
      __$$CreateVaccineLogCubitParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {VaccineScheduleLogRequest vaccineScheduleLogRequest,
      bool afterSymptomReport});

  @override
  $VaccineScheduleLogRequestCopyWith<$Res> get vaccineScheduleLogRequest;
}

/// @nodoc
class __$$CreateVaccineLogCubitParamsImplCopyWithImpl<$Res>
    extends _$CreateVaccineLogCubitParamsCopyWithImpl<$Res,
        _$CreateVaccineLogCubitParamsImpl>
    implements _$$CreateVaccineLogCubitParamsImplCopyWith<$Res> {
  __$$CreateVaccineLogCubitParamsImplCopyWithImpl(
      _$CreateVaccineLogCubitParamsImpl _value,
      $Res Function(_$CreateVaccineLogCubitParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateVaccineLogCubitParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vaccineScheduleLogRequest = null,
    Object? afterSymptomReport = null,
  }) {
    return _then(_$CreateVaccineLogCubitParamsImpl(
      vaccineScheduleLogRequest: null == vaccineScheduleLogRequest
          ? _value.vaccineScheduleLogRequest
          : vaccineScheduleLogRequest // ignore: cast_nullable_to_non_nullable
              as VaccineScheduleLogRequest,
      afterSymptomReport: null == afterSymptomReport
          ? _value.afterSymptomReport
          : afterSymptomReport // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateVaccineLogCubitParamsImpl
    implements _CreateVaccineLogCubitParams {
  _$CreateVaccineLogCubitParamsImpl(
      {required this.vaccineScheduleLogRequest,
      required this.afterSymptomReport});

  factory _$CreateVaccineLogCubitParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateVaccineLogCubitParamsImplFromJson(json);

  @override
  final VaccineScheduleLogRequest vaccineScheduleLogRequest;
  @override
  final bool afterSymptomReport;

  @override
  String toString() {
    return 'CreateVaccineLogCubitParams(vaccineScheduleLogRequest: $vaccineScheduleLogRequest, afterSymptomReport: $afterSymptomReport)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateVaccineLogCubitParamsImpl &&
            (identical(other.vaccineScheduleLogRequest,
                    vaccineScheduleLogRequest) ||
                other.vaccineScheduleLogRequest == vaccineScheduleLogRequest) &&
            (identical(other.afterSymptomReport, afterSymptomReport) ||
                other.afterSymptomReport == afterSymptomReport));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, vaccineScheduleLogRequest, afterSymptomReport);

  /// Create a copy of CreateVaccineLogCubitParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateVaccineLogCubitParamsImplCopyWith<_$CreateVaccineLogCubitParamsImpl>
      get copyWith => __$$CreateVaccineLogCubitParamsImplCopyWithImpl<
          _$CreateVaccineLogCubitParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateVaccineLogCubitParamsImplToJson(
      this,
    );
  }
}

abstract class _CreateVaccineLogCubitParams
    implements CreateVaccineLogCubitParams {
  factory _CreateVaccineLogCubitParams(
          {required final VaccineScheduleLogRequest vaccineScheduleLogRequest,
          required final bool afterSymptomReport}) =
      _$CreateVaccineLogCubitParamsImpl;

  factory _CreateVaccineLogCubitParams.fromJson(Map<String, dynamic> json) =
      _$CreateVaccineLogCubitParamsImpl.fromJson;

  @override
  VaccineScheduleLogRequest get vaccineScheduleLogRequest;
  @override
  bool get afterSymptomReport;

  /// Create a copy of CreateVaccineLogCubitParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateVaccineLogCubitParamsImplCopyWith<_$CreateVaccineLogCubitParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
