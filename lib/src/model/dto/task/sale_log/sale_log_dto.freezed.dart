// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_log_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SaleLogDto _$SaleLogDtoFromJson(Map<String, dynamic> json) {
  return _SaleLogDto.fromJson(json);
}

/// @nodoc
mixin _$SaleLogDto {
  String get saleType => throw _privateConstructorUsedError;
  int get totalQuantity => throw _privateConstructorUsedError;
  int get totalRevenue => throw _privateConstructorUsedError;
  int get unitPriceAverage => throw _privateConstructorUsedError;
  List<SaleDetailLogDto> get logs => throw _privateConstructorUsedError;

  /// Serializes this SaleLogDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaleLogDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaleLogDtoCopyWith<SaleLogDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleLogDtoCopyWith<$Res> {
  factory $SaleLogDtoCopyWith(
          SaleLogDto value, $Res Function(SaleLogDto) then) =
      _$SaleLogDtoCopyWithImpl<$Res, SaleLogDto>;
  @useResult
  $Res call(
      {String saleType,
      int totalQuantity,
      int totalRevenue,
      int unitPriceAverage,
      List<SaleDetailLogDto> logs});
}

/// @nodoc
class _$SaleLogDtoCopyWithImpl<$Res, $Val extends SaleLogDto>
    implements $SaleLogDtoCopyWith<$Res> {
  _$SaleLogDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaleLogDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleType = null,
    Object? totalQuantity = null,
    Object? totalRevenue = null,
    Object? unitPriceAverage = null,
    Object? logs = null,
  }) {
    return _then(_value.copyWith(
      saleType: null == saleType
          ? _value.saleType
          : saleType // ignore: cast_nullable_to_non_nullable
              as String,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as int,
      unitPriceAverage: null == unitPriceAverage
          ? _value.unitPriceAverage
          : unitPriceAverage // ignore: cast_nullable_to_non_nullable
              as int,
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<SaleDetailLogDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaleLogDtoImplCopyWith<$Res>
    implements $SaleLogDtoCopyWith<$Res> {
  factory _$$SaleLogDtoImplCopyWith(
          _$SaleLogDtoImpl value, $Res Function(_$SaleLogDtoImpl) then) =
      __$$SaleLogDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String saleType,
      int totalQuantity,
      int totalRevenue,
      int unitPriceAverage,
      List<SaleDetailLogDto> logs});
}

/// @nodoc
class __$$SaleLogDtoImplCopyWithImpl<$Res>
    extends _$SaleLogDtoCopyWithImpl<$Res, _$SaleLogDtoImpl>
    implements _$$SaleLogDtoImplCopyWith<$Res> {
  __$$SaleLogDtoImplCopyWithImpl(
      _$SaleLogDtoImpl _value, $Res Function(_$SaleLogDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaleLogDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleType = null,
    Object? totalQuantity = null,
    Object? totalRevenue = null,
    Object? unitPriceAverage = null,
    Object? logs = null,
  }) {
    return _then(_$SaleLogDtoImpl(
      saleType: null == saleType
          ? _value.saleType
          : saleType // ignore: cast_nullable_to_non_nullable
              as String,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalRevenue: null == totalRevenue
          ? _value.totalRevenue
          : totalRevenue // ignore: cast_nullable_to_non_nullable
              as int,
      unitPriceAverage: null == unitPriceAverage
          ? _value.unitPriceAverage
          : unitPriceAverage // ignore: cast_nullable_to_non_nullable
              as int,
      logs: null == logs
          ? _value._logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<SaleDetailLogDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaleLogDtoImpl implements _SaleLogDto {
  _$SaleLogDtoImpl(
      {required this.saleType,
      required this.totalQuantity,
      required this.totalRevenue,
      required this.unitPriceAverage,
      required final List<SaleDetailLogDto> logs})
      : _logs = logs;

  factory _$SaleLogDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaleLogDtoImplFromJson(json);

  @override
  final String saleType;
  @override
  final int totalQuantity;
  @override
  final int totalRevenue;
  @override
  final int unitPriceAverage;
  final List<SaleDetailLogDto> _logs;
  @override
  List<SaleDetailLogDto> get logs {
    if (_logs is EqualUnmodifiableListView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logs);
  }

  @override
  String toString() {
    return 'SaleLogDto(saleType: $saleType, totalQuantity: $totalQuantity, totalRevenue: $totalRevenue, unitPriceAverage: $unitPriceAverage, logs: $logs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleLogDtoImpl &&
            (identical(other.saleType, saleType) ||
                other.saleType == saleType) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.unitPriceAverage, unitPriceAverage) ||
                other.unitPriceAverage == unitPriceAverage) &&
            const DeepCollectionEquality().equals(other._logs, _logs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      saleType,
      totalQuantity,
      totalRevenue,
      unitPriceAverage,
      const DeepCollectionEquality().hash(_logs));

  /// Create a copy of SaleLogDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleLogDtoImplCopyWith<_$SaleLogDtoImpl> get copyWith =>
      __$$SaleLogDtoImplCopyWithImpl<_$SaleLogDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaleLogDtoImplToJson(
      this,
    );
  }
}

abstract class _SaleLogDto implements SaleLogDto {
  factory _SaleLogDto(
      {required final String saleType,
      required final int totalQuantity,
      required final int totalRevenue,
      required final int unitPriceAverage,
      required final List<SaleDetailLogDto> logs}) = _$SaleLogDtoImpl;

  factory _SaleLogDto.fromJson(Map<String, dynamic> json) =
      _$SaleLogDtoImpl.fromJson;

  @override
  String get saleType;
  @override
  int get totalQuantity;
  @override
  int get totalRevenue;
  @override
  int get unitPriceAverage;
  @override
  List<SaleDetailLogDto> get logs;

  /// Create a copy of SaleLogDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaleLogDtoImplCopyWith<_$SaleLogDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
