// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_symptom_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateSymptomRequest _$CreateSymptomRequestFromJson(Map<String, dynamic> json) {
  return _CreateSymptomRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateSymptomRequest {
  String get farmingBatchId => throw _privateConstructorUsedError;
  String get symptoms => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get affectedQuantity => throw _privateConstructorUsedError;
  bool get isEmergency => throw _privateConstructorUsedError;
  int get quantityInCage => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  List<PictureSymptom> get pictures => throw _privateConstructorUsedError;
  List<GetSymptomRequest> get medicalSymptomDetails =>
      throw _privateConstructorUsedError;

  /// Serializes this CreateSymptomRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateSymptomRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateSymptomRequestCopyWith<CreateSymptomRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSymptomRequestCopyWith<$Res> {
  factory $CreateSymptomRequestCopyWith(CreateSymptomRequest value,
          $Res Function(CreateSymptomRequest) then) =
      _$CreateSymptomRequestCopyWithImpl<$Res, CreateSymptomRequest>;
  @useResult
  $Res call(
      {String farmingBatchId,
      String symptoms,
      String status,
      int affectedQuantity,
      bool isEmergency,
      int quantityInCage,
      String notes,
      List<PictureSymptom> pictures,
      List<GetSymptomRequest> medicalSymptomDetails});
}

