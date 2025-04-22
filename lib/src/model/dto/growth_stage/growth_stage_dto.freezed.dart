// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'growth_stage_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GrowthStageDto _$GrowthStageDtoFromJson(Map<String, dynamic> json) {
  return _GrowthStageDto.fromJson(json);
}

/// @nodoc
mixin _$GrowthStageDto {
  String get id => throw _privateConstructorUsedError;
  String get farmingBatchId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get weightAnimal => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  int get ageStart => throw _privateConstructorUsedError;
  int get ageEnd => throw _privateConstructorUsedError;
  String? get foodType => throw _privateConstructorUsedError;
  String get ageStartDate => throw _privateConstructorUsedError;
  String get ageEndDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int? get affectQuantity => throw _privateConstructorUsedError;
  int? get deadQuantity => throw _privateConstructorUsedError;
  double get recommendedWeightPerSession => throw _privateConstructorUsedError;
  double get weightBasedOnBodyMass => throw _privateConstructorUsedError;
  TaskByUserResponse? get taskDailies => throw _privateConstructorUsedError;
  List<VaccineSchedule>? get vaccineSchedules =>
      throw _privateConstructorUsedError;

  /// Serializes this GrowthStageDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GrowthStageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GrowthStageDtoCopyWith<GrowthStageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrowthStageDtoCopyWith<$Res> {
  factory $GrowthStageDtoCopyWith(
          GrowthStageDto value, $Res Function(GrowthStageDto) then) =
      _$GrowthStageDtoCopyWithImpl<$Res, GrowthStageDto>;
  @useResult
  $Res call(
      {String id,
      String farmingBatchId,
      String name,
      double weightAnimal,
      int? quantity,
      int ageStart,
      int ageEnd,
      String? foodType,
      String ageStartDate,
      String ageEndDate,
      String status,
      int? affectQuantity,
      int? deadQuantity,
      double recommendedWeightPerSession,
      double weightBasedOnBodyMass,
      TaskByUserResponse? taskDailies,
      List<VaccineSchedule>? vaccineSchedules});

  $TaskByUserResponseCopyWith<$Res>? get taskDailies;
}

