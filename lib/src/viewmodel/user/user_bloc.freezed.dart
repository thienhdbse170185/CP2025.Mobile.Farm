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
    required TResult Function(bool isAppStart) getUserProfile,
    required TResult Function() getServerTime,
    required TResult Function() updateDeviceToken,
    required TResult Function(String username, bool isResend, String? email)
        sendOTP,
    required TResult Function(
            String? phoneNumber, String username, bool isResend)
        sendOTPSms,
    required TResult Function(String oldPassword, String newPassword)
        updatePassword,
    required TResult Function(String email, String otp) verifyOTP,
    required TResult Function() getUserProfileByUserId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isAppStart)? getUserProfile,
    TResult? Function()? getServerTime,
    TResult? Function()? updateDeviceToken,
    TResult? Function(String username, bool isResend, String? email)? sendOTP,
    TResult? Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult? Function(String oldPassword, String newPassword)? updatePassword,
    TResult? Function(String email, String otp)? verifyOTP,
    TResult? Function()? getUserProfileByUserId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isAppStart)? getUserProfile,
    TResult Function()? getServerTime,
    TResult Function()? updateDeviceToken,
    TResult Function(String username, bool isResend, String? email)? sendOTP,
    TResult Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult Function(String oldPassword, String newPassword)? updatePassword,
    TResult Function(String email, String otp)? verifyOTP,
    TResult Function()? getUserProfileByUserId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetUserProfile value) getUserProfile,
    required TResult Function(_GetServerTime value) getServerTime,
    required TResult Function(_UpdateDeviceToken value) updateDeviceToken,
    required TResult Function(_SendOTP value) sendOTP,
    required TResult Function(_SendOTPSms value) sendOTPSms,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_VerifyOTP value) verifyOTP,
    required TResult Function(_GetUserProfileByUserId value)
        getUserProfileByUserId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserProfile value)? getUserProfile,
    TResult? Function(_GetServerTime value)? getServerTime,
    TResult? Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult? Function(_SendOTP value)? sendOTP,
    TResult? Function(_SendOTPSms value)? sendOTPSms,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_VerifyOTP value)? verifyOTP,
    TResult? Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserProfile value)? getUserProfile,
    TResult Function(_GetServerTime value)? getServerTime,
    TResult Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult Function(_SendOTP value)? sendOTP,
    TResult Function(_SendOTPSms value)? sendOTPSms,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
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
    required TResult Function(bool isAppStart) getUserProfile,
    required TResult Function() getServerTime,
    required TResult Function() updateDeviceToken,
    required TResult Function(String username, bool isResend, String? email)
        sendOTP,
    required TResult Function(
            String? phoneNumber, String username, bool isResend)
        sendOTPSms,
    required TResult Function(String oldPassword, String newPassword)
        updatePassword,
    required TResult Function(String email, String otp) verifyOTP,
    required TResult Function() getUserProfileByUserId,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isAppStart)? getUserProfile,
    TResult? Function()? getServerTime,
    TResult? Function()? updateDeviceToken,
    TResult? Function(String username, bool isResend, String? email)? sendOTP,
    TResult? Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult? Function(String oldPassword, String newPassword)? updatePassword,
    TResult? Function(String email, String otp)? verifyOTP,
    TResult? Function()? getUserProfileByUserId,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isAppStart)? getUserProfile,
    TResult Function()? getServerTime,
    TResult Function()? updateDeviceToken,
    TResult Function(String username, bool isResend, String? email)? sendOTP,
    TResult Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult Function(String oldPassword, String newPassword)? updatePassword,
    TResult Function(String email, String otp)? verifyOTP,
    TResult Function()? getUserProfileByUserId,
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
    required TResult Function(_UpdateDeviceToken value) updateDeviceToken,
    required TResult Function(_SendOTP value) sendOTP,
    required TResult Function(_SendOTPSms value) sendOTPSms,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_VerifyOTP value) verifyOTP,
    required TResult Function(_GetUserProfileByUserId value)
        getUserProfileByUserId,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserProfile value)? getUserProfile,
    TResult? Function(_GetServerTime value)? getServerTime,
    TResult? Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult? Function(_SendOTP value)? sendOTP,
    TResult? Function(_SendOTPSms value)? sendOTPSms,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_VerifyOTP value)? verifyOTP,
    TResult? Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserProfile value)? getUserProfile,
    TResult Function(_GetServerTime value)? getServerTime,
    TResult Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult Function(_SendOTP value)? sendOTP,
    TResult Function(_SendOTPSms value)? sendOTPSms,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
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
  @useResult
  $Res call({bool isAppStart});
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
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAppStart = null,
  }) {
    return _then(_$GetUserProfileImpl(
      isAppStart: null == isAppStart
          ? _value.isAppStart
          : isAppStart // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetUserProfileImpl implements _GetUserProfile {
  const _$GetUserProfileImpl({this.isAppStart = false});

  @override
  @JsonKey()
  final bool isAppStart;

  @override
  String toString() {
    return 'UserEvent.getUserProfile(isAppStart: $isAppStart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserProfileImpl &&
            (identical(other.isAppStart, isAppStart) ||
                other.isAppStart == isAppStart));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAppStart);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserProfileImplCopyWith<_$GetUserProfileImpl> get copyWith =>
      __$$GetUserProfileImplCopyWithImpl<_$GetUserProfileImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isAppStart) getUserProfile,
    required TResult Function() getServerTime,
    required TResult Function() updateDeviceToken,
    required TResult Function(String username, bool isResend, String? email)
        sendOTP,
    required TResult Function(
            String? phoneNumber, String username, bool isResend)
        sendOTPSms,
    required TResult Function(String oldPassword, String newPassword)
        updatePassword,
    required TResult Function(String email, String otp) verifyOTP,
    required TResult Function() getUserProfileByUserId,
  }) {
    return getUserProfile(isAppStart);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isAppStart)? getUserProfile,
    TResult? Function()? getServerTime,
    TResult? Function()? updateDeviceToken,
    TResult? Function(String username, bool isResend, String? email)? sendOTP,
    TResult? Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult? Function(String oldPassword, String newPassword)? updatePassword,
    TResult? Function(String email, String otp)? verifyOTP,
    TResult? Function()? getUserProfileByUserId,
  }) {
    return getUserProfile?.call(isAppStart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isAppStart)? getUserProfile,
    TResult Function()? getServerTime,
    TResult Function()? updateDeviceToken,
    TResult Function(String username, bool isResend, String? email)? sendOTP,
    TResult Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult Function(String oldPassword, String newPassword)? updatePassword,
    TResult Function(String email, String otp)? verifyOTP,
    TResult Function()? getUserProfileByUserId,
    required TResult orElse(),
  }) {
    if (getUserProfile != null) {
      return getUserProfile(isAppStart);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetUserProfile value) getUserProfile,
    required TResult Function(_GetServerTime value) getServerTime,
    required TResult Function(_UpdateDeviceToken value) updateDeviceToken,
    required TResult Function(_SendOTP value) sendOTP,
    required TResult Function(_SendOTPSms value) sendOTPSms,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_VerifyOTP value) verifyOTP,
    required TResult Function(_GetUserProfileByUserId value)
        getUserProfileByUserId,
  }) {
    return getUserProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserProfile value)? getUserProfile,
    TResult? Function(_GetServerTime value)? getServerTime,
    TResult? Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult? Function(_SendOTP value)? sendOTP,
    TResult? Function(_SendOTPSms value)? sendOTPSms,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_VerifyOTP value)? verifyOTP,
    TResult? Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
  }) {
    return getUserProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserProfile value)? getUserProfile,
    TResult Function(_GetServerTime value)? getServerTime,
    TResult Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult Function(_SendOTP value)? sendOTP,
    TResult Function(_SendOTPSms value)? sendOTPSms,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
    required TResult orElse(),
  }) {
    if (getUserProfile != null) {
      return getUserProfile(this);
    }
    return orElse();
  }
}

abstract class _GetUserProfile implements UserEvent {
  const factory _GetUserProfile({final bool isAppStart}) = _$GetUserProfileImpl;

