// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cage_admin_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CageAdminDto _$CageAdminDtoFromJson(Map<String, dynamic> json) {
  return _CageAdminDto.fromJson(json);
}

/// @nodoc
mixin _$CageAdminDto {
  String get id => throw _privateConstructorUsedError;
  String get penCode => throw _privateConstructorUsedError;
  String get farmId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get area => throw _privateConstructorUsedError;
  String? get animalType => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;
  String get boardCode => throw _privateConstructorUsedError;
  bool get boardStatus => throw _privateConstructorUsedError;
  String? get endDateOfFarmingBatch => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;
  String get cameraUrl => throw _privateConstructorUsedError;
  String get staffId => throw _privateConstructorUsedError;
  String get staffName => throw _privateConstructorUsedError;
  bool? get isSolationCage => throw _privateConstructorUsedError;
  FarmingBatchDto? get farmingBatchStageModel =>
      throw _privateConstructorUsedError;

  /// Serializes this CageAdminDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CageAdminDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CageAdminDtoCopyWith<CageAdminDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CageAdminDtoCopyWith<$Res> {
  factory $CageAdminDtoCopyWith(
          CageAdminDto value, $Res Function(CageAdminDto) then) =
      _$CageAdminDtoCopyWithImpl<$Res, CageAdminDto>;
  @useResult
  $Res call(
      {String id,
      String penCode,
      String farmId,
      String name,
      int area,
      String? animalType,
      String location,
      int capacity,
      String boardCode,
      bool boardStatus,
      String? endDateOfFarmingBatch,
      String createdDate,
      String cameraUrl,
      String staffId,
      String staffName,
      bool? isSolationCage,
      FarmingBatchDto? farmingBatchStageModel});

  $FarmingBatchDtoCopyWith<$Res>? get farmingBatchStageModel;
}