/// @nodoc
class _$GrowthStageDtoCopyWithImpl<$Res, $Val extends GrowthStageDto>
    implements $GrowthStageDtoCopyWith<$Res> {
  _$GrowthStageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GrowthStageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmingBatchId = null,
    Object? name = null,
    Object? weightAnimal = null,
    Object? quantity = freezed,
    Object? ageStart = null,
    Object? ageEnd = null,
    Object? foodType = freezed,
    Object? ageStartDate = null,
    Object? ageEndDate = null,
    Object? status = null,
    Object? affectQuantity = freezed,
    Object? deadQuantity = freezed,
    Object? recommendedWeightPerSession = null,
    Object? weightBasedOnBodyMass = null,
    Object? taskDailies = freezed,
    Object? vaccineSchedules = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      farmingBatchId: null == farmingBatchId
          ? _value.farmingBatchId
          : farmingBatchId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weightAnimal: null == weightAnimal
          ? _value.weightAnimal
          : weightAnimal // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      ageStart: null == ageStart
          ? _value.ageStart
          : ageStart // ignore: cast_nullable_to_non_nullable
              as int,
      ageEnd: null == ageEnd
          ? _value.ageEnd
          : ageEnd // ignore: cast_nullable_to_non_nullable
              as int,
      foodType: freezed == foodType
          ? _value.foodType
          : foodType // ignore: cast_nullable_to_non_nullable
              as String?,
      ageStartDate: null == ageStartDate
          ? _value.ageStartDate
          : ageStartDate // ignore: cast_nullable_to_non_nullable
              as String,
      ageEndDate: null == ageEndDate
          ? _value.ageEndDate
          : ageEndDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      affectQuantity: freezed == affectQuantity
          ? _value.affectQuantity
          : affectQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      deadQuantity: freezed == deadQuantity
          ? _value.deadQuantity
          : deadQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      recommendedWeightPerSession: null == recommendedWeightPerSession
          ? _value.recommendedWeightPerSession
          : recommendedWeightPerSession // ignore: cast_nullable_to_non_nullable
              as double,
      weightBasedOnBodyMass: null == weightBasedOnBodyMass
          ? _value.weightBasedOnBodyMass
          : weightBasedOnBodyMass // ignore: cast_nullable_to_non_nullable
              as double,
      taskDailies: freezed == taskDailies
          ? _value.taskDailies
          : taskDailies // ignore: cast_nullable_to_non_nullable
              as TaskByUserResponse?,
      vaccineSchedules: freezed == vaccineSchedules
          ? _value.vaccineSchedules
          : vaccineSchedules // ignore: cast_nullable_to_non_nullable
              as List<VaccineSchedule>?,
    ) as $Val);
  }

  /// Create a copy of GrowthStageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskByUserResponseCopyWith<$Res>? get taskDailies {
    if (_value.taskDailies == null) {
      return null;
    }

    return $TaskByUserResponseCopyWith<$Res>(_value.taskDailies!, (value) {
      return _then(_value.copyWith(taskDailies: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GrowthStageDtoImplCopyWith<$Res>
    implements $GrowthStageDtoCopyWith<$Res> {
  factory _$$GrowthStageDtoImplCopyWith(_$GrowthStageDtoImpl value,
          $Res Function(_$GrowthStageDtoImpl) then) =
      __$$GrowthStageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String farmingBatchId,
      String name,
      double weightAnimal,
      int? quantity,
      int ageStart,
      int ageEnd,
      String? foodType,
      String ageStartDate,
      String ageEndDate,
      String status,
      int? affectQuantity,
      int? deadQuantity,
      double recommendedWeightPerSession,
      double weightBasedOnBodyMass,
      TaskByUserResponse? taskDailies,
      List<VaccineSchedule>? vaccineSchedules});

  @override
  $TaskByUserResponseCopyWith<$Res>? get taskDailies;
}

/// @nodoc
class __$$GrowthStageDtoImplCopyWithImpl<$Res>
    extends _$GrowthStageDtoCopyWithImpl<$Res, _$GrowthStageDtoImpl>
    implements _$$GrowthStageDtoImplCopyWith<$Res> {
  __$$GrowthStageDtoImplCopyWithImpl(
      _$GrowthStageDtoImpl _value, $Res Function(_$GrowthStageDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GrowthStageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmingBatchId = null,
    Object? name = null,
    Object? weightAnimal = null,
    Object? quantity = freezed,
    Object? ageStart = null,
    Object? ageEnd = null,
    Object? foodType = freezed,
    Object? ageStartDate = null,
    Object? ageEndDate = null,
    Object? status = null,
    Object? affectQuantity = freezed,
    Object? deadQuantity = freezed,
    Object? recommendedWeightPerSession = null,
    Object? weightBasedOnBodyMass = null,
    Object? taskDailies = freezed,
    Object? vaccineSchedules = freezed,
  }) {
    return _then(_$GrowthStageDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      farmingBatchId: null == farmingBatchId
          ? _value.farmingBatchId
          : farmingBatchId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weightAnimal: null == weightAnimal
          ? _value.weightAnimal
          : weightAnimal // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      ageStart: null == ageStart
          ? _value.ageStart
          : ageStart // ignore: cast_nullable_to_non_nullable
              as int,
      ageEnd: null == ageEnd
          ? _value.ageEnd
          : ageEnd // ignore: cast_nullable_to_non_nullable
              as int,
      foodType: freezed == foodType
          ? _value.foodType
          : foodType // ignore: cast_nullable_to_non_nullable
              as String?,
      ageStartDate: null == ageStartDate
          ? _value.ageStartDate
          : ageStartDate // ignore: cast_nullable_to_non_nullable
              as String,
      ageEndDate: null == ageEndDate
          ? _value.ageEndDate
          : ageEndDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      affectQuantity: freezed == affectQuantity
          ? _value.affectQuantity
          : affectQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      deadQuantity: freezed == deadQuantity
          ? _value.deadQuantity
          : deadQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      recommendedWeightPerSession: null == recommendedWeightPerSession
          ? _value.recommendedWeightPerSession
          : recommendedWeightPerSession // ignore: cast_nullable_to_non_nullable
              as double,
      weightBasedOnBodyMass: null == weightBasedOnBodyMass
          ? _value.weightBasedOnBodyMass
          : weightBasedOnBodyMass // ignore: cast_nullable_to_non_nullable
              as double,
      taskDailies: freezed == taskDailies
          ? _value.taskDailies
          : taskDailies // ignore: cast_nullable_to_non_nullable
              as TaskByUserResponse?,
      vaccineSchedules: freezed == vaccineSchedules
          ? _value._vaccineSchedules
          : vaccineSchedules // ignore: cast_nullable_to_non_nullable
              as List<VaccineSchedule>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GrowthStageDtoImpl implements _GrowthStageDto {
  const _$GrowthStageDtoImpl(
      {required this.id,
      required this.farmingBatchId,
      required this.name,
      required this.weightAnimal,
      required this.quantity,
      required this.ageStart,
      required this.ageEnd,
      required this.foodType,
      required this.ageStartDate,
      required this.ageEndDate,
      required this.status,
      required this.affectQuantity,
      required this.deadQuantity,
      required this.recommendedWeightPerSession,
      required this.weightBasedOnBodyMass,
      required this.taskDailies,
      required final List<VaccineSchedule>? vaccineSchedules})
      : _vaccineSchedules = vaccineSchedules;

  factory _$GrowthStageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GrowthStageDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String farmingBatchId;
  @override
  final String name;
  @override
  final double weightAnimal;
  @override
  final int? quantity;
  @override
  final int ageStart;
  @override
  final int ageEnd;
  @override
  final String? foodType;
  @override
  final String ageStartDate;
  @override
  final String ageEndDate;
  @override
  final String status;
  @override
  final int? affectQuantity;
  @override
  final int? deadQuantity;
  @override
  final double recommendedWeightPerSession;
  @override
  final double weightBasedOnBodyMass;
  @override
  final TaskByUserResponse? taskDailies;
  final List<VaccineSchedule>? _vaccineSchedules;
  @override
  List<VaccineSchedule>? get vaccineSchedules {
    final value = _vaccineSchedules;
    if (value == null) return null;
    if (_vaccineSchedules is EqualUnmodifiableListView)
      return _vaccineSchedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GrowthStageDto(id: $id, farmingBatchId: $farmingBatchId, name: $name, weightAnimal: $weightAnimal, quantity: $quantity, ageStart: $ageStart, ageEnd: $ageEnd, foodType: $foodType, ageStartDate: $ageStartDate, ageEndDate: $ageEndDate, status: $status, affectQuantity: $affectQuantity, deadQuantity: $deadQuantity, recommendedWeightPerSession: $recommendedWeightPerSession, weightBasedOnBodyMass: $weightBasedOnBodyMass, taskDailies: $taskDailies, vaccineSchedules: $vaccineSchedules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GrowthStageDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.farmingBatchId, farmingBatchId) ||
                other.farmingBatchId == farmingBatchId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.weightAnimal, weightAnimal) ||
                other.weightAnimal == weightAnimal) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.ageStart, ageStart) ||
                other.ageStart == ageStart) &&
            (identical(other.ageEnd, ageEnd) || other.ageEnd == ageEnd) &&
            (identical(other.foodType, foodType) ||
                other.foodType == foodType) &&
            (identical(other.ageStartDate, ageStartDate) ||
                other.ageStartDate == ageStartDate) &&
            (identical(other.ageEndDate, ageEndDate) ||
                other.ageEndDate == ageEndDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.affectQuantity, affectQuantity) ||
                other.affectQuantity == affectQuantity) &&
            (identical(other.deadQuantity, deadQuantity) ||
                other.deadQuantity == deadQuantity) &&
            (identical(other.recommendedWeightPerSession,
                    recommendedWeightPerSession) ||
                other.recommendedWeightPerSession ==
                    recommendedWeightPerSession) &&
            (identical(other.weightBasedOnBodyMass, weightBasedOnBodyMass) ||
                other.weightBasedOnBodyMass == weightBasedOnBodyMass) &&
            (identical(other.taskDailies, taskDailies) ||
                other.taskDailies == taskDailies) &&
            const DeepCollectionEquality()
                .equals(other._vaccineSchedules, _vaccineSchedules));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      farmingBatchId,
      name,
      weightAnimal,
      quantity,
      ageStart,
      ageEnd,
      foodType,
      ageStartDate,
      ageEndDate,
      status,
      affectQuantity,
      deadQuantity,
      recommendedWeightPerSession,
      weightBasedOnBodyMass,
      taskDailies,
      const DeepCollectionEquality().hash(_vaccineSchedules));

  /// Create a copy of GrowthStageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GrowthStageDtoImplCopyWith<_$GrowthStageDtoImpl> get copyWith =>
      __$$GrowthStageDtoImplCopyWithImpl<_$GrowthStageDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GrowthStageDtoImplToJson(
      this,
    );
  }
}