  bool get isAppStart;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserProfileImplCopyWith<_$GetUserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    required TResult Function(bool isAppStart) getUserProfile,
    required TResult Function() getServerTime,
    required TResult Function() updateDeviceToken,
    required TResult Function(String username, bool isResend, String? email)
        sendOTP,
    required TResult Function(
            String? phoneNumber, String username, bool isResend)
        sendOTPSms,
    required TResult Function(String oldPassword, String newPassword)
        updatePassword,
    required TResult Function(String email, String otp) verifyOTP,
    required TResult Function() getUserProfileByUserId,
  }) {
    return getServerTime();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isAppStart)? getUserProfile,
    TResult? Function()? getServerTime,
    TResult? Function()? updateDeviceToken,
    TResult? Function(String username, bool isResend, String? email)? sendOTP,
    TResult? Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult? Function(String oldPassword, String newPassword)? updatePassword,
    TResult? Function(String email, String otp)? verifyOTP,
    TResult? Function()? getUserProfileByUserId,
  }) {
    return getServerTime?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isAppStart)? getUserProfile,
    TResult Function()? getServerTime,
    TResult Function()? updateDeviceToken,
    TResult Function(String username, bool isResend, String? email)? sendOTP,
    TResult Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult Function(String oldPassword, String newPassword)? updatePassword,
    TResult Function(String email, String otp)? verifyOTP,
    TResult Function()? getUserProfileByUserId,
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
    required TResult Function(_UpdateDeviceToken value) updateDeviceToken,
    required TResult Function(_SendOTP value) sendOTP,
    required TResult Function(_SendOTPSms value) sendOTPSms,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_VerifyOTP value) verifyOTP,
    required TResult Function(_GetUserProfileByUserId value)
        getUserProfileByUserId,
  }) {
    return getServerTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserProfile value)? getUserProfile,
    TResult? Function(_GetServerTime value)? getServerTime,
    TResult? Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult? Function(_SendOTP value)? sendOTP,
    TResult? Function(_SendOTPSms value)? sendOTPSms,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_VerifyOTP value)? verifyOTP,
    TResult? Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
  }) {
    return getServerTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserProfile value)? getUserProfile,
    TResult Function(_GetServerTime value)? getServerTime,
    TResult Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult Function(_SendOTP value)? sendOTP,
    TResult Function(_SendOTPSms value)? sendOTPSms,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
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
abstract class _$$UpdateDeviceTokenImplCopyWith<$Res> {
  factory _$$UpdateDeviceTokenImplCopyWith(_$UpdateDeviceTokenImpl value,
          $Res Function(_$UpdateDeviceTokenImpl) then) =
      __$$UpdateDeviceTokenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateDeviceTokenImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UpdateDeviceTokenImpl>
    implements _$$UpdateDeviceTokenImplCopyWith<$Res> {
  __$$UpdateDeviceTokenImplCopyWithImpl(_$UpdateDeviceTokenImpl _value,
      $Res Function(_$UpdateDeviceTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdateDeviceTokenImpl implements _UpdateDeviceToken {
  const _$UpdateDeviceTokenImpl();

  @override
  String toString() {
    return 'UserEvent.updateDeviceToken()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateDeviceTokenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isAppStart) getUserProfile,
    required TResult Function() getServerTime,
    required TResult Function() updateDeviceToken,
    required TResult Function(String username, bool isResend, String? email)
        sendOTP,
    required TResult Function(
            String? phoneNumber, String username, bool isResend)
        sendOTPSms,
    required TResult Function(String oldPassword, String newPassword)
        updatePassword,
    required TResult Function(String email, String otp) verifyOTP,
    required TResult Function() getUserProfileByUserId,
  }) {
    return updateDeviceToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isAppStart)? getUserProfile,
    TResult? Function()? getServerTime,
    TResult? Function()? updateDeviceToken,
    TResult? Function(String username, bool isResend, String? email)? sendOTP,
    TResult? Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult? Function(String oldPassword, String newPassword)? updatePassword,
    TResult? Function(String email, String otp)? verifyOTP,
    TResult? Function()? getUserProfileByUserId,
  }) {
    return updateDeviceToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isAppStart)? getUserProfile,
    TResult Function()? getServerTime,
    TResult Function()? updateDeviceToken,
    TResult Function(String username, bool isResend, String? email)? sendOTP,
    TResult Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult Function(String oldPassword, String newPassword)? updatePassword,
    TResult Function(String email, String otp)? verifyOTP,
    TResult Function()? getUserProfileByUserId,
    required TResult orElse(),
  }) {
    if (updateDeviceToken != null) {
      return updateDeviceToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetUserProfile value) getUserProfile,
    required TResult Function(_GetServerTime value) getServerTime,
    required TResult Function(_UpdateDeviceToken value) updateDeviceToken,
    required TResult Function(_SendOTP value) sendOTP,
    required TResult Function(_SendOTPSms value) sendOTPSms,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_VerifyOTP value) verifyOTP,
    required TResult Function(_GetUserProfileByUserId value)
        getUserProfileByUserId,
  }) {
    return updateDeviceToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserProfile value)? getUserProfile,
    TResult? Function(_GetServerTime value)? getServerTime,
    TResult? Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult? Function(_SendOTP value)? sendOTP,
    TResult? Function(_SendOTPSms value)? sendOTPSms,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_VerifyOTP value)? verifyOTP,
    TResult? Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
  }) {
    return updateDeviceToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserProfile value)? getUserProfile,
    TResult Function(_GetServerTime value)? getServerTime,
    TResult Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult Function(_SendOTP value)? sendOTP,
    TResult Function(_SendOTPSms value)? sendOTPSms,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
    required TResult orElse(),
  }) {
    if (updateDeviceToken != null) {
      return updateDeviceToken(this);
    }
    return orElse();
  }
}

abstract class _UpdateDeviceToken implements UserEvent {
  const factory _UpdateDeviceToken() = _$UpdateDeviceTokenImpl;
}

/// @nodoc
abstract class _$$SendOTPImplCopyWith<$Res> {
  factory _$$SendOTPImplCopyWith(
          _$SendOTPImpl value, $Res Function(_$SendOTPImpl) then) =
      __$$SendOTPImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String username, bool isResend, String? email});
}

/// @nodoc
class __$$SendOTPImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$SendOTPImpl>
    implements _$$SendOTPImplCopyWith<$Res> {
  __$$SendOTPImplCopyWithImpl(
      _$SendOTPImpl _value, $Res Function(_$SendOTPImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? isResend = null,
    Object? email = freezed,
  }) {
    return _then(_$SendOTPImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      isResend: null == isResend
          ? _value.isResend
          : isResend // ignore: cast_nullable_to_non_nullable
              as bool,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SendOTPImpl implements _SendOTP {
  const _$SendOTPImpl(
      {required this.username, required this.isResend, this.email});

  @override
  final String username;
  @override
  final bool isResend;
  @override
  final String? email;

  @override
  String toString() {
    return 'UserEvent.sendOTP(username: $username, isResend: $isResend, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOTPImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.isResend, isResend) ||
                other.isResend == isResend) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, isResend, email);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOTPImplCopyWith<_$SendOTPImpl> get copyWith =>
      __$$SendOTPImplCopyWithImpl<_$SendOTPImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isAppStart) getUserProfile,
    required TResult Function() getServerTime,
    required TResult Function() updateDeviceToken,
    required TResult Function(String username, bool isResend, String? email)
        sendOTP,
    required TResult Function(
            String? phoneNumber, String username, bool isResend)
        sendOTPSms,
    required TResult Function(String oldPassword, String newPassword)
        updatePassword,
    required TResult Function(String email, String otp) verifyOTP,
    required TResult Function() getUserProfileByUserId,
  }) {
    return sendOTP(username, isResend, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isAppStart)? getUserProfile,
    TResult? Function()? getServerTime,
    TResult? Function()? updateDeviceToken,
    TResult? Function(String username, bool isResend, String? email)? sendOTP,
    TResult? Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult? Function(String oldPassword, String newPassword)? updatePassword,
    TResult? Function(String email, String otp)? verifyOTP,
    TResult? Function()? getUserProfileByUserId,
  }) {
    return sendOTP?.call(username, isResend, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isAppStart)? getUserProfile,
    TResult Function()? getServerTime,
    TResult Function()? updateDeviceToken,
    TResult Function(String username, bool isResend, String? email)? sendOTP,
    TResult Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult Function(String oldPassword, String newPassword)? updatePassword,
    TResult Function(String email, String otp)? verifyOTP,
    TResult Function()? getUserProfileByUserId,
    required TResult orElse(),
  }) {
    if (sendOTP != null) {
      return sendOTP(username, isResend, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetUserProfile value) getUserProfile,
    required TResult Function(_GetServerTime value) getServerTime,
    required TResult Function(_UpdateDeviceToken value) updateDeviceToken,
    required TResult Function(_SendOTP value) sendOTP,
    required TResult Function(_SendOTPSms value) sendOTPSms,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_VerifyOTP value) verifyOTP,
    required TResult Function(_GetUserProfileByUserId value)
        getUserProfileByUserId,
  }) {
    return sendOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserProfile value)? getUserProfile,
    TResult? Function(_GetServerTime value)? getServerTime,
    TResult? Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult? Function(_SendOTP value)? sendOTP,
    TResult? Function(_SendOTPSms value)? sendOTPSms,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_VerifyOTP value)? verifyOTP,
    TResult? Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
  }) {
    return sendOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserProfile value)? getUserProfile,
    TResult Function(_GetServerTime value)? getServerTime,
    TResult Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult Function(_SendOTP value)? sendOTP,
    TResult Function(_SendOTPSms value)? sendOTPSms,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
    required TResult orElse(),
  }) {
    if (sendOTP != null) {
      return sendOTP(this);
    }
    return orElse();
  }
}

