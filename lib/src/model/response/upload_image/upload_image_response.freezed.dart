// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_image_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadImageResponse _$UploadImageResponseFromJson(Map<String, dynamic> json) {
  return _UploadImageResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadImageResponse {
  String get message => throw _privateConstructorUsedError;
  UploadImageDto get image => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;

  /// Serializes this UploadImageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadImageResponseCopyWith<UploadImageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadImageResponseCopyWith<$Res> {
  factory $UploadImageResponseCopyWith(
          UploadImageResponse value, $Res Function(UploadImageResponse) then) =
      _$UploadImageResponseCopyWithImpl<$Res, UploadImageResponse>;
  @useResult
  $Res call({String message, UploadImageDto image, String path});

  $UploadImageDtoCopyWith<$Res> get image;
}

/// @nodoc
class _$UploadImageResponseCopyWithImpl<$Res, $Val extends UploadImageResponse>
    implements $UploadImageResponseCopyWith<$Res> {
  _$UploadImageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? image = null,
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as UploadImageDto,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of UploadImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UploadImageDtoCopyWith<$Res> get image {
    return $UploadImageDtoCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UploadImageResponseImplCopyWith<$Res>
    implements $UploadImageResponseCopyWith<$Res> {
  factory _$$UploadImageResponseImplCopyWith(_$UploadImageResponseImpl value,
          $Res Function(_$UploadImageResponseImpl) then) =
      __$$UploadImageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, UploadImageDto image, String path});

  @override
  $UploadImageDtoCopyWith<$Res> get image;
}

/// @nodoc
class __$$UploadImageResponseImplCopyWithImpl<$Res>
    extends _$UploadImageResponseCopyWithImpl<$Res, _$UploadImageResponseImpl>
    implements _$$UploadImageResponseImplCopyWith<$Res> {
  __$$UploadImageResponseImplCopyWithImpl(_$UploadImageResponseImpl _value,
      $Res Function(_$UploadImageResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? image = null,
    Object? path = null,
  }) {
    return _then(_$UploadImageResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as UploadImageDto,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadImageResponseImpl implements _UploadImageResponse {
  _$UploadImageResponseImpl(
      {required this.message, required this.image, required this.path});

  factory _$UploadImageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadImageResponseImplFromJson(json);

  @override
  final String message;
  @override
  final UploadImageDto image;
  @override
  final String path;

  @override
  String toString() {
    return 'UploadImageResponse(message: $message, image: $image, path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadImageResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, image, path);

  /// Create a copy of UploadImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadImageResponseImplCopyWith<_$UploadImageResponseImpl> get copyWith =>
      __$$UploadImageResponseImplCopyWithImpl<_$UploadImageResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadImageResponseImplToJson(
      this,
    );
  }
}

abstract class _UploadImageResponse implements UploadImageResponse {
  factory _UploadImageResponse(
      {required final String message,
      required final UploadImageDto image,
      required final String path}) = _$UploadImageResponseImpl;

  factory _UploadImageResponse.fromJson(Map<String, dynamic> json) =
      _$UploadImageResponseImpl.fromJson;

  @override
  String get message;
  @override
  UploadImageDto get image;
  @override
  String get path;

  /// Create a copy of UploadImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadImageResponseImplCopyWith<_$UploadImageResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