abstract class _GrowthStageDto implements GrowthStageDto {
  const factory _GrowthStageDto(
          {required final String id,
          required final String farmingBatchId,
          required final String name,
          required final double weightAnimal,
          required final int? quantity,
          required final int ageStart,
          required final int ageEnd,
          required final String? foodType,
          required final String ageStartDate,
          required final String ageEndDate,
          required final String status,
          required final int? affectQuantity,
          required final int? deadQuantity,
          required final double recommendedWeightPerSession,
          required final double weightBasedOnBodyMass,
          required final TaskByUserResponse? taskDailies,
          required final List<VaccineSchedule>? vaccineSchedules}) =
      _$GrowthStageDtoImpl;

  factory _GrowthStageDto.fromJson(Map<String, dynamic> json) =
      _$GrowthStageDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get farmingBatchId;
  @override
  String get name;
  @override
  double get weightAnimal;
  @override
  int? get quantity;
  @override
  int get ageStart;
  @override
  int get ageEnd;
  @override
  String? get foodType;
  @override
  String get ageStartDate;
  @override
  String get ageEndDate;
  @override
  String get status;
  @override
  int? get affectQuantity;
  @override
  int? get deadQuantity;
  @override
  double get recommendedWeightPerSession;
  @override
  double get weightBasedOnBodyMass;
  @override
  TaskByUserResponse? get taskDailies;
  @override
  List<VaccineSchedule>? get vaccineSchedules;

  /// Create a copy of GrowthStageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GrowthStageDtoImplCopyWith<_$GrowthStageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
