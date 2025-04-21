// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_symptom_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetSymptomRequest _$GetSymptomRequestFromJson(Map<String, dynamic> json) {
  return _GetSymptomRequest.fromJson(json);
}

/// @nodoc
mixin _$GetSymptomRequest {
  String get symptomId => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  /// Serializes this GetSymptomRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetSymptomRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetSymptomRequestCopyWith<GetSymptomRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSymptomRequestCopyWith<$Res> {
  factory $GetSymptomRequestCopyWith(
          GetSymptomRequest value, $Res Function(GetSymptomRequest) then) =
      _$GetSymptomRequestCopyWithImpl<$Res, GetSymptomRequest>;
  @useResult
  $Res call({String symptomId, String notes});
}

/// @nodoc
class _$GetSymptomRequestCopyWithImpl<$Res, $Val extends GetSymptomRequest>
    implements $GetSymptomRequestCopyWith<$Res> {
  _$GetSymptomRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetSymptomRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symptomId = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      symptomId: null == symptomId
          ? _value.symptomId
          : symptomId // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetSymptomRequestImplCopyWith<$Res>
    implements $GetSymptomRequestCopyWith<$Res> {
  factory _$$GetSymptomRequestImplCopyWith(_$GetSymptomRequestImpl value,
          $Res Function(_$GetSymptomRequestImpl) then) =
      __$$GetSymptomRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String symptomId, String notes});
}

/// @nodoc
class __$$GetSymptomRequestImplCopyWithImpl<$Res>
    extends _$GetSymptomRequestCopyWithImpl<$Res, _$GetSymptomRequestImpl>
    implements _$$GetSymptomRequestImplCopyWith<$Res> {
  __$$GetSymptomRequestImplCopyWithImpl(_$GetSymptomRequestImpl _value,
      $Res Function(_$GetSymptomRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetSymptomRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symptomId = null,
    Object? notes = null,
  }) {
    return _then(_$GetSymptomRequestImpl(
      symptomId: null == symptomId
          ? _value.symptomId
          : symptomId // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetSymptomRequestImpl implements _GetSymptomRequest {
  const _$GetSymptomRequestImpl({required this.symptomId, required this.notes});

  factory _$GetSymptomRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetSymptomRequestImplFromJson(json);

  @override
  final String symptomId;
  @override
  final String notes;

  @override
  String toString() {
    return 'GetSymptomRequest(symptomId: $symptomId, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSymptomRequestImpl &&
            (identical(other.symptomId, symptomId) ||
                other.symptomId == symptomId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, symptomId, notes);

  /// Create a copy of GetSymptomRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSymptomRequestImplCopyWith<_$GetSymptomRequestImpl> get copyWith =>
      __$$GetSymptomRequestImplCopyWithImpl<_$GetSymptomRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetSymptomRequestImplToJson(
      this,
    );
  }
}

abstract class _GetSymptomRequest implements GetSymptomRequest {
  const factory _GetSymptomRequest(
      {required final String symptomId,
      required final String notes}) = _$GetSymptomRequestImpl;

  factory _GetSymptomRequest.fromJson(Map<String, dynamic> json) =
      _$GetSymptomRequestImpl.fromJson;

  @override
  String get symptomId;
  @override
  String get notes;

  /// Create a copy of GetSymptomRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSymptomRequestImplCopyWith<_$GetSymptomRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
