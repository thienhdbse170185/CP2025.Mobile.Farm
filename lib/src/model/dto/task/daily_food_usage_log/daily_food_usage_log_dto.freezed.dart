// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_food_usage_log_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyFoodUsageLogDto _$DailyFoodUsageLogDtoFromJson(Map<String, dynamic> json) {
  return _DailyFoodUsageLogDto.fromJson(json);
}

/// @nodoc
mixin _$DailyFoodUsageLogDto {
  int get recommendedWeight => throw _privateConstructorUsedError;
  int get actualWeight => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  DateTime get logTime => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;
  String get taskId => throw _privateConstructorUsedError;

  /// Serializes this DailyFoodUsageLogDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyFoodUsageLogDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyFoodUsageLogDtoCopyWith<DailyFoodUsageLogDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyFoodUsageLogDtoCopyWith<$Res> {
  factory $DailyFoodUsageLogDtoCopyWith(DailyFoodUsageLogDto value,
          $Res Function(DailyFoodUsageLogDto) then) =
      _$DailyFoodUsageLogDtoCopyWithImpl<$Res, DailyFoodUsageLogDto>;
  @useResult
  $Res call(
      {int recommendedWeight,
      int actualWeight,
      String notes,
      DateTime logTime,
      String photo,
      String taskId});
}

/// @nodoc
class _$DailyFoodUsageLogDtoCopyWithImpl<$Res,
        $Val extends DailyFoodUsageLogDto>
    implements $DailyFoodUsageLogDtoCopyWith<$Res> {
  _$DailyFoodUsageLogDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyFoodUsageLogDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendedWeight = null,
    Object? actualWeight = null,
    Object? notes = null,
    Object? logTime = null,
    Object? photo = null,
    Object? taskId = null,
  }) {
    return _then(_value.copyWith(
      recommendedWeight: null == recommendedWeight
          ? _value.recommendedWeight
          : recommendedWeight // ignore: cast_nullable_to_non_nullable
              as int,
      actualWeight: null == actualWeight
          ? _value.actualWeight
          : actualWeight // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      logTime: null == logTime
          ? _value.logTime
          : logTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyFoodUsageLogDtoImplCopyWith<$Res>
    implements $DailyFoodUsageLogDtoCopyWith<$Res> {
  factory _$$DailyFoodUsageLogDtoImplCopyWith(_$DailyFoodUsageLogDtoImpl value,
          $Res Function(_$DailyFoodUsageLogDtoImpl) then) =
      __$$DailyFoodUsageLogDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int recommendedWeight,
      int actualWeight,
      String notes,
      DateTime logTime,
      String photo,
      String taskId});
}

/// @nodoc
class __$$DailyFoodUsageLogDtoImplCopyWithImpl<$Res>
    extends _$DailyFoodUsageLogDtoCopyWithImpl<$Res, _$DailyFoodUsageLogDtoImpl>
    implements _$$DailyFoodUsageLogDtoImplCopyWith<$Res> {
  __$$DailyFoodUsageLogDtoImplCopyWithImpl(_$DailyFoodUsageLogDtoImpl _value,
      $Res Function(_$DailyFoodUsageLogDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyFoodUsageLogDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendedWeight = null,
    Object? actualWeight = null,
    Object? notes = null,
    Object? logTime = null,
    Object? photo = null,
    Object? taskId = null,
  }) {
    return _then(_$DailyFoodUsageLogDtoImpl(
      recommendedWeight: null == recommendedWeight
          ? _value.recommendedWeight
          : recommendedWeight // ignore: cast_nullable_to_non_nullable
              as int,
      actualWeight: null == actualWeight
          ? _value.actualWeight
          : actualWeight // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      logTime: null == logTime
          ? _value.logTime
          : logTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyFoodUsageLogDtoImpl implements _DailyFoodUsageLogDto {
  const _$DailyFoodUsageLogDtoImpl(
      {required this.recommendedWeight,
      required this.actualWeight,
      required this.notes,
      required this.logTime,
      required this.photo,
      required this.taskId});

  factory _$DailyFoodUsageLogDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyFoodUsageLogDtoImplFromJson(json);

  @override
  final int recommendedWeight;
  @override
  final int actualWeight;
  @override
  final String notes;
  @override
  final DateTime logTime;
  @override
  final String photo;
  @override
  final String taskId;

  @override
  String toString() {
    return 'DailyFoodUsageLogDto(recommendedWeight: $recommendedWeight, actualWeight: $actualWeight, notes: $notes, logTime: $logTime, photo: $photo, taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyFoodUsageLogDtoImpl &&
            (identical(other.recommendedWeight, recommendedWeight) ||
                other.recommendedWeight == recommendedWeight) &&
            (identical(other.actualWeight, actualWeight) ||
                other.actualWeight == actualWeight) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.logTime, logTime) || other.logTime == logTime) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, recommendedWeight, actualWeight,
      notes, logTime, photo, taskId);

  /// Create a copy of DailyFoodUsageLogDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyFoodUsageLogDtoImplCopyWith<_$DailyFoodUsageLogDtoImpl>
      get copyWith =>
          __$$DailyFoodUsageLogDtoImplCopyWithImpl<_$DailyFoodUsageLogDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyFoodUsageLogDtoImplToJson(
      this,
    );
  }
}

abstract class _DailyFoodUsageLogDto implements DailyFoodUsageLogDto {
  const factory _DailyFoodUsageLogDto(
      {required final int recommendedWeight,
      required final int actualWeight,
      required final String notes,
      required final DateTime logTime,
      required final String photo,
      required final String taskId}) = _$DailyFoodUsageLogDtoImpl;

  factory _DailyFoodUsageLogDto.fromJson(Map<String, dynamic> json) =
      _$DailyFoodUsageLogDtoImpl.fromJson;

  @override
  int get recommendedWeight;
  @override
  int get actualWeight;
  @override
  String get notes;
  @override
  DateTime get logTime;
  @override
  String get photo;
  @override
  String get taskId;

  /// Create a copy of DailyFoodUsageLogDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyFoodUsageLogDtoImplCopyWith<_$DailyFoodUsageLogDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
