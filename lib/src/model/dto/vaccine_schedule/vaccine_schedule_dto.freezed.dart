// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vaccine_schedule_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VaccineScheduleDto _$VaccineScheduleDtoFromJson(Map<String, dynamic> json) {
  return _VaccineScheduleDto.fromJson(json);
}

/// @nodoc
mixin _$VaccineScheduleDto {
  String get vaccineScheduleId => throw _privateConstructorUsedError;
  String get stageId => throw _privateConstructorUsedError;
  String get vaccineId => throw _privateConstructorUsedError;
  String get vaccineName => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int? get applicationAge => throw _privateConstructorUsedError;
  double? get totalPrice => throw _privateConstructorUsedError;
  int get session => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this VaccineScheduleDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VaccineScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaccineScheduleDtoCopyWith<VaccineScheduleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineScheduleDtoCopyWith<$Res> {
  factory $VaccineScheduleDtoCopyWith(
          VaccineScheduleDto value, $Res Function(VaccineScheduleDto) then) =
      _$VaccineScheduleDtoCopyWithImpl<$Res, VaccineScheduleDto>;
  @useResult
  $Res call(
      {String vaccineScheduleId,
      String stageId,
      String vaccineId,
      String vaccineName,
      DateTime date,
      int quantity,
      int? applicationAge,
      double? totalPrice,
      int session,
      String status});
}

/// @nodoc
class _$VaccineScheduleDtoCopyWithImpl<$Res, $Val extends VaccineScheduleDto>
    implements $VaccineScheduleDtoCopyWith<$Res> {
  _$VaccineScheduleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaccineScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vaccineScheduleId = null,
    Object? stageId = null,
    Object? vaccineId = null,
    Object? vaccineName = null,
    Object? date = null,
    Object? quantity = null,
    Object? applicationAge = freezed,
    Object? totalPrice = freezed,
    Object? session = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      vaccineScheduleId: null == vaccineScheduleId
          ? _value.vaccineScheduleId
          : vaccineScheduleId // ignore: cast_nullable_to_non_nullable
              as String,
      stageId: null == stageId
          ? _value.stageId
          : stageId // ignore: cast_nullable_to_non_nullable
              as String,
      vaccineId: null == vaccineId
          ? _value.vaccineId
          : vaccineId // ignore: cast_nullable_to_non_nullable
              as String,
      vaccineName: null == vaccineName
          ? _value.vaccineName
          : vaccineName // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      applicationAge: freezed == applicationAge
          ? _value.applicationAge
          : applicationAge // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VaccineScheduleDtoImplCopyWith<$Res>
    implements $VaccineScheduleDtoCopyWith<$Res> {
  factory _$$VaccineScheduleDtoImplCopyWith(_$VaccineScheduleDtoImpl value,
          $Res Function(_$VaccineScheduleDtoImpl) then) =
      __$$VaccineScheduleDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String vaccineScheduleId,
      String stageId,
      String vaccineId,
      String vaccineName,
      DateTime date,
      int quantity,
      int? applicationAge,
      double? totalPrice,
      int session,
      String status});
}