abstract class _SendOTP implements UserEvent {
  const factory _SendOTP(
      {required final String username,
      required final bool isResend,
      final String? email}) = _$SendOTPImpl;

  String get username;
  bool get isResend;
  String? get email;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOTPImplCopyWith<_$SendOTPImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendOTPSmsImplCopyWith<$Res> {
  factory _$$SendOTPSmsImplCopyWith(
          _$SendOTPSmsImpl value, $Res Function(_$SendOTPSmsImpl) then) =
      __$$SendOTPSmsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? phoneNumber, String username, bool isResend});
}

/// @nodoc
class __$$SendOTPSmsImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$SendOTPSmsImpl>
    implements _$$SendOTPSmsImplCopyWith<$Res> {
  __$$SendOTPSmsImplCopyWithImpl(
      _$SendOTPSmsImpl _value, $Res Function(_$SendOTPSmsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? username = null,
    Object? isResend = null,
  }) {
    return _then(_$SendOTPSmsImpl(
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      isResend: null == isResend
          ? _value.isResend
          : isResend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SendOTPSmsImpl implements _SendOTPSms {
  const _$SendOTPSmsImpl(
      {this.phoneNumber, required this.username, required this.isResend});

  @override
  final String? phoneNumber;
  @override
  final String username;
  @override
  final bool isResend;

  @override
  String toString() {
    return 'UserEvent.sendOTPSms(phoneNumber: $phoneNumber, username: $username, isResend: $isResend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOTPSmsImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.isResend, isResend) ||
                other.isResend == isResend));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, username, isResend);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOTPSmsImplCopyWith<_$SendOTPSmsImpl> get copyWith =>
      __$$SendOTPSmsImplCopyWithImpl<_$SendOTPSmsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isAppStart) getUserProfile,
    required TResult Function() getServerTime,
    required TResult Function() updateDeviceToken,
    required TResult Function(String username, bool isResend, String? email)
        sendOTP,
    required TResult Function(
            String? phoneNumber, String username, bool isResend)
        sendOTPSms,
    required TResult Function(String oldPassword, String newPassword)
        updatePassword,
    required TResult Function(String email, String otp) verifyOTP,
    required TResult Function() getUserProfileByUserId,
  }) {
    return sendOTPSms(phoneNumber, username, isResend);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isAppStart)? getUserProfile,
    TResult? Function()? getServerTime,
    TResult? Function()? updateDeviceToken,
    TResult? Function(String username, bool isResend, String? email)? sendOTP,
    TResult? Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult? Function(String oldPassword, String newPassword)? updatePassword,
    TResult? Function(String email, String otp)? verifyOTP,
    TResult? Function()? getUserProfileByUserId,
  }) {
    return sendOTPSms?.call(phoneNumber, username, isResend);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isAppStart)? getUserProfile,
    TResult Function()? getServerTime,
    TResult Function()? updateDeviceToken,
    TResult Function(String username, bool isResend, String? email)? sendOTP,
    TResult Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult Function(String oldPassword, String newPassword)? updatePassword,
    TResult Function(String email, String otp)? verifyOTP,
    TResult Function()? getUserProfileByUserId,
    required TResult orElse(),
  }) {
    if (sendOTPSms != null) {
      return sendOTPSms(phoneNumber, username, isResend);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetUserProfile value) getUserProfile,
    required TResult Function(_GetServerTime value) getServerTime,
    required TResult Function(_UpdateDeviceToken value) updateDeviceToken,
    required TResult Function(_SendOTP value) sendOTP,
    required TResult Function(_SendOTPSms value) sendOTPSms,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_VerifyOTP value) verifyOTP,
    required TResult Function(_GetUserProfileByUserId value)
        getUserProfileByUserId,
  }) {
    return sendOTPSms(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserProfile value)? getUserProfile,
    TResult? Function(_GetServerTime value)? getServerTime,
    TResult? Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult? Function(_SendOTP value)? sendOTP,
    TResult? Function(_SendOTPSms value)? sendOTPSms,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_VerifyOTP value)? verifyOTP,
    TResult? Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
  }) {
    return sendOTPSms?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserProfile value)? getUserProfile,
    TResult Function(_GetServerTime value)? getServerTime,
    TResult Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult Function(_SendOTP value)? sendOTP,
    TResult Function(_SendOTPSms value)? sendOTPSms,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
    required TResult orElse(),
  }) {
    if (sendOTPSms != null) {
      return sendOTPSms(this);
    }
    return orElse();
  }
}

abstract class _SendOTPSms implements UserEvent {
  const factory _SendOTPSms(
      {final String? phoneNumber,
      required final String username,
      required final bool isResend}) = _$SendOTPSmsImpl;

  String? get phoneNumber;
  String get username;
  bool get isResend;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOTPSmsImplCopyWith<_$SendOTPSmsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePasswordImplCopyWith<$Res> {
  factory _$$UpdatePasswordImplCopyWith(_$UpdatePasswordImpl value,
          $Res Function(_$UpdatePasswordImpl) then) =
      __$$UpdatePasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String oldPassword, String newPassword});
}

/// @nodoc
class __$$UpdatePasswordImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UpdatePasswordImpl>
    implements _$$UpdatePasswordImplCopyWith<$Res> {
  __$$UpdatePasswordImplCopyWithImpl(
      _$UpdatePasswordImpl _value, $Res Function(_$UpdatePasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_$UpdatePasswordImpl(
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdatePasswordImpl implements _UpdatePassword {
  const _$UpdatePasswordImpl(
      {required this.oldPassword, required this.newPassword});

  @override
  final String oldPassword;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'UserEvent.updatePassword(oldPassword: $oldPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePasswordImpl &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldPassword, newPassword);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePasswordImplCopyWith<_$UpdatePasswordImpl> get copyWith =>
      __$$UpdatePasswordImplCopyWithImpl<_$UpdatePasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isAppStart) getUserProfile,
    required TResult Function() getServerTime,
    required TResult Function() updateDeviceToken,
    required TResult Function(String username, bool isResend, String? email)
        sendOTP,
    required TResult Function(
            String? phoneNumber, String username, bool isResend)
        sendOTPSms,
    required TResult Function(String oldPassword, String newPassword)
        updatePassword,
    required TResult Function(String email, String otp) verifyOTP,
    required TResult Function() getUserProfileByUserId,
  }) {
    return updatePassword(oldPassword, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isAppStart)? getUserProfile,
    TResult? Function()? getServerTime,
    TResult? Function()? updateDeviceToken,
    TResult? Function(String username, bool isResend, String? email)? sendOTP,
    TResult? Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult? Function(String oldPassword, String newPassword)? updatePassword,
    TResult? Function(String email, String otp)? verifyOTP,
    TResult? Function()? getUserProfileByUserId,
  }) {
    return updatePassword?.call(oldPassword, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isAppStart)? getUserProfile,
    TResult Function()? getServerTime,
    TResult Function()? updateDeviceToken,
    TResult Function(String username, bool isResend, String? email)? sendOTP,
    TResult Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult Function(String oldPassword, String newPassword)? updatePassword,
    TResult Function(String email, String otp)? verifyOTP,
    TResult Function()? getUserProfileByUserId,
    required TResult orElse(),
  }) {
    if (updatePassword != null) {
      return updatePassword(oldPassword, newPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetUserProfile value) getUserProfile,
    required TResult Function(_GetServerTime value) getServerTime,
    required TResult Function(_UpdateDeviceToken value) updateDeviceToken,
    required TResult Function(_SendOTP value) sendOTP,
    required TResult Function(_SendOTPSms value) sendOTPSms,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_VerifyOTP value) verifyOTP,
    required TResult Function(_GetUserProfileByUserId value)
        getUserProfileByUserId,
  }) {
    return updatePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserProfile value)? getUserProfile,
    TResult? Function(_GetServerTime value)? getServerTime,
    TResult? Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult? Function(_SendOTP value)? sendOTP,
    TResult? Function(_SendOTPSms value)? sendOTPSms,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_VerifyOTP value)? verifyOTP,
    TResult? Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
  }) {
    return updatePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserProfile value)? getUserProfile,
    TResult Function(_GetServerTime value)? getServerTime,
    TResult Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult Function(_SendOTP value)? sendOTP,
    TResult Function(_SendOTPSms value)? sendOTPSms,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
    required TResult orElse(),
  }) {
    if (updatePassword != null) {
      return updatePassword(this);
    }
    return orElse();
  }
}

abstract class _UpdatePassword implements UserEvent {
  const factory _UpdatePassword(
      {required final String oldPassword,
      required final String newPassword}) = _$UpdatePasswordImpl;

