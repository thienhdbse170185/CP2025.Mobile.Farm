// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_food_log_cubit_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateFoodLogCubitParams _$CreateFoodLogCubitParamsFromJson(
    Map<String, dynamic> json) {
  return _CreateFoodLogCubitParams.fromJson(json);
}

/// @nodoc
mixin _$CreateFoodLogCubitParams {
  String get cageId => throw _privateConstructorUsedError;
  DailyFoodUsageLogDto get log => throw _privateConstructorUsedError;
  bool get afterSymptomReport => throw _privateConstructorUsedError;

  /// Serializes this CreateFoodLogCubitParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateFoodLogCubitParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateFoodLogCubitParamsCopyWith<CreateFoodLogCubitParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateFoodLogCubitParamsCopyWith<$Res> {
  factory $CreateFoodLogCubitParamsCopyWith(CreateFoodLogCubitParams value,
          $Res Function(CreateFoodLogCubitParams) then) =
      _$CreateFoodLogCubitParamsCopyWithImpl<$Res, CreateFoodLogCubitParams>;
  @useResult
  $Res call({String cageId, DailyFoodUsageLogDto log, bool afterSymptomReport});

  $DailyFoodUsageLogDtoCopyWith<$Res> get log;
}

/// @nodoc
class _$CreateFoodLogCubitParamsCopyWithImpl<$Res,
        $Val extends CreateFoodLogCubitParams>
    implements $CreateFoodLogCubitParamsCopyWith<$Res> {
  _$CreateFoodLogCubitParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateFoodLogCubitParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cageId = null,
    Object? log = null,
    Object? afterSymptomReport = null,
  }) {
    return _then(_value.copyWith(
      cageId: null == cageId
          ? _value.cageId
          : cageId // ignore: cast_nullable_to_non_nullable
              as String,
      log: null == log
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as DailyFoodUsageLogDto,
      afterSymptomReport: null == afterSymptomReport
          ? _value.afterSymptomReport
          : afterSymptomReport // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of CreateFoodLogCubitParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyFoodUsageLogDtoCopyWith<$Res> get log {
    return $DailyFoodUsageLogDtoCopyWith<$Res>(_value.log, (value) {
      return _then(_value.copyWith(log: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateFoodLogCubitParamsImplCopyWith<$Res>
    implements $CreateFoodLogCubitParamsCopyWith<$Res> {
  factory _$$CreateFoodLogCubitParamsImplCopyWith(
          _$CreateFoodLogCubitParamsImpl value,
          $Res Function(_$CreateFoodLogCubitParamsImpl) then) =
      __$$CreateFoodLogCubitParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cageId, DailyFoodUsageLogDto log, bool afterSymptomReport});

  @override
  $DailyFoodUsageLogDtoCopyWith<$Res> get log;
}

/// @nodoc
class __$$CreateFoodLogCubitParamsImplCopyWithImpl<$Res>
    extends _$CreateFoodLogCubitParamsCopyWithImpl<$Res,
        _$CreateFoodLogCubitParamsImpl>
    implements _$$CreateFoodLogCubitParamsImplCopyWith<$Res> {
  __$$CreateFoodLogCubitParamsImplCopyWithImpl(
      _$CreateFoodLogCubitParamsImpl _value,
      $Res Function(_$CreateFoodLogCubitParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateFoodLogCubitParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cageId = null,
    Object? log = null,
    Object? afterSymptomReport = null,
  }) {
    return _then(_$CreateFoodLogCubitParamsImpl(
      cageId: null == cageId
          ? _value.cageId
          : cageId // ignore: cast_nullable_to_non_nullable
              as String,
      log: null == log
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as DailyFoodUsageLogDto,
      afterSymptomReport: null == afterSymptomReport
          ? _value.afterSymptomReport
          : afterSymptomReport // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFoodLogCubitParamsImpl implements _CreateFoodLogCubitParams {
  _$CreateFoodLogCubitParamsImpl(
      {required this.cageId,
      required this.log,
      required this.afterSymptomReport});

  factory _$CreateFoodLogCubitParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateFoodLogCubitParamsImplFromJson(json);

  @override
  final String cageId;
  @override
  final DailyFoodUsageLogDto log;
  @override
  final bool afterSymptomReport;

  @override
  String toString() {
    return 'CreateFoodLogCubitParams(cageId: $cageId, log: $log, afterSymptomReport: $afterSymptomReport)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFoodLogCubitParamsImpl &&
            (identical(other.cageId, cageId) || other.cageId == cageId) &&
            (identical(other.log, log) || other.log == log) &&
            (identical(other.afterSymptomReport, afterSymptomReport) ||
                other.afterSymptomReport == afterSymptomReport));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cageId, log, afterSymptomReport);

  /// Create a copy of CreateFoodLogCubitParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFoodLogCubitParamsImplCopyWith<_$CreateFoodLogCubitParamsImpl>
      get copyWith => __$$CreateFoodLogCubitParamsImplCopyWithImpl<
          _$CreateFoodLogCubitParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFoodLogCubitParamsImplToJson(
      this,
    );
  }
}

abstract class _CreateFoodLogCubitParams implements CreateFoodLogCubitParams {
  factory _CreateFoodLogCubitParams(
      {required final String cageId,
      required final DailyFoodUsageLogDto log,
      required final bool afterSymptomReport}) = _$CreateFoodLogCubitParamsImpl;

  factory _CreateFoodLogCubitParams.fromJson(Map<String, dynamic> json) =
      _$CreateFoodLogCubitParamsImpl.fromJson;

  @override
  String get cageId;
  @override
  DailyFoodUsageLogDto get log;
  @override
  bool get afterSymptomReport;

  /// Create a copy of CreateFoodLogCubitParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFoodLogCubitParamsImplCopyWith<_$CreateFoodLogCubitParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