/// @nodoc
class _$CageAdminDtoCopyWithImpl<$Res, $Val extends CageAdminDto>
    implements $CageAdminDtoCopyWith<$Res> {
  _$CageAdminDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CageAdminDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? penCode = null,
    Object? farmId = null,
    Object? name = null,
    Object? area = null,
    Object? animalType = freezed,
    Object? location = null,
    Object? capacity = null,
    Object? boardCode = null,
    Object? boardStatus = null,
    Object? endDateOfFarmingBatch = freezed,
    Object? createdDate = null,
    Object? cameraUrl = null,
    Object? staffId = null,
    Object? staffName = null,
    Object? isSolationCage = freezed,
    Object? farmingBatchStageModel = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      penCode: null == penCode
          ? _value.penCode
          : penCode // ignore: cast_nullable_to_non_nullable
              as String,
      farmId: null == farmId
          ? _value.farmId
          : farmId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as int,
      animalType: freezed == animalType
          ? _value.animalType
          : animalType // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      boardCode: null == boardCode
          ? _value.boardCode
          : boardCode // ignore: cast_nullable_to_non_nullable
              as String,
      boardStatus: null == boardStatus
          ? _value.boardStatus
          : boardStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      endDateOfFarmingBatch: freezed == endDateOfFarmingBatch
          ? _value.endDateOfFarmingBatch
          : endDateOfFarmingBatch // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      cameraUrl: null == cameraUrl
          ? _value.cameraUrl
          : cameraUrl // ignore: cast_nullable_to_non_nullable
              as String,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      staffName: null == staffName
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String,
      isSolationCage: freezed == isSolationCage
          ? _value.isSolationCage
          : isSolationCage // ignore: cast_nullable_to_non_nullable
              as bool?,
      farmingBatchStageModel: freezed == farmingBatchStageModel
          ? _value.farmingBatchStageModel
          : farmingBatchStageModel // ignore: cast_nullable_to_non_nullable
              as FarmingBatchDto?,
    ) as $Val);
  }

  /// Create a copy of CageAdminDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FarmingBatchDtoCopyWith<$Res>? get farmingBatchStageModel {
    if (_value.farmingBatchStageModel == null) {
      return null;
    }

    return $FarmingBatchDtoCopyWith<$Res>(_value.farmingBatchStageModel!,
        (value) {
      return _then(_value.copyWith(farmingBatchStageModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CageAdminDtoImplCopyWith<$Res>
    implements $CageAdminDtoCopyWith<$Res> {
  factory _$$CageAdminDtoImplCopyWith(
          _$CageAdminDtoImpl value, $Res Function(_$CageAdminDtoImpl) then) =
      __$$CageAdminDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String penCode,
      String farmId,
      String name,
      int area,
      String? animalType,
      String location,
      int capacity,
      String boardCode,
      bool boardStatus,
      String? endDateOfFarmingBatch,
      String createdDate,
      String cameraUrl,
      String staffId,
      String staffName,
      bool? isSolationCage,
      FarmingBatchDto? farmingBatchStageModel});

  @override
  $FarmingBatchDtoCopyWith<$Res>? get farmingBatchStageModel;
}

/// @nodoc
class __$$CageAdminDtoImplCopyWithImpl<$Res>
    extends _$CageAdminDtoCopyWithImpl<$Res, _$CageAdminDtoImpl>
    implements _$$CageAdminDtoImplCopyWith<$Res> {
  __$$CageAdminDtoImplCopyWithImpl(
      _$CageAdminDtoImpl _value, $Res Function(_$CageAdminDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CageAdminDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? penCode = null,
    Object? farmId = null,
    Object? name = null,
    Object? area = null,
    Object? animalType = freezed,
    Object? location = null,
    Object? capacity = null,
    Object? boardCode = null,
    Object? boardStatus = null,
    Object? endDateOfFarmingBatch = freezed,
    Object? createdDate = null,
    Object? cameraUrl = null,
    Object? staffId = null,
    Object? staffName = null,
    Object? isSolationCage = freezed,
    Object? farmingBatchStageModel = freezed,
  }) {
    return _then(_$CageAdminDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      penCode: null == penCode
          ? _value.penCode
          : penCode // ignore: cast_nullable_to_non_nullable
              as String,
      farmId: null == farmId
          ? _value.farmId
          : farmId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as int,
      animalType: freezed == animalType
          ? _value.animalType
          : animalType // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      boardCode: null == boardCode
          ? _value.boardCode
          : boardCode // ignore: cast_nullable_to_non_nullable
              as String,
      boardStatus: null == boardStatus
          ? _value.boardStatus
          : boardStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      endDateOfFarmingBatch: freezed == endDateOfFarmingBatch
          ? _value.endDateOfFarmingBatch
          : endDateOfFarmingBatch // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      cameraUrl: null == cameraUrl
          ? _value.cameraUrl
          : cameraUrl // ignore: cast_nullable_to_non_nullable
              as String,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      staffName: null == staffName
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String,
      isSolationCage: freezed == isSolationCage
          ? _value.isSolationCage
          : isSolationCage // ignore: cast_nullable_to_non_nullable
              as bool?,
      farmingBatchStageModel: freezed == farmingBatchStageModel
          ? _value.farmingBatchStageModel
          : farmingBatchStageModel // ignore: cast_nullable_to_non_nullable
              as FarmingBatchDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CageAdminDtoImpl implements _CageAdminDto {
  _$CageAdminDtoImpl(
      {required this.id,
      required this.penCode,
      required this.farmId,
      required this.name,
      required this.area,
      required this.animalType,
      required this.location,
      required this.capacity,
      required this.boardCode,
      required this.boardStatus,
      required this.endDateOfFarmingBatch,
      required this.createdDate,
      required this.cameraUrl,
      required this.staffId,
      required this.staffName,
      required this.isSolationCage,
      required this.farmingBatchStageModel});

  factory _$CageAdminDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CageAdminDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String penCode;
  @override
  final String farmId;
  @override
  final String name;
  @override
  final int area;
  @override
  final String? animalType;
  @override
  final String location;
  @override
  final int capacity;
  @override
  final String boardCode;
  @override
  final bool boardStatus;
  @override
  final String? endDateOfFarmingBatch;
  @override
  final String createdDate;
  @override
  final String cameraUrl;
  @override
  final String staffId;
  @override
  final String staffName;
  @override
  final bool? isSolationCage;
  @override
  final FarmingBatchDto? farmingBatchStageModel;

  @override
  String toString() {
    return 'CageAdminDto(id: $id, penCode: $penCode, farmId: $farmId, name: $name, area: $area, animalType: $animalType, location: $location, capacity: $capacity, boardCode: $boardCode, boardStatus: $boardStatus, endDateOfFarmingBatch: $endDateOfFarmingBatch, createdDate: $createdDate, cameraUrl: $cameraUrl, staffId: $staffId, staffName: $staffName, isSolationCage: $isSolationCage, farmingBatchStageModel: $farmingBatchStageModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CageAdminDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.penCode, penCode) || other.penCode == penCode) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.animalType, animalType) ||
                other.animalType == animalType) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.boardCode, boardCode) ||
                other.boardCode == boardCode) &&
            (identical(other.boardStatus, boardStatus) ||
                other.boardStatus == boardStatus) &&
            (identical(other.endDateOfFarmingBatch, endDateOfFarmingBatch) ||
                other.endDateOfFarmingBatch == endDateOfFarmingBatch) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.cameraUrl, cameraUrl) ||
                other.cameraUrl == cameraUrl) &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.staffName, staffName) ||
                other.staffName == staffName) &&
            (identical(other.isSolationCage, isSolationCage) ||
                other.isSolationCage == isSolationCage) &&
            (identical(other.farmingBatchStageModel, farmingBatchStageModel) ||
                other.farmingBatchStageModel == farmingBatchStageModel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      penCode,
      farmId,
      name,
      area,
      animalType,
      location,
      capacity,
      boardCode,
      boardStatus,
      endDateOfFarmingBatch,
      createdDate,
      cameraUrl,
      staffId,
      staffName,
      isSolationCage,
      farmingBatchStageModel);

  /// Create a copy of CageAdminDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CageAdminDtoImplCopyWith<_$CageAdminDtoImpl> get copyWith =>
      __$$CageAdminDtoImplCopyWithImpl<_$CageAdminDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CageAdminDtoImplToJson(
      this,
    );
  }
}

