// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getUserProfile,
    required TResult Function() getServerTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getUserProfile,
    TResult? Function()? getServerTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getUserProfile,
    TResult Function()? getServerTime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetUserProfile value) getUserProfile,
    required TResult Function(_GetServerTime value) getServerTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserProfile value)? getUserProfile,
    TResult? Function(_GetServerTime value)? getServerTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserProfile value)? getUserProfile,
    TResult Function(_GetServerTime value)? getServerTime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEvent
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
    extends _$UserEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'UserEvent.started()';
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
    required TResult Function() getUserProfile,
    required TResult Function() getServerTime,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getUserProfile,
    TResult? Function()? getServerTime,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getUserProfile,
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
    required TResult Function(_GetUserProfile value) getUserProfile,
    required TResult Function(_GetServerTime value) getServerTime,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserProfile value)? getUserProfile,
    TResult? Function(_GetServerTime value)? getServerTime,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserProfile value)? getUserProfile,
    TResult Function(_GetServerTime value)? getServerTime,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements UserEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetUserProfileImplCopyWith<$Res> {
  factory _$$GetUserProfileImplCopyWith(_$GetUserProfileImpl value,
          $Res Function(_$GetUserProfileImpl) then) =
      __$$GetUserProfileImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserProfileImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetUserProfileImpl>
    implements _$$GetUserProfileImplCopyWith<$Res> {
  __$$GetUserProfileImplCopyWithImpl(
      _$GetUserProfileImpl _value, $Res Function(_$GetUserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetUserProfileImpl implements _GetUserProfile {
  const _$GetUserProfileImpl();

  @override
  String toString() {
    return 'UserEvent.getUserProfile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserProfileImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getUserProfile,
    required TResult Function() getServerTime,
  }) {
    return getUserProfile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getUserProfile,
    TResult? Function()? getServerTime,
  }) {
    return getUserProfile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getUserProfile,
    TResult Function()? getServerTime,
    required TResult orElse(),
  }) {
    if (getUserProfile != null) {
      return getUserProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetUserProfile value) getUserProfile,
    required TResult Function(_GetServerTime value) getServerTime,
  }) {
    return getUserProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserProfile value)? getUserProfile,
    TResult? Function(_GetServerTime value)? getServerTime,
  }) {
    return getUserProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserProfile value)? getUserProfile,
    TResult Function(_GetServerTime value)? getServerTime,
    required TResult orElse(),
  }) {
    if (getUserProfile != null) {
      return getUserProfile(this);
    }
    return orElse();
  }
}

abstract class _GetUserProfile implements UserEvent {
  const factory _GetUserProfile() = _$GetUserProfileImpl;
}

/// @nodoc
abstract class _$$GetServerTimeImplCopyWith<$Res> {
  factory _$$GetServerTimeImplCopyWith(
          _$GetServerTimeImpl value, $Res Function(_$GetServerTimeImpl) then) =
      __$$GetServerTimeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetServerTimeImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetServerTimeImpl>
    implements _$$GetServerTimeImplCopyWith<$Res> {
  __$$GetServerTimeImplCopyWithImpl(
      _$GetServerTimeImpl _value, $Res Function(_$GetServerTimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetServerTimeImpl implements _GetServerTime {
  const _$GetServerTimeImpl();

  @override
  String toString() {
    return 'UserEvent.getServerTime()';
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
    required TResult Function() getUserProfile,
    required TResult Function() getServerTime,
  }) {
    return getServerTime();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getUserProfile,
    TResult? Function()? getServerTime,
  }) {
    return getServerTime?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getUserProfile,
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
    required TResult Function(_GetUserProfile value) getUserProfile,
    required TResult Function(_GetServerTime value) getServerTime,
  }) {
    return getServerTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserProfile value)? getUserProfile,
    TResult? Function(_GetServerTime value)? getServerTime,
  }) {
    return getServerTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserProfile value)? getUserProfile,
    TResult Function(_GetServerTime value)? getServerTime,
    required TResult orElse(),
  }) {
    if (getServerTime != null) {
      return getServerTime(this);
    }
    return orElse();
  }
}