  String get oldPassword;
  String get newPassword;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePasswordImplCopyWith<_$UpdatePasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyOTPImplCopyWith<$Res> {
  factory _$$VerifyOTPImplCopyWith(
          _$VerifyOTPImpl value, $Res Function(_$VerifyOTPImpl) then) =
      __$$VerifyOTPImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String otp});
}

/// @nodoc
class __$$VerifyOTPImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$VerifyOTPImpl>
    implements _$$VerifyOTPImplCopyWith<$Res> {
  __$$VerifyOTPImplCopyWithImpl(
      _$VerifyOTPImpl _value, $Res Function(_$VerifyOTPImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? otp = null,
  }) {
    return _then(_$VerifyOTPImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerifyOTPImpl implements _VerifyOTP {
  const _$VerifyOTPImpl({required this.email, required this.otp});

  @override
  final String email;
  @override
  final String otp;

  @override
  String toString() {
    return 'UserEvent.verifyOTP(email: $email, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOTPImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, otp);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOTPImplCopyWith<_$VerifyOTPImpl> get copyWith =>
      __$$VerifyOTPImplCopyWithImpl<_$VerifyOTPImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isAppStart) getUserProfile,
    required TResult Function() getServerTime,
    required TResult Function() updateDeviceToken,
    required TResult Function(String username, bool isResend, String? email)
        sendOTP,
    required TResult Function(
            String? phoneNumber, String username, bool isResend)
        sendOTPSms,
    required TResult Function(String oldPassword, String newPassword)
        updatePassword,
    required TResult Function(String email, String otp) verifyOTP,
    required TResult Function() getUserProfileByUserId,
  }) {
    return verifyOTP(email, otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isAppStart)? getUserProfile,
    TResult? Function()? getServerTime,
    TResult? Function()? updateDeviceToken,
    TResult? Function(String username, bool isResend, String? email)? sendOTP,
    TResult? Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult? Function(String oldPassword, String newPassword)? updatePassword,
    TResult? Function(String email, String otp)? verifyOTP,
    TResult? Function()? getUserProfileByUserId,
  }) {
    return verifyOTP?.call(email, otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isAppStart)? getUserProfile,
    TResult Function()? getServerTime,
    TResult Function()? updateDeviceToken,
    TResult Function(String username, bool isResend, String? email)? sendOTP,
    TResult Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult Function(String oldPassword, String newPassword)? updatePassword,
    TResult Function(String email, String otp)? verifyOTP,
    TResult Function()? getUserProfileByUserId,
    required TResult orElse(),
  }) {
    if (verifyOTP != null) {
      return verifyOTP(email, otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetUserProfile value) getUserProfile,
    required TResult Function(_GetServerTime value) getServerTime,
    required TResult Function(_UpdateDeviceToken value) updateDeviceToken,
    required TResult Function(_SendOTP value) sendOTP,
    required TResult Function(_SendOTPSms value) sendOTPSms,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_VerifyOTP value) verifyOTP,
    required TResult Function(_GetUserProfileByUserId value)
        getUserProfileByUserId,
  }) {
    return verifyOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserProfile value)? getUserProfile,
    TResult? Function(_GetServerTime value)? getServerTime,
    TResult? Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult? Function(_SendOTP value)? sendOTP,
    TResult? Function(_SendOTPSms value)? sendOTPSms,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_VerifyOTP value)? verifyOTP,
    TResult? Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
  }) {
    return verifyOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserProfile value)? getUserProfile,
    TResult Function(_GetServerTime value)? getServerTime,
    TResult Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult Function(_SendOTP value)? sendOTP,
    TResult Function(_SendOTPSms value)? sendOTPSms,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
    required TResult orElse(),
  }) {
    if (verifyOTP != null) {
      return verifyOTP(this);
    }
    return orElse();
  }
}

abstract class _VerifyOTP implements UserEvent {
  const factory _VerifyOTP(
      {required final String email,
      required final String otp}) = _$VerifyOTPImpl;

  String get email;
  String get otp;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOTPImplCopyWith<_$VerifyOTPImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetUserProfileByUserIdImplCopyWith<$Res> {
  factory _$$GetUserProfileByUserIdImplCopyWith(
          _$GetUserProfileByUserIdImpl value,
          $Res Function(_$GetUserProfileByUserIdImpl) then) =
      __$$GetUserProfileByUserIdImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserProfileByUserIdImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetUserProfileByUserIdImpl>
    implements _$$GetUserProfileByUserIdImplCopyWith<$Res> {
  __$$GetUserProfileByUserIdImplCopyWithImpl(
      _$GetUserProfileByUserIdImpl _value,
      $Res Function(_$GetUserProfileByUserIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetUserProfileByUserIdImpl implements _GetUserProfileByUserId {
  const _$GetUserProfileByUserIdImpl();

  @override
  String toString() {
    return 'UserEvent.getUserProfileByUserId()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserProfileByUserIdImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isAppStart) getUserProfile,
    required TResult Function() getServerTime,
    required TResult Function() updateDeviceToken,
    required TResult Function(String username, bool isResend, String? email)
        sendOTP,
    required TResult Function(
            String? phoneNumber, String username, bool isResend)
        sendOTPSms,
    required TResult Function(String oldPassword, String newPassword)
        updatePassword,
    required TResult Function(String email, String otp) verifyOTP,
    required TResult Function() getUserProfileByUserId,
  }) {
    return getUserProfileByUserId();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isAppStart)? getUserProfile,
    TResult? Function()? getServerTime,
    TResult? Function()? updateDeviceToken,
    TResult? Function(String username, bool isResend, String? email)? sendOTP,
    TResult? Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult? Function(String oldPassword, String newPassword)? updatePassword,
    TResult? Function(String email, String otp)? verifyOTP,
    TResult? Function()? getUserProfileByUserId,
  }) {
    return getUserProfileByUserId?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isAppStart)? getUserProfile,
    TResult Function()? getServerTime,
    TResult Function()? updateDeviceToken,
    TResult Function(String username, bool isResend, String? email)? sendOTP,
    TResult Function(String? phoneNumber, String username, bool isResend)?
        sendOTPSms,
    TResult Function(String oldPassword, String newPassword)? updatePassword,
    TResult Function(String email, String otp)? verifyOTP,
    TResult Function()? getUserProfileByUserId,
    required TResult orElse(),
  }) {
    if (getUserProfileByUserId != null) {
      return getUserProfileByUserId();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetUserProfile value) getUserProfile,
    required TResult Function(_GetServerTime value) getServerTime,
    required TResult Function(_UpdateDeviceToken value) updateDeviceToken,
    required TResult Function(_SendOTP value) sendOTP,
    required TResult Function(_SendOTPSms value) sendOTPSms,
    required TResult Function(_UpdatePassword value) updatePassword,
    required TResult Function(_VerifyOTP value) verifyOTP,
    required TResult Function(_GetUserProfileByUserId value)
        getUserProfileByUserId,
  }) {
    return getUserProfileByUserId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetUserProfile value)? getUserProfile,
    TResult? Function(_GetServerTime value)? getServerTime,
    TResult? Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult? Function(_SendOTP value)? sendOTP,
    TResult? Function(_SendOTPSms value)? sendOTPSms,
    TResult? Function(_UpdatePassword value)? updatePassword,
    TResult? Function(_VerifyOTP value)? verifyOTP,
    TResult? Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
  }) {
    return getUserProfileByUserId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetUserProfile value)? getUserProfile,
    TResult Function(_GetServerTime value)? getServerTime,
    TResult Function(_UpdateDeviceToken value)? updateDeviceToken,
    TResult Function(_SendOTP value)? sendOTP,
    TResult Function(_SendOTPSms value)? sendOTPSms,
    TResult Function(_UpdatePassword value)? updatePassword,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_GetUserProfileByUserId value)? getUserProfileByUserId,
    required TResult orElse(),
  }) {
    if (getUserProfileByUserId != null) {
      return getUserProfileByUserId(this);
    }
    return orElse();
  }
}

