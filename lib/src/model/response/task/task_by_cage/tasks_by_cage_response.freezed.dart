// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_by_cage_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TasksByCageResponse _$TasksByCageResponseFromJson(Map<String, dynamic> json) {
  return _TasksByCageResponse.fromJson(json);
}

/// @nodoc
mixin _$TasksByCageResponse {
  List<Task> get items => throw _privateConstructorUsedError;
  int get totalItems => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;
  bool get hasPreviousPage => throw _privateConstructorUsedError;

  /// Serializes this TasksByCageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TasksByCageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TasksByCageResponseCopyWith<TasksByCageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksByCageResponseCopyWith<$Res> {
  factory $TasksByCageResponseCopyWith(
          TasksByCageResponse value, $Res Function(TasksByCageResponse) then) =
      _$TasksByCageResponseCopyWithImpl<$Res, TasksByCageResponse>;
  @useResult
  $Res call(
      {List<Task> items,
      int totalItems,
      int totalPages,
      int currentPage,
      int pageSize,
      bool hasNextPage,
      bool hasPreviousPage});
}

/// @nodoc
class _$TasksByCageResponseCopyWithImpl<$Res, $Val extends TasksByCageResponse>
    implements $TasksByCageResponseCopyWith<$Res> {
  _$TasksByCageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TasksByCageResponse
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
              as List<Task>,
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
abstract class _$$TasksByCageResponseImplCopyWith<$Res>
    implements $TasksByCageResponseCopyWith<$Res> {
  factory _$$TasksByCageResponseImplCopyWith(_$TasksByCageResponseImpl value,
          $Res Function(_$TasksByCageResponseImpl) then) =
      __$$TasksByCageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Task> items,
      int totalItems,
      int totalPages,
      int currentPage,
      int pageSize,
      bool hasNextPage,
      bool hasPreviousPage});
}

/// @nodoc
class __$$TasksByCageResponseImplCopyWithImpl<$Res>
    extends _$TasksByCageResponseCopyWithImpl<$Res, _$TasksByCageResponseImpl>
    implements _$$TasksByCageResponseImplCopyWith<$Res> {
  __$$TasksByCageResponseImplCopyWithImpl(_$TasksByCageResponseImpl _value,
      $Res Function(_$TasksByCageResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TasksByCageResponse
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
    return _then(_$TasksByCageResponseImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Task>,
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
class _$TasksByCageResponseImpl implements _TasksByCageResponse {
  const _$TasksByCageResponseImpl(
      {required final List<Task> items,
      required this.totalItems,
      required this.totalPages,
      required this.currentPage,
      required this.pageSize,
      required this.hasNextPage,
      required this.hasPreviousPage})
      : _items = items;

  factory _$TasksByCageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TasksByCageResponseImplFromJson(json);

  final List<Task> _items;
  @override
  List<Task> get items {
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
    return 'TasksByCageResponse(items: $items, totalItems: $totalItems, totalPages: $totalPages, currentPage: $currentPage, pageSize: $pageSize, hasNextPage: $hasNextPage, hasPreviousPage: $hasPreviousPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksByCageResponseImpl &&
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

  /// Create a copy of TasksByCageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksByCageResponseImplCopyWith<_$TasksByCageResponseImpl> get copyWith =>
      __$$TasksByCageResponseImplCopyWithImpl<_$TasksByCageResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TasksByCageResponseImplToJson(
      this,
    );
  }
}

abstract class _TasksByCageResponse implements TasksByCageResponse {
  const factory _TasksByCageResponse(
      {required final List<Task> items,
      required final int totalItems,
      required final int totalPages,
      required final int currentPage,
      required final int pageSize,
      required final bool hasNextPage,
      required final bool hasPreviousPage}) = _$TasksByCageResponseImpl;

  factory _TasksByCageResponse.fromJson(Map<String, dynamic> json) =
      _$TasksByCageResponseImpl.fromJson;

  @override
  List<Task> get items;
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

  /// Create a copy of TasksByCageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TasksByCageResponseImplCopyWith<_$TasksByCageResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