/// @nodoc
class __$$VaccineScheduleDtoImplCopyWithImpl<$Res>
    extends _$VaccineScheduleDtoCopyWithImpl<$Res, _$VaccineScheduleDtoImpl>
    implements _$$VaccineScheduleDtoImplCopyWith<$Res> {
  __$$VaccineScheduleDtoImplCopyWithImpl(_$VaccineScheduleDtoImpl _value,
      $Res Function(_$VaccineScheduleDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of VaccineScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vaccineScheduleId = null,
    Object? stageId = null,
    Object? vaccineId = null,
    Object? vaccineName = null,
    Object? date = null,
    Object? quantity = null,
    Object? applicationAge = freezed,
    Object? totalPrice = freezed,
    Object? session = null,
    Object? status = null,
  }) {
    return _then(_$VaccineScheduleDtoImpl(
      vaccineScheduleId: null == vaccineScheduleId
          ? _value.vaccineScheduleId
          : vaccineScheduleId // ignore: cast_nullable_to_non_nullable
              as String,
      stageId: null == stageId
          ? _value.stageId
          : stageId // ignore: cast_nullable_to_non_nullable
              as String,
      vaccineId: null == vaccineId
          ? _value.vaccineId
          : vaccineId // ignore: cast_nullable_to_non_nullable
              as String,
      vaccineName: null == vaccineName
          ? _value.vaccineName
          : vaccineName // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      applicationAge: freezed == applicationAge
          ? _value.applicationAge
          : applicationAge // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VaccineScheduleDtoImpl implements _VaccineScheduleDto {
  _$VaccineScheduleDtoImpl(
      {required this.vaccineScheduleId,
      required this.stageId,
      required this.vaccineId,
      required this.vaccineName,
      required this.date,
      required this.quantity,
      required this.applicationAge,
      this.totalPrice,
      required this.session,
      required this.status});

  factory _$VaccineScheduleDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VaccineScheduleDtoImplFromJson(json);

  @override
  final String vaccineScheduleId;
  @override
  final String stageId;
  @override
  final String vaccineId;
  @override
  final String vaccineName;
  @override
  final DateTime date;
  @override
  final int quantity;
  @override
  final int? applicationAge;
  @override
  final double? totalPrice;
  @override
  final int session;
  @override
  final String status;

  @override
  String toString() {
    return 'VaccineScheduleDto(vaccineScheduleId: $vaccineScheduleId, stageId: $stageId, vaccineId: $vaccineId, vaccineName: $vaccineName, date: $date, quantity: $quantity, applicationAge: $applicationAge, totalPrice: $totalPrice, session: $session, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaccineScheduleDtoImpl &&
            (identical(other.vaccineScheduleId, vaccineScheduleId) ||
                other.vaccineScheduleId == vaccineScheduleId) &&
            (identical(other.stageId, stageId) || other.stageId == stageId) &&
            (identical(other.vaccineId, vaccineId) ||
                other.vaccineId == vaccineId) &&
            (identical(other.vaccineName, vaccineName) ||
                other.vaccineName == vaccineName) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.applicationAge, applicationAge) ||
                other.applicationAge == applicationAge) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      vaccineScheduleId,
      stageId,
      vaccineId,
      vaccineName,
      date,
      quantity,
      applicationAge,
      totalPrice,
      session,
      status);

  /// Create a copy of VaccineScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaccineScheduleDtoImplCopyWith<_$VaccineScheduleDtoImpl> get copyWith =>
      __$$VaccineScheduleDtoImplCopyWithImpl<_$VaccineScheduleDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaccineScheduleDtoImplToJson(
      this,
    );
  }
}

abstract class _VaccineScheduleDto implements VaccineScheduleDto {
  factory _VaccineScheduleDto(
      {required final String vaccineScheduleId,
      required final String stageId,
      required final String vaccineId,
      required final String vaccineName,
      required final DateTime date,
      required final int quantity,
      required final int? applicationAge,
      final double? totalPrice,
      required final int session,
      required final String status}) = _$VaccineScheduleDtoImpl;

  factory _VaccineScheduleDto.fromJson(Map<String, dynamic> json) =
      _$VaccineScheduleDtoImpl.fromJson;

  @override
  String get vaccineScheduleId;
  @override
  String get stageId;
  @override
  String get vaccineId;
  @override
  String get vaccineName;
  @override
  DateTime get date;
  @override
  int get quantity;
  @override
  int? get applicationAge;
  @override
  double? get totalPrice;
  @override
  int get session;
  @override
  String get status;

  /// Create a copy of VaccineScheduleDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaccineScheduleDtoImplCopyWith<_$VaccineScheduleDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
