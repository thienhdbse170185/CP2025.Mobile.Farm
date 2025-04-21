// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'egg_harvest_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EggHarvestRequest _$EggHarvestRequestFromJson(Map<String, dynamic> json) {
  return _EggHarvestRequest.fromJson(json);
}

/// @nodoc
mixin _$EggHarvestRequest {
  String get growthStageId => throw _privateConstructorUsedError;
  int get eggCount => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  String get taskId => throw _privateConstructorUsedError;

  /// Serializes this EggHarvestRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EggHarvestRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EggHarvestRequestCopyWith<EggHarvestRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EggHarvestRequestCopyWith<$Res> {
  factory $EggHarvestRequestCopyWith(
          EggHarvestRequest value, $Res Function(EggHarvestRequest) then) =
      _$EggHarvestRequestCopyWithImpl<$Res, EggHarvestRequest>;
  @useResult
  $Res call({String growthStageId, int eggCount, String notes, String taskId});
}

/// @nodoc
class _$EggHarvestRequestCopyWithImpl<$Res, $Val extends EggHarvestRequest>
    implements $EggHarvestRequestCopyWith<$Res> {
  _$EggHarvestRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EggHarvestRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? growthStageId = null,
    Object? eggCount = null,
    Object? notes = null,
    Object? taskId = null,
  }) {
    return _then(_value.copyWith(
      growthStageId: null == growthStageId
          ? _value.growthStageId
          : growthStageId // ignore: cast_nullable_to_non_nullable
              as String,
      eggCount: null == eggCount
          ? _value.eggCount
          : eggCount // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EggHarvestRequestImplCopyWith<$Res>
    implements $EggHarvestRequestCopyWith<$Res> {
  factory _$$EggHarvestRequestImplCopyWith(_$EggHarvestRequestImpl value,
          $Res Function(_$EggHarvestRequestImpl) then) =
      __$$EggHarvestRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String growthStageId, int eggCount, String notes, String taskId});
}

/// @nodoc
class __$$EggHarvestRequestImplCopyWithImpl<$Res>
    extends _$EggHarvestRequestCopyWithImpl<$Res, _$EggHarvestRequestImpl>
    implements _$$EggHarvestRequestImplCopyWith<$Res> {
  __$$EggHarvestRequestImplCopyWithImpl(_$EggHarvestRequestImpl _value,
      $Res Function(_$EggHarvestRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of EggHarvestRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? growthStageId = null,
    Object? eggCount = null,
    Object? notes = null,
    Object? taskId = null,
  }) {
    return _then(_$EggHarvestRequestImpl(
      growthStageId: null == growthStageId
          ? _value.growthStageId
          : growthStageId // ignore: cast_nullable_to_non_nullable
              as String,
      eggCount: null == eggCount
          ? _value.eggCount
          : eggCount // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
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
class _$EggHarvestRequestImpl implements _EggHarvestRequest {
  _$EggHarvestRequestImpl(
      {required this.growthStageId,
      required this.eggCount,
      required this.notes,
      required this.taskId});

  factory _$EggHarvestRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$EggHarvestRequestImplFromJson(json);

  @override
  final String growthStageId;
  @override
  final int eggCount;
  @override
  final String notes;
  @override
  final String taskId;

  @override
  String toString() {
    return 'EggHarvestRequest(growthStageId: $growthStageId, eggCount: $eggCount, notes: $notes, taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EggHarvestRequestImpl &&
            (identical(other.growthStageId, growthStageId) ||
                other.growthStageId == growthStageId) &&
            (identical(other.eggCount, eggCount) ||
                other.eggCount == eggCount) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, growthStageId, eggCount, notes, taskId);

  /// Create a copy of EggHarvestRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EggHarvestRequestImplCopyWith<_$EggHarvestRequestImpl> get copyWith =>
      __$$EggHarvestRequestImplCopyWithImpl<_$EggHarvestRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EggHarvestRequestImplToJson(
      this,
    );
  }
}

abstract class _EggHarvestRequest implements EggHarvestRequest {
  factory _EggHarvestRequest(
      {required final String growthStageId,
      required final int eggCount,
      required final String notes,
      required final String taskId}) = _$EggHarvestRequestImpl;

  factory _EggHarvestRequest.fromJson(Map<String, dynamic> json) =
      _$EggHarvestRequestImpl.fromJson;

  @override
  String get growthStageId;
  @override
  int get eggCount;
  @override
  String get notes;
  @override
  String get taskId;

  /// Create a copy of EggHarvestRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EggHarvestRequestImplCopyWith<_$EggHarvestRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