abstract class _CageAdminDto implements CageAdminDto {
  factory _CageAdminDto(
          {required final String id,
          required final String penCode,
          required final String farmId,
          required final String name,
          required final int area,
          required final String? animalType,
          required final String location,
          required final int capacity,
          required final String boardCode,
          required final bool boardStatus,
          required final String? endDateOfFarmingBatch,
          required final String createdDate,
          required final String cameraUrl,
          required final String staffId,
          required final String staffName,
          required final bool? isSolationCage,
          required final FarmingBatchDto? farmingBatchStageModel}) =
      _$CageAdminDtoImpl;

  factory _CageAdminDto.fromJson(Map<String, dynamic> json) =
      _$CageAdminDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get penCode;
  @override
  String get farmId;
  @override
  String get name;
  @override
  int get area;
  @override
  String? get animalType;
  @override
  String get location;
  @override
  int get capacity;
  @override
  String get boardCode;
  @override
  bool get boardStatus;
  @override
  String? get endDateOfFarmingBatch;
  @override
  String get createdDate;
  @override
  String get cameraUrl;
  @override
  String get staffId;
  @override
  String get staffName;
  @override
  bool? get isSolationCage;
  @override
  FarmingBatchDto? get farmingBatchStageModel;

  /// Create a copy of CageAdminDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CageAdminDtoImplCopyWith<_$CageAdminDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
