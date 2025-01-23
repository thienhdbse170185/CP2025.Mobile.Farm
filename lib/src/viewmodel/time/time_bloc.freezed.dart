// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getServerTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getServerTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getServerTime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetServerTime value) getServerTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetServerTime value)? getServerTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetServerTime value)? getServerTime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeEventCopyWith<$Res> {
  factory $TimeEventCopyWith(TimeEvent value, $Res Function(TimeEvent) then) =
      _$TimeEventCopyWithImpl<$Res, TimeEvent>;
}

/// @nodoc
class _$TimeEventCopyWithImpl<$Res, $Val extends TimeEvent>
    implements $TimeEventCopyWith<$Res> {
  _$TimeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$TimeEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'TimeEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getServerTime,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getServerTime,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getServerTime,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetServerTime value) getServerTime,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetServerTime value)? getServerTime,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetServerTime value)? getServerTime,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements TimeEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetServerTimeImplCopyWith<$Res> {
  factory _$$GetServerTimeImplCopyWith(
          _$GetServerTimeImpl value, $Res Function(_$GetServerTimeImpl) then) =
      __$$GetServerTimeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetServerTimeImplCopyWithImpl<$Res>
    extends _$TimeEventCopyWithImpl<$Res, _$GetServerTimeImpl>
    implements _$$GetServerTimeImplCopyWith<$Res> {
  __$$GetServerTimeImplCopyWithImpl(
      _$GetServerTimeImpl _value, $Res Function(_$GetServerTimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetServerTimeImpl implements _GetServerTime {
  const _$GetServerTimeImpl();

  @override
  String toString() {
    return 'TimeEvent.getServerTime()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetServerTimeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getServerTime,
  }) {
    return getServerTime();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getServerTime,
  }) {
    return getServerTime?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getServerTime,
    required TResult orElse(),
  }) {
    if (getServerTime != null) {
      return getServerTime();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetServerTime value) getServerTime,
  }) {
    return getServerTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetServerTime value)? getServerTime,
  }) {
    return getServerTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetServerTime value)? getServerTime,
    required TResult orElse(),
  }) {
    if (getServerTime != null) {
      return getServerTime(this);
    }
    return orElse();
  }
}

abstract class _GetServerTime implements TimeEvent {
  const factory _GetServerTime() = _$GetServerTimeImpl;
}

/// @nodoc
mixin _$TimeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String error) getServerTimeFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String error)? getServerTimeFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String error)? getServerTimeFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetServerTimeInProgress value)
        getServerTimeInProgress,
    required TResult Function(_GetServerTimeSuccess value) getServerTimeSuccess,
    required TResult Function(_GetServerTimeFailure value) getServerTimeFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult? Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult? Function(_GetServerTimeFailure value)? getServerTimeFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult Function(_GetServerTimeFailure value)? getServerTimeFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeStateCopyWith<$Res> {
  factory $TimeStateCopyWith(TimeState value, $Res Function(TimeState) then) =
      _$TimeStateCopyWithImpl<$Res, TimeState>;
}

/// @nodoc
class _$TimeStateCopyWithImpl<$Res, $Val extends TimeState>
    implements $TimeStateCopyWith<$Res> {
  _$TimeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TimeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'TimeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String error) getServerTimeFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String error)? getServerTimeFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String error)? getServerTimeFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetServerTimeInProgress value)
        getServerTimeInProgress,
    required TResult Function(_GetServerTimeSuccess value) getServerTimeSuccess,
    required TResult Function(_GetServerTimeFailure value) getServerTimeFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult? Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult? Function(_GetServerTimeFailure value)? getServerTimeFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult Function(_GetServerTimeFailure value)? getServerTimeFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TimeState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$GetServerTimeInProgressImplCopyWith<$Res> {
  factory _$$GetServerTimeInProgressImplCopyWith(
          _$GetServerTimeInProgressImpl value,
          $Res Function(_$GetServerTimeInProgressImpl) then) =
      __$$GetServerTimeInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetServerTimeInProgressImplCopyWithImpl<$Res>
    extends _$TimeStateCopyWithImpl<$Res, _$GetServerTimeInProgressImpl>
    implements _$$GetServerTimeInProgressImplCopyWith<$Res> {
  __$$GetServerTimeInProgressImplCopyWithImpl(
      _$GetServerTimeInProgressImpl _value,
      $Res Function(_$GetServerTimeInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetServerTimeInProgressImpl implements _GetServerTimeInProgress {
  const _$GetServerTimeInProgressImpl();

  @override
  String toString() {
    return 'TimeState.getServerTimeInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetServerTimeInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String error) getServerTimeFailure,
  }) {
    return getServerTimeInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String error)? getServerTimeFailure,
  }) {
    return getServerTimeInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String error)? getServerTimeFailure,
    required TResult orElse(),
  }) {
    if (getServerTimeInProgress != null) {
      return getServerTimeInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetServerTimeInProgress value)
        getServerTimeInProgress,
    required TResult Function(_GetServerTimeSuccess value) getServerTimeSuccess,
    required TResult Function(_GetServerTimeFailure value) getServerTimeFailure,
  }) {
    return getServerTimeInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult? Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult? Function(_GetServerTimeFailure value)? getServerTimeFailure,
  }) {
    return getServerTimeInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult Function(_GetServerTimeFailure value)? getServerTimeFailure,
    required TResult orElse(),
  }) {
    if (getServerTimeInProgress != null) {
      return getServerTimeInProgress(this);
    }
    return orElse();
  }
}

