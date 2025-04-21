// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_status_prescription_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateStatusPrescriptionRequest _$UpdateStatusPrescriptionRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateStatusPrescriptionRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateStatusPrescriptionRequest {
  String get status => throw _privateConstructorUsedError;
  int get remainingQuantity => throw _privateConstructorUsedError;

  /// Serializes this UpdateStatusPrescriptionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateStatusPrescriptionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateStatusPrescriptionRequestCopyWith<UpdateStatusPrescriptionRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateStatusPrescriptionRequestCopyWith<$Res> {
  factory $UpdateStatusPrescriptionRequestCopyWith(
          UpdateStatusPrescriptionRequest value,
          $Res Function(UpdateStatusPrescriptionRequest) then) =
      _$UpdateStatusPrescriptionRequestCopyWithImpl<$Res,
          UpdateStatusPrescriptionRequest>;
  @useResult
  $Res call({String status, int remainingQuantity});
}

/// @nodoc
class _$UpdateStatusPrescriptionRequestCopyWithImpl<$Res,
        $Val extends UpdateStatusPrescriptionRequest>
    implements $UpdateStatusPrescriptionRequestCopyWith<$Res> {
  _$UpdateStatusPrescriptionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateStatusPrescriptionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? remainingQuantity = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      remainingQuantity: null == remainingQuantity
          ? _value.remainingQuantity
          : remainingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateStatusPrescriptionRequestImplCopyWith<$Res>
    implements $UpdateStatusPrescriptionRequestCopyWith<$Res> {
  factory _$$UpdateStatusPrescriptionRequestImplCopyWith(
          _$UpdateStatusPrescriptionRequestImpl value,
          $Res Function(_$UpdateStatusPrescriptionRequestImpl) then) =
      __$$UpdateStatusPrescriptionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int remainingQuantity});
}

/// @nodoc
class __$$UpdateStatusPrescriptionRequestImplCopyWithImpl<$Res>
    extends _$UpdateStatusPrescriptionRequestCopyWithImpl<$Res,
        _$UpdateStatusPrescriptionRequestImpl>
    implements _$$UpdateStatusPrescriptionRequestImplCopyWith<$Res> {
  __$$UpdateStatusPrescriptionRequestImplCopyWithImpl(
      _$UpdateStatusPrescriptionRequestImpl _value,
      $Res Function(_$UpdateStatusPrescriptionRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateStatusPrescriptionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? remainingQuantity = null,
  }) {
    return _then(_$UpdateStatusPrescriptionRequestImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      remainingQuantity: null == remainingQuantity
          ? _value.remainingQuantity
          : remainingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateStatusPrescriptionRequestImpl
    implements _UpdateStatusPrescriptionRequest {
  _$UpdateStatusPrescriptionRequestImpl(
      {required this.status, required this.remainingQuantity});

  factory _$UpdateStatusPrescriptionRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdateStatusPrescriptionRequestImplFromJson(json);

  @override
  final String status;
  @override
  final int remainingQuantity;

  @override
  String toString() {
    return 'UpdateStatusPrescriptionRequest(status: $status, remainingQuantity: $remainingQuantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStatusPrescriptionRequestImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.remainingQuantity, remainingQuantity) ||
                other.remainingQuantity == remainingQuantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, remainingQuantity);

  /// Create a copy of UpdateStatusPrescriptionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateStatusPrescriptionRequestImplCopyWith<
          _$UpdateStatusPrescriptionRequestImpl>
      get copyWith => __$$UpdateStatusPrescriptionRequestImplCopyWithImpl<
          _$UpdateStatusPrescriptionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateStatusPrescriptionRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateStatusPrescriptionRequest
    implements UpdateStatusPrescriptionRequest {
  factory _UpdateStatusPrescriptionRequest(
          {required final String status,
          required final int remainingQuantity}) =
      _$UpdateStatusPrescriptionRequestImpl;

  factory _UpdateStatusPrescriptionRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateStatusPrescriptionRequestImpl.fromJson;

  @override
  String get status;
  @override
  int get remainingQuantity;

  /// Create a copy of UpdateStatusPrescriptionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateStatusPrescriptionRequestImplCopyWith<
          _$UpdateStatusPrescriptionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
