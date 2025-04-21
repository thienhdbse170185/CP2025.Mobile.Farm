// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_type_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SaleTypeDto _$SaleTypeDtoFromJson(Map<String, dynamic> json) {
  return _SaleTypeDto.fromJson(json);
}

/// @nodoc
mixin _$SaleTypeDto {
  String get id => throw _privateConstructorUsedError;
  String get stageTypeName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this SaleTypeDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaleTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaleTypeDtoCopyWith<SaleTypeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleTypeDtoCopyWith<$Res> {
  factory $SaleTypeDtoCopyWith(
          SaleTypeDto value, $Res Function(SaleTypeDto) then) =
      _$SaleTypeDtoCopyWithImpl<$Res, SaleTypeDto>;
  @useResult
  $Res call({String id, String stageTypeName, String description});
}

/// @nodoc
class _$SaleTypeDtoCopyWithImpl<$Res, $Val extends SaleTypeDto>
    implements $SaleTypeDtoCopyWith<$Res> {
  _$SaleTypeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaleTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stageTypeName = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stageTypeName: null == stageTypeName
          ? _value.stageTypeName
          : stageTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaleTypeDtoImplCopyWith<$Res>
    implements $SaleTypeDtoCopyWith<$Res> {
  factory _$$SaleTypeDtoImplCopyWith(
          _$SaleTypeDtoImpl value, $Res Function(_$SaleTypeDtoImpl) then) =
      __$$SaleTypeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String stageTypeName, String description});
}

/// @nodoc
class __$$SaleTypeDtoImplCopyWithImpl<$Res>
    extends _$SaleTypeDtoCopyWithImpl<$Res, _$SaleTypeDtoImpl>
    implements _$$SaleTypeDtoImplCopyWith<$Res> {
  __$$SaleTypeDtoImplCopyWithImpl(
      _$SaleTypeDtoImpl _value, $Res Function(_$SaleTypeDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaleTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stageTypeName = null,
    Object? description = null,
  }) {
    return _then(_$SaleTypeDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stageTypeName: null == stageTypeName
          ? _value.stageTypeName
          : stageTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaleTypeDtoImpl implements _SaleTypeDto {
  const _$SaleTypeDtoImpl(
      {required this.id,
      required this.stageTypeName,
      required this.description});

  factory _$SaleTypeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaleTypeDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String stageTypeName;
  @override
  final String description;

  @override
  String toString() {
    return 'SaleTypeDto(id: $id, stageTypeName: $stageTypeName, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleTypeDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stageTypeName, stageTypeName) ||
                other.stageTypeName == stageTypeName) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, stageTypeName, description);

  /// Create a copy of SaleTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleTypeDtoImplCopyWith<_$SaleTypeDtoImpl> get copyWith =>
      __$$SaleTypeDtoImplCopyWithImpl<_$SaleTypeDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaleTypeDtoImplToJson(
      this,
    );
  }
}

abstract class _SaleTypeDto implements SaleTypeDto {
  const factory _SaleTypeDto(
      {required final String id,
      required final String stageTypeName,
      required final String description}) = _$SaleTypeDtoImpl;

  factory _SaleTypeDto.fromJson(Map<String, dynamic> json) =
      _$SaleTypeDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get stageTypeName;
  @override
  String get description;

  /// Create a copy of SaleTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaleTypeDtoImplCopyWith<_$SaleTypeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
