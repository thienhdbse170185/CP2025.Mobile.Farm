// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vaccine_schedule_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VaccineScheduleRequest _$VaccineScheduleRequestFromJson(
    Map<String, dynamic> json) {
  return _VaccineScheduleRequest.fromJson(json);
}

/// @nodoc
mixin _$VaccineScheduleRequest {
  String get stageId => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this VaccineScheduleRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VaccineScheduleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaccineScheduleRequestCopyWith<VaccineScheduleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineScheduleRequestCopyWith<$Res> {
  factory $VaccineScheduleRequestCopyWith(VaccineScheduleRequest value,
          $Res Function(VaccineScheduleRequest) then) =
      _$VaccineScheduleRequestCopyWithImpl<$Res, VaccineScheduleRequest>;
  @useResult
  $Res call({String stageId, String? date, String status});
}

/// @nodoc
class _$VaccineScheduleRequestCopyWithImpl<$Res,
        $Val extends VaccineScheduleRequest>
    implements $VaccineScheduleRequestCopyWith<$Res> {
  _$VaccineScheduleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaccineScheduleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stageId = null,
    Object? date = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      stageId: null == stageId
          ? _value.stageId
          : stageId // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VaccineScheduleRequestImplCopyWith<$Res>
    implements $VaccineScheduleRequestCopyWith<$Res> {
  factory _$$VaccineScheduleRequestImplCopyWith(
          _$VaccineScheduleRequestImpl value,
          $Res Function(_$VaccineScheduleRequestImpl) then) =
      __$$VaccineScheduleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String stageId, String? date, String status});
}

/// @nodoc
class __$$VaccineScheduleRequestImplCopyWithImpl<$Res>
    extends _$VaccineScheduleRequestCopyWithImpl<$Res,
        _$VaccineScheduleRequestImpl>
    implements _$$VaccineScheduleRequestImplCopyWith<$Res> {
  __$$VaccineScheduleRequestImplCopyWithImpl(
      _$VaccineScheduleRequestImpl _value,
      $Res Function(_$VaccineScheduleRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of VaccineScheduleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stageId = null,
    Object? date = freezed,
    Object? status = null,
  }) {
    return _then(_$VaccineScheduleRequestImpl(
      stageId: null == stageId
          ? _value.stageId
          : stageId // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VaccineScheduleRequestImpl implements _VaccineScheduleRequest {
  const _$VaccineScheduleRequestImpl(
      {required this.stageId, required this.date, required this.status});

  factory _$VaccineScheduleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VaccineScheduleRequestImplFromJson(json);

  @override
  final String stageId;
  @override
  final String? date;
  @override
  final String status;

  @override
  String toString() {
    return 'VaccineScheduleRequest(stageId: $stageId, date: $date, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaccineScheduleRequestImpl &&
            (identical(other.stageId, stageId) || other.stageId == stageId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, stageId, date, status);

  /// Create a copy of VaccineScheduleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaccineScheduleRequestImplCopyWith<_$VaccineScheduleRequestImpl>
      get copyWith => __$$VaccineScheduleRequestImplCopyWithImpl<
          _$VaccineScheduleRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaccineScheduleRequestImplToJson(
      this,
    );
  }
}

abstract class _VaccineScheduleRequest implements VaccineScheduleRequest {
  const factory _VaccineScheduleRequest(
      {required final String stageId,
      required final String? date,
      required final String status}) = _$VaccineScheduleRequestImpl;

  factory _VaccineScheduleRequest.fromJson(Map<String, dynamic> json) =
      _$VaccineScheduleRequestImpl.fromJson;

  @override
  String get stageId;
  @override
  String? get date;
  @override
  String get status;

  /// Create a copy of VaccineScheduleRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaccineScheduleRequestImplCopyWith<_$VaccineScheduleRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
