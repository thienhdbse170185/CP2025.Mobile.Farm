// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetTaskResponse _$GetTaskResponseFromJson(Map<String, dynamic> json) {
  return _GetTaskResponse.fromJson(json);
}

/// @nodoc
mixin _$GetTaskResponse {
  bool get success => throw _privateConstructorUsedError;
  GetTaskResponseResult get result => throw _privateConstructorUsedError;

  /// Serializes this GetTaskResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetTaskResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetTaskResponseCopyWith<GetTaskResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTaskResponseCopyWith<$Res> {
  factory $GetTaskResponseCopyWith(
          GetTaskResponse value, $Res Function(GetTaskResponse) then) =
      _$GetTaskResponseCopyWithImpl<$Res, GetTaskResponse>;
  @useResult
  $Res call({bool success, GetTaskResponseResult result});

  $GetTaskResponseResultCopyWith<$Res> get result;
}

/// @nodoc
class _$GetTaskResponseCopyWithImpl<$Res, $Val extends GetTaskResponse>
    implements $GetTaskResponseCopyWith<$Res> {
  _$GetTaskResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetTaskResponse
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
              as GetTaskResponseResult,
    ) as $Val);
  }

  /// Create a copy of GetTaskResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetTaskResponseResultCopyWith<$Res> get result {
    return $GetTaskResponseResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetTaskResponseImplCopyWith<$Res>
    implements $GetTaskResponseCopyWith<$Res> {
  factory _$$GetTaskResponseImplCopyWith(_$GetTaskResponseImpl value,
          $Res Function(_$GetTaskResponseImpl) then) =
      __$$GetTaskResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, GetTaskResponseResult result});

  @override
  $GetTaskResponseResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$GetTaskResponseImplCopyWithImpl<$Res>
    extends _$GetTaskResponseCopyWithImpl<$Res, _$GetTaskResponseImpl>
    implements _$$GetTaskResponseImplCopyWith<$Res> {
  __$$GetTaskResponseImplCopyWithImpl(
      _$GetTaskResponseImpl _value, $Res Function(_$GetTaskResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetTaskResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? result = null,
  }) {
    return _then(_$GetTaskResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as GetTaskResponseResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetTaskResponseImpl implements _GetTaskResponse {
  const _$GetTaskResponseImpl({required this.success, required this.result});

  factory _$GetTaskResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetTaskResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final GetTaskResponseResult result;

  @override
  String toString() {
    return 'GetTaskResponse(success: $success, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTaskResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, result);

  /// Create a copy of GetTaskResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTaskResponseImplCopyWith<_$GetTaskResponseImpl> get copyWith =>
      __$$GetTaskResponseImplCopyWithImpl<_$GetTaskResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetTaskResponseImplToJson(
      this,
    );
  }
}

abstract class _GetTaskResponse implements GetTaskResponse {
  const factory _GetTaskResponse(
      {required final bool success,
      required final GetTaskResponseResult result}) = _$GetTaskResponseImpl;

  factory _GetTaskResponse.fromJson(Map<String, dynamic> json) =
      _$GetTaskResponseImpl.fromJson;

  @override
  bool get success;
  @override
  GetTaskResponseResult get result;

  /// Create a copy of GetTaskResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTaskResponseImplCopyWith<_$GetTaskResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetTaskResponseResult _$GetTaskResponseResultFromJson(
    Map<String, dynamic> json) {
  return _GetTaskResponseResult.fromJson(json);
}

/// @nodoc
mixin _$GetTaskResponseResult {
  List<TaskHaveCageName> get items => throw _privateConstructorUsedError;

  /// Serializes this GetTaskResponseResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetTaskResponseResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetTaskResponseResultCopyWith<GetTaskResponseResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTaskResponseResultCopyWith<$Res> {
  factory $GetTaskResponseResultCopyWith(GetTaskResponseResult value,
          $Res Function(GetTaskResponseResult) then) =
      _$GetTaskResponseResultCopyWithImpl<$Res, GetTaskResponseResult>;
  @useResult
  $Res call({List<TaskHaveCageName> items});
}

/// @nodoc
class _$GetTaskResponseResultCopyWithImpl<$Res,
        $Val extends GetTaskResponseResult>
    implements $GetTaskResponseResultCopyWith<$Res> {
  _$GetTaskResponseResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetTaskResponseResult
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
              as List<TaskHaveCageName>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetTaskResponseResultImplCopyWith<$Res>
    implements $GetTaskResponseResultCopyWith<$Res> {
  factory _$$GetTaskResponseResultImplCopyWith(
          _$GetTaskResponseResultImpl value,
          $Res Function(_$GetTaskResponseResultImpl) then) =
      __$$GetTaskResponseResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TaskHaveCageName> items});
}

/// @nodoc
class __$$GetTaskResponseResultImplCopyWithImpl<$Res>
    extends _$GetTaskResponseResultCopyWithImpl<$Res,
        _$GetTaskResponseResultImpl>
    implements _$$GetTaskResponseResultImplCopyWith<$Res> {
  __$$GetTaskResponseResultImplCopyWithImpl(_$GetTaskResponseResultImpl _value,
      $Res Function(_$GetTaskResponseResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetTaskResponseResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$GetTaskResponseResultImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TaskHaveCageName>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetTaskResponseResultImpl implements _GetTaskResponseResult {
  const _$GetTaskResponseResultImpl(
      {required final List<TaskHaveCageName> items})
      : _items = items;

  factory _$GetTaskResponseResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetTaskResponseResultImplFromJson(json);

  final List<TaskHaveCageName> _items;
  @override
  List<TaskHaveCageName> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'GetTaskResponseResult(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTaskResponseResultImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of GetTaskResponseResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTaskResponseResultImplCopyWith<_$GetTaskResponseResultImpl>
      get copyWith => __$$GetTaskResponseResultImplCopyWithImpl<
          _$GetTaskResponseResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetTaskResponseResultImplToJson(
      this,
    );
  }
}

abstract class _GetTaskResponseResult implements GetTaskResponseResult {
  const factory _GetTaskResponseResult(
          {required final List<TaskHaveCageName> items}) =
      _$GetTaskResponseResultImpl;

  factory _GetTaskResponseResult.fromJson(Map<String, dynamic> json) =
      _$GetTaskResponseResultImpl.fromJson;

  @override
  List<TaskHaveCageName> get items;

  /// Create a copy of GetTaskResponseResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTaskResponseResultImplCopyWith<_$GetTaskResponseResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
