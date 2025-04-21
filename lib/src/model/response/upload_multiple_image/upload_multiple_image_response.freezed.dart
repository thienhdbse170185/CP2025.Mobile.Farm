// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_multiple_image_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadMultipleImageResponse _$UploadMultipleImageResponseFromJson(
    Map<String, dynamic> json) {
  return _UploadMultipleImageResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadMultipleImageResponse {
  String get message => throw _privateConstructorUsedError;
  List<UploadImageDto> get images => throw _privateConstructorUsedError;

  /// Serializes this UploadMultipleImageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadMultipleImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadMultipleImageResponseCopyWith<UploadMultipleImageResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadMultipleImageResponseCopyWith<$Res> {
  factory $UploadMultipleImageResponseCopyWith(
          UploadMultipleImageResponse value,
          $Res Function(UploadMultipleImageResponse) then) =
      _$UploadMultipleImageResponseCopyWithImpl<$Res,
          UploadMultipleImageResponse>;
  @useResult
  $Res call({String message, List<UploadImageDto> images});
}

/// @nodoc
class _$UploadMultipleImageResponseCopyWithImpl<$Res,
        $Val extends UploadMultipleImageResponse>
    implements $UploadMultipleImageResponseCopyWith<$Res> {
  _$UploadMultipleImageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadMultipleImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<UploadImageDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadMultipleImageResponseImplCopyWith<$Res>
    implements $UploadMultipleImageResponseCopyWith<$Res> {
  factory _$$UploadMultipleImageResponseImplCopyWith(
          _$UploadMultipleImageResponseImpl value,
          $Res Function(_$UploadMultipleImageResponseImpl) then) =
      __$$UploadMultipleImageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, List<UploadImageDto> images});
}

/// @nodoc
class __$$UploadMultipleImageResponseImplCopyWithImpl<$Res>
    extends _$UploadMultipleImageResponseCopyWithImpl<$Res,
        _$UploadMultipleImageResponseImpl>
    implements _$$UploadMultipleImageResponseImplCopyWith<$Res> {
  __$$UploadMultipleImageResponseImplCopyWithImpl(
      _$UploadMultipleImageResponseImpl _value,
      $Res Function(_$UploadMultipleImageResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadMultipleImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? images = null,
  }) {
    return _then(_$UploadMultipleImageResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<UploadImageDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadMultipleImageResponseImpl
    implements _UploadMultipleImageResponse {
  _$UploadMultipleImageResponseImpl(
      {required this.message, required final List<UploadImageDto> images})
      : _images = images;

  factory _$UploadMultipleImageResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UploadMultipleImageResponseImplFromJson(json);

  @override
  final String message;
  final List<UploadImageDto> _images;
  @override
  List<UploadImageDto> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'UploadMultipleImageResponse(message: $message, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadMultipleImageResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_images));

  /// Create a copy of UploadMultipleImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadMultipleImageResponseImplCopyWith<_$UploadMultipleImageResponseImpl>
      get copyWith => __$$UploadMultipleImageResponseImplCopyWithImpl<
          _$UploadMultipleImageResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadMultipleImageResponseImplToJson(
      this,
    );
  }
}

abstract class _UploadMultipleImageResponse
    implements UploadMultipleImageResponse {
  factory _UploadMultipleImageResponse(
          {required final String message,
          required final List<UploadImageDto> images}) =
      _$UploadMultipleImageResponseImpl;

  factory _UploadMultipleImageResponse.fromJson(Map<String, dynamic> json) =
      _$UploadMultipleImageResponseImpl.fromJson;

  @override
  String get message;
  @override
  List<UploadImageDto> get images;

  /// Create a copy of UploadMultipleImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadMultipleImageResponseImplCopyWith<_$UploadMultipleImageResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
