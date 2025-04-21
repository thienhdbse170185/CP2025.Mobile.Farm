// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'egg_harvest_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EggHarvestResponse _$EggHarvestResponseFromJson(Map<String, dynamic> json) {
  return _EggHarvestResponse.fromJson(json);
}

/// @nodoc
mixin _$EggHarvestResponse {
  bool get success => throw _privateConstructorUsedError;
  List<EggHarvestDto> get result => throw _privateConstructorUsedError;

  /// Serializes this EggHarvestResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EggHarvestResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EggHarvestResponseCopyWith<EggHarvestResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EggHarvestResponseCopyWith<$Res> {
  factory $EggHarvestResponseCopyWith(
          EggHarvestResponse value, $Res Function(EggHarvestResponse) then) =
      _$EggHarvestResponseCopyWithImpl<$Res, EggHarvestResponse>;
  @useResult
  $Res call({bool success, List<EggHarvestDto> result});
}

/// @nodoc
class _$EggHarvestResponseCopyWithImpl<$Res, $Val extends EggHarvestResponse>
    implements $EggHarvestResponseCopyWith<$Res> {
  _$EggHarvestResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EggHarvestResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<EggHarvestDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EggHarvestResponseImplCopyWith<$Res>
    implements $EggHarvestResponseCopyWith<$Res> {
  factory _$$EggHarvestResponseImplCopyWith(_$EggHarvestResponseImpl value,
          $Res Function(_$EggHarvestResponseImpl) then) =
      __$$EggHarvestResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<EggHarvestDto> result});
}

/// @nodoc
class __$$EggHarvestResponseImplCopyWithImpl<$Res>
    extends _$EggHarvestResponseCopyWithImpl<$Res, _$EggHarvestResponseImpl>
    implements _$$EggHarvestResponseImplCopyWith<$Res> {
  __$$EggHarvestResponseImplCopyWithImpl(_$EggHarvestResponseImpl _value,
      $Res Function(_$EggHarvestResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of EggHarvestResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? result = null,
  }) {
    return _then(_$EggHarvestResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<EggHarvestDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EggHarvestResponseImpl implements _EggHarvestResponse {
  _$EggHarvestResponseImpl(
      {required this.success, required final List<EggHarvestDto> result})
      : _result = result;

  factory _$EggHarvestResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EggHarvestResponseImplFromJson(json);

  @override
  final bool success;
  final List<EggHarvestDto> _result;
  @override
  List<EggHarvestDto> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'EggHarvestResponse(success: $success, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EggHarvestResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, const DeepCollectionEquality().hash(_result));

  /// Create a copy of EggHarvestResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EggHarvestResponseImplCopyWith<_$EggHarvestResponseImpl> get copyWith =>
      __$$EggHarvestResponseImplCopyWithImpl<_$EggHarvestResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EggHarvestResponseImplToJson(
      this,
    );
  }
}

abstract class _EggHarvestResponse implements EggHarvestResponse {
  factory _EggHarvestResponse(
      {required final bool success,
      required final List<EggHarvestDto> result}) = _$EggHarvestResponseImpl;

  factory _EggHarvestResponse.fromJson(Map<String, dynamic> json) =
      _$EggHarvestResponseImpl.fromJson;

  @override
  bool get success;
  @override
  List<EggHarvestDto> get result;

  /// Create a copy of EggHarvestResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EggHarvestResponseImplCopyWith<_$EggHarvestResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
