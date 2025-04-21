// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_weight_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateWeightRequest _$UpdateWeightRequestFromJson(Map<String, dynamic> json) {
  return _UpdateWeightRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateWeightRequest {
  String get growthStageId => throw _privateConstructorUsedError;
  double get weightAnimal => throw _privateConstructorUsedError;
  String get taskId => throw _privateConstructorUsedError;

  /// Serializes this UpdateWeightRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateWeightRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateWeightRequestCopyWith<UpdateWeightRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateWeightRequestCopyWith<$Res> {
  factory $UpdateWeightRequestCopyWith(
          UpdateWeightRequest value, $Res Function(UpdateWeightRequest) then) =
      _$UpdateWeightRequestCopyWithImpl<$Res, UpdateWeightRequest>;
  @useResult
  $Res call({String growthStageId, double weightAnimal, String taskId});
}

/// @nodoc
class _$UpdateWeightRequestCopyWithImpl<$Res, $Val extends UpdateWeightRequest>
    implements $UpdateWeightRequestCopyWith<$Res> {
  _$UpdateWeightRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateWeightRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? growthStageId = null,
    Object? weightAnimal = null,
    Object? taskId = null,
  }) {
    return _then(_value.copyWith(
      growthStageId: null == growthStageId
          ? _value.growthStageId
          : growthStageId // ignore: cast_nullable_to_non_nullable
              as String,
      weightAnimal: null == weightAnimal
          ? _value.weightAnimal
          : weightAnimal // ignore: cast_nullable_to_non_nullable
              as double,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateWeightRequestImplCopyWith<$Res>
    implements $UpdateWeightRequestCopyWith<$Res> {
  factory _$$UpdateWeightRequestImplCopyWith(_$UpdateWeightRequestImpl value,
          $Res Function(_$UpdateWeightRequestImpl) then) =
      __$$UpdateWeightRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String growthStageId, double weightAnimal, String taskId});
}

/// @nodoc
class __$$UpdateWeightRequestImplCopyWithImpl<$Res>
    extends _$UpdateWeightRequestCopyWithImpl<$Res, _$UpdateWeightRequestImpl>
    implements _$$UpdateWeightRequestImplCopyWith<$Res> {
  __$$UpdateWeightRequestImplCopyWithImpl(_$UpdateWeightRequestImpl _value,
      $Res Function(_$UpdateWeightRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateWeightRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? growthStageId = null,
    Object? weightAnimal = null,
    Object? taskId = null,
  }) {
    return _then(_$UpdateWeightRequestImpl(
      growthStageId: null == growthStageId
          ? _value.growthStageId
          : growthStageId // ignore: cast_nullable_to_non_nullable
              as String,
      weightAnimal: null == weightAnimal
          ? _value.weightAnimal
          : weightAnimal // ignore: cast_nullable_to_non_nullable
              as double,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateWeightRequestImpl implements _UpdateWeightRequest {
  const _$UpdateWeightRequestImpl(
      {required this.growthStageId,
      required this.weightAnimal,
      required this.taskId});

  factory _$UpdateWeightRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateWeightRequestImplFromJson(json);

  @override
  final String growthStageId;
  @override
  final double weightAnimal;
  @override
  final String taskId;

  @override
  String toString() {
    return 'UpdateWeightRequest(growthStageId: $growthStageId, weightAnimal: $weightAnimal, taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateWeightRequestImpl &&
            (identical(other.growthStageId, growthStageId) ||
                other.growthStageId == growthStageId) &&
            (identical(other.weightAnimal, weightAnimal) ||
                other.weightAnimal == weightAnimal) &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, growthStageId, weightAnimal, taskId);

  /// Create a copy of UpdateWeightRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateWeightRequestImplCopyWith<_$UpdateWeightRequestImpl> get copyWith =>
      __$$UpdateWeightRequestImplCopyWithImpl<_$UpdateWeightRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateWeightRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateWeightRequest implements UpdateWeightRequest {
  const factory _UpdateWeightRequest(
      {required final String growthStageId,
      required final double weightAnimal,
      required final String taskId}) = _$UpdateWeightRequestImpl;

  factory _UpdateWeightRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateWeightRequestImpl.fromJson;

  @override
  String get growthStageId;
  @override
  double get weightAnimal;
  @override
  String get taskId;

  /// Create a copy of UpdateWeightRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateWeightRequestImplCopyWith<_$UpdateWeightRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
