// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_log_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HealthLogDto _$HealthLogDtoFromJson(Map<String, dynamic> json) {
  return _HealthLogDto.fromJson(json);
}

/// @nodoc
mixin _$HealthLogDto {
  String? get id => throw _privateConstructorUsedError;
  String? get prescriptionId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  String get taskId => throw _privateConstructorUsedError;

  /// Serializes this HealthLogDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthLogDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthLogDtoCopyWith<HealthLogDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthLogDtoCopyWith<$Res> {
  factory $HealthLogDtoCopyWith(
          HealthLogDto value, $Res Function(HealthLogDto) then) =
      _$HealthLogDtoCopyWithImpl<$Res, HealthLogDto>;
  @useResult
  $Res call(
      {String? id,
      String? prescriptionId,
      DateTime date,
      String notes,
      String? photo,
      String taskId});
}

/// @nodoc
class _$HealthLogDtoCopyWithImpl<$Res, $Val extends HealthLogDto>
    implements $HealthLogDtoCopyWith<$Res> {
  _$HealthLogDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthLogDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? prescriptionId = freezed,
    Object? date = null,
    Object? notes = null,
    Object? photo = freezed,
    Object? taskId = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      prescriptionId: freezed == prescriptionId
          ? _value.prescriptionId
          : prescriptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthLogDtoImplCopyWith<$Res>
    implements $HealthLogDtoCopyWith<$Res> {
  factory _$$HealthLogDtoImplCopyWith(
          _$HealthLogDtoImpl value, $Res Function(_$HealthLogDtoImpl) then) =
      __$$HealthLogDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? prescriptionId,
      DateTime date,
      String notes,
      String? photo,
      String taskId});
}

/// @nodoc
class __$$HealthLogDtoImplCopyWithImpl<$Res>
    extends _$HealthLogDtoCopyWithImpl<$Res, _$HealthLogDtoImpl>
    implements _$$HealthLogDtoImplCopyWith<$Res> {
  __$$HealthLogDtoImplCopyWithImpl(
      _$HealthLogDtoImpl _value, $Res Function(_$HealthLogDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of HealthLogDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? prescriptionId = freezed,
    Object? date = null,
    Object? notes = null,
    Object? photo = freezed,
    Object? taskId = null,
  }) {
    return _then(_$HealthLogDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      prescriptionId: freezed == prescriptionId
          ? _value.prescriptionId
          : prescriptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthLogDtoImpl implements _HealthLogDto {
  const _$HealthLogDtoImpl(
      {this.id,
      this.prescriptionId,
      required this.date,
      required this.notes,
      required this.photo,
      required this.taskId});

  factory _$HealthLogDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthLogDtoImplFromJson(json);

  @override
  final String? id;
  @override
  final String? prescriptionId;
  @override
  final DateTime date;
  @override
  final String notes;
  @override
  final String? photo;
  @override
  final String taskId;

  @override
  String toString() {
    return 'HealthLogDto(id: $id, prescriptionId: $prescriptionId, date: $date, notes: $notes, photo: $photo, taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthLogDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.prescriptionId, prescriptionId) ||
                other.prescriptionId == prescriptionId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, prescriptionId, date, notes, photo, taskId);

  /// Create a copy of HealthLogDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthLogDtoImplCopyWith<_$HealthLogDtoImpl> get copyWith =>
      __$$HealthLogDtoImplCopyWithImpl<_$HealthLogDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthLogDtoImplToJson(
      this,
    );
  }
}

abstract class _HealthLogDto implements HealthLogDto {
  const factory _HealthLogDto(
      {final String? id,
      final String? prescriptionId,
      required final DateTime date,
      required final String notes,
      required final String? photo,
      required final String taskId}) = _$HealthLogDtoImpl;

  factory _HealthLogDto.fromJson(Map<String, dynamic> json) =
      _$HealthLogDtoImpl.fromJson;

  @override
  String? get id;
  @override
  String? get prescriptionId;
  @override
  DateTime get date;
  @override
  String get notes;
  @override
  String? get photo;
  @override
  String get taskId;

  /// Create a copy of HealthLogDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthLogDtoImplCopyWith<_$HealthLogDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