abstract class _GetServerTime implements UserEvent {
  const factory _GetServerTime() = _$GetServerTimeImpl;
}

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email)? getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email)? getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetUserProfileInProgress value)
        getUserProfileInProgress,
    required TResult Function(_GetUserProfileSuccess value)
        getUserProfileSuccess,
    required TResult Function(_GetUserProfileFailure value)
        getUserProfileFailure,
    required TResult Function(_GetServerTimeInProgress value)
        getServerTimeInProgress,
    required TResult Function(_GetServerTimeSuccess value) getServerTimeSuccess,
    required TResult Function(_GetServerTimeFailure value) getServerTimeFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetUserProfileInProgress value)?
        getUserProfileInProgress,
    TResult? Function(_GetUserProfileSuccess value)? getUserProfileSuccess,
    TResult? Function(_GetUserProfileFailure value)? getUserProfileFailure,
    TResult? Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult? Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult? Function(_GetServerTimeFailure value)? getServerTimeFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetUserProfileInProgress value)? getUserProfileInProgress,
    TResult Function(_GetUserProfileSuccess value)? getUserProfileSuccess,
    TResult Function(_GetUserProfileFailure value)? getUserProfileFailure,
    TResult Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult Function(_GetServerTimeFailure value)? getServerTimeFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
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
    extends _$UserStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'UserState.initial()';
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
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email)? getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email)? getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
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
    required TResult Function(_GetUserProfileInProgress value)
        getUserProfileInProgress,
    required TResult Function(_GetUserProfileSuccess value)
        getUserProfileSuccess,
    required TResult Function(_GetUserProfileFailure value)
        getUserProfileFailure,
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
    TResult? Function(_GetUserProfileInProgress value)?
        getUserProfileInProgress,
    TResult? Function(_GetUserProfileSuccess value)? getUserProfileSuccess,
    TResult? Function(_GetUserProfileFailure value)? getUserProfileFailure,
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
    TResult Function(_GetUserProfileInProgress value)? getUserProfileInProgress,
    TResult Function(_GetUserProfileSuccess value)? getUserProfileSuccess,
    TResult Function(_GetUserProfileFailure value)? getUserProfileFailure,
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

abstract class _Initial implements UserState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$GetUserProfileInProgressImplCopyWith<$Res> {
  factory _$$GetUserProfileInProgressImplCopyWith(
          _$GetUserProfileInProgressImpl value,
          $Res Function(_$GetUserProfileInProgressImpl) then) =
      __$$GetUserProfileInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserProfileInProgressImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$GetUserProfileInProgressImpl>
    implements _$$GetUserProfileInProgressImplCopyWith<$Res> {
  __$$GetUserProfileInProgressImplCopyWithImpl(
      _$GetUserProfileInProgressImpl _value,
      $Res Function(_$GetUserProfileInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetUserProfileInProgressImpl implements _GetUserProfileInProgress {
  const _$GetUserProfileInProgressImpl();

  @override
  String toString() {
    return 'UserState.getUserProfileInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserProfileInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
  }) {
    return getUserProfileInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email)? getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
  }) {
    return getUserProfileInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email)? getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    required TResult orElse(),
  }) {
    if (getUserProfileInProgress != null) {
      return getUserProfileInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetUserProfileInProgress value)
        getUserProfileInProgress,
    required TResult Function(_GetUserProfileSuccess value)
        getUserProfileSuccess,
    required TResult Function(_GetUserProfileFailure value)
        getUserProfileFailure,
    required TResult Function(_GetServerTimeInProgress value)
        getServerTimeInProgress,
    required TResult Function(_GetServerTimeSuccess value) getServerTimeSuccess,
    required TResult Function(_GetServerTimeFailure value) getServerTimeFailure,
  }) {
    return getUserProfileInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetUserProfileInProgress value)?
        getUserProfileInProgress,
    TResult? Function(_GetUserProfileSuccess value)? getUserProfileSuccess,
    TResult? Function(_GetUserProfileFailure value)? getUserProfileFailure,
    TResult? Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult? Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult? Function(_GetServerTimeFailure value)? getServerTimeFailure,
  }) {
    return getUserProfileInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetUserProfileInProgress value)? getUserProfileInProgress,
    TResult Function(_GetUserProfileSuccess value)? getUserProfileSuccess,
    TResult Function(_GetUserProfileFailure value)? getUserProfileFailure,
    TResult Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult Function(_GetServerTimeFailure value)? getServerTimeFailure,
    required TResult orElse(),
  }) {
    if (getUserProfileInProgress != null) {
      return getUserProfileInProgress(this);
    }
    return orElse();
  }
}

