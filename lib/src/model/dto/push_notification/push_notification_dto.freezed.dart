// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PushNotificationDto _$PushNotificationDtoFromJson(Map<String, dynamic> json) {
  return _PushNotificationDto.fromJson(json);
}

/// @nodoc
mixin _$PushNotificationDto {
  CustomData get customData => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Serializes this PushNotificationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PushNotificationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PushNotificationDtoCopyWith<PushNotificationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushNotificationDtoCopyWith<$Res> {
  factory $PushNotificationDtoCopyWith(
          PushNotificationDto value, $Res Function(PushNotificationDto) then) =
      _$PushNotificationDtoCopyWithImpl<$Res, PushNotificationDto>;
  @useResult
  $Res call({CustomData customData, String title});

  $CustomDataCopyWith<$Res> get customData;
}

/// @nodoc
class _$PushNotificationDtoCopyWithImpl<$Res, $Val extends PushNotificationDto>
    implements $PushNotificationDtoCopyWith<$Res> {
  _$PushNotificationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PushNotificationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customData = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      customData: null == customData
          ? _value.customData
          : customData // ignore: cast_nullable_to_non_nullable
              as CustomData,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of PushNotificationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomDataCopyWith<$Res> get customData {
    return $CustomDataCopyWith<$Res>(_value.customData, (value) {
      return _then(_value.copyWith(customData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PushNotificationDtoImplCopyWith<$Res>
    implements $PushNotificationDtoCopyWith<$Res> {
  factory _$$PushNotificationDtoImplCopyWith(_$PushNotificationDtoImpl value,
          $Res Function(_$PushNotificationDtoImpl) then) =
      __$$PushNotificationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CustomData customData, String title});

  @override
  $CustomDataCopyWith<$Res> get customData;
}

/// @nodoc
class __$$PushNotificationDtoImplCopyWithImpl<$Res>
    extends _$PushNotificationDtoCopyWithImpl<$Res, _$PushNotificationDtoImpl>
    implements _$$PushNotificationDtoImplCopyWith<$Res> {
  __$$PushNotificationDtoImplCopyWithImpl(_$PushNotificationDtoImpl _value,
      $Res Function(_$PushNotificationDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PushNotificationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customData = null,
    Object? title = null,
  }) {
    return _then(_$PushNotificationDtoImpl(
      customData: null == customData
          ? _value.customData
          : customData // ignore: cast_nullable_to_non_nullable
              as CustomData,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushNotificationDtoImpl implements _PushNotificationDto {
  _$PushNotificationDtoImpl({required this.customData, required this.title});

  factory _$PushNotificationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushNotificationDtoImplFromJson(json);

  @override
  final CustomData customData;
  @override
  final String title;

  @override
  String toString() {
    return 'PushNotificationDto(customData: $customData, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationDtoImpl &&
            (identical(other.customData, customData) ||
                other.customData == customData) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customData, title);

  /// Create a copy of PushNotificationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationDtoImplCopyWith<_$PushNotificationDtoImpl> get copyWith =>
      __$$PushNotificationDtoImplCopyWithImpl<_$PushNotificationDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushNotificationDtoImplToJson(
      this,
    );
  }
}

abstract class _PushNotificationDto implements PushNotificationDto {
  factory _PushNotificationDto(
      {required final CustomData customData,
      required final String title}) = _$PushNotificationDtoImpl;

  factory _PushNotificationDto.fromJson(Map<String, dynamic> json) =
      _$PushNotificationDtoImpl.fromJson;

  @override
  CustomData get customData;
  @override
  String get title;

  /// Create a copy of PushNotificationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PushNotificationDtoImplCopyWith<_$PushNotificationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
