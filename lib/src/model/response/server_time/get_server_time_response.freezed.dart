// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_server_time_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetServerTimeResponse _$GetServerTimeResponseFromJson(
    Map<String, dynamic> json) {
  return _GetServerTimeResponse.fromJson(json);
}

/// @nodoc
mixin _$GetServerTimeResponse {
  String get serverTime => throw _privateConstructorUsedError;
  int get currentSession => throw _privateConstructorUsedError;

  /// Serializes this GetServerTimeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetServerTimeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetServerTimeResponseCopyWith<GetServerTimeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetServerTimeResponseCopyWith<$Res> {
  factory $GetServerTimeResponseCopyWith(GetServerTimeResponse value,
          $Res Function(GetServerTimeResponse) then) =
      _$GetServerTimeResponseCopyWithImpl<$Res, GetServerTimeResponse>;
  @useResult
  $Res call({String serverTime, int currentSession});
}

/// @nodoc
class _$GetServerTimeResponseCopyWithImpl<$Res,
        $Val extends GetServerTimeResponse>
    implements $GetServerTimeResponseCopyWith<$Res> {
  _$GetServerTimeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetServerTimeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverTime = null,
    Object? currentSession = null,
  }) {
    return _then(_value.copyWith(
      serverTime: null == serverTime
          ? _value.serverTime
          : serverTime // ignore: cast_nullable_to_non_nullable
              as String,
      currentSession: null == currentSession
          ? _value.currentSession
          : currentSession // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetServerTimeResponseImplCopyWith<$Res>
    implements $GetServerTimeResponseCopyWith<$Res> {
  factory _$$GetServerTimeResponseImplCopyWith(
          _$GetServerTimeResponseImpl value,
          $Res Function(_$GetServerTimeResponseImpl) then) =
      __$$GetServerTimeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String serverTime, int currentSession});
}

/// @nodoc
class __$$GetServerTimeResponseImplCopyWithImpl<$Res>
    extends _$GetServerTimeResponseCopyWithImpl<$Res,
        _$GetServerTimeResponseImpl>
    implements _$$GetServerTimeResponseImplCopyWith<$Res> {
  __$$GetServerTimeResponseImplCopyWithImpl(_$GetServerTimeResponseImpl _value,
      $Res Function(_$GetServerTimeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetServerTimeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverTime = null,
    Object? currentSession = null,
  }) {
    return _then(_$GetServerTimeResponseImpl(
      serverTime: null == serverTime
          ? _value.serverTime
          : serverTime // ignore: cast_nullable_to_non_nullable
              as String,
      currentSession: null == currentSession
          ? _value.currentSession
          : currentSession // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetServerTimeResponseImpl implements _GetServerTimeResponse {
  _$GetServerTimeResponseImpl(
      {required this.serverTime, required this.currentSession});

  factory _$GetServerTimeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetServerTimeResponseImplFromJson(json);

  @override
  final String serverTime;
  @override
  final int currentSession;

  @override
  String toString() {
    return 'GetServerTimeResponse(serverTime: $serverTime, currentSession: $currentSession)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetServerTimeResponseImpl &&
            (identical(other.serverTime, serverTime) ||
                other.serverTime == serverTime) &&
            (identical(other.currentSession, currentSession) ||
                other.currentSession == currentSession));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, serverTime, currentSession);

  /// Create a copy of GetServerTimeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetServerTimeResponseImplCopyWith<_$GetServerTimeResponseImpl>
      get copyWith => __$$GetServerTimeResponseImplCopyWithImpl<
          _$GetServerTimeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetServerTimeResponseImplToJson(
      this,
    );
  }
}

abstract class _GetServerTimeResponse implements GetServerTimeResponse {
  factory _GetServerTimeResponse(
      {required final String serverTime,
      required final int currentSession}) = _$GetServerTimeResponseImpl;

  factory _GetServerTimeResponse.fromJson(Map<String, dynamic> json) =
      _$GetServerTimeResponseImpl.fromJson;

  @override
  String get serverTime;
  @override
  int get currentSession;

  /// Create a copy of GetServerTimeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetServerTimeResponseImplCopyWith<_$GetServerTimeResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
