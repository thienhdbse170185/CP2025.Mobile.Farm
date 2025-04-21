// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_detail_log_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SaleDetailLogDto _$SaleDetailLogDtoFromJson(Map<String, dynamic> json) {
  return _SaleDetailLogDto.fromJson(json);
}

/// @nodoc
mixin _$SaleDetailLogDto {
  String get saleDate => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get unitPrice => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this SaleDetailLogDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaleDetailLogDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaleDetailLogDtoCopyWith<SaleDetailLogDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleDetailLogDtoCopyWith<$Res> {
  factory $SaleDetailLogDtoCopyWith(
          SaleDetailLogDto value, $Res Function(SaleDetailLogDto) then) =
      _$SaleDetailLogDtoCopyWithImpl<$Res, SaleDetailLogDto>;
  @useResult
  $Res call({String saleDate, int quantity, int unitPrice, int total});
}

/// @nodoc
class _$SaleDetailLogDtoCopyWithImpl<$Res, $Val extends SaleDetailLogDto>
    implements $SaleDetailLogDtoCopyWith<$Res> {
  _$SaleDetailLogDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaleDetailLogDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleDate = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      saleDate: null == saleDate
          ? _value.saleDate
          : saleDate // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaleDetailLogDtoImplCopyWith<$Res>
    implements $SaleDetailLogDtoCopyWith<$Res> {
  factory _$$SaleDetailLogDtoImplCopyWith(_$SaleDetailLogDtoImpl value,
          $Res Function(_$SaleDetailLogDtoImpl) then) =
      __$$SaleDetailLogDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String saleDate, int quantity, int unitPrice, int total});
}

/// @nodoc
class __$$SaleDetailLogDtoImplCopyWithImpl<$Res>
    extends _$SaleDetailLogDtoCopyWithImpl<$Res, _$SaleDetailLogDtoImpl>
    implements _$$SaleDetailLogDtoImplCopyWith<$Res> {
  __$$SaleDetailLogDtoImplCopyWithImpl(_$SaleDetailLogDtoImpl _value,
      $Res Function(_$SaleDetailLogDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaleDetailLogDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleDate = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? total = null,
  }) {
    return _then(_$SaleDetailLogDtoImpl(
      saleDate: null == saleDate
          ? _value.saleDate
          : saleDate // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaleDetailLogDtoImpl implements _SaleDetailLogDto {
  _$SaleDetailLogDtoImpl(
      {required this.saleDate,
      required this.quantity,
      required this.unitPrice,
      required this.total});

  factory _$SaleDetailLogDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaleDetailLogDtoImplFromJson(json);

  @override
  final String saleDate;
  @override
  final int quantity;
  @override
  final int unitPrice;
  @override
  final int total;

  @override
  String toString() {
    return 'SaleDetailLogDto(saleDate: $saleDate, quantity: $quantity, unitPrice: $unitPrice, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleDetailLogDtoImpl &&
            (identical(other.saleDate, saleDate) ||
                other.saleDate == saleDate) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, saleDate, quantity, unitPrice, total);

  /// Create a copy of SaleDetailLogDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleDetailLogDtoImplCopyWith<_$SaleDetailLogDtoImpl> get copyWith =>
      __$$SaleDetailLogDtoImplCopyWithImpl<_$SaleDetailLogDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaleDetailLogDtoImplToJson(
      this,
    );
  }
}

abstract class _SaleDetailLogDto implements SaleDetailLogDto {
  factory _SaleDetailLogDto(
      {required final String saleDate,
      required final int quantity,
      required final int unitPrice,
      required final int total}) = _$SaleDetailLogDtoImpl;

  factory _SaleDetailLogDto.fromJson(Map<String, dynamic> json) =
      _$SaleDetailLogDtoImpl.fromJson;

  @override
  String get saleDate;
  @override
  int get quantity;
  @override
  int get unitPrice;
  @override
  int get total;

  /// Create a copy of SaleDetailLogDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaleDetailLogDtoImplCopyWith<_$SaleDetailLogDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