abstract class _GetServerTimeInProgress implements TimeState {
  const factory _GetServerTimeInProgress() = _$GetServerTimeInProgressImpl;
}

/// @nodoc
abstract class _$$GetServerTimeSuccessImplCopyWith<$Res> {
  factory _$$GetServerTimeSuccessImplCopyWith(_$GetServerTimeSuccessImpl value,
          $Res Function(_$GetServerTimeSuccessImpl) then) =
      __$$GetServerTimeSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serverTime});
}

/// @nodoc
class __$$GetServerTimeSuccessImplCopyWithImpl<$Res>
    extends _$TimeStateCopyWithImpl<$Res, _$GetServerTimeSuccessImpl>
    implements _$$GetServerTimeSuccessImplCopyWith<$Res> {
  __$$GetServerTimeSuccessImplCopyWithImpl(_$GetServerTimeSuccessImpl _value,
      $Res Function(_$GetServerTimeSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverTime = null,
  }) {
    return _then(_$GetServerTimeSuccessImpl(
      null == serverTime
          ? _value.serverTime
          : serverTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetServerTimeSuccessImpl implements _GetServerTimeSuccess {
  const _$GetServerTimeSuccessImpl(this.serverTime);

  @override
  final String serverTime;

  @override
  String toString() {
    return 'TimeState.getServerTimeSuccess(serverTime: $serverTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetServerTimeSuccessImpl &&
            (identical(other.serverTime, serverTime) ||
                other.serverTime == serverTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serverTime);

  /// Create a copy of TimeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetServerTimeSuccessImplCopyWith<_$GetServerTimeSuccessImpl>
      get copyWith =>
          __$$GetServerTimeSuccessImplCopyWithImpl<_$GetServerTimeSuccessImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String error) getServerTimeFailure,
  }) {
    return getServerTimeSuccess(serverTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String error)? getServerTimeFailure,
  }) {
    return getServerTimeSuccess?.call(serverTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String error)? getServerTimeFailure,
    required TResult orElse(),
  }) {
    if (getServerTimeSuccess != null) {
      return getServerTimeSuccess(serverTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetServerTimeInProgress value)
        getServerTimeInProgress,
    required TResult Function(_GetServerTimeSuccess value) getServerTimeSuccess,
    required TResult Function(_GetServerTimeFailure value) getServerTimeFailure,
  }) {
    return getServerTimeSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult? Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult? Function(_GetServerTimeFailure value)? getServerTimeFailure,
  }) {
    return getServerTimeSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult Function(_GetServerTimeFailure value)? getServerTimeFailure,
    required TResult orElse(),
  }) {
    if (getServerTimeSuccess != null) {
      return getServerTimeSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetServerTimeSuccess implements TimeState {
  const factory _GetServerTimeSuccess(final String serverTime) =
      _$GetServerTimeSuccessImpl;

  String get serverTime;

  /// Create a copy of TimeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetServerTimeSuccessImplCopyWith<_$GetServerTimeSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetServerTimeFailureImplCopyWith<$Res> {
  factory _$$GetServerTimeFailureImplCopyWith(_$GetServerTimeFailureImpl value,
          $Res Function(_$GetServerTimeFailureImpl) then) =
      __$$GetServerTimeFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetServerTimeFailureImplCopyWithImpl<$Res>
    extends _$TimeStateCopyWithImpl<$Res, _$GetServerTimeFailureImpl>
    implements _$$GetServerTimeFailureImplCopyWith<$Res> {
  __$$GetServerTimeFailureImplCopyWithImpl(_$GetServerTimeFailureImpl _value,
      $Res Function(_$GetServerTimeFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetServerTimeFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetServerTimeFailureImpl implements _GetServerTimeFailure {
  const _$GetServerTimeFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'TimeState.getServerTimeFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetServerTimeFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of TimeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetServerTimeFailureImplCopyWith<_$GetServerTimeFailureImpl>
      get copyWith =>
          __$$GetServerTimeFailureImplCopyWithImpl<_$GetServerTimeFailureImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String error) getServerTimeFailure,
  }) {
    return getServerTimeFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String error)? getServerTimeFailure,
  }) {
    return getServerTimeFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String error)? getServerTimeFailure,
    required TResult orElse(),
  }) {
    if (getServerTimeFailure != null) {
      return getServerTimeFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetServerTimeInProgress value)
        getServerTimeInProgress,
    required TResult Function(_GetServerTimeSuccess value) getServerTimeSuccess,
    required TResult Function(_GetServerTimeFailure value) getServerTimeFailure,
  }) {
    return getServerTimeFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult? Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult? Function(_GetServerTimeFailure value)? getServerTimeFailure,
  }) {
    return getServerTimeFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult Function(_GetServerTimeFailure value)? getServerTimeFailure,
    required TResult orElse(),
  }) {
    if (getServerTimeFailure != null) {
      return getServerTimeFailure(this);
    }
    return orElse();
  }
}

abstract class _GetServerTimeFailure implements TimeState {
  const factory _GetServerTimeFailure(final String error) =
      _$GetServerTimeFailureImpl;

  String get error;

  /// Create a copy of TimeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetServerTimeFailureImplCopyWith<_$GetServerTimeFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
