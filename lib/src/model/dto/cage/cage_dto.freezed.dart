// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cage_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CageDto _$CageDtoFromJson(Map<String, dynamic> json) {
  return _CageDto.fromJson(json);
}

/// @nodoc
mixin _$CageDto {
  String get cageId => throw _privateConstructorUsedError;
  String get cageName => throw _privateConstructorUsedError;
  List<Task> get tasks => throw _privateConstructorUsedError;

  /// Serializes this CageDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CageDtoCopyWith<CageDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CageDtoCopyWith<$Res> {
  factory $CageDtoCopyWith(CageDto value, $Res Function(CageDto) then) =
      _$CageDtoCopyWithImpl<$Res, CageDto>;
  @useResult
  $Res call({String cageId, String cageName, List<Task> tasks});
}

/// @nodoc
class _$CageDtoCopyWithImpl<$Res, $Val extends CageDto>
    implements $CageDtoCopyWith<$Res> {
  _$CageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cageId = null,
    Object? cageName = null,
    Object? tasks = null,
  }) {
    return _then(_value.copyWith(
      cageId: null == cageId
          ? _value.cageId
          : cageId // ignore: cast_nullable_to_non_nullable
              as String,
      cageName: null == cageName
          ? _value.cageName
          : cageName // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CageDtoImplCopyWith<$Res> implements $CageDtoCopyWith<$Res> {
  factory _$$CageDtoImplCopyWith(
          _$CageDtoImpl value, $Res Function(_$CageDtoImpl) then) =
      __$$CageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cageId, String cageName, List<Task> tasks});
}

/// @nodoc
class __$$CageDtoImplCopyWithImpl<$Res>
    extends _$CageDtoCopyWithImpl<$Res, _$CageDtoImpl>
    implements _$$CageDtoImplCopyWith<$Res> {
  __$$CageDtoImplCopyWithImpl(
      _$CageDtoImpl _value, $Res Function(_$CageDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cageId = null,
    Object? cageName = null,
    Object? tasks = null,
  }) {
    return _then(_$CageDtoImpl(
      cageId: null == cageId
          ? _value.cageId
          : cageId // ignore: cast_nullable_to_non_nullable
              as String,
      cageName: null == cageName
          ? _value.cageName
          : cageName // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CageDtoImpl implements _CageDto {
  const _$CageDtoImpl(
      {required this.cageId,
      required this.cageName,
      required final List<Task> tasks})
      : _tasks = tasks;

  factory _$CageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CageDtoImplFromJson(json);

  @override
  final String cageId;
  @override
  final String cageName;
  final List<Task> _tasks;
  @override
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'CageDto(cageId: $cageId, cageName: $cageName, tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CageDtoImpl &&
            (identical(other.cageId, cageId) || other.cageId == cageId) &&
            (identical(other.cageName, cageName) ||
                other.cageName == cageName) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cageId, cageName,
      const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of CageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CageDtoImplCopyWith<_$CageDtoImpl> get copyWith =>
      __$$CageDtoImplCopyWithImpl<_$CageDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CageDtoImplToJson(
      this,
    );
  }
}

abstract class _CageDto implements CageDto {
  const factory _CageDto(
      {required final String cageId,
      required final String cageName,
      required final List<Task> tasks}) = _$CageDtoImpl;

  factory _CageDto.fromJson(Map<String, dynamic> json) = _$CageDtoImpl.fromJson;

  @override
  String get cageId;
  @override
  String get cageName;
  @override
  List<Task> get tasks;

  /// Create a copy of CageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CageDtoImplCopyWith<_$CageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
