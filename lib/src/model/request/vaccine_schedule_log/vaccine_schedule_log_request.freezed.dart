// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vaccine_schedule_log_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VaccineScheduleLogRequest _$VaccineScheduleLogRequestFromJson(
    Map<String, dynamic> json) {
  return _VaccineScheduleLogRequest.fromJson(json);
}

/// @nodoc
mixin _$VaccineScheduleLogRequest {
  String get date => throw _privateConstructorUsedError;
  int get session => throw _privateConstructorUsedError;
  String get vaccineId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;
  String get taskId => throw _privateConstructorUsedError;

  /// Serializes this VaccineScheduleLogRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VaccineScheduleLogRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaccineScheduleLogRequestCopyWith<VaccineScheduleLogRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineScheduleLogRequestCopyWith<$Res> {
  factory $VaccineScheduleLogRequestCopyWith(VaccineScheduleLogRequest value,
          $Res Function(VaccineScheduleLogRequest) then) =
      _$VaccineScheduleLogRequestCopyWithImpl<$Res, VaccineScheduleLogRequest>;
  @useResult
  $Res call(
      {String date,
      int session,
      String vaccineId,
      int quantity,
      String notes,
      String photo,
      String taskId});
}

/// @nodoc
class _$VaccineScheduleLogRequestCopyWithImpl<$Res,
        $Val extends VaccineScheduleLogRequest>
    implements $VaccineScheduleLogRequestCopyWith<$Res> {
  _$VaccineScheduleLogRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaccineScheduleLogRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? session = null,
    Object? vaccineId = null,
    Object? quantity = null,
    Object? notes = null,
    Object? photo = null,
    Object? taskId = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as int,
      vaccineId: null == vaccineId
          ? _value.vaccineId
          : vaccineId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$VaccineScheduleLogRequestImplCopyWith<$Res>
    implements $VaccineScheduleLogRequestCopyWith<$Res> {
  factory _$$VaccineScheduleLogRequestImplCopyWith(
          _$VaccineScheduleLogRequestImpl value,
          $Res Function(_$VaccineScheduleLogRequestImpl) then) =
      __$$VaccineScheduleLogRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      int session,
      String vaccineId,
      int quantity,
      String notes,
      String photo,
      String taskId});
}

/// @nodoc
class __$$VaccineScheduleLogRequestImplCopyWithImpl<$Res>
    extends _$VaccineScheduleLogRequestCopyWithImpl<$Res,
        _$VaccineScheduleLogRequestImpl>
    implements _$$VaccineScheduleLogRequestImplCopyWith<$Res> {
  __$$VaccineScheduleLogRequestImplCopyWithImpl(
      _$VaccineScheduleLogRequestImpl _value,
      $Res Function(_$VaccineScheduleLogRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of VaccineScheduleLogRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? session = null,
    Object? vaccineId = null,
    Object? quantity = null,
    Object? notes = null,
    Object? photo = null,
    Object? taskId = null,
  }) {
    return _then(_$VaccineScheduleLogRequestImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as int,
      vaccineId: null == vaccineId
          ? _value.vaccineId
          : vaccineId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$VaccineScheduleLogRequestImpl implements _VaccineScheduleLogRequest {
  const _$VaccineScheduleLogRequestImpl(
      {required this.date,
      required this.session,
      required this.vaccineId,
      required this.quantity,
      required this.notes,
      required this.photo,
      required this.taskId});

  factory _$VaccineScheduleLogRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VaccineScheduleLogRequestImplFromJson(json);

  @override
  final String date;
  @override
  final int session;
  @override
  final String vaccineId;
  @override
  final int quantity;
  @override
  final String notes;
  @override
  final String photo;
  @override
  final String taskId;

  @override
  String toString() {
    return 'VaccineScheduleLogRequest(date: $date, session: $session, vaccineId: $vaccineId, quantity: $quantity, notes: $notes, photo: $photo, taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaccineScheduleLogRequestImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.vaccineId, vaccineId) ||
                other.vaccineId == vaccineId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, session, vaccineId, quantity, notes, photo, taskId);

  /// Create a copy of VaccineScheduleLogRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaccineScheduleLogRequestImplCopyWith<_$VaccineScheduleLogRequestImpl>
      get copyWith => __$$VaccineScheduleLogRequestImplCopyWithImpl<
          _$VaccineScheduleLogRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaccineScheduleLogRequestImplToJson(
      this,
    );
  }
}

abstract class _VaccineScheduleLogRequest implements VaccineScheduleLogRequest {
  const factory _VaccineScheduleLogRequest(
      {required final String date,
      required final int session,
      required final String vaccineId,
      required final int quantity,
      required final String notes,
      required final String photo,
      required final String taskId}) = _$VaccineScheduleLogRequestImpl;

  factory _VaccineScheduleLogRequest.fromJson(Map<String, dynamic> json) =
      _$VaccineScheduleLogRequestImpl.fromJson;

  @override
  String get date;
  @override
  int get session;
  @override
  String get vaccineId;
  @override
  int get quantity;
  @override
  String get notes;
  @override
  String get photo;
  @override
  String get taskId;

  /// Create a copy of VaccineScheduleLogRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaccineScheduleLogRequestImplCopyWith<_$VaccineScheduleLogRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
