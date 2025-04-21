// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_image_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadImageDto _$UploadImageDtoFromJson(Map<String, dynamic> json) {
  return _UploadImageDto.fromJson(json);
}

/// @nodoc
mixin _$UploadImageDto {
  String get id => throw _privateConstructorUsedError;
  String get originalName => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this UploadImageDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadImageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadImageDtoCopyWith<UploadImageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadImageDtoCopyWith<$Res> {
  factory $UploadImageDtoCopyWith(
          UploadImageDto value, $Res Function(UploadImageDto) then) =
      _$UploadImageDtoCopyWithImpl<$Res, UploadImageDto>;
  @useResult
  $Res call(
      {String id,
      String originalName,
      String path,
      int size,
      String mimeType,
      int width,
      int height,
      String createdAt});
}

/// @nodoc
class _$UploadImageDtoCopyWithImpl<$Res, $Val extends UploadImageDto>
    implements $UploadImageDtoCopyWith<$Res> {
  _$UploadImageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadImageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? originalName = null,
    Object? path = null,
    Object? size = null,
    Object? mimeType = null,
    Object? width = null,
    Object? height = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadImageDtoImplCopyWith<$Res>
    implements $UploadImageDtoCopyWith<$Res> {
  factory _$$UploadImageDtoImplCopyWith(_$UploadImageDtoImpl value,
          $Res Function(_$UploadImageDtoImpl) then) =
      __$$UploadImageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String originalName,
      String path,
      int size,
      String mimeType,
      int width,
      int height,
      String createdAt});
}

/// @nodoc
class __$$UploadImageDtoImplCopyWithImpl<$Res>
    extends _$UploadImageDtoCopyWithImpl<$Res, _$UploadImageDtoImpl>
    implements _$$UploadImageDtoImplCopyWith<$Res> {
  __$$UploadImageDtoImplCopyWithImpl(
      _$UploadImageDtoImpl _value, $Res Function(_$UploadImageDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadImageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? originalName = null,
    Object? path = null,
    Object? size = null,
    Object? mimeType = null,
    Object? width = null,
    Object? height = null,
    Object? createdAt = null,
  }) {
    return _then(_$UploadImageDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadImageDtoImpl implements _UploadImageDto {
  _$UploadImageDtoImpl(
      {required this.id,
      required this.originalName,
      required this.path,
      required this.size,
      required this.mimeType,
      required this.width,
      required this.height,
      required this.createdAt});

  factory _$UploadImageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadImageDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String originalName;
  @override
  final String path;
  @override
  final int size;
  @override
  final String mimeType;
  @override
  final int width;
  @override
  final int height;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'UploadImageDto(id: $id, originalName: $originalName, path: $path, size: $size, mimeType: $mimeType, width: $width, height: $height, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadImageDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, originalName, path, size,
      mimeType, width, height, createdAt);

  /// Create a copy of UploadImageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadImageDtoImplCopyWith<_$UploadImageDtoImpl> get copyWith =>
      __$$UploadImageDtoImplCopyWithImpl<_$UploadImageDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadImageDtoImplToJson(
      this,
    );
  }
}

abstract class _UploadImageDto implements UploadImageDto {
  factory _UploadImageDto(
      {required final String id,
      required final String originalName,
      required final String path,
      required final int size,
      required final String mimeType,
      required final int width,
      required final int height,
      required final String createdAt}) = _$UploadImageDtoImpl;

  factory _UploadImageDto.fromJson(Map<String, dynamic> json) =
      _$UploadImageDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get originalName;
  @override
  String get path;
  @override
  int get size;
  @override
  String get mimeType;
  @override
  int get width;
  @override
  int get height;
  @override
  String get createdAt;

  /// Create a copy of UploadImageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadImageDtoImplCopyWith<_$UploadImageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