/// @nodoc
class _$CreateSymptomRequestCopyWithImpl<$Res,
        $Val extends CreateSymptomRequest>
    implements $CreateSymptomRequestCopyWith<$Res> {
  _$CreateSymptomRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateSymptomRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmingBatchId = null,
    Object? symptoms = null,
    Object? status = null,
    Object? affectedQuantity = null,
    Object? isEmergency = null,
    Object? quantityInCage = null,
    Object? notes = null,
    Object? pictures = null,
    Object? medicalSymptomDetails = null,
  }) {
    return _then(_value.copyWith(
      farmingBatchId: null == farmingBatchId
          ? _value.farmingBatchId
          : farmingBatchId // ignore: cast_nullable_to_non_nullable
              as String,
      symptoms: null == symptoms
          ? _value.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      affectedQuantity: null == affectedQuantity
          ? _value.affectedQuantity
          : affectedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      isEmergency: null == isEmergency
          ? _value.isEmergency
          : isEmergency // ignore: cast_nullable_to_non_nullable
              as bool,
      quantityInCage: null == quantityInCage
          ? _value.quantityInCage
          : quantityInCage // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      pictures: null == pictures
          ? _value.pictures
          : pictures // ignore: cast_nullable_to_non_nullable
              as List<PictureSymptom>,
      medicalSymptomDetails: null == medicalSymptomDetails
          ? _value.medicalSymptomDetails
          : medicalSymptomDetails // ignore: cast_nullable_to_non_nullable
              as List<GetSymptomRequest>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateSymptomRequestImplCopyWith<$Res>
    implements $CreateSymptomRequestCopyWith<$Res> {
  factory _$$CreateSymptomRequestImplCopyWith(_$CreateSymptomRequestImpl value,
          $Res Function(_$CreateSymptomRequestImpl) then) =
      __$$CreateSymptomRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String farmingBatchId,
      String symptoms,
      String status,
      int affectedQuantity,
      bool isEmergency,
      int quantityInCage,
      String notes,
      List<PictureSymptom> pictures,
      List<GetSymptomRequest> medicalSymptomDetails});
}

/// @nodoc
class __$$CreateSymptomRequestImplCopyWithImpl<$Res>
    extends _$CreateSymptomRequestCopyWithImpl<$Res, _$CreateSymptomRequestImpl>
    implements _$$CreateSymptomRequestImplCopyWith<$Res> {
  __$$CreateSymptomRequestImplCopyWithImpl(_$CreateSymptomRequestImpl _value,
      $Res Function(_$CreateSymptomRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateSymptomRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmingBatchId = null,
    Object? symptoms = null,
    Object? status = null,
    Object? affectedQuantity = null,
    Object? isEmergency = null,
    Object? quantityInCage = null,
    Object? notes = null,
    Object? pictures = null,
    Object? medicalSymptomDetails = null,
  }) {
    return _then(_$CreateSymptomRequestImpl(
      farmingBatchId: null == farmingBatchId
          ? _value.farmingBatchId
          : farmingBatchId // ignore: cast_nullable_to_non_nullable
              as String,
      symptoms: null == symptoms
          ? _value.symptoms
          : symptoms // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      affectedQuantity: null == affectedQuantity
          ? _value.affectedQuantity
          : affectedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      isEmergency: null == isEmergency
          ? _value.isEmergency
          : isEmergency // ignore: cast_nullable_to_non_nullable
              as bool,
      quantityInCage: null == quantityInCage
          ? _value.quantityInCage
          : quantityInCage // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      pictures: null == pictures
          ? _value._pictures
          : pictures // ignore: cast_nullable_to_non_nullable
              as List<PictureSymptom>,
      medicalSymptomDetails: null == medicalSymptomDetails
          ? _value._medicalSymptomDetails
          : medicalSymptomDetails // ignore: cast_nullable_to_non_nullable
              as List<GetSymptomRequest>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateSymptomRequestImpl implements _CreateSymptomRequest {
  const _$CreateSymptomRequestImpl(
      {required this.farmingBatchId,
      required this.symptoms,
      required this.status,
      required this.affectedQuantity,
      required this.isEmergency,
      required this.quantityInCage,
      required this.notes,
      required final List<PictureSymptom> pictures,
      required final List<GetSymptomRequest> medicalSymptomDetails})
      : _pictures = pictures,
        _medicalSymptomDetails = medicalSymptomDetails;

  factory _$CreateSymptomRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateSymptomRequestImplFromJson(json);

  @override
  final String farmingBatchId;
  @override
  final String symptoms;
  @override
  final String status;
  @override
  final int affectedQuantity;
  @override
  final bool isEmergency;
  @override
  final int quantityInCage;
  @override
  final String notes;
  final List<PictureSymptom> _pictures;
  @override
  List<PictureSymptom> get pictures {
    if (_pictures is EqualUnmodifiableListView) return _pictures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pictures);
  }

  final List<GetSymptomRequest> _medicalSymptomDetails;
  @override
  List<GetSymptomRequest> get medicalSymptomDetails {
    if (_medicalSymptomDetails is EqualUnmodifiableListView)
      return _medicalSymptomDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicalSymptomDetails);
  }

  @override
  String toString() {
    return 'CreateSymptomRequest(farmingBatchId: $farmingBatchId, symptoms: $symptoms, status: $status, affectedQuantity: $affectedQuantity, isEmergency: $isEmergency, quantityInCage: $quantityInCage, notes: $notes, pictures: $pictures, medicalSymptomDetails: $medicalSymptomDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSymptomRequestImpl &&
            (identical(other.farmingBatchId, farmingBatchId) ||
                other.farmingBatchId == farmingBatchId) &&
            (identical(other.symptoms, symptoms) ||
                other.symptoms == symptoms) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.affectedQuantity, affectedQuantity) ||
                other.affectedQuantity == affectedQuantity) &&
            (identical(other.isEmergency, isEmergency) ||
                other.isEmergency == isEmergency) &&
            (identical(other.quantityInCage, quantityInCage) ||
                other.quantityInCage == quantityInCage) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._pictures, _pictures) &&
            const DeepCollectionEquality()
                .equals(other._medicalSymptomDetails, _medicalSymptomDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      farmingBatchId,
      symptoms,
      status,
      affectedQuantity,
      isEmergency,
      quantityInCage,
      notes,
      const DeepCollectionEquality().hash(_pictures),
      const DeepCollectionEquality().hash(_medicalSymptomDetails));

  /// Create a copy of CreateSymptomRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSymptomRequestImplCopyWith<_$CreateSymptomRequestImpl>
      get copyWith =>
          __$$CreateSymptomRequestImplCopyWithImpl<_$CreateSymptomRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateSymptomRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateSymptomRequest implements CreateSymptomRequest {
  const factory _CreateSymptomRequest(
          {required final String farmingBatchId,
          required final String symptoms,
          required final String status,
          required final int affectedQuantity,
          required final bool isEmergency,
          required final int quantityInCage,
          required final String notes,
          required final List<PictureSymptom> pictures,
          required final List<GetSymptomRequest> medicalSymptomDetails}) =
      _$CreateSymptomRequestImpl;

  factory _CreateSymptomRequest.fromJson(Map<String, dynamic> json) =
      _$CreateSymptomRequestImpl.fromJson;

  @override
  String get farmingBatchId;
  @override
  String get symptoms;
  @override
  String get status;
  @override
  int get affectedQuantity;
  @override
  bool get isEmergency;
  @override
  int get quantityInCage;
  @override
  String get notes;
  @override
  List<PictureSymptom> get pictures;
  @override
  List<GetSymptomRequest> get medicalSymptomDetails;

  /// Create a copy of CreateSymptomRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSymptomRequestImplCopyWith<_$CreateSymptomRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PictureSymptom _$PictureSymptomFromJson(Map<String, dynamic> json) {
  return _PictureSymptom.fromJson(json);
}

/// @nodoc
mixin _$PictureSymptom {
  String get image => throw _privateConstructorUsedError;
  DateTime get dateCaptured => throw _privateConstructorUsedError;

  /// Serializes this PictureSymptom to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PictureSymptom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PictureSymptomCopyWith<PictureSymptom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureSymptomCopyWith<$Res> {
  factory $PictureSymptomCopyWith(
          PictureSymptom value, $Res Function(PictureSymptom) then) =
      _$PictureSymptomCopyWithImpl<$Res, PictureSymptom>;
  @useResult
  $Res call({String image, DateTime dateCaptured});
}

/// @nodoc
class _$PictureSymptomCopyWithImpl<$Res, $Val extends PictureSymptom>
    implements $PictureSymptomCopyWith<$Res> {
  _$PictureSymptomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PictureSymptom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? dateCaptured = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      dateCaptured: null == dateCaptured
          ? _value.dateCaptured
          : dateCaptured // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PictureSymptomImplCopyWith<$Res>
    implements $PictureSymptomCopyWith<$Res> {
  factory _$$PictureSymptomImplCopyWith(_$PictureSymptomImpl value,
          $Res Function(_$PictureSymptomImpl) then) =
      __$$PictureSymptomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String image, DateTime dateCaptured});
}

/// @nodoc
class __$$PictureSymptomImplCopyWithImpl<$Res>
    extends _$PictureSymptomCopyWithImpl<$Res, _$PictureSymptomImpl>
    implements _$$PictureSymptomImplCopyWith<$Res> {
  __$$PictureSymptomImplCopyWithImpl(
      _$PictureSymptomImpl _value, $Res Function(_$PictureSymptomImpl) _then)
      : super(_value, _then);

  /// Create a copy of PictureSymptom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
    Object? dateCaptured = null,
  }) {
    return _then(_$PictureSymptomImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      dateCaptured: null == dateCaptured
          ? _value.dateCaptured
          : dateCaptured // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PictureSymptomImpl implements _PictureSymptom {
  const _$PictureSymptomImpl({required this.image, required this.dateCaptured});

  factory _$PictureSymptomImpl.fromJson(Map<String, dynamic> json) =>
      _$$PictureSymptomImplFromJson(json);

  @override
  final String image;
  @override
  final DateTime dateCaptured;

  @override
  String toString() {
    return 'PictureSymptom(image: $image, dateCaptured: $dateCaptured)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PictureSymptomImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.dateCaptured, dateCaptured) ||
                other.dateCaptured == dateCaptured));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, image, dateCaptured);

  /// Create a copy of PictureSymptom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PictureSymptomImplCopyWith<_$PictureSymptomImpl> get copyWith =>
      __$$PictureSymptomImplCopyWithImpl<_$PictureSymptomImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PictureSymptomImplToJson(
      this,
    );
  }
}

abstract class _PictureSymptom implements PictureSymptom {
  const factory _PictureSymptom(
      {required final String image,
      required final DateTime dateCaptured}) = _$PictureSymptomImpl;

  factory _PictureSymptom.fromJson(Map<String, dynamic> json) =
      _$PictureSymptomImpl.fromJson;

  @override
  String get image;
  @override
  DateTime get dateCaptured;

  /// Create a copy of PictureSymptom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PictureSymptomImplCopyWith<_$PictureSymptomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
