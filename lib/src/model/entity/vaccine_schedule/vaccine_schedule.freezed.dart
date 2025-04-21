// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vaccine_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VaccineSchedule _$VaccineScheduleFromJson(Map<String, dynamic> json) {
  return _VaccineSchedule.fromJson(json);
}

/// @nodoc
mixin _$VaccineSchedule {
  String get id => throw _privateConstructorUsedError;
  String get vaccineId => throw _privateConstructorUsedError;
  String get stageId => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get applicationAge => throw _privateConstructorUsedError;

  /// Serializes this VaccineSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VaccineSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaccineScheduleCopyWith<VaccineSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineScheduleCopyWith<$Res> {
  factory $VaccineScheduleCopyWith(
          VaccineSchedule value, $Res Function(VaccineSchedule) then) =
      _$VaccineScheduleCopyWithImpl<$Res, VaccineSchedule>;
  @useResult
  $Res call(
      {String id,
      String vaccineId,
      String stageId,
      DateTime? date,
      int quantity,
      String status,
      int applicationAge});
}

/// @nodoc
class _$VaccineScheduleCopyWithImpl<$Res, $Val extends VaccineSchedule>
    implements $VaccineScheduleCopyWith<$Res> {
  _$VaccineScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaccineSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vaccineId = null,
    Object? stageId = null,
    Object? date = freezed,
    Object? quantity = null,
    Object? status = null,
    Object? applicationAge = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vaccineId: null == vaccineId
          ? _value.vaccineId
          : vaccineId // ignore: cast_nullable_to_non_nullable
              as String,
      stageId: null == stageId
          ? _value.stageId
          : stageId // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      applicationAge: null == applicationAge
          ? _value.applicationAge
          : applicationAge // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VaccineScheduleImplCopyWith<$Res>
    implements $VaccineScheduleCopyWith<$Res> {
  factory _$$VaccineScheduleImplCopyWith(_$VaccineScheduleImpl value,
          $Res Function(_$VaccineScheduleImpl) then) =
      __$$VaccineScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String vaccineId,
      String stageId,
      DateTime? date,
      int quantity,
      String status,
      int applicationAge});
}

/// @nodoc
class __$$VaccineScheduleImplCopyWithImpl<$Res>
    extends _$VaccineScheduleCopyWithImpl<$Res, _$VaccineScheduleImpl>
    implements _$$VaccineScheduleImplCopyWith<$Res> {
  __$$VaccineScheduleImplCopyWithImpl(
      _$VaccineScheduleImpl _value, $Res Function(_$VaccineScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of VaccineSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vaccineId = null,
    Object? stageId = null,
    Object? date = freezed,
    Object? quantity = null,
    Object? status = null,
    Object? applicationAge = null,
  }) {
    return _then(_$VaccineScheduleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vaccineId: null == vaccineId
          ? _value.vaccineId
          : vaccineId // ignore: cast_nullable_to_non_nullable
              as String,
      stageId: null == stageId
          ? _value.stageId
          : stageId // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      applicationAge: null == applicationAge
          ? _value.applicationAge
          : applicationAge // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VaccineScheduleImpl implements _VaccineSchedule {
  const _$VaccineScheduleImpl(
      {required this.id,
      required this.vaccineId,
      required this.stageId,
      required this.date,
      required this.quantity,
      required this.status,
      required this.applicationAge});

  factory _$VaccineScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$VaccineScheduleImplFromJson(json);

  @override
  final String id;
  @override
  final String vaccineId;
  @override
  final String stageId;
  @override
  final DateTime? date;
  @override
  final int quantity;
  @override
  final String status;
  @override
  final int applicationAge;

  @override
  String toString() {
    return 'VaccineSchedule(id: $id, vaccineId: $vaccineId, stageId: $stageId, date: $date, quantity: $quantity, status: $status, applicationAge: $applicationAge)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaccineScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vaccineId, vaccineId) ||
                other.vaccineId == vaccineId) &&
            (identical(other.stageId, stageId) || other.stageId == stageId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.applicationAge, applicationAge) ||
                other.applicationAge == applicationAge));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, vaccineId, stageId, date,
      quantity, status, applicationAge);

  /// Create a copy of VaccineSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaccineScheduleImplCopyWith<_$VaccineScheduleImpl> get copyWith =>
      __$$VaccineScheduleImplCopyWithImpl<_$VaccineScheduleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaccineScheduleImplToJson(
      this,
    );
  }
}

abstract class _VaccineSchedule implements VaccineSchedule {
  const factory _VaccineSchedule(
      {required final String id,
      required final String vaccineId,
      required final String stageId,
      required final DateTime? date,
      required final int quantity,
      required final String status,
      required final int applicationAge}) = _$VaccineScheduleImpl;

  factory _VaccineSchedule.fromJson(Map<String, dynamic> json) =
      _$VaccineScheduleImpl.fromJson;

  @override
  String get id;
  @override
  String get vaccineId;
  @override
  String get stageId;
  @override
  DateTime? get date;
  @override
  int get quantity;
  @override
  String get status;
  @override
  int get applicationAge;

  /// Create a copy of VaccineSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaccineScheduleImplCopyWith<_$VaccineScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
