// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrescriptionDto _$PrescriptionDtoFromJson(Map<String, dynamic> json) {
  return _PrescriptionDto.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionDto {
  String get id => throw _privateConstructorUsedError;
  DateTime get prescribedDate => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  int get quantityAnimal => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String get cageId => throw _privateConstructorUsedError;
  int get daysToTake => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  List<MedicationDto>? get medications => throw _privateConstructorUsedError;

  /// Serializes this PrescriptionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrescriptionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescriptionDtoCopyWith<PrescriptionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionDtoCopyWith<$Res> {
  factory $PrescriptionDtoCopyWith(
          PrescriptionDto value, $Res Function(PrescriptionDto) then) =
      _$PrescriptionDtoCopyWithImpl<$Res, PrescriptionDto>;
  @useResult
  $Res call(
      {String id,
      DateTime prescribedDate,
      String notes,
      int quantityAnimal,
      String status,
      double? price,
      String cageId,
      int daysToTake,
      DateTime? endDate,
      List<MedicationDto>? medications});
}

/// @nodoc
class _$PrescriptionDtoCopyWithImpl<$Res, $Val extends PrescriptionDto>
    implements $PrescriptionDtoCopyWith<$Res> {
  _$PrescriptionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrescriptionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prescribedDate = null,
    Object? notes = null,
    Object? quantityAnimal = null,
    Object? status = null,
    Object? price = freezed,
    Object? cageId = null,
    Object? daysToTake = null,
    Object? endDate = freezed,
    Object? medications = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      prescribedDate: null == prescribedDate
          ? _value.prescribedDate
          : prescribedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      quantityAnimal: null == quantityAnimal
          ? _value.quantityAnimal
          : quantityAnimal // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      cageId: null == cageId
          ? _value.cageId
          : cageId // ignore: cast_nullable_to_non_nullable
              as String,
      daysToTake: null == daysToTake
          ? _value.daysToTake
          : daysToTake // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      medications: freezed == medications
          ? _value.medications
          : medications // ignore: cast_nullable_to_non_nullable
              as List<MedicationDto>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrescriptionDtoImplCopyWith<$Res>
    implements $PrescriptionDtoCopyWith<$Res> {
  factory _$$PrescriptionDtoImplCopyWith(_$PrescriptionDtoImpl value,
          $Res Function(_$PrescriptionDtoImpl) then) =
      __$$PrescriptionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime prescribedDate,
      String notes,
      int quantityAnimal,
      String status,
      double? price,
      String cageId,
      int daysToTake,
      DateTime? endDate,
      List<MedicationDto>? medications});
}

/// @nodoc
class __$$PrescriptionDtoImplCopyWithImpl<$Res>
    extends _$PrescriptionDtoCopyWithImpl<$Res, _$PrescriptionDtoImpl>
    implements _$$PrescriptionDtoImplCopyWith<$Res> {
  __$$PrescriptionDtoImplCopyWithImpl(
      _$PrescriptionDtoImpl _value, $Res Function(_$PrescriptionDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrescriptionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prescribedDate = null,
    Object? notes = null,
    Object? quantityAnimal = null,
    Object? status = null,
    Object? price = freezed,
    Object? cageId = null,
    Object? daysToTake = null,
    Object? endDate = freezed,
    Object? medications = freezed,
  }) {
    return _then(_$PrescriptionDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      prescribedDate: null == prescribedDate
          ? _value.prescribedDate
          : prescribedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      quantityAnimal: null == quantityAnimal
          ? _value.quantityAnimal
          : quantityAnimal // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      cageId: null == cageId
          ? _value.cageId
          : cageId // ignore: cast_nullable_to_non_nullable
              as String,
      daysToTake: null == daysToTake
          ? _value.daysToTake
          : daysToTake // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      medications: freezed == medications
          ? _value._medications
          : medications // ignore: cast_nullable_to_non_nullable
              as List<MedicationDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionDtoImpl implements _PrescriptionDto {
  const _$PrescriptionDtoImpl(
      {required this.id,
      required this.prescribedDate,
      required this.notes,
      required this.quantityAnimal,
      required this.status,
      required this.price,
      required this.cageId,
      required this.daysToTake,
      required this.endDate,
      required final List<MedicationDto>? medications})
      : _medications = medications;

  factory _$PrescriptionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionDtoImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime prescribedDate;
  @override
  final String notes;
  @override
  final int quantityAnimal;
  @override
  final String status;
  @override
  final double? price;
  @override
  final String cageId;
  @override
  final int daysToTake;
  @override
  final DateTime? endDate;
  final List<MedicationDto>? _medications;
  @override
  List<MedicationDto>? get medications {
    final value = _medications;
    if (value == null) return null;
    if (_medications is EqualUnmodifiableListView) return _medications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PrescriptionDto(id: $id, prescribedDate: $prescribedDate, notes: $notes, quantityAnimal: $quantityAnimal, status: $status, price: $price, cageId: $cageId, daysToTake: $daysToTake, endDate: $endDate, medications: $medications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.prescribedDate, prescribedDate) ||
                other.prescribedDate == prescribedDate) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.quantityAnimal, quantityAnimal) ||
                other.quantityAnimal == quantityAnimal) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.cageId, cageId) || other.cageId == cageId) &&
            (identical(other.daysToTake, daysToTake) ||
                other.daysToTake == daysToTake) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._medications, _medications));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      prescribedDate,
      notes,
      quantityAnimal,
      status,
      price,
      cageId,
      daysToTake,
      endDate,
      const DeepCollectionEquality().hash(_medications));

  /// Create a copy of PrescriptionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionDtoImplCopyWith<_$PrescriptionDtoImpl> get copyWith =>
      __$$PrescriptionDtoImplCopyWithImpl<_$PrescriptionDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionDtoImplToJson(
      this,
    );
  }
}

abstract class _PrescriptionDto implements PrescriptionDto {
  const factory _PrescriptionDto(
      {required final String id,
      required final DateTime prescribedDate,
      required final String notes,
      required final int quantityAnimal,
      required final String status,
      required final double? price,
      required final String cageId,
      required final int daysToTake,
      required final DateTime? endDate,
      required final List<MedicationDto>? medications}) = _$PrescriptionDtoImpl;

  factory _PrescriptionDto.fromJson(Map<String, dynamic> json) =
      _$PrescriptionDtoImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get prescribedDate;
  @override
  String get notes;
  @override
  int get quantityAnimal;
  @override
  String get status;
  @override
  double? get price;
  @override
  String get cageId;
  @override
  int get daysToTake;
  @override
  DateTime? get endDate;
  @override
  List<MedicationDto>? get medications;

  /// Create a copy of PrescriptionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescriptionDtoImplCopyWith<_$PrescriptionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