abstract class _GetUserProfileInProgress implements UserState {
  const factory _GetUserProfileInProgress() = _$GetUserProfileInProgressImpl;
}

/// @nodoc
abstract class _$$GetUserProfileSuccessImplCopyWith<$Res> {
  factory _$$GetUserProfileSuccessImplCopyWith(
          _$GetUserProfileSuccessImpl value,
          $Res Function(_$GetUserProfileSuccessImpl) then) =
      __$$GetUserProfileSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userName, String email});
}

/// @nodoc
class __$$GetUserProfileSuccessImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$GetUserProfileSuccessImpl>
    implements _$$GetUserProfileSuccessImplCopyWith<$Res> {
  __$$GetUserProfileSuccessImplCopyWithImpl(_$GetUserProfileSuccessImpl _value,
      $Res Function(_$GetUserProfileSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? email = null,
  }) {
    return _then(_$GetUserProfileSuccessImpl(
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetUserProfileSuccessImpl implements _GetUserProfileSuccess {
  const _$GetUserProfileSuccessImpl(this.userName, this.email);

  @override
  final String userName;
  @override
  final String email;

  @override
  String toString() {
    return 'UserState.getUserProfileSuccess(userName: $userName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserProfileSuccessImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, email);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserProfileSuccessImplCopyWith<_$GetUserProfileSuccessImpl>
      get copyWith => __$$GetUserProfileSuccessImplCopyWithImpl<
          _$GetUserProfileSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
  }) {
    return getUserProfileSuccess(userName, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email)? getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
  }) {
    return getUserProfileSuccess?.call(userName, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email)? getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    required TResult orElse(),
  }) {
    if (getUserProfileSuccess != null) {
      return getUserProfileSuccess(userName, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetUserProfileInProgress value)
        getUserProfileInProgress,
    required TResult Function(_GetUserProfileSuccess value)
        getUserProfileSuccess,
    required TResult Function(_GetUserProfileFailure value)
        getUserProfileFailure,
    required TResult Function(_GetServerTimeInProgress value)
        getServerTimeInProgress,
    required TResult Function(_GetServerTimeSuccess value) getServerTimeSuccess,
    required TResult Function(_GetServerTimeFailure value) getServerTimeFailure,
  }) {
    return getUserProfileSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetUserProfileInProgress value)?
        getUserProfileInProgress,
    TResult? Function(_GetUserProfileSuccess value)? getUserProfileSuccess,
    TResult? Function(_GetUserProfileFailure value)? getUserProfileFailure,
    TResult? Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult? Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult? Function(_GetServerTimeFailure value)? getServerTimeFailure,
  }) {
    return getUserProfileSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetUserProfileInProgress value)? getUserProfileInProgress,
    TResult Function(_GetUserProfileSuccess value)? getUserProfileSuccess,
    TResult Function(_GetUserProfileFailure value)? getUserProfileFailure,
    TResult Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult Function(_GetServerTimeFailure value)? getServerTimeFailure,
    required TResult orElse(),
  }) {
    if (getUserProfileSuccess != null) {
      return getUserProfileSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetUserProfileSuccess implements UserState {
  const factory _GetUserProfileSuccess(
      final String userName, final String email) = _$GetUserProfileSuccessImpl;

  String get userName;
  String get email;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserProfileSuccessImplCopyWith<_$GetUserProfileSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetUserProfileFailureImplCopyWith<$Res> {
  factory _$$GetUserProfileFailureImplCopyWith(
          _$GetUserProfileFailureImpl value,
          $Res Function(_$GetUserProfileFailureImpl) then) =
      __$$GetUserProfileFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GetUserProfileFailureImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$GetUserProfileFailureImpl>
    implements _$$GetUserProfileFailureImplCopyWith<$Res> {
  __$$GetUserProfileFailureImplCopyWithImpl(_$GetUserProfileFailureImpl _value,
      $Res Function(_$GetUserProfileFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GetUserProfileFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetUserProfileFailureImpl implements _GetUserProfileFailure {
  const _$GetUserProfileFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UserState.getUserProfileFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserProfileFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserProfileFailureImplCopyWith<_$GetUserProfileFailureImpl>
      get copyWith => __$$GetUserProfileFailureImplCopyWithImpl<
          _$GetUserProfileFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
  }) {
    return getUserProfileFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email)? getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
  }) {
    return getUserProfileFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email)? getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    required TResult orElse(),
  }) {
    if (getUserProfileFailure != null) {
      return getUserProfileFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetUserProfileInProgress value)
        getUserProfileInProgress,
    required TResult Function(_GetUserProfileSuccess value)
        getUserProfileSuccess,
    required TResult Function(_GetUserProfileFailure value)
        getUserProfileFailure,
    required TResult Function(_GetServerTimeInProgress value)
        getServerTimeInProgress,
    required TResult Function(_GetServerTimeSuccess value) getServerTimeSuccess,
    required TResult Function(_GetServerTimeFailure value) getServerTimeFailure,
  }) {
    return getUserProfileFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetUserProfileInProgress value)?
        getUserProfileInProgress,
    TResult? Function(_GetUserProfileSuccess value)? getUserProfileSuccess,
    TResult? Function(_GetUserProfileFailure value)? getUserProfileFailure,
    TResult? Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult? Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult? Function(_GetServerTimeFailure value)? getServerTimeFailure,
  }) {
    return getUserProfileFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetUserProfileInProgress value)? getUserProfileInProgress,
    TResult Function(_GetUserProfileSuccess value)? getUserProfileSuccess,
    TResult Function(_GetUserProfileFailure value)? getUserProfileFailure,
    TResult Function(_GetServerTimeInProgress value)? getServerTimeInProgress,
    TResult Function(_GetServerTimeSuccess value)? getServerTimeSuccess,
    TResult Function(_GetServerTimeFailure value)? getServerTimeFailure,
    required TResult orElse(),
  }) {
    if (getUserProfileFailure != null) {
      return getUserProfileFailure(this);
    }
    return orElse();
  }
}

