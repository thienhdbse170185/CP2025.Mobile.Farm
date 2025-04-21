// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_type_by_name_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SaleTypeByNameResponse _$SaleTypeByNameResponseFromJson(
    Map<String, dynamic> json) {
  return _SaleTypeByNameResponse.fromJson(json);
}

/// @nodoc
mixin _$SaleTypeByNameResponse {
  bool get success => throw _privateConstructorUsedError;
  SaleTypeByNameResult get result => throw _privateConstructorUsedError;

  /// Serializes this SaleTypeByNameResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaleTypeByNameResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaleTypeByNameResponseCopyWith<SaleTypeByNameResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleTypeByNameResponseCopyWith<$Res> {
  factory $SaleTypeByNameResponseCopyWith(SaleTypeByNameResponse value,
          $Res Function(SaleTypeByNameResponse) then) =
      _$SaleTypeByNameResponseCopyWithImpl<$Res, SaleTypeByNameResponse>;
  @useResult
  $Res call({bool success, SaleTypeByNameResult result});

  $SaleTypeByNameResultCopyWith<$Res> get result;
}

/// @nodoc
class _$SaleTypeByNameResponseCopyWithImpl<$Res,
        $Val extends SaleTypeByNameResponse>
    implements $SaleTypeByNameResponseCopyWith<$Res> {
  _$SaleTypeByNameResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaleTypeByNameResponse
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
              as SaleTypeByNameResult,
    ) as $Val);
  }

  /// Create a copy of SaleTypeByNameResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SaleTypeByNameResultCopyWith<$Res> get result {
    return $SaleTypeByNameResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SaleTypeByNameResponseImplCopyWith<$Res>
    implements $SaleTypeByNameResponseCopyWith<$Res> {
  factory _$$SaleTypeByNameResponseImplCopyWith(
          _$SaleTypeByNameResponseImpl value,
          $Res Function(_$SaleTypeByNameResponseImpl) then) =
      __$$SaleTypeByNameResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, SaleTypeByNameResult result});

  @override
  $SaleTypeByNameResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$SaleTypeByNameResponseImplCopyWithImpl<$Res>
    extends _$SaleTypeByNameResponseCopyWithImpl<$Res,
        _$SaleTypeByNameResponseImpl>
    implements _$$SaleTypeByNameResponseImplCopyWith<$Res> {
  __$$SaleTypeByNameResponseImplCopyWithImpl(
      _$SaleTypeByNameResponseImpl _value,
      $Res Function(_$SaleTypeByNameResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaleTypeByNameResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? result = null,
  }) {
    return _then(_$SaleTypeByNameResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as SaleTypeByNameResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaleTypeByNameResponseImpl implements _SaleTypeByNameResponse {
  const _$SaleTypeByNameResponseImpl(
      {required this.success, required this.result});

  factory _$SaleTypeByNameResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaleTypeByNameResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final SaleTypeByNameResult result;

  @override
  String toString() {
    return 'SaleTypeByNameResponse(success: $success, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleTypeByNameResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, result);

  /// Create a copy of SaleTypeByNameResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleTypeByNameResponseImplCopyWith<_$SaleTypeByNameResponseImpl>
      get copyWith => __$$SaleTypeByNameResponseImplCopyWithImpl<
          _$SaleTypeByNameResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaleTypeByNameResponseImplToJson(
      this,
    );
  }
}

abstract class _SaleTypeByNameResponse implements SaleTypeByNameResponse {
  const factory _SaleTypeByNameResponse(
          {required final bool success,
          required final SaleTypeByNameResult result}) =
      _$SaleTypeByNameResponseImpl;

  factory _SaleTypeByNameResponse.fromJson(Map<String, dynamic> json) =
      _$SaleTypeByNameResponseImpl.fromJson;

  @override
  bool get success;
  @override
  SaleTypeByNameResult get result;

  /// Create a copy of SaleTypeByNameResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaleTypeByNameResponseImplCopyWith<_$SaleTypeByNameResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SaleTypeByNameResult _$SaleTypeByNameResultFromJson(Map<String, dynamic> json) {
  return _SaleTypeByNameResult.fromJson(json);
}

/// @nodoc
mixin _$SaleTypeByNameResult {
  List<SaleTypeDto> get items => throw _privateConstructorUsedError;
  int get totalItems => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;
  bool get hasPreviousPage => throw _privateConstructorUsedError;

  /// Serializes this SaleTypeByNameResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaleTypeByNameResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaleTypeByNameResultCopyWith<SaleTypeByNameResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleTypeByNameResultCopyWith<$Res> {
  factory $SaleTypeByNameResultCopyWith(SaleTypeByNameResult value,
          $Res Function(SaleTypeByNameResult) then) =
      _$SaleTypeByNameResultCopyWithImpl<$Res, SaleTypeByNameResult>;
  @useResult
  $Res call(
      {List<SaleTypeDto> items,
      int totalItems,
      int totalPages,
      int currentPage,
      int pageSize,
      bool hasNextPage,
      bool hasPreviousPage});
}

/// @nodoc
class _$SaleTypeByNameResultCopyWithImpl<$Res,
        $Val extends SaleTypeByNameResult>
    implements $SaleTypeByNameResultCopyWith<$Res> {
  _$SaleTypeByNameResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaleTypeByNameResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalItems = null,
    Object? totalPages = null,
    Object? currentPage = null,
    Object? pageSize = null,
    Object? hasNextPage = null,
    Object? hasPreviousPage = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SaleTypeDto>,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPreviousPage: null == hasPreviousPage
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaleTypeByNameResultImplCopyWith<$Res>
    implements $SaleTypeByNameResultCopyWith<$Res> {
  factory _$$SaleTypeByNameResultImplCopyWith(_$SaleTypeByNameResultImpl value,
          $Res Function(_$SaleTypeByNameResultImpl) then) =
      __$$SaleTypeByNameResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SaleTypeDto> items,
      int totalItems,
      int totalPages,
      int currentPage,
      int pageSize,
      bool hasNextPage,
      bool hasPreviousPage});
}

/// @nodoc
class __$$SaleTypeByNameResultImplCopyWithImpl<$Res>
    extends _$SaleTypeByNameResultCopyWithImpl<$Res, _$SaleTypeByNameResultImpl>
    implements _$$SaleTypeByNameResultImplCopyWith<$Res> {
  __$$SaleTypeByNameResultImplCopyWithImpl(_$SaleTypeByNameResultImpl _value,
      $Res Function(_$SaleTypeByNameResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaleTypeByNameResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalItems = null,
    Object? totalPages = null,
    Object? currentPage = null,
    Object? pageSize = null,
    Object? hasNextPage = null,
    Object? hasPreviousPage = null,
  }) {
    return _then(_$SaleTypeByNameResultImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SaleTypeDto>,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPreviousPage: null == hasPreviousPage
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaleTypeByNameResultImpl implements _SaleTypeByNameResult {
  const _$SaleTypeByNameResultImpl(
      {required final List<SaleTypeDto> items,
      required this.totalItems,
      required this.totalPages,
      required this.currentPage,
      required this.pageSize,
      required this.hasNextPage,
      required this.hasPreviousPage})
      : _items = items;

  factory _$SaleTypeByNameResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaleTypeByNameResultImplFromJson(json);

  final List<SaleTypeDto> _items;
  @override
  List<SaleTypeDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int totalItems;
  @override
  final int totalPages;
  @override
  final int currentPage;
  @override
  final int pageSize;
  @override
  final bool hasNextPage;
  @override
  final bool hasPreviousPage;

  @override
  String toString() {
    return 'SaleTypeByNameResult(items: $items, totalItems: $totalItems, totalPages: $totalPages, currentPage: $currentPage, pageSize: $pageSize, hasNextPage: $hasNextPage, hasPreviousPage: $hasPreviousPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleTypeByNameResultImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            (identical(other.hasPreviousPage, hasPreviousPage) ||
                other.hasPreviousPage == hasPreviousPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      totalItems,
      totalPages,
      currentPage,
      pageSize,
      hasNextPage,
      hasPreviousPage);

  /// Create a copy of SaleTypeByNameResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleTypeByNameResultImplCopyWith<_$SaleTypeByNameResultImpl>
      get copyWith =>
          __$$SaleTypeByNameResultImplCopyWithImpl<_$SaleTypeByNameResultImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaleTypeByNameResultImplToJson(
      this,
    );
  }
}

abstract class _SaleTypeByNameResult implements SaleTypeByNameResult {
  const factory _SaleTypeByNameResult(
      {required final List<SaleTypeDto> items,
      required final int totalItems,
      required final int totalPages,
      required final int currentPage,
      required final int pageSize,
      required final bool hasNextPage,
      required final bool hasPreviousPage}) = _$SaleTypeByNameResultImpl;

  factory _SaleTypeByNameResult.fromJson(Map<String, dynamic> json) =
      _$SaleTypeByNameResultImpl.fromJson;

  @override
  List<SaleTypeDto> get items;
  @override
  int get totalItems;
  @override
  int get totalPages;
  @override
  int get currentPage;
  @override
  int get pageSize;
  @override
  bool get hasNextPage;
  @override
  bool get hasPreviousPage;

  /// Create a copy of SaleTypeByNameResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaleTypeByNameResultImplCopyWith<_$SaleTypeByNameResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
