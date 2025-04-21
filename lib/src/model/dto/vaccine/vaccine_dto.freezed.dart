// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vaccine_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VaccineDto _$VaccineDtoFromJson(Map<String, dynamic> json) {
  return _VaccineDto.fromJson(json);
}

/// @nodoc
mixin _$VaccineDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get ageStart => throw _privateConstructorUsedError;
  int get ageEnd => throw _privateConstructorUsedError;

  /// Serializes this VaccineDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VaccineDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaccineDtoCopyWith<VaccineDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccineDtoCopyWith<$Res> {
  factory $VaccineDtoCopyWith(
          VaccineDto value, $Res Function(VaccineDto) then) =
      _$VaccineDtoCopyWithImpl<$Res, VaccineDto>;
  @useResult
  $Res call(
      {String id,
      String name,
      String method,
      int price,
      int ageStart,
      int ageEnd});
}

/// @nodoc
class _$VaccineDtoCopyWithImpl<$Res, $Val extends VaccineDto>
    implements $VaccineDtoCopyWith<$Res> {
  _$VaccineDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaccineDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? method = null,
    Object? price = null,
    Object? ageStart = null,
    Object? ageEnd = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      ageStart: null == ageStart
          ? _value.ageStart
          : ageStart // ignore: cast_nullable_to_non_nullable
              as int,
      ageEnd: null == ageEnd
          ? _value.ageEnd
          : ageEnd // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VaccineDtoImplCopyWith<$Res>
    implements $VaccineDtoCopyWith<$Res> {
  factory _$$VaccineDtoImplCopyWith(
          _$VaccineDtoImpl value, $Res Function(_$VaccineDtoImpl) then) =
      __$$VaccineDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String method,
      int price,
      int ageStart,
      int ageEnd});
}

/// @nodoc
class __$$VaccineDtoImplCopyWithImpl<$Res>
    extends _$VaccineDtoCopyWithImpl<$Res, _$VaccineDtoImpl>
    implements _$$VaccineDtoImplCopyWith<$Res> {
  __$$VaccineDtoImplCopyWithImpl(
      _$VaccineDtoImpl _value, $Res Function(_$VaccineDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of VaccineDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? method = null,
    Object? price = null,
    Object? ageStart = null,
    Object? ageEnd = null,
  }) {
    return _then(_$VaccineDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      ageStart: null == ageStart
          ? _value.ageStart
          : ageStart // ignore: cast_nullable_to_non_nullable
              as int,
      ageEnd: null == ageEnd
          ? _value.ageEnd
          : ageEnd // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VaccineDtoImpl implements _VaccineDto {
  _$VaccineDtoImpl(
      {required this.id,
      required this.name,
      required this.method,
      required this.price,
      required this.ageStart,
      required this.ageEnd});

  factory _$VaccineDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VaccineDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String method;
  @override
  final int price;
  @override
  final int ageStart;
  @override
  final int ageEnd;

  @override
  String toString() {
    return 'VaccineDto(id: $id, name: $name, method: $method, price: $price, ageStart: $ageStart, ageEnd: $ageEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaccineDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.ageStart, ageStart) ||
                other.ageStart == ageStart) &&
            (identical(other.ageEnd, ageEnd) || other.ageEnd == ageEnd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, method, price, ageStart, ageEnd);

  /// Create a copy of VaccineDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaccineDtoImplCopyWith<_$VaccineDtoImpl> get copyWith =>
      __$$VaccineDtoImplCopyWithImpl<_$VaccineDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaccineDtoImplToJson(
      this,
    );
  }
}

abstract class _VaccineDto implements VaccineDto {
  factory _VaccineDto(
      {required final String id,
      required final String name,
      required final String method,
      required final int price,
      required final int ageStart,
      required final int ageEnd}) = _$VaccineDtoImpl;

  factory _VaccineDto.fromJson(Map<String, dynamic> json) =
      _$VaccineDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get method;
  @override
  int get price;
  @override
  int get ageStart;
  @override
  int get ageEnd;

  /// Create a copy of VaccineDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaccineDtoImplCopyWith<_$VaccineDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
