// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_cage_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetAllCageResponse _$GetAllCageResponseFromJson(Map<String, dynamic> json) {
  return _GetAllCageResponse.fromJson(json);
}

/// @nodoc
mixin _$GetAllCageResponse {
  List<CageAdminDto> get items => throw _privateConstructorUsedError;

  /// Serializes this GetAllCageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetAllCageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAllCageResponseCopyWith<GetAllCageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllCageResponseCopyWith<$Res> {
  factory $GetAllCageResponseCopyWith(
          GetAllCageResponse value, $Res Function(GetAllCageResponse) then) =
      _$GetAllCageResponseCopyWithImpl<$Res, GetAllCageResponse>;
  @useResult
  $Res call({List<CageAdminDto> items});
}

/// @nodoc
class _$GetAllCageResponseCopyWithImpl<$Res, $Val extends GetAllCageResponse>
    implements $GetAllCageResponseCopyWith<$Res> {
  _$GetAllCageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllCageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CageAdminDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAllCageResponseImplCopyWith<$Res>
    implements $GetAllCageResponseCopyWith<$Res> {
  factory _$$GetAllCageResponseImplCopyWith(_$GetAllCageResponseImpl value,
          $Res Function(_$GetAllCageResponseImpl) then) =
      __$$GetAllCageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CageAdminDto> items});
}

/// @nodoc
class __$$GetAllCageResponseImplCopyWithImpl<$Res>
    extends _$GetAllCageResponseCopyWithImpl<$Res, _$GetAllCageResponseImpl>
    implements _$$GetAllCageResponseImplCopyWith<$Res> {
  __$$GetAllCageResponseImplCopyWithImpl(_$GetAllCageResponseImpl _value,
      $Res Function(_$GetAllCageResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllCageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$GetAllCageResponseImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CageAdminDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetAllCageResponseImpl implements _GetAllCageResponse {
  const _$GetAllCageResponseImpl({required final List<CageAdminDto> items})
      : _items = items;

  factory _$GetAllCageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetAllCageResponseImplFromJson(json);

  final List<CageAdminDto> _items;
  @override
  List<CageAdminDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'GetAllCageResponse(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllCageResponseImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of GetAllCageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllCageResponseImplCopyWith<_$GetAllCageResponseImpl> get copyWith =>
      __$$GetAllCageResponseImplCopyWithImpl<_$GetAllCageResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAllCageResponseImplToJson(
      this,
    );
  }
}

abstract class _GetAllCageResponse implements GetAllCageResponse {
  const factory _GetAllCageResponse({required final List<CageAdminDto> items}) =
      _$GetAllCageResponseImpl;

  factory _GetAllCageResponse.fromJson(Map<String, dynamic> json) =
      _$GetAllCageResponseImpl.fromJson;

  @override
  List<CageAdminDto> get items;

  /// Create a copy of GetAllCageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAllCageResponseImplCopyWith<_$GetAllCageResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