abstract class _GetUserProfileByUserId implements UserEvent {
  const factory _GetUserProfileByUserId() = _$GetUserProfileByUserIdImpl;
}

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
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
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
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
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return getUserProfileInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return getUserProfileInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
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
  $Res call({String userName, String email, bool isAppStart});
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
    Object? isAppStart = null,
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
      null == isAppStart
          ? _value.isAppStart
          : isAppStart // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetUserProfileSuccessImpl implements _GetUserProfileSuccess {
  const _$GetUserProfileSuccessImpl(this.userName, this.email, this.isAppStart);

  @override
  final String userName;
  @override
  final String email;
  @override
  final bool isAppStart;

  @override
  String toString() {
    return 'UserState.getUserProfileSuccess(userName: $userName, email: $email, isAppStart: $isAppStart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserProfileSuccessImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isAppStart, isAppStart) ||
                other.isAppStart == isAppStart));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, email, isAppStart);

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
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return getUserProfileSuccess(userName, email, isAppStart);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return getUserProfileSuccess?.call(userName, email, isAppStart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (getUserProfileSuccess != null) {
      return getUserProfileSuccess(userName, email, isAppStart);
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
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
          final String userName, final String email, final bool isAppStart) =
      _$GetUserProfileSuccessImpl;

  String get userName;
  String get email;
  bool get isAppStart;

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
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return getUserProfileFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return getUserProfileFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
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
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return getServerTimeInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return getServerTimeInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
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
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return getServerTimeSuccess(serverTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return getServerTimeSuccess?.call(serverTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
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
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return getServerTimeFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return getServerTimeFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
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

/// @nodoc
abstract class _$$UpdateDeviceTokenInProgressImplCopyWith<$Res> {
  factory _$$UpdateDeviceTokenInProgressImplCopyWith(
          _$UpdateDeviceTokenInProgressImpl value,
          $Res Function(_$UpdateDeviceTokenInProgressImpl) then) =
      __$$UpdateDeviceTokenInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateDeviceTokenInProgressImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UpdateDeviceTokenInProgressImpl>
    implements _$$UpdateDeviceTokenInProgressImplCopyWith<$Res> {
  __$$UpdateDeviceTokenInProgressImplCopyWithImpl(
      _$UpdateDeviceTokenInProgressImpl _value,
      $Res Function(_$UpdateDeviceTokenInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdateDeviceTokenInProgressImpl
    implements _UpdateDeviceTokenInProgress {
  const _$UpdateDeviceTokenInProgressImpl();

  @override
  String toString() {
    return 'UserState.updateDeviceTokenInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDeviceTokenInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return updateDeviceTokenInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return updateDeviceTokenInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (updateDeviceTokenInProgress != null) {
      return updateDeviceTokenInProgress();
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return updateDeviceTokenInProgress(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return updateDeviceTokenInProgress?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (updateDeviceTokenInProgress != null) {
      return updateDeviceTokenInProgress(this);
    }
    return orElse();
  }
}

abstract class _UpdateDeviceTokenInProgress implements UserState {
  const factory _UpdateDeviceTokenInProgress() =
      _$UpdateDeviceTokenInProgressImpl;
}

/// @nodoc
abstract class _$$UpdateDeviceTokenSuccessImplCopyWith<$Res> {
  factory _$$UpdateDeviceTokenSuccessImplCopyWith(
          _$UpdateDeviceTokenSuccessImpl value,
          $Res Function(_$UpdateDeviceTokenSuccessImpl) then) =
      __$$UpdateDeviceTokenSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateDeviceTokenSuccessImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UpdateDeviceTokenSuccessImpl>
    implements _$$UpdateDeviceTokenSuccessImplCopyWith<$Res> {
  __$$UpdateDeviceTokenSuccessImplCopyWithImpl(
      _$UpdateDeviceTokenSuccessImpl _value,
      $Res Function(_$UpdateDeviceTokenSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdateDeviceTokenSuccessImpl implements _UpdateDeviceTokenSuccess {
  const _$UpdateDeviceTokenSuccessImpl();

  @override
  String toString() {
    return 'UserState.updateDeviceTokenSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDeviceTokenSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return updateDeviceTokenSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return updateDeviceTokenSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (updateDeviceTokenSuccess != null) {
      return updateDeviceTokenSuccess();
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return updateDeviceTokenSuccess(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return updateDeviceTokenSuccess?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (updateDeviceTokenSuccess != null) {
      return updateDeviceTokenSuccess(this);
    }
    return orElse();
  }
}

abstract class _UpdateDeviceTokenSuccess implements UserState {
  const factory _UpdateDeviceTokenSuccess() = _$UpdateDeviceTokenSuccessImpl;
}

/// @nodoc
abstract class _$$UpdateDeviceTokenFailureImplCopyWith<$Res> {
  factory _$$UpdateDeviceTokenFailureImplCopyWith(
          _$UpdateDeviceTokenFailureImpl value,
          $Res Function(_$UpdateDeviceTokenFailureImpl) then) =
      __$$UpdateDeviceTokenFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UpdateDeviceTokenFailureImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UpdateDeviceTokenFailureImpl>
    implements _$$UpdateDeviceTokenFailureImplCopyWith<$Res> {
  __$$UpdateDeviceTokenFailureImplCopyWithImpl(
      _$UpdateDeviceTokenFailureImpl _value,
      $Res Function(_$UpdateDeviceTokenFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UpdateDeviceTokenFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateDeviceTokenFailureImpl implements _UpdateDeviceTokenFailure {
  const _$UpdateDeviceTokenFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UserState.updateDeviceTokenFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDeviceTokenFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDeviceTokenFailureImplCopyWith<_$UpdateDeviceTokenFailureImpl>
      get copyWith => __$$UpdateDeviceTokenFailureImplCopyWithImpl<
          _$UpdateDeviceTokenFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return updateDeviceTokenFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return updateDeviceTokenFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (updateDeviceTokenFailure != null) {
      return updateDeviceTokenFailure(message);
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return updateDeviceTokenFailure(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return updateDeviceTokenFailure?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (updateDeviceTokenFailure != null) {
      return updateDeviceTokenFailure(this);
    }
    return orElse();
  }
}

abstract class _UpdateDeviceTokenFailure implements UserState {
  const factory _UpdateDeviceTokenFailure(final String message) =
      _$UpdateDeviceTokenFailureImpl;

  String get message;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateDeviceTokenFailureImplCopyWith<_$UpdateDeviceTokenFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendOTPInProgressImplCopyWith<$Res> {
  factory _$$SendOTPInProgressImplCopyWith(_$SendOTPInProgressImpl value,
          $Res Function(_$SendOTPInProgressImpl) then) =
      __$$SendOTPInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendOTPInProgressImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$SendOTPInProgressImpl>
    implements _$$SendOTPInProgressImplCopyWith<$Res> {
  __$$SendOTPInProgressImplCopyWithImpl(_$SendOTPInProgressImpl _value,
      $Res Function(_$SendOTPInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendOTPInProgressImpl implements _SendOTPInProgress {
  const _$SendOTPInProgressImpl();

  @override
  String toString() {
    return 'UserState.sendOTPInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendOTPInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return sendOTPInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return sendOTPInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (sendOTPInProgress != null) {
      return sendOTPInProgress();
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return sendOTPInProgress(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return sendOTPInProgress?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (sendOTPInProgress != null) {
      return sendOTPInProgress(this);
    }
    return orElse();
  }
}

abstract class _SendOTPInProgress implements UserState {
  const factory _SendOTPInProgress() = _$SendOTPInProgressImpl;
}

/// @nodoc
abstract class _$$SendOTPSuccessImplCopyWith<$Res> {
  factory _$$SendOTPSuccessImplCopyWith(_$SendOTPSuccessImpl value,
          $Res Function(_$SendOTPSuccessImpl) then) =
      __$$SendOTPSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$SendOTPSuccessImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$SendOTPSuccessImpl>
    implements _$$SendOTPSuccessImplCopyWith<$Res> {
  __$$SendOTPSuccessImplCopyWithImpl(
      _$SendOTPSuccessImpl _value, $Res Function(_$SendOTPSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$SendOTPSuccessImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendOTPSuccessImpl implements _SendOTPSuccess {
  const _$SendOTPSuccessImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'UserState.sendOTPSuccess(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOTPSuccessImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOTPSuccessImplCopyWith<_$SendOTPSuccessImpl> get copyWith =>
      __$$SendOTPSuccessImplCopyWithImpl<_$SendOTPSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return sendOTPSuccess(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return sendOTPSuccess?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (sendOTPSuccess != null) {
      return sendOTPSuccess(email);
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return sendOTPSuccess(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return sendOTPSuccess?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (sendOTPSuccess != null) {
      return sendOTPSuccess(this);
    }
    return orElse();
  }
}

abstract class _SendOTPSuccess implements UserState {
  const factory _SendOTPSuccess(final String email) = _$SendOTPSuccessImpl;

  String get email;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOTPSuccessImplCopyWith<_$SendOTPSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendOTPFailureImplCopyWith<$Res> {
  factory _$$SendOTPFailureImplCopyWith(_$SendOTPFailureImpl value,
          $Res Function(_$SendOTPFailureImpl) then) =
      __$$SendOTPFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SendOTPFailureImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$SendOTPFailureImpl>
    implements _$$SendOTPFailureImplCopyWith<$Res> {
  __$$SendOTPFailureImplCopyWithImpl(
      _$SendOTPFailureImpl _value, $Res Function(_$SendOTPFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SendOTPFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendOTPFailureImpl implements _SendOTPFailure {
  const _$SendOTPFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UserState.sendOTPFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOTPFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOTPFailureImplCopyWith<_$SendOTPFailureImpl> get copyWith =>
      __$$SendOTPFailureImplCopyWithImpl<_$SendOTPFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return sendOTPFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return sendOTPFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (sendOTPFailure != null) {
      return sendOTPFailure(message);
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return sendOTPFailure(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return sendOTPFailure?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (sendOTPFailure != null) {
      return sendOTPFailure(this);
    }
    return orElse();
  }
}

abstract class _SendOTPFailure implements UserState {
  const factory _SendOTPFailure(final String message) = _$SendOTPFailureImpl;

  String get message;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOTPFailureImplCopyWith<_$SendOTPFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendOTPSmsInProgressImplCopyWith<$Res> {
  factory _$$SendOTPSmsInProgressImplCopyWith(_$SendOTPSmsInProgressImpl value,
          $Res Function(_$SendOTPSmsInProgressImpl) then) =
      __$$SendOTPSmsInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendOTPSmsInProgressImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$SendOTPSmsInProgressImpl>
    implements _$$SendOTPSmsInProgressImplCopyWith<$Res> {
  __$$SendOTPSmsInProgressImplCopyWithImpl(_$SendOTPSmsInProgressImpl _value,
      $Res Function(_$SendOTPSmsInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendOTPSmsInProgressImpl implements _SendOTPSmsInProgress {
  const _$SendOTPSmsInProgressImpl();

  @override
  String toString() {
    return 'UserState.sendOTPSmsInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOTPSmsInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return sendOTPSmsInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return sendOTPSmsInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (sendOTPSmsInProgress != null) {
      return sendOTPSmsInProgress();
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return sendOTPSmsInProgress(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return sendOTPSmsInProgress?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (sendOTPSmsInProgress != null) {
      return sendOTPSmsInProgress(this);
    }
    return orElse();
  }
}

abstract class _SendOTPSmsInProgress implements UserState {
  const factory _SendOTPSmsInProgress() = _$SendOTPSmsInProgressImpl;
}

/// @nodoc
abstract class _$$SendOTPSmsSuccessImplCopyWith<$Res> {
  factory _$$SendOTPSmsSuccessImplCopyWith(_$SendOTPSmsSuccessImpl value,
          $Res Function(_$SendOTPSmsSuccessImpl) then) =
      __$$SendOTPSmsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$SendOTPSmsSuccessImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$SendOTPSmsSuccessImpl>
    implements _$$SendOTPSmsSuccessImplCopyWith<$Res> {
  __$$SendOTPSmsSuccessImplCopyWithImpl(_$SendOTPSmsSuccessImpl _value,
      $Res Function(_$SendOTPSmsSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$SendOTPSmsSuccessImpl(
      null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendOTPSmsSuccessImpl implements _SendOTPSmsSuccess {
  const _$SendOTPSmsSuccessImpl(this.phoneNumber);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'UserState.sendOTPSmsSuccess(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOTPSmsSuccessImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOTPSmsSuccessImplCopyWith<_$SendOTPSmsSuccessImpl> get copyWith =>
      __$$SendOTPSmsSuccessImplCopyWithImpl<_$SendOTPSmsSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return sendOTPSmsSuccess(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return sendOTPSmsSuccess?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (sendOTPSmsSuccess != null) {
      return sendOTPSmsSuccess(phoneNumber);
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return sendOTPSmsSuccess(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return sendOTPSmsSuccess?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (sendOTPSmsSuccess != null) {
      return sendOTPSmsSuccess(this);
    }
    return orElse();
  }
}

abstract class _SendOTPSmsSuccess implements UserState {
  const factory _SendOTPSmsSuccess(final String phoneNumber) =
      _$SendOTPSmsSuccessImpl;

  String get phoneNumber;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOTPSmsSuccessImplCopyWith<_$SendOTPSmsSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendOTPSmsFailureImplCopyWith<$Res> {
  factory _$$SendOTPSmsFailureImplCopyWith(_$SendOTPSmsFailureImpl value,
          $Res Function(_$SendOTPSmsFailureImpl) then) =
      __$$SendOTPSmsFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SendOTPSmsFailureImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$SendOTPSmsFailureImpl>
    implements _$$SendOTPSmsFailureImplCopyWith<$Res> {
  __$$SendOTPSmsFailureImplCopyWithImpl(_$SendOTPSmsFailureImpl _value,
      $Res Function(_$SendOTPSmsFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SendOTPSmsFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendOTPSmsFailureImpl implements _SendOTPSmsFailure {
  const _$SendOTPSmsFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UserState.sendOTPSmsFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOTPSmsFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOTPSmsFailureImplCopyWith<_$SendOTPSmsFailureImpl> get copyWith =>
      __$$SendOTPSmsFailureImplCopyWithImpl<_$SendOTPSmsFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return sendOTPSmsFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return sendOTPSmsFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (sendOTPSmsFailure != null) {
      return sendOTPSmsFailure(message);
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return sendOTPSmsFailure(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return sendOTPSmsFailure?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (sendOTPSmsFailure != null) {
      return sendOTPSmsFailure(this);
    }
    return orElse();
  }
}

abstract class _SendOTPSmsFailure implements UserState {
  const factory _SendOTPSmsFailure(final String message) =
      _$SendOTPSmsFailureImpl;

  String get message;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOTPSmsFailureImplCopyWith<_$SendOTPSmsFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePasswordInProgressImplCopyWith<$Res> {
  factory _$$UpdatePasswordInProgressImplCopyWith(
          _$UpdatePasswordInProgressImpl value,
          $Res Function(_$UpdatePasswordInProgressImpl) then) =
      __$$UpdatePasswordInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdatePasswordInProgressImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UpdatePasswordInProgressImpl>
    implements _$$UpdatePasswordInProgressImplCopyWith<$Res> {
  __$$UpdatePasswordInProgressImplCopyWithImpl(
      _$UpdatePasswordInProgressImpl _value,
      $Res Function(_$UpdatePasswordInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdatePasswordInProgressImpl implements _UpdatePasswordInProgress {
  const _$UpdatePasswordInProgressImpl();

  @override
  String toString() {
    return 'UserState.updatePasswordInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePasswordInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return updatePasswordInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return updatePasswordInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (updatePasswordInProgress != null) {
      return updatePasswordInProgress();
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return updatePasswordInProgress(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return updatePasswordInProgress?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (updatePasswordInProgress != null) {
      return updatePasswordInProgress(this);
    }
    return orElse();
  }
}

abstract class _UpdatePasswordInProgress implements UserState {
  const factory _UpdatePasswordInProgress() = _$UpdatePasswordInProgressImpl;
}

/// @nodoc
abstract class _$$UpdatePasswordSuccessImplCopyWith<$Res> {
  factory _$$UpdatePasswordSuccessImplCopyWith(
          _$UpdatePasswordSuccessImpl value,
          $Res Function(_$UpdatePasswordSuccessImpl) then) =
      __$$UpdatePasswordSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdatePasswordSuccessImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UpdatePasswordSuccessImpl>
    implements _$$UpdatePasswordSuccessImplCopyWith<$Res> {
  __$$UpdatePasswordSuccessImplCopyWithImpl(_$UpdatePasswordSuccessImpl _value,
      $Res Function(_$UpdatePasswordSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdatePasswordSuccessImpl implements _UpdatePasswordSuccess {
  const _$UpdatePasswordSuccessImpl();

  @override
  String toString() {
    return 'UserState.updatePasswordSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePasswordSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return updatePasswordSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return updatePasswordSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (updatePasswordSuccess != null) {
      return updatePasswordSuccess();
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return updatePasswordSuccess(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return updatePasswordSuccess?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (updatePasswordSuccess != null) {
      return updatePasswordSuccess(this);
    }
    return orElse();
  }
}

abstract class _UpdatePasswordSuccess implements UserState {
  const factory _UpdatePasswordSuccess() = _$UpdatePasswordSuccessImpl;
}

/// @nodoc
abstract class _$$UpdatePasswordFailureImplCopyWith<$Res> {
  factory _$$UpdatePasswordFailureImplCopyWith(
          _$UpdatePasswordFailureImpl value,
          $Res Function(_$UpdatePasswordFailureImpl) then) =
      __$$UpdatePasswordFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UpdatePasswordFailureImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UpdatePasswordFailureImpl>
    implements _$$UpdatePasswordFailureImplCopyWith<$Res> {
  __$$UpdatePasswordFailureImplCopyWithImpl(_$UpdatePasswordFailureImpl _value,
      $Res Function(_$UpdatePasswordFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UpdatePasswordFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdatePasswordFailureImpl implements _UpdatePasswordFailure {
  const _$UpdatePasswordFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UserState.updatePasswordFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePasswordFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePasswordFailureImplCopyWith<_$UpdatePasswordFailureImpl>
      get copyWith => __$$UpdatePasswordFailureImplCopyWithImpl<
          _$UpdatePasswordFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return updatePasswordFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return updatePasswordFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (updatePasswordFailure != null) {
      return updatePasswordFailure(message);
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return updatePasswordFailure(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return updatePasswordFailure?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (updatePasswordFailure != null) {
      return updatePasswordFailure(this);
    }
    return orElse();
  }
}

abstract class _UpdatePasswordFailure implements UserState {
  const factory _UpdatePasswordFailure(final String message) =
      _$UpdatePasswordFailureImpl;

  String get message;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePasswordFailureImplCopyWith<_$UpdatePasswordFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyOTPInProgressImplCopyWith<$Res> {
  factory _$$VerifyOTPInProgressImplCopyWith(_$VerifyOTPInProgressImpl value,
          $Res Function(_$VerifyOTPInProgressImpl) then) =
      __$$VerifyOTPInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifyOTPInProgressImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$VerifyOTPInProgressImpl>
    implements _$$VerifyOTPInProgressImplCopyWith<$Res> {
  __$$VerifyOTPInProgressImplCopyWithImpl(_$VerifyOTPInProgressImpl _value,
      $Res Function(_$VerifyOTPInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VerifyOTPInProgressImpl implements _VerifyOTPInProgress {
  const _$VerifyOTPInProgressImpl();

  @override
  String toString() {
    return 'UserState.verifyOTPInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOTPInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return verifyOTPInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return verifyOTPInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (verifyOTPInProgress != null) {
      return verifyOTPInProgress();
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return verifyOTPInProgress(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return verifyOTPInProgress?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (verifyOTPInProgress != null) {
      return verifyOTPInProgress(this);
    }
    return orElse();
  }
}

abstract class _VerifyOTPInProgress implements UserState {
  const factory _VerifyOTPInProgress() = _$VerifyOTPInProgressImpl;
}

/// @nodoc
abstract class _$$VerifyOTPSuccessImplCopyWith<$Res> {
  factory _$$VerifyOTPSuccessImplCopyWith(_$VerifyOTPSuccessImpl value,
          $Res Function(_$VerifyOTPSuccessImpl) then) =
      __$$VerifyOTPSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifyOTPSuccessImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$VerifyOTPSuccessImpl>
    implements _$$VerifyOTPSuccessImplCopyWith<$Res> {
  __$$VerifyOTPSuccessImplCopyWithImpl(_$VerifyOTPSuccessImpl _value,
      $Res Function(_$VerifyOTPSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VerifyOTPSuccessImpl implements _VerifyOTPSuccess {
  const _$VerifyOTPSuccessImpl();

  @override
  String toString() {
    return 'UserState.verifyOTPSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerifyOTPSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return verifyOTPSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return verifyOTPSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (verifyOTPSuccess != null) {
      return verifyOTPSuccess();
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return verifyOTPSuccess(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return verifyOTPSuccess?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (verifyOTPSuccess != null) {
      return verifyOTPSuccess(this);
    }
    return orElse();
  }
}

abstract class _VerifyOTPSuccess implements UserState {
  const factory _VerifyOTPSuccess() = _$VerifyOTPSuccessImpl;
}

/// @nodoc
abstract class _$$VerifyOTPFailureImplCopyWith<$Res> {
  factory _$$VerifyOTPFailureImplCopyWith(_$VerifyOTPFailureImpl value,
          $Res Function(_$VerifyOTPFailureImpl) then) =
      __$$VerifyOTPFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$VerifyOTPFailureImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$VerifyOTPFailureImpl>
    implements _$$VerifyOTPFailureImplCopyWith<$Res> {
  __$$VerifyOTPFailureImplCopyWithImpl(_$VerifyOTPFailureImpl _value,
      $Res Function(_$VerifyOTPFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$VerifyOTPFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerifyOTPFailureImpl implements _VerifyOTPFailure {
  const _$VerifyOTPFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UserState.verifyOTPFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOTPFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOTPFailureImplCopyWith<_$VerifyOTPFailureImpl> get copyWith =>
      __$$VerifyOTPFailureImplCopyWithImpl<_$VerifyOTPFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return verifyOTPFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return verifyOTPFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (verifyOTPFailure != null) {
      return verifyOTPFailure(message);
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return verifyOTPFailure(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return verifyOTPFailure?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (verifyOTPFailure != null) {
      return verifyOTPFailure(this);
    }
    return orElse();
  }
}

abstract class _VerifyOTPFailure implements UserState {
  const factory _VerifyOTPFailure(final String message) =
      _$VerifyOTPFailureImpl;

  String get message;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOTPFailureImplCopyWith<_$VerifyOTPFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetUserProfileByUserIdInProgressImplCopyWith<$Res> {
  factory _$$GetUserProfileByUserIdInProgressImplCopyWith(
          _$GetUserProfileByUserIdInProgressImpl value,
          $Res Function(_$GetUserProfileByUserIdInProgressImpl) then) =
      __$$GetUserProfileByUserIdInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserProfileByUserIdInProgressImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res,
        _$GetUserProfileByUserIdInProgressImpl>
    implements _$$GetUserProfileByUserIdInProgressImplCopyWith<$Res> {
  __$$GetUserProfileByUserIdInProgressImplCopyWithImpl(
      _$GetUserProfileByUserIdInProgressImpl _value,
      $Res Function(_$GetUserProfileByUserIdInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetUserProfileByUserIdInProgressImpl
    implements _GetUserProfileByUserIdInProgress {
  const _$GetUserProfileByUserIdInProgressImpl();

  @override
  String toString() {
    return 'UserState.getUserProfileByUserIdInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserProfileByUserIdInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return getUserProfileByUserIdInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return getUserProfileByUserIdInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (getUserProfileByUserIdInProgress != null) {
      return getUserProfileByUserIdInProgress();
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return getUserProfileByUserIdInProgress(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return getUserProfileByUserIdInProgress?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (getUserProfileByUserIdInProgress != null) {
      return getUserProfileByUserIdInProgress(this);
    }
    return orElse();
  }
}

abstract class _GetUserProfileByUserIdInProgress implements UserState {
  const factory _GetUserProfileByUserIdInProgress() =
      _$GetUserProfileByUserIdInProgressImpl;
}

/// @nodoc
abstract class _$$GetUserProfileByUserIdSuccessImplCopyWith<$Res> {
  factory _$$GetUserProfileByUserIdSuccessImplCopyWith(
          _$GetUserProfileByUserIdSuccessImpl value,
          $Res Function(_$GetUserProfileByUserIdSuccessImpl) then) =
      __$$GetUserProfileByUserIdSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserProfileByUserIdSuccessImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$GetUserProfileByUserIdSuccessImpl>
    implements _$$GetUserProfileByUserIdSuccessImplCopyWith<$Res> {
  __$$GetUserProfileByUserIdSuccessImplCopyWithImpl(
      _$GetUserProfileByUserIdSuccessImpl _value,
      $Res Function(_$GetUserProfileByUserIdSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetUserProfileByUserIdSuccessImpl
    implements _GetUserProfileByUserIdSuccess {
  const _$GetUserProfileByUserIdSuccessImpl();

  @override
  String toString() {
    return 'UserState.getUserProfileByUserIdSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserProfileByUserIdSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return getUserProfileByUserIdSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return getUserProfileByUserIdSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (getUserProfileByUserIdSuccess != null) {
      return getUserProfileByUserIdSuccess();
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return getUserProfileByUserIdSuccess(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return getUserProfileByUserIdSuccess?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (getUserProfileByUserIdSuccess != null) {
      return getUserProfileByUserIdSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetUserProfileByUserIdSuccess implements UserState {
  const factory _GetUserProfileByUserIdSuccess() =
      _$GetUserProfileByUserIdSuccessImpl;
}

/// @nodoc
abstract class _$$GetUserProfileByUserIdFailureImplCopyWith<$Res> {
  factory _$$GetUserProfileByUserIdFailureImplCopyWith(
          _$GetUserProfileByUserIdFailureImpl value,
          $Res Function(_$GetUserProfileByUserIdFailureImpl) then) =
      __$$GetUserProfileByUserIdFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GetUserProfileByUserIdFailureImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$GetUserProfileByUserIdFailureImpl>
    implements _$$GetUserProfileByUserIdFailureImplCopyWith<$Res> {
  __$$GetUserProfileByUserIdFailureImplCopyWithImpl(
      _$GetUserProfileByUserIdFailureImpl _value,
      $Res Function(_$GetUserProfileByUserIdFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GetUserProfileByUserIdFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetUserProfileByUserIdFailureImpl
    implements _GetUserProfileByUserIdFailure {
  const _$GetUserProfileByUserIdFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UserState.getUserProfileByUserIdFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserProfileByUserIdFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserProfileByUserIdFailureImplCopyWith<
          _$GetUserProfileByUserIdFailureImpl>
      get copyWith => __$$GetUserProfileByUserIdFailureImplCopyWithImpl<
          _$GetUserProfileByUserIdFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserProfileInProgress,
    required TResult Function(String userName, String email, bool isAppStart)
        getUserProfileSuccess,
    required TResult Function(String message) getUserProfileFailure,
    required TResult Function() getServerTimeInProgress,
    required TResult Function(String serverTime) getServerTimeSuccess,
    required TResult Function(String message) getServerTimeFailure,
    required TResult Function() updateDeviceTokenInProgress,
    required TResult Function() updateDeviceTokenSuccess,
    required TResult Function(String message) updateDeviceTokenFailure,
    required TResult Function() sendOTPInProgress,
    required TResult Function(String email) sendOTPSuccess,
    required TResult Function(String message) sendOTPFailure,
    required TResult Function() sendOTPSmsInProgress,
    required TResult Function(String phoneNumber) sendOTPSmsSuccess,
    required TResult Function(String message) sendOTPSmsFailure,
    required TResult Function() updatePasswordInProgress,
    required TResult Function() updatePasswordSuccess,
    required TResult Function(String message) updatePasswordFailure,
    required TResult Function() verifyOTPInProgress,
    required TResult Function() verifyOTPSuccess,
    required TResult Function(String message) verifyOTPFailure,
    required TResult Function() getUserProfileByUserIdInProgress,
    required TResult Function() getUserProfileByUserIdSuccess,
    required TResult Function(String message) getUserProfileByUserIdFailure,
  }) {
    return getUserProfileByUserIdFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserProfileInProgress,
    TResult? Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult? Function(String message)? getUserProfileFailure,
    TResult? Function()? getServerTimeInProgress,
    TResult? Function(String serverTime)? getServerTimeSuccess,
    TResult? Function(String message)? getServerTimeFailure,
    TResult? Function()? updateDeviceTokenInProgress,
    TResult? Function()? updateDeviceTokenSuccess,
    TResult? Function(String message)? updateDeviceTokenFailure,
    TResult? Function()? sendOTPInProgress,
    TResult? Function(String email)? sendOTPSuccess,
    TResult? Function(String message)? sendOTPFailure,
    TResult? Function()? sendOTPSmsInProgress,
    TResult? Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult? Function(String message)? sendOTPSmsFailure,
    TResult? Function()? updatePasswordInProgress,
    TResult? Function()? updatePasswordSuccess,
    TResult? Function(String message)? updatePasswordFailure,
    TResult? Function()? verifyOTPInProgress,
    TResult? Function()? verifyOTPSuccess,
    TResult? Function(String message)? verifyOTPFailure,
    TResult? Function()? getUserProfileByUserIdInProgress,
    TResult? Function()? getUserProfileByUserIdSuccess,
    TResult? Function(String message)? getUserProfileByUserIdFailure,
  }) {
    return getUserProfileByUserIdFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserProfileInProgress,
    TResult Function(String userName, String email, bool isAppStart)?
        getUserProfileSuccess,
    TResult Function(String message)? getUserProfileFailure,
    TResult Function()? getServerTimeInProgress,
    TResult Function(String serverTime)? getServerTimeSuccess,
    TResult Function(String message)? getServerTimeFailure,
    TResult Function()? updateDeviceTokenInProgress,
    TResult Function()? updateDeviceTokenSuccess,
    TResult Function(String message)? updateDeviceTokenFailure,
    TResult Function()? sendOTPInProgress,
    TResult Function(String email)? sendOTPSuccess,
    TResult Function(String message)? sendOTPFailure,
    TResult Function()? sendOTPSmsInProgress,
    TResult Function(String phoneNumber)? sendOTPSmsSuccess,
    TResult Function(String message)? sendOTPSmsFailure,
    TResult Function()? updatePasswordInProgress,
    TResult Function()? updatePasswordSuccess,
    TResult Function(String message)? updatePasswordFailure,
    TResult Function()? verifyOTPInProgress,
    TResult Function()? verifyOTPSuccess,
    TResult Function(String message)? verifyOTPFailure,
    TResult Function()? getUserProfileByUserIdInProgress,
    TResult Function()? getUserProfileByUserIdSuccess,
    TResult Function(String message)? getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (getUserProfileByUserIdFailure != null) {
      return getUserProfileByUserIdFailure(message);
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
    required TResult Function(_UpdateDeviceTokenInProgress value)
        updateDeviceTokenInProgress,
    required TResult Function(_UpdateDeviceTokenSuccess value)
        updateDeviceTokenSuccess,
    required TResult Function(_UpdateDeviceTokenFailure value)
        updateDeviceTokenFailure,
    required TResult Function(_SendOTPInProgress value) sendOTPInProgress,
    required TResult Function(_SendOTPSuccess value) sendOTPSuccess,
    required TResult Function(_SendOTPFailure value) sendOTPFailure,
    required TResult Function(_SendOTPSmsInProgress value) sendOTPSmsInProgress,
    required TResult Function(_SendOTPSmsSuccess value) sendOTPSmsSuccess,
    required TResult Function(_SendOTPSmsFailure value) sendOTPSmsFailure,
    required TResult Function(_UpdatePasswordInProgress value)
        updatePasswordInProgress,
    required TResult Function(_UpdatePasswordSuccess value)
        updatePasswordSuccess,
    required TResult Function(_UpdatePasswordFailure value)
        updatePasswordFailure,
    required TResult Function(_VerifyOTPInProgress value) verifyOTPInProgress,
    required TResult Function(_VerifyOTPSuccess value) verifyOTPSuccess,
    required TResult Function(_VerifyOTPFailure value) verifyOTPFailure,
    required TResult Function(_GetUserProfileByUserIdInProgress value)
        getUserProfileByUserIdInProgress,
    required TResult Function(_GetUserProfileByUserIdSuccess value)
        getUserProfileByUserIdSuccess,
    required TResult Function(_GetUserProfileByUserIdFailure value)
        getUserProfileByUserIdFailure,
  }) {
    return getUserProfileByUserIdFailure(this);
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
    TResult? Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult? Function(_UpdateDeviceTokenSuccess value)?
        updateDeviceTokenSuccess,
    TResult? Function(_UpdateDeviceTokenFailure value)?
        updateDeviceTokenFailure,
    TResult? Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult? Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult? Function(_SendOTPFailure value)? sendOTPFailure,
    TResult? Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult? Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult? Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult? Function(_UpdatePasswordInProgress value)?
        updatePasswordInProgress,
    TResult? Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult? Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult? Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult? Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult? Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult? Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult? Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult? Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
  }) {
    return getUserProfileByUserIdFailure?.call(this);
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
    TResult Function(_UpdateDeviceTokenInProgress value)?
        updateDeviceTokenInProgress,
    TResult Function(_UpdateDeviceTokenSuccess value)? updateDeviceTokenSuccess,
    TResult Function(_UpdateDeviceTokenFailure value)? updateDeviceTokenFailure,
    TResult Function(_SendOTPInProgress value)? sendOTPInProgress,
    TResult Function(_SendOTPSuccess value)? sendOTPSuccess,
    TResult Function(_SendOTPFailure value)? sendOTPFailure,
    TResult Function(_SendOTPSmsInProgress value)? sendOTPSmsInProgress,
    TResult Function(_SendOTPSmsSuccess value)? sendOTPSmsSuccess,
    TResult Function(_SendOTPSmsFailure value)? sendOTPSmsFailure,
    TResult Function(_UpdatePasswordInProgress value)? updatePasswordInProgress,
    TResult Function(_UpdatePasswordSuccess value)? updatePasswordSuccess,
    TResult Function(_UpdatePasswordFailure value)? updatePasswordFailure,
    TResult Function(_VerifyOTPInProgress value)? verifyOTPInProgress,
    TResult Function(_VerifyOTPSuccess value)? verifyOTPSuccess,
    TResult Function(_VerifyOTPFailure value)? verifyOTPFailure,
    TResult Function(_GetUserProfileByUserIdInProgress value)?
        getUserProfileByUserIdInProgress,
    TResult Function(_GetUserProfileByUserIdSuccess value)?
        getUserProfileByUserIdSuccess,
    TResult Function(_GetUserProfileByUserIdFailure value)?
        getUserProfileByUserIdFailure,
    required TResult orElse(),
  }) {
    if (getUserProfileByUserIdFailure != null) {
      return getUserProfileByUserIdFailure(this);
    }
    return orElse();
  }
}

abstract class _GetUserProfileByUserIdFailure implements UserState {
  const factory _GetUserProfileByUserIdFailure(final String message) =
      _$GetUserProfileByUserIdFailureImpl;

  String get message;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserProfileByUserIdFailureImplCopyWith<
          _$GetUserProfileByUserIdFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