abstract class _GetUserProfileFailure implements UserState {
  const factory _GetUserProfileFailure(final String message) =
      _$GetUserProfileFailureImpl;

  String get message;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserProfileFailureImplCopyWith<_$GetUserProfileFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
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
    extends _$UserStateCopyWithImpl<$Res, _$GetServerTimeInProgressImpl>
    implements _$$GetServerTimeInProgressImplCopyWith<$Res> {
  __$$GetServerTimeInProgressImplCopyWithImpl(
      _$GetServerTimeInProgressImpl _value,
      $Res Function(_$GetServerTimeInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetServerTimeInProgressImpl implements _GetServerTimeInProgress {
  const _$GetServerTimeInProgressImpl();

  @override
  String toString() {
    return 'UserState.getServerTimeInProgress()';
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
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
  }) {
    return getServerTimeInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email)? getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
  }) {
    return getServerTimeInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email)? getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
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
    required TResult Function(_GetUserProfileInProgress value)
        getUserProfileInProgress,
    required TResult Function(_GetUserProfileSuccess value)
        getUserProfileSuccess,
    required TResult Function(_GetUserProfileFailure value)
        getUserProfileFailure,
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
    TResult? Function(_GetUserProfileInProgress value)?
        getUserProfileInProgress,
    TResult? Function(_GetUserProfileSuccess value)? getUserProfileSuccess,
    TResult? Function(_GetUserProfileFailure value)? getUserProfileFailure,
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
    TResult Function(_GetUserProfileInProgress value)? getUserProfileInProgress,
    TResult Function(_GetUserProfileSuccess value)? getUserProfileSuccess,
    TResult Function(_GetUserProfileFailure value)? getUserProfileFailure,
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

abstract class _GetServerTimeInProgress implements UserState {
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
    extends _$UserStateCopyWithImpl<$Res, _$GetServerTimeSuccessImpl>
    implements _$$GetServerTimeSuccessImplCopyWith<$Res> {
  __$$GetServerTimeSuccessImplCopyWithImpl(_$GetServerTimeSuccessImpl _value,
      $Res Function(_$GetServerTimeSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
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
    return 'UserState.getServerTimeSuccess(serverTime: $serverTime)';
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

  /// Create a copy of UserState
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
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
  }) {
    return getServerTimeSuccess(serverTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email)? getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
  }) {
    return getServerTimeSuccess?.call(serverTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email)? getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
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
    required TResult Function(_GetUserProfileInProgress value)
        getUserProfileInProgress,
    required TResult Function(_GetUserProfileSuccess value)
        getUserProfileSuccess,
    required TResult Function(_GetUserProfileFailure value)
        getUserProfileFailure,
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
    TResult? Function(_GetUserProfileInProgress value)?
        getUserProfileInProgress,
    TResult? Function(_GetUserProfileSuccess value)? getUserProfileSuccess,
    TResult? Function(_GetUserProfileFailure value)? getUserProfileFailure,
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
    TResult Function(_GetUserProfileInProgress value)? getUserProfileInProgress,
    TResult Function(_GetUserProfileSuccess value)? getUserProfileSuccess,
    TResult Function(_GetUserProfileFailure value)? getUserProfileFailure,
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

abstract class _GetServerTimeSuccess implements UserState {
  const factory _GetServerTimeSuccess(final String serverTime) =
      _$GetServerTimeSuccessImpl;

  String get serverTime;

  /// Create a copy of UserState
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
  $Res call({String message});
}

/// @nodoc
class __$$GetServerTimeFailureImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$GetServerTimeFailureImpl>
    implements _$$GetServerTimeFailureImplCopyWith<$Res> {
  __$$GetServerTimeFailureImplCopyWithImpl(_$GetServerTimeFailureImpl _value,
      $Res Function(_$GetServerTimeFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GetServerTimeFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetServerTimeFailureImpl implements _GetServerTimeFailure {
  const _$GetServerTimeFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UserState.getServerTimeFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetServerTimeFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of UserState
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
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
  }) {
    return getServerTimeFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email)? getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
  }) {
    return getServerTimeFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email)? getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    required TResult orElse(),
  }) {
    if (getServerTimeFailure != null) {
      return getServerTimeFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetUserProfileInProgress value)
        getUserProfileInProgress,
    required TResult Function(_GetUserProfileSuccess value)
        getUserProfileSuccess,
    required TResult Function(_GetUserProfileFailure value)
        getUserProfileFailure,
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
    TResult? Function(_GetUserProfileInProgress value)?
        getUserProfileInProgress,
    TResult? Function(_GetUserProfileSuccess value)? getUserProfileSuccess,
    TResult? Function(_GetUserProfileFailure value)? getUserProfileFailure,
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
    TResult Function(_GetUserProfileInProgress value)? getUserProfileInProgress,
    TResult Function(_GetUserProfileSuccess value)? getUserProfileSuccess,
    TResult Function(_GetUserProfileFailure value)? getUserProfileFailure,
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

abstract class _GetServerTimeFailure implements UserState {
  const factory _GetServerTimeFailure(final String message) =
      _$GetServerTimeFailureImpl;

  String get message;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetServerTimeFailureImplCopyWith<_$GetServerTimeFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
