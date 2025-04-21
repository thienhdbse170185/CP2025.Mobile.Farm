// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'next_task_by_user_id_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NextTaskByUserIdResponse _$NextTaskByUserIdResponseFromJson(
    Map<String, dynamic> json) {
  return _NextTaskByUserIdResponse.fromJson(json);
}

/// @nodoc
mixin _$NextTaskByUserIdResponse {
  List<NextTask> get items => throw _privateConstructorUsedError;

  /// Serializes this NextTaskByUserIdResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NextTaskByUserIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NextTaskByUserIdResponseCopyWith<NextTaskByUserIdResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NextTaskByUserIdResponseCopyWith<$Res> {
  factory $NextTaskByUserIdResponseCopyWith(NextTaskByUserIdResponse value,
          $Res Function(NextTaskByUserIdResponse) then) =
      _$NextTaskByUserIdResponseCopyWithImpl<$Res, NextTaskByUserIdResponse>;
  @useResult
  $Res call({List<NextTask> items});
}

/// @nodoc
class _$NextTaskByUserIdResponseCopyWithImpl<$Res,
        $Val extends NextTaskByUserIdResponse>
    implements $NextTaskByUserIdResponseCopyWith<$Res> {
  _$NextTaskByUserIdResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NextTaskByUserIdResponse
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
              as List<NextTask>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NextTaskByUserIdResponseImplCopyWith<$Res>
    implements $NextTaskByUserIdResponseCopyWith<$Res> {
  factory _$$NextTaskByUserIdResponseImplCopyWith(
          _$NextTaskByUserIdResponseImpl value,
          $Res Function(_$NextTaskByUserIdResponseImpl) then) =
      __$$NextTaskByUserIdResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NextTask> items});
}

/// @nodoc
class __$$NextTaskByUserIdResponseImplCopyWithImpl<$Res>
    extends _$NextTaskByUserIdResponseCopyWithImpl<$Res,
        _$NextTaskByUserIdResponseImpl>
    implements _$$NextTaskByUserIdResponseImplCopyWith<$Res> {
  __$$NextTaskByUserIdResponseImplCopyWithImpl(
      _$NextTaskByUserIdResponseImpl _value,
      $Res Function(_$NextTaskByUserIdResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of NextTaskByUserIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$NextTaskByUserIdResponseImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NextTask>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NextTaskByUserIdResponseImpl implements _NextTaskByUserIdResponse {
  const _$NextTaskByUserIdResponseImpl({required final List<NextTask> items})
      : _items = items;

  factory _$NextTaskByUserIdResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NextTaskByUserIdResponseImplFromJson(json);

  final List<NextTask> _items;
  @override
  List<NextTask> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'NextTaskByUserIdResponse(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NextTaskByUserIdResponseImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of NextTaskByUserIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NextTaskByUserIdResponseImplCopyWith<_$NextTaskByUserIdResponseImpl>
      get copyWith => __$$NextTaskByUserIdResponseImplCopyWithImpl<
          _$NextTaskByUserIdResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NextTaskByUserIdResponseImplToJson(
      this,
    );
  }
}

abstract class _NextTaskByUserIdResponse implements NextTaskByUserIdResponse {
  const factory _NextTaskByUserIdResponse(
      {required final List<NextTask> items}) = _$NextTaskByUserIdResponseImpl;

  factory _NextTaskByUserIdResponse.fromJson(Map<String, dynamic> json) =
      _$NextTaskByUserIdResponseImpl.fromJson;

  @override
  List<NextTask> get items;

  /// Create a copy of NextTaskByUserIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NextTaskByUserIdResponseImplCopyWith<_$NextTaskByUserIdResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
