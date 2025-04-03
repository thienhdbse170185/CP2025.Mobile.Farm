// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getNotificationsByUserId,
    required TResult Function(NotificationDto notification)
        markReadNotification,
    required TResult Function() markReadAllNotification,
    required TResult Function(String notificationId) deleteNotificationById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getNotificationsByUserId,
    TResult? Function(NotificationDto notification)? markReadNotification,
    TResult? Function()? markReadAllNotification,
    TResult? Function(String notificationId)? deleteNotificationById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getNotificationsByUserId,
    TResult Function(NotificationDto notification)? markReadNotification,
    TResult Function()? markReadAllNotification,
    TResult Function(String notificationId)? deleteNotificationById,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetNotificationsByUserId value)
        getNotificationsByUserId,
    required TResult Function(_MarkReadNotification value) markReadNotification,
    required TResult Function(_MarkReadAllNotification value)
        markReadAllNotification,
    required TResult Function(_DeleteNotificationById value)
        deleteNotificationById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetNotificationsByUserId value)?
        getNotificationsByUserId,
    TResult? Function(_MarkReadNotification value)? markReadNotification,
    TResult? Function(_MarkReadAllNotification value)? markReadAllNotification,
    TResult? Function(_DeleteNotificationById value)? deleteNotificationById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetNotificationsByUserId value)? getNotificationsByUserId,
    TResult Function(_MarkReadNotification value)? markReadNotification,
    TResult Function(_MarkReadAllNotification value)? markReadAllNotification,
    TResult Function(_DeleteNotificationById value)? deleteNotificationById,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res, NotificationEvent>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res, $Val extends NotificationEvent>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationEvent
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
    extends _$NotificationEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'NotificationEvent.started()';
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
    required TResult Function() getNotificationsByUserId,
    required TResult Function(NotificationDto notification)
        markReadNotification,
    required TResult Function() markReadAllNotification,
    required TResult Function(String notificationId) deleteNotificationById,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getNotificationsByUserId,
    TResult? Function(NotificationDto notification)? markReadNotification,
    TResult? Function()? markReadAllNotification,
    TResult? Function(String notificationId)? deleteNotificationById,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getNotificationsByUserId,
    TResult Function(NotificationDto notification)? markReadNotification,
    TResult Function()? markReadAllNotification,
    TResult Function(String notificationId)? deleteNotificationById,
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
    required TResult Function(_GetNotificationsByUserId value)
        getNotificationsByUserId,
    required TResult Function(_MarkReadNotification value) markReadNotification,
    required TResult Function(_MarkReadAllNotification value)
        markReadAllNotification,
    required TResult Function(_DeleteNotificationById value)
        deleteNotificationById,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetNotificationsByUserId value)?
        getNotificationsByUserId,
    TResult? Function(_MarkReadNotification value)? markReadNotification,
    TResult? Function(_MarkReadAllNotification value)? markReadAllNotification,
    TResult? Function(_DeleteNotificationById value)? deleteNotificationById,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetNotificationsByUserId value)? getNotificationsByUserId,
    TResult Function(_MarkReadNotification value)? markReadNotification,
    TResult Function(_MarkReadAllNotification value)? markReadAllNotification,
    TResult Function(_DeleteNotificationById value)? deleteNotificationById,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements NotificationEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetNotificationsByUserIdImplCopyWith<$Res> {
  factory _$$GetNotificationsByUserIdImplCopyWith(
          _$GetNotificationsByUserIdImpl value,
          $Res Function(_$GetNotificationsByUserIdImpl) then) =
      __$$GetNotificationsByUserIdImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNotificationsByUserIdImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res,
        _$GetNotificationsByUserIdImpl>
    implements _$$GetNotificationsByUserIdImplCopyWith<$Res> {
  __$$GetNotificationsByUserIdImplCopyWithImpl(
      _$GetNotificationsByUserIdImpl _value,
      $Res Function(_$GetNotificationsByUserIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetNotificationsByUserIdImpl implements _GetNotificationsByUserId {
  const _$GetNotificationsByUserIdImpl();

  @override
  String toString() {
    return 'NotificationEvent.getNotificationsByUserId()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationsByUserIdImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getNotificationsByUserId,
    required TResult Function(NotificationDto notification)
        markReadNotification,
    required TResult Function() markReadAllNotification,
    required TResult Function(String notificationId) deleteNotificationById,
  }) {
    return getNotificationsByUserId();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getNotificationsByUserId,
    TResult? Function(NotificationDto notification)? markReadNotification,
    TResult? Function()? markReadAllNotification,
    TResult? Function(String notificationId)? deleteNotificationById,
  }) {
    return getNotificationsByUserId?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getNotificationsByUserId,
    TResult Function(NotificationDto notification)? markReadNotification,
    TResult Function()? markReadAllNotification,
    TResult Function(String notificationId)? deleteNotificationById,
    required TResult orElse(),
  }) {
    if (getNotificationsByUserId != null) {
      return getNotificationsByUserId();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetNotificationsByUserId value)
        getNotificationsByUserId,
    required TResult Function(_MarkReadNotification value) markReadNotification,
    required TResult Function(_MarkReadAllNotification value)
        markReadAllNotification,
    required TResult Function(_DeleteNotificationById value)
        deleteNotificationById,
  }) {
    return getNotificationsByUserId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetNotificationsByUserId value)?
        getNotificationsByUserId,
    TResult? Function(_MarkReadNotification value)? markReadNotification,
    TResult? Function(_MarkReadAllNotification value)? markReadAllNotification,
    TResult? Function(_DeleteNotificationById value)? deleteNotificationById,
  }) {
    return getNotificationsByUserId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetNotificationsByUserId value)? getNotificationsByUserId,
    TResult Function(_MarkReadNotification value)? markReadNotification,
    TResult Function(_MarkReadAllNotification value)? markReadAllNotification,
    TResult Function(_DeleteNotificationById value)? deleteNotificationById,
    required TResult orElse(),
  }) {
    if (getNotificationsByUserId != null) {
      return getNotificationsByUserId(this);
    }
    return orElse();
  }
}

abstract class _GetNotificationsByUserId implements NotificationEvent {
  const factory _GetNotificationsByUserId() = _$GetNotificationsByUserIdImpl;
}

/// @nodoc
abstract class _$$MarkReadNotificationImplCopyWith<$Res> {
  factory _$$MarkReadNotificationImplCopyWith(_$MarkReadNotificationImpl value,
          $Res Function(_$MarkReadNotificationImpl) then) =
      __$$MarkReadNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NotificationDto notification});

  $NotificationDtoCopyWith<$Res> get notification;
}

/// @nodoc
class __$$MarkReadNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$MarkReadNotificationImpl>
    implements _$$MarkReadNotificationImplCopyWith<$Res> {
  __$$MarkReadNotificationImplCopyWithImpl(_$MarkReadNotificationImpl _value,
      $Res Function(_$MarkReadNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
  }) {
    return _then(_$MarkReadNotificationImpl(
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationDto,
    ));
  }

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationDtoCopyWith<$Res> get notification {
    return $NotificationDtoCopyWith<$Res>(_value.notification, (value) {
      return _then(_value.copyWith(notification: value));
    });
  }
}

/// @nodoc

class _$MarkReadNotificationImpl implements _MarkReadNotification {
  const _$MarkReadNotificationImpl({required this.notification});

  @override
  final NotificationDto notification;

  @override
  String toString() {
    return 'NotificationEvent.markReadNotification(notification: $notification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkReadNotificationImpl &&
            (identical(other.notification, notification) ||
                other.notification == notification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notification);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkReadNotificationImplCopyWith<_$MarkReadNotificationImpl>
      get copyWith =>
          __$$MarkReadNotificationImplCopyWithImpl<_$MarkReadNotificationImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getNotificationsByUserId,
    required TResult Function(NotificationDto notification)
        markReadNotification,
    required TResult Function() markReadAllNotification,
    required TResult Function(String notificationId) deleteNotificationById,
  }) {
    return markReadNotification(notification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getNotificationsByUserId,
    TResult? Function(NotificationDto notification)? markReadNotification,
    TResult? Function()? markReadAllNotification,
    TResult? Function(String notificationId)? deleteNotificationById,
  }) {
    return markReadNotification?.call(notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getNotificationsByUserId,
    TResult Function(NotificationDto notification)? markReadNotification,
    TResult Function()? markReadAllNotification,
    TResult Function(String notificationId)? deleteNotificationById,
    required TResult orElse(),
  }) {
    if (markReadNotification != null) {
      return markReadNotification(notification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetNotificationsByUserId value)
        getNotificationsByUserId,
    required TResult Function(_MarkReadNotification value) markReadNotification,
    required TResult Function(_MarkReadAllNotification value)
        markReadAllNotification,
    required TResult Function(_DeleteNotificationById value)
        deleteNotificationById,
  }) {
    return markReadNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetNotificationsByUserId value)?
        getNotificationsByUserId,
    TResult? Function(_MarkReadNotification value)? markReadNotification,
    TResult? Function(_MarkReadAllNotification value)? markReadAllNotification,
    TResult? Function(_DeleteNotificationById value)? deleteNotificationById,
  }) {
    return markReadNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetNotificationsByUserId value)? getNotificationsByUserId,
    TResult Function(_MarkReadNotification value)? markReadNotification,
    TResult Function(_MarkReadAllNotification value)? markReadAllNotification,
    TResult Function(_DeleteNotificationById value)? deleteNotificationById,
    required TResult orElse(),
  }) {
    if (markReadNotification != null) {
      return markReadNotification(this);
    }
    return orElse();
  }
}

abstract class _MarkReadNotification implements NotificationEvent {
  const factory _MarkReadNotification(
          {required final NotificationDto notification}) =
      _$MarkReadNotificationImpl;

  NotificationDto get notification;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkReadNotificationImplCopyWith<_$MarkReadNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkReadAllNotificationImplCopyWith<$Res> {
  factory _$$MarkReadAllNotificationImplCopyWith(
          _$MarkReadAllNotificationImpl value,
          $Res Function(_$MarkReadAllNotificationImpl) then) =
      __$$MarkReadAllNotificationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkReadAllNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$MarkReadAllNotificationImpl>
    implements _$$MarkReadAllNotificationImplCopyWith<$Res> {
  __$$MarkReadAllNotificationImplCopyWithImpl(
      _$MarkReadAllNotificationImpl _value,
      $Res Function(_$MarkReadAllNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MarkReadAllNotificationImpl implements _MarkReadAllNotification {
  const _$MarkReadAllNotificationImpl();

  @override
  String toString() {
    return 'NotificationEvent.markReadAllNotification()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkReadAllNotificationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getNotificationsByUserId,
    required TResult Function(NotificationDto notification)
        markReadNotification,
    required TResult Function() markReadAllNotification,
    required TResult Function(String notificationId) deleteNotificationById,
  }) {
    return markReadAllNotification();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getNotificationsByUserId,
    TResult? Function(NotificationDto notification)? markReadNotification,
    TResult? Function()? markReadAllNotification,
    TResult? Function(String notificationId)? deleteNotificationById,
  }) {
    return markReadAllNotification?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getNotificationsByUserId,
    TResult Function(NotificationDto notification)? markReadNotification,
    TResult Function()? markReadAllNotification,
    TResult Function(String notificationId)? deleteNotificationById,
    required TResult orElse(),
  }) {
    if (markReadAllNotification != null) {
      return markReadAllNotification();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetNotificationsByUserId value)
        getNotificationsByUserId,
    required TResult Function(_MarkReadNotification value) markReadNotification,
    required TResult Function(_MarkReadAllNotification value)
        markReadAllNotification,
    required TResult Function(_DeleteNotificationById value)
        deleteNotificationById,
  }) {
    return markReadAllNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetNotificationsByUserId value)?
        getNotificationsByUserId,
    TResult? Function(_MarkReadNotification value)? markReadNotification,
    TResult? Function(_MarkReadAllNotification value)? markReadAllNotification,
    TResult? Function(_DeleteNotificationById value)? deleteNotificationById,
  }) {
    return markReadAllNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetNotificationsByUserId value)? getNotificationsByUserId,
    TResult Function(_MarkReadNotification value)? markReadNotification,
    TResult Function(_MarkReadAllNotification value)? markReadAllNotification,
    TResult Function(_DeleteNotificationById value)? deleteNotificationById,
    required TResult orElse(),
  }) {
    if (markReadAllNotification != null) {
      return markReadAllNotification(this);
    }
    return orElse();
  }
}

abstract class _MarkReadAllNotification implements NotificationEvent {
  const factory _MarkReadAllNotification() = _$MarkReadAllNotificationImpl;
}

/// @nodoc
abstract class _$$DeleteNotificationByIdImplCopyWith<$Res> {
  factory _$$DeleteNotificationByIdImplCopyWith(
          _$DeleteNotificationByIdImpl value,
          $Res Function(_$DeleteNotificationByIdImpl) then) =
      __$$DeleteNotificationByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String notificationId});
}

/// @nodoc
class __$$DeleteNotificationByIdImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$DeleteNotificationByIdImpl>
    implements _$$DeleteNotificationByIdImplCopyWith<$Res> {
  __$$DeleteNotificationByIdImplCopyWithImpl(
      _$DeleteNotificationByIdImpl _value,
      $Res Function(_$DeleteNotificationByIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
  }) {
    return _then(_$DeleteNotificationByIdImpl(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteNotificationByIdImpl implements _DeleteNotificationById {
  const _$DeleteNotificationByIdImpl({required this.notificationId});

  @override
  final String notificationId;

  @override
  String toString() {
    return 'NotificationEvent.deleteNotificationById(notificationId: $notificationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteNotificationByIdImpl &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notificationId);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteNotificationByIdImplCopyWith<_$DeleteNotificationByIdImpl>
      get copyWith => __$$DeleteNotificationByIdImplCopyWithImpl<
          _$DeleteNotificationByIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getNotificationsByUserId,
    required TResult Function(NotificationDto notification)
        markReadNotification,
    required TResult Function() markReadAllNotification,
    required TResult Function(String notificationId) deleteNotificationById,
  }) {
    return deleteNotificationById(notificationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getNotificationsByUserId,
    TResult? Function(NotificationDto notification)? markReadNotification,
    TResult? Function()? markReadAllNotification,
    TResult? Function(String notificationId)? deleteNotificationById,
  }) {
    return deleteNotificationById?.call(notificationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getNotificationsByUserId,
    TResult Function(NotificationDto notification)? markReadNotification,
    TResult Function()? markReadAllNotification,
    TResult Function(String notificationId)? deleteNotificationById,
    required TResult orElse(),
  }) {
    if (deleteNotificationById != null) {
      return deleteNotificationById(notificationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetNotificationsByUserId value)
        getNotificationsByUserId,
    required TResult Function(_MarkReadNotification value) markReadNotification,
    required TResult Function(_MarkReadAllNotification value)
        markReadAllNotification,
    required TResult Function(_DeleteNotificationById value)
        deleteNotificationById,
  }) {
    return deleteNotificationById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetNotificationsByUserId value)?
        getNotificationsByUserId,
    TResult? Function(_MarkReadNotification value)? markReadNotification,
    TResult? Function(_MarkReadAllNotification value)? markReadAllNotification,
    TResult? Function(_DeleteNotificationById value)? deleteNotificationById,
  }) {
    return deleteNotificationById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetNotificationsByUserId value)? getNotificationsByUserId,
    TResult Function(_MarkReadNotification value)? markReadNotification,
    TResult Function(_MarkReadAllNotification value)? markReadAllNotification,
    TResult Function(_DeleteNotificationById value)? deleteNotificationById,
    required TResult orElse(),
  }) {
    if (deleteNotificationById != null) {
      return deleteNotificationById(this);
    }
    return orElse();
  }
}

abstract class _DeleteNotificationById implements NotificationEvent {
  const factory _DeleteNotificationById(
      {required final String notificationId}) = _$DeleteNotificationByIdImpl;

  String get notificationId;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteNotificationByIdImplCopyWith<_$DeleteNotificationByIdImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsByUserIdInProgress,
    required TResult Function(List<NotificationDto> notifications)
        getNotificationsByUserIdSuccess,
    required TResult Function(String error) getNotificationsByUserIdFailure,
    required TResult Function() markReadNotificationInProgress,
    required TResult Function(NotificationDto notification)
        markReadNotificationSuccess,
    required TResult Function(String error) markReadNotificationFailure,
    required TResult Function() markReadAllNotificationInProgress,
    required TResult Function() markReadAllNotificationSuccess,
    required TResult Function(String error) markReadAllNotificationFailure,
    required TResult Function() deleteNotificationByIdInProgress,
    required TResult Function() deleteNotificationByIdSuccess,
    required TResult Function(String error) deleteNotificationByIdFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsByUserIdInProgress,
    TResult? Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult? Function(String error)? getNotificationsByUserIdFailure,
    TResult? Function()? markReadNotificationInProgress,
    TResult? Function(NotificationDto notification)?
        markReadNotificationSuccess,
    TResult? Function(String error)? markReadNotificationFailure,
    TResult? Function()? markReadAllNotificationInProgress,
    TResult? Function()? markReadAllNotificationSuccess,
    TResult? Function(String error)? markReadAllNotificationFailure,
    TResult? Function()? deleteNotificationByIdInProgress,
    TResult? Function()? deleteNotificationByIdSuccess,
    TResult? Function(String error)? deleteNotificationByIdFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsByUserIdInProgress,
    TResult Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult Function(String error)? getNotificationsByUserIdFailure,
    TResult Function()? markReadNotificationInProgress,
    TResult Function(NotificationDto notification)? markReadNotificationSuccess,
    TResult Function(String error)? markReadNotificationFailure,
    TResult Function()? markReadAllNotificationInProgress,
    TResult Function()? markReadAllNotificationSuccess,
    TResult Function(String error)? markReadAllNotificationFailure,
    TResult Function()? deleteNotificationByIdInProgress,
    TResult Function()? deleteNotificationByIdSuccess,
    TResult Function(String error)? deleteNotificationByIdFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetNotificationsByUserIdInProgress value)
        getNotificationsByUserIdInProgress,
    required TResult Function(_GetNotificationsByUserIdSuccess value)
        getNotificationsByUserIdSuccess,
    required TResult Function(_GetNotificationsByUserIdFailure value)
        getNotificationsByUserIdFailure,
    required TResult Function(_MarkReadNotificationInProgress value)
        markReadNotificationInProgress,
    required TResult Function(_MarkReadNotificationSuccess value)
        markReadNotificationSuccess,
    required TResult Function(_MarkReadNotificationFailure value)
        markReadNotificationFailure,
    required TResult Function(_MarkReadAllNotificationInProgress value)
        markReadAllNotificationInProgress,
    required TResult Function(_MarkReadAllNotificationSuccess value)
        markReadAllNotificationSuccess,
    required TResult Function(_MarkReadAllNotificationFailure value)
        markReadAllNotificationFailure,
    required TResult Function(_DeleteNotificationByIdInProgress value)
        deleteNotificationByIdInProgress,
    required TResult Function(_DeleteNotificationByIdSuccess value)
        deleteNotificationByIdSuccess,
    required TResult Function(_DeleteNotificationByIdFailure value)
        deleteNotificationByIdFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult? Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult? Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult? Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult? Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult? Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult? Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult? Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult? Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult? Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult? Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult? Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationState
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
    extends _$NotificationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'NotificationState.initial()';
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
    required TResult Function() getNotificationsByUserIdInProgress,
    required TResult Function(List<NotificationDto> notifications)
        getNotificationsByUserIdSuccess,
    required TResult Function(String error) getNotificationsByUserIdFailure,
    required TResult Function() markReadNotificationInProgress,
    required TResult Function(NotificationDto notification)
        markReadNotificationSuccess,
    required TResult Function(String error) markReadNotificationFailure,
    required TResult Function() markReadAllNotificationInProgress,
    required TResult Function() markReadAllNotificationSuccess,
    required TResult Function(String error) markReadAllNotificationFailure,
    required TResult Function() deleteNotificationByIdInProgress,
    required TResult Function() deleteNotificationByIdSuccess,
    required TResult Function(String error) deleteNotificationByIdFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsByUserIdInProgress,
    TResult? Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult? Function(String error)? getNotificationsByUserIdFailure,
    TResult? Function()? markReadNotificationInProgress,
    TResult? Function(NotificationDto notification)?
        markReadNotificationSuccess,
    TResult? Function(String error)? markReadNotificationFailure,
    TResult? Function()? markReadAllNotificationInProgress,
    TResult? Function()? markReadAllNotificationSuccess,
    TResult? Function(String error)? markReadAllNotificationFailure,
    TResult? Function()? deleteNotificationByIdInProgress,
    TResult? Function()? deleteNotificationByIdSuccess,
    TResult? Function(String error)? deleteNotificationByIdFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsByUserIdInProgress,
    TResult Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult Function(String error)? getNotificationsByUserIdFailure,
    TResult Function()? markReadNotificationInProgress,
    TResult Function(NotificationDto notification)? markReadNotificationSuccess,
    TResult Function(String error)? markReadNotificationFailure,
    TResult Function()? markReadAllNotificationInProgress,
    TResult Function()? markReadAllNotificationSuccess,
    TResult Function(String error)? markReadAllNotificationFailure,
    TResult Function()? deleteNotificationByIdInProgress,
    TResult Function()? deleteNotificationByIdSuccess,
    TResult Function(String error)? deleteNotificationByIdFailure,
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
    required TResult Function(_GetNotificationsByUserIdInProgress value)
        getNotificationsByUserIdInProgress,
    required TResult Function(_GetNotificationsByUserIdSuccess value)
        getNotificationsByUserIdSuccess,
    required TResult Function(_GetNotificationsByUserIdFailure value)
        getNotificationsByUserIdFailure,
    required TResult Function(_MarkReadNotificationInProgress value)
        markReadNotificationInProgress,
    required TResult Function(_MarkReadNotificationSuccess value)
        markReadNotificationSuccess,
    required TResult Function(_MarkReadNotificationFailure value)
        markReadNotificationFailure,
    required TResult Function(_MarkReadAllNotificationInProgress value)
        markReadAllNotificationInProgress,
    required TResult Function(_MarkReadAllNotificationSuccess value)
        markReadAllNotificationSuccess,
    required TResult Function(_MarkReadAllNotificationFailure value)
        markReadAllNotificationFailure,
    required TResult Function(_DeleteNotificationByIdInProgress value)
        deleteNotificationByIdInProgress,
    required TResult Function(_DeleteNotificationByIdSuccess value)
        deleteNotificationByIdSuccess,
    required TResult Function(_DeleteNotificationByIdFailure value)
        deleteNotificationByIdFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult? Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult? Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult? Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult? Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult? Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult? Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult? Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult? Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult? Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult? Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult? Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NotificationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$GetNotificationsByUserIdInProgressImplCopyWith<$Res> {
  factory _$$GetNotificationsByUserIdInProgressImplCopyWith(
          _$GetNotificationsByUserIdInProgressImpl value,
          $Res Function(_$GetNotificationsByUserIdInProgressImpl) then) =
      __$$GetNotificationsByUserIdInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNotificationsByUserIdInProgressImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res,
        _$GetNotificationsByUserIdInProgressImpl>
    implements _$$GetNotificationsByUserIdInProgressImplCopyWith<$Res> {
  __$$GetNotificationsByUserIdInProgressImplCopyWithImpl(
      _$GetNotificationsByUserIdInProgressImpl _value,
      $Res Function(_$GetNotificationsByUserIdInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetNotificationsByUserIdInProgressImpl
    implements _GetNotificationsByUserIdInProgress {
  const _$GetNotificationsByUserIdInProgressImpl();

  @override
  String toString() {
    return 'NotificationState.getNotificationsByUserIdInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationsByUserIdInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsByUserIdInProgress,
    required TResult Function(List<NotificationDto> notifications)
        getNotificationsByUserIdSuccess,
    required TResult Function(String error) getNotificationsByUserIdFailure,
    required TResult Function() markReadNotificationInProgress,
    required TResult Function(NotificationDto notification)
        markReadNotificationSuccess,
    required TResult Function(String error) markReadNotificationFailure,
    required TResult Function() markReadAllNotificationInProgress,
    required TResult Function() markReadAllNotificationSuccess,
    required TResult Function(String error) markReadAllNotificationFailure,
    required TResult Function() deleteNotificationByIdInProgress,
    required TResult Function() deleteNotificationByIdSuccess,
    required TResult Function(String error) deleteNotificationByIdFailure,
  }) {
    return getNotificationsByUserIdInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsByUserIdInProgress,
    TResult? Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult? Function(String error)? getNotificationsByUserIdFailure,
    TResult? Function()? markReadNotificationInProgress,
    TResult? Function(NotificationDto notification)?
        markReadNotificationSuccess,
    TResult? Function(String error)? markReadNotificationFailure,
    TResult? Function()? markReadAllNotificationInProgress,
    TResult? Function()? markReadAllNotificationSuccess,
    TResult? Function(String error)? markReadAllNotificationFailure,
    TResult? Function()? deleteNotificationByIdInProgress,
    TResult? Function()? deleteNotificationByIdSuccess,
    TResult? Function(String error)? deleteNotificationByIdFailure,
  }) {
    return getNotificationsByUserIdInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsByUserIdInProgress,
    TResult Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult Function(String error)? getNotificationsByUserIdFailure,
    TResult Function()? markReadNotificationInProgress,
    TResult Function(NotificationDto notification)? markReadNotificationSuccess,
    TResult Function(String error)? markReadNotificationFailure,
    TResult Function()? markReadAllNotificationInProgress,
    TResult Function()? markReadAllNotificationSuccess,
    TResult Function(String error)? markReadAllNotificationFailure,
    TResult Function()? deleteNotificationByIdInProgress,
    TResult Function()? deleteNotificationByIdSuccess,
    TResult Function(String error)? deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (getNotificationsByUserIdInProgress != null) {
      return getNotificationsByUserIdInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetNotificationsByUserIdInProgress value)
        getNotificationsByUserIdInProgress,
    required TResult Function(_GetNotificationsByUserIdSuccess value)
        getNotificationsByUserIdSuccess,
    required TResult Function(_GetNotificationsByUserIdFailure value)
        getNotificationsByUserIdFailure,
    required TResult Function(_MarkReadNotificationInProgress value)
        markReadNotificationInProgress,
    required TResult Function(_MarkReadNotificationSuccess value)
        markReadNotificationSuccess,
    required TResult Function(_MarkReadNotificationFailure value)
        markReadNotificationFailure,
    required TResult Function(_MarkReadAllNotificationInProgress value)
        markReadAllNotificationInProgress,
    required TResult Function(_MarkReadAllNotificationSuccess value)
        markReadAllNotificationSuccess,
    required TResult Function(_MarkReadAllNotificationFailure value)
        markReadAllNotificationFailure,
    required TResult Function(_DeleteNotificationByIdInProgress value)
        deleteNotificationByIdInProgress,
    required TResult Function(_DeleteNotificationByIdSuccess value)
        deleteNotificationByIdSuccess,
    required TResult Function(_DeleteNotificationByIdFailure value)
        deleteNotificationByIdFailure,
  }) {
    return getNotificationsByUserIdInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult? Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult? Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult? Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult? Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult? Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult? Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult? Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult? Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult? Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult? Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult? Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
  }) {
    return getNotificationsByUserIdInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (getNotificationsByUserIdInProgress != null) {
      return getNotificationsByUserIdInProgress(this);
    }
    return orElse();
  }
}

abstract class _GetNotificationsByUserIdInProgress
    implements NotificationState {
  const factory _GetNotificationsByUserIdInProgress() =
      _$GetNotificationsByUserIdInProgressImpl;
}

/// @nodoc
abstract class _$$GetNotificationsByUserIdSuccessImplCopyWith<$Res> {
  factory _$$GetNotificationsByUserIdSuccessImplCopyWith(
          _$GetNotificationsByUserIdSuccessImpl value,
          $Res Function(_$GetNotificationsByUserIdSuccessImpl) then) =
      __$$GetNotificationsByUserIdSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationDto> notifications});
}

/// @nodoc
class __$$GetNotificationsByUserIdSuccessImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res,
        _$GetNotificationsByUserIdSuccessImpl>
    implements _$$GetNotificationsByUserIdSuccessImplCopyWith<$Res> {
  __$$GetNotificationsByUserIdSuccessImplCopyWithImpl(
      _$GetNotificationsByUserIdSuccessImpl _value,
      $Res Function(_$GetNotificationsByUserIdSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
  }) {
    return _then(_$GetNotificationsByUserIdSuccessImpl(
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDto>,
    ));
  }
}

/// @nodoc

class _$GetNotificationsByUserIdSuccessImpl
    implements _GetNotificationsByUserIdSuccess {
  const _$GetNotificationsByUserIdSuccessImpl(
      {required final List<NotificationDto> notifications})
      : _notifications = notifications;

  final List<NotificationDto> _notifications;
  @override
  List<NotificationDto> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString() {
    return 'NotificationState.getNotificationsByUserIdSuccess(notifications: $notifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationsByUserIdSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notifications));

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNotificationsByUserIdSuccessImplCopyWith<
          _$GetNotificationsByUserIdSuccessImpl>
      get copyWith => __$$GetNotificationsByUserIdSuccessImplCopyWithImpl<
          _$GetNotificationsByUserIdSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsByUserIdInProgress,
    required TResult Function(List<NotificationDto> notifications)
        getNotificationsByUserIdSuccess,
    required TResult Function(String error) getNotificationsByUserIdFailure,
    required TResult Function() markReadNotificationInProgress,
    required TResult Function(NotificationDto notification)
        markReadNotificationSuccess,
    required TResult Function(String error) markReadNotificationFailure,
    required TResult Function() markReadAllNotificationInProgress,
    required TResult Function() markReadAllNotificationSuccess,
    required TResult Function(String error) markReadAllNotificationFailure,
    required TResult Function() deleteNotificationByIdInProgress,
    required TResult Function() deleteNotificationByIdSuccess,
    required TResult Function(String error) deleteNotificationByIdFailure,
  }) {
    return getNotificationsByUserIdSuccess(notifications);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsByUserIdInProgress,
    TResult? Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult? Function(String error)? getNotificationsByUserIdFailure,
    TResult? Function()? markReadNotificationInProgress,
    TResult? Function(NotificationDto notification)?
        markReadNotificationSuccess,
    TResult? Function(String error)? markReadNotificationFailure,
    TResult? Function()? markReadAllNotificationInProgress,
    TResult? Function()? markReadAllNotificationSuccess,
    TResult? Function(String error)? markReadAllNotificationFailure,
    TResult? Function()? deleteNotificationByIdInProgress,
    TResult? Function()? deleteNotificationByIdSuccess,
    TResult? Function(String error)? deleteNotificationByIdFailure,
  }) {
    return getNotificationsByUserIdSuccess?.call(notifications);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsByUserIdInProgress,
    TResult Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult Function(String error)? getNotificationsByUserIdFailure,
    TResult Function()? markReadNotificationInProgress,
    TResult Function(NotificationDto notification)? markReadNotificationSuccess,
    TResult Function(String error)? markReadNotificationFailure,
    TResult Function()? markReadAllNotificationInProgress,
    TResult Function()? markReadAllNotificationSuccess,
    TResult Function(String error)? markReadAllNotificationFailure,
    TResult Function()? deleteNotificationByIdInProgress,
    TResult Function()? deleteNotificationByIdSuccess,
    TResult Function(String error)? deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (getNotificationsByUserIdSuccess != null) {
      return getNotificationsByUserIdSuccess(notifications);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetNotificationsByUserIdInProgress value)
        getNotificationsByUserIdInProgress,
    required TResult Function(_GetNotificationsByUserIdSuccess value)
        getNotificationsByUserIdSuccess,
    required TResult Function(_GetNotificationsByUserIdFailure value)
        getNotificationsByUserIdFailure,
    required TResult Function(_MarkReadNotificationInProgress value)
        markReadNotificationInProgress,
    required TResult Function(_MarkReadNotificationSuccess value)
        markReadNotificationSuccess,
    required TResult Function(_MarkReadNotificationFailure value)
        markReadNotificationFailure,
    required TResult Function(_MarkReadAllNotificationInProgress value)
        markReadAllNotificationInProgress,
    required TResult Function(_MarkReadAllNotificationSuccess value)
        markReadAllNotificationSuccess,
    required TResult Function(_MarkReadAllNotificationFailure value)
        markReadAllNotificationFailure,
    required TResult Function(_DeleteNotificationByIdInProgress value)
        deleteNotificationByIdInProgress,
    required TResult Function(_DeleteNotificationByIdSuccess value)
        deleteNotificationByIdSuccess,
    required TResult Function(_DeleteNotificationByIdFailure value)
        deleteNotificationByIdFailure,
  }) {
    return getNotificationsByUserIdSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult? Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult? Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult? Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult? Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult? Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult? Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult? Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult? Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult? Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult? Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult? Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
  }) {
    return getNotificationsByUserIdSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (getNotificationsByUserIdSuccess != null) {
      return getNotificationsByUserIdSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetNotificationsByUserIdSuccess implements NotificationState {
  const factory _GetNotificationsByUserIdSuccess(
          {required final List<NotificationDto> notifications}) =
      _$GetNotificationsByUserIdSuccessImpl;

  List<NotificationDto> get notifications;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetNotificationsByUserIdSuccessImplCopyWith<
          _$GetNotificationsByUserIdSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetNotificationsByUserIdFailureImplCopyWith<$Res> {
  factory _$$GetNotificationsByUserIdFailureImplCopyWith(
          _$GetNotificationsByUserIdFailureImpl value,
          $Res Function(_$GetNotificationsByUserIdFailureImpl) then) =
      __$$GetNotificationsByUserIdFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetNotificationsByUserIdFailureImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res,
        _$GetNotificationsByUserIdFailureImpl>
    implements _$$GetNotificationsByUserIdFailureImplCopyWith<$Res> {
  __$$GetNotificationsByUserIdFailureImplCopyWithImpl(
      _$GetNotificationsByUserIdFailureImpl _value,
      $Res Function(_$GetNotificationsByUserIdFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetNotificationsByUserIdFailureImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetNotificationsByUserIdFailureImpl
    implements _GetNotificationsByUserIdFailure {
  const _$GetNotificationsByUserIdFailureImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'NotificationState.getNotificationsByUserIdFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationsByUserIdFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNotificationsByUserIdFailureImplCopyWith<
          _$GetNotificationsByUserIdFailureImpl>
      get copyWith => __$$GetNotificationsByUserIdFailureImplCopyWithImpl<
          _$GetNotificationsByUserIdFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsByUserIdInProgress,
    required TResult Function(List<NotificationDto> notifications)
        getNotificationsByUserIdSuccess,
    required TResult Function(String error) getNotificationsByUserIdFailure,
    required TResult Function() markReadNotificationInProgress,
    required TResult Function(NotificationDto notification)
        markReadNotificationSuccess,
    required TResult Function(String error) markReadNotificationFailure,
    required TResult Function() markReadAllNotificationInProgress,
    required TResult Function() markReadAllNotificationSuccess,
    required TResult Function(String error) markReadAllNotificationFailure,
    required TResult Function() deleteNotificationByIdInProgress,
    required TResult Function() deleteNotificationByIdSuccess,
    required TResult Function(String error) deleteNotificationByIdFailure,
  }) {
    return getNotificationsByUserIdFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsByUserIdInProgress,
    TResult? Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult? Function(String error)? getNotificationsByUserIdFailure,
    TResult? Function()? markReadNotificationInProgress,
    TResult? Function(NotificationDto notification)?
        markReadNotificationSuccess,
    TResult? Function(String error)? markReadNotificationFailure,
    TResult? Function()? markReadAllNotificationInProgress,
    TResult? Function()? markReadAllNotificationSuccess,
    TResult? Function(String error)? markReadAllNotificationFailure,
    TResult? Function()? deleteNotificationByIdInProgress,
    TResult? Function()? deleteNotificationByIdSuccess,
    TResult? Function(String error)? deleteNotificationByIdFailure,
  }) {
    return getNotificationsByUserIdFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsByUserIdInProgress,
    TResult Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult Function(String error)? getNotificationsByUserIdFailure,
    TResult Function()? markReadNotificationInProgress,
    TResult Function(NotificationDto notification)? markReadNotificationSuccess,
    TResult Function(String error)? markReadNotificationFailure,
    TResult Function()? markReadAllNotificationInProgress,
    TResult Function()? markReadAllNotificationSuccess,
    TResult Function(String error)? markReadAllNotificationFailure,
    TResult Function()? deleteNotificationByIdInProgress,
    TResult Function()? deleteNotificationByIdSuccess,
    TResult Function(String error)? deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (getNotificationsByUserIdFailure != null) {
      return getNotificationsByUserIdFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetNotificationsByUserIdInProgress value)
        getNotificationsByUserIdInProgress,
    required TResult Function(_GetNotificationsByUserIdSuccess value)
        getNotificationsByUserIdSuccess,
    required TResult Function(_GetNotificationsByUserIdFailure value)
        getNotificationsByUserIdFailure,
    required TResult Function(_MarkReadNotificationInProgress value)
        markReadNotificationInProgress,
    required TResult Function(_MarkReadNotificationSuccess value)
        markReadNotificationSuccess,
    required TResult Function(_MarkReadNotificationFailure value)
        markReadNotificationFailure,
    required TResult Function(_MarkReadAllNotificationInProgress value)
        markReadAllNotificationInProgress,
    required TResult Function(_MarkReadAllNotificationSuccess value)
        markReadAllNotificationSuccess,
    required TResult Function(_MarkReadAllNotificationFailure value)
        markReadAllNotificationFailure,
    required TResult Function(_DeleteNotificationByIdInProgress value)
        deleteNotificationByIdInProgress,
    required TResult Function(_DeleteNotificationByIdSuccess value)
        deleteNotificationByIdSuccess,
    required TResult Function(_DeleteNotificationByIdFailure value)
        deleteNotificationByIdFailure,
  }) {
    return getNotificationsByUserIdFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult? Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult? Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult? Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult? Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult? Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult? Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult? Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult? Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult? Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult? Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult? Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
  }) {
    return getNotificationsByUserIdFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (getNotificationsByUserIdFailure != null) {
      return getNotificationsByUserIdFailure(this);
    }
    return orElse();
  }
}

abstract class _GetNotificationsByUserIdFailure implements NotificationState {
  const factory _GetNotificationsByUserIdFailure(
      {required final String error}) = _$GetNotificationsByUserIdFailureImpl;

  String get error;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetNotificationsByUserIdFailureImplCopyWith<
          _$GetNotificationsByUserIdFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkReadNotificationInProgressImplCopyWith<$Res> {
  factory _$$MarkReadNotificationInProgressImplCopyWith(
          _$MarkReadNotificationInProgressImpl value,
          $Res Function(_$MarkReadNotificationInProgressImpl) then) =
      __$$MarkReadNotificationInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkReadNotificationInProgressImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res,
        _$MarkReadNotificationInProgressImpl>
    implements _$$MarkReadNotificationInProgressImplCopyWith<$Res> {
  __$$MarkReadNotificationInProgressImplCopyWithImpl(
      _$MarkReadNotificationInProgressImpl _value,
      $Res Function(_$MarkReadNotificationInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MarkReadNotificationInProgressImpl
    implements _MarkReadNotificationInProgress {
  const _$MarkReadNotificationInProgressImpl();

  @override
  String toString() {
    return 'NotificationState.markReadNotificationInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkReadNotificationInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsByUserIdInProgress,
    required TResult Function(List<NotificationDto> notifications)
        getNotificationsByUserIdSuccess,
    required TResult Function(String error) getNotificationsByUserIdFailure,
    required TResult Function() markReadNotificationInProgress,
    required TResult Function(NotificationDto notification)
        markReadNotificationSuccess,
    required TResult Function(String error) markReadNotificationFailure,
    required TResult Function() markReadAllNotificationInProgress,
    required TResult Function() markReadAllNotificationSuccess,
    required TResult Function(String error) markReadAllNotificationFailure,
    required TResult Function() deleteNotificationByIdInProgress,
    required TResult Function() deleteNotificationByIdSuccess,
    required TResult Function(String error) deleteNotificationByIdFailure,
  }) {
    return markReadNotificationInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsByUserIdInProgress,
    TResult? Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult? Function(String error)? getNotificationsByUserIdFailure,
    TResult? Function()? markReadNotificationInProgress,
    TResult? Function(NotificationDto notification)?
        markReadNotificationSuccess,
    TResult? Function(String error)? markReadNotificationFailure,
    TResult? Function()? markReadAllNotificationInProgress,
    TResult? Function()? markReadAllNotificationSuccess,
    TResult? Function(String error)? markReadAllNotificationFailure,
    TResult? Function()? deleteNotificationByIdInProgress,
    TResult? Function()? deleteNotificationByIdSuccess,
    TResult? Function(String error)? deleteNotificationByIdFailure,
  }) {
    return markReadNotificationInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsByUserIdInProgress,
    TResult Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult Function(String error)? getNotificationsByUserIdFailure,
    TResult Function()? markReadNotificationInProgress,
    TResult Function(NotificationDto notification)? markReadNotificationSuccess,
    TResult Function(String error)? markReadNotificationFailure,
    TResult Function()? markReadAllNotificationInProgress,
    TResult Function()? markReadAllNotificationSuccess,
    TResult Function(String error)? markReadAllNotificationFailure,
    TResult Function()? deleteNotificationByIdInProgress,
    TResult Function()? deleteNotificationByIdSuccess,
    TResult Function(String error)? deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (markReadNotificationInProgress != null) {
      return markReadNotificationInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetNotificationsByUserIdInProgress value)
        getNotificationsByUserIdInProgress,
    required TResult Function(_GetNotificationsByUserIdSuccess value)
        getNotificationsByUserIdSuccess,
    required TResult Function(_GetNotificationsByUserIdFailure value)
        getNotificationsByUserIdFailure,
    required TResult Function(_MarkReadNotificationInProgress value)
        markReadNotificationInProgress,
    required TResult Function(_MarkReadNotificationSuccess value)
        markReadNotificationSuccess,
    required TResult Function(_MarkReadNotificationFailure value)
        markReadNotificationFailure,
    required TResult Function(_MarkReadAllNotificationInProgress value)
        markReadAllNotificationInProgress,
    required TResult Function(_MarkReadAllNotificationSuccess value)
        markReadAllNotificationSuccess,
    required TResult Function(_MarkReadAllNotificationFailure value)
        markReadAllNotificationFailure,
    required TResult Function(_DeleteNotificationByIdInProgress value)
        deleteNotificationByIdInProgress,
    required TResult Function(_DeleteNotificationByIdSuccess value)
        deleteNotificationByIdSuccess,
    required TResult Function(_DeleteNotificationByIdFailure value)
        deleteNotificationByIdFailure,
  }) {
    return markReadNotificationInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult? Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult? Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult? Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult? Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult? Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult? Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult? Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult? Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult? Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult? Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult? Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
  }) {
    return markReadNotificationInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (markReadNotificationInProgress != null) {
      return markReadNotificationInProgress(this);
    }
    return orElse();
  }
}

abstract class _MarkReadNotificationInProgress implements NotificationState {
  const factory _MarkReadNotificationInProgress() =
      _$MarkReadNotificationInProgressImpl;
}

/// @nodoc
abstract class _$$MarkReadNotificationSuccessImplCopyWith<$Res> {
  factory _$$MarkReadNotificationSuccessImplCopyWith(
          _$MarkReadNotificationSuccessImpl value,
          $Res Function(_$MarkReadNotificationSuccessImpl) then) =
      __$$MarkReadNotificationSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NotificationDto notification});

  $NotificationDtoCopyWith<$Res> get notification;
}

/// @nodoc
class __$$MarkReadNotificationSuccessImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res,
        _$MarkReadNotificationSuccessImpl>
    implements _$$MarkReadNotificationSuccessImplCopyWith<$Res> {
  __$$MarkReadNotificationSuccessImplCopyWithImpl(
      _$MarkReadNotificationSuccessImpl _value,
      $Res Function(_$MarkReadNotificationSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
  }) {
    return _then(_$MarkReadNotificationSuccessImpl(
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationDto,
    ));
  }

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationDtoCopyWith<$Res> get notification {
    return $NotificationDtoCopyWith<$Res>(_value.notification, (value) {
      return _then(_value.copyWith(notification: value));
    });
  }
}

/// @nodoc

class _$MarkReadNotificationSuccessImpl
    implements _MarkReadNotificationSuccess {
  const _$MarkReadNotificationSuccessImpl({required this.notification});

  @override
  final NotificationDto notification;

  @override
  String toString() {
    return 'NotificationState.markReadNotificationSuccess(notification: $notification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkReadNotificationSuccessImpl &&
            (identical(other.notification, notification) ||
                other.notification == notification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notification);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkReadNotificationSuccessImplCopyWith<_$MarkReadNotificationSuccessImpl>
      get copyWith => __$$MarkReadNotificationSuccessImplCopyWithImpl<
          _$MarkReadNotificationSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsByUserIdInProgress,
    required TResult Function(List<NotificationDto> notifications)
        getNotificationsByUserIdSuccess,
    required TResult Function(String error) getNotificationsByUserIdFailure,
    required TResult Function() markReadNotificationInProgress,
    required TResult Function(NotificationDto notification)
        markReadNotificationSuccess,
    required TResult Function(String error) markReadNotificationFailure,
    required TResult Function() markReadAllNotificationInProgress,
    required TResult Function() markReadAllNotificationSuccess,
    required TResult Function(String error) markReadAllNotificationFailure,
    required TResult Function() deleteNotificationByIdInProgress,
    required TResult Function() deleteNotificationByIdSuccess,
    required TResult Function(String error) deleteNotificationByIdFailure,
  }) {
    return markReadNotificationSuccess(notification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsByUserIdInProgress,
    TResult? Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult? Function(String error)? getNotificationsByUserIdFailure,
    TResult? Function()? markReadNotificationInProgress,
    TResult? Function(NotificationDto notification)?
        markReadNotificationSuccess,
    TResult? Function(String error)? markReadNotificationFailure,
    TResult? Function()? markReadAllNotificationInProgress,
    TResult? Function()? markReadAllNotificationSuccess,
    TResult? Function(String error)? markReadAllNotificationFailure,
    TResult? Function()? deleteNotificationByIdInProgress,
    TResult? Function()? deleteNotificationByIdSuccess,
    TResult? Function(String error)? deleteNotificationByIdFailure,
  }) {
    return markReadNotificationSuccess?.call(notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsByUserIdInProgress,
    TResult Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult Function(String error)? getNotificationsByUserIdFailure,
    TResult Function()? markReadNotificationInProgress,
    TResult Function(NotificationDto notification)? markReadNotificationSuccess,
    TResult Function(String error)? markReadNotificationFailure,
    TResult Function()? markReadAllNotificationInProgress,
    TResult Function()? markReadAllNotificationSuccess,
    TResult Function(String error)? markReadAllNotificationFailure,
    TResult Function()? deleteNotificationByIdInProgress,
    TResult Function()? deleteNotificationByIdSuccess,
    TResult Function(String error)? deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (markReadNotificationSuccess != null) {
      return markReadNotificationSuccess(notification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetNotificationsByUserIdInProgress value)
        getNotificationsByUserIdInProgress,
    required TResult Function(_GetNotificationsByUserIdSuccess value)
        getNotificationsByUserIdSuccess,
    required TResult Function(_GetNotificationsByUserIdFailure value)
        getNotificationsByUserIdFailure,
    required TResult Function(_MarkReadNotificationInProgress value)
        markReadNotificationInProgress,
    required TResult Function(_MarkReadNotificationSuccess value)
        markReadNotificationSuccess,
    required TResult Function(_MarkReadNotificationFailure value)
        markReadNotificationFailure,
    required TResult Function(_MarkReadAllNotificationInProgress value)
        markReadAllNotificationInProgress,
    required TResult Function(_MarkReadAllNotificationSuccess value)
        markReadAllNotificationSuccess,
    required TResult Function(_MarkReadAllNotificationFailure value)
        markReadAllNotificationFailure,
    required TResult Function(_DeleteNotificationByIdInProgress value)
        deleteNotificationByIdInProgress,
    required TResult Function(_DeleteNotificationByIdSuccess value)
        deleteNotificationByIdSuccess,
    required TResult Function(_DeleteNotificationByIdFailure value)
        deleteNotificationByIdFailure,
  }) {
    return markReadNotificationSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult? Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult? Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult? Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult? Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult? Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult? Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult? Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult? Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult? Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult? Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult? Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
  }) {
    return markReadNotificationSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (markReadNotificationSuccess != null) {
      return markReadNotificationSuccess(this);
    }
    return orElse();
  }
}

abstract class _MarkReadNotificationSuccess implements NotificationState {
  const factory _MarkReadNotificationSuccess(
          {required final NotificationDto notification}) =
      _$MarkReadNotificationSuccessImpl;

  NotificationDto get notification;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkReadNotificationSuccessImplCopyWith<_$MarkReadNotificationSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkReadNotificationFailureImplCopyWith<$Res> {
  factory _$$MarkReadNotificationFailureImplCopyWith(
          _$MarkReadNotificationFailureImpl value,
          $Res Function(_$MarkReadNotificationFailureImpl) then) =
      __$$MarkReadNotificationFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$MarkReadNotificationFailureImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res,
        _$MarkReadNotificationFailureImpl>
    implements _$$MarkReadNotificationFailureImplCopyWith<$Res> {
  __$$MarkReadNotificationFailureImplCopyWithImpl(
      _$MarkReadNotificationFailureImpl _value,
      $Res Function(_$MarkReadNotificationFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$MarkReadNotificationFailureImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MarkReadNotificationFailureImpl
    implements _MarkReadNotificationFailure {
  const _$MarkReadNotificationFailureImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'NotificationState.markReadNotificationFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkReadNotificationFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkReadNotificationFailureImplCopyWith<_$MarkReadNotificationFailureImpl>
      get copyWith => __$$MarkReadNotificationFailureImplCopyWithImpl<
          _$MarkReadNotificationFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsByUserIdInProgress,
    required TResult Function(List<NotificationDto> notifications)
        getNotificationsByUserIdSuccess,
    required TResult Function(String error) getNotificationsByUserIdFailure,
    required TResult Function() markReadNotificationInProgress,
    required TResult Function(NotificationDto notification)
        markReadNotificationSuccess,
    required TResult Function(String error) markReadNotificationFailure,
    required TResult Function() markReadAllNotificationInProgress,
    required TResult Function() markReadAllNotificationSuccess,
    required TResult Function(String error) markReadAllNotificationFailure,
    required TResult Function() deleteNotificationByIdInProgress,
    required TResult Function() deleteNotificationByIdSuccess,
    required TResult Function(String error) deleteNotificationByIdFailure,
  }) {
    return markReadNotificationFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsByUserIdInProgress,
    TResult? Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult? Function(String error)? getNotificationsByUserIdFailure,
    TResult? Function()? markReadNotificationInProgress,
    TResult? Function(NotificationDto notification)?
        markReadNotificationSuccess,
    TResult? Function(String error)? markReadNotificationFailure,
    TResult? Function()? markReadAllNotificationInProgress,
    TResult? Function()? markReadAllNotificationSuccess,
    TResult? Function(String error)? markReadAllNotificationFailure,
    TResult? Function()? deleteNotificationByIdInProgress,
    TResult? Function()? deleteNotificationByIdSuccess,
    TResult? Function(String error)? deleteNotificationByIdFailure,
  }) {
    return markReadNotificationFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsByUserIdInProgress,
    TResult Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult Function(String error)? getNotificationsByUserIdFailure,
    TResult Function()? markReadNotificationInProgress,
    TResult Function(NotificationDto notification)? markReadNotificationSuccess,
    TResult Function(String error)? markReadNotificationFailure,
    TResult Function()? markReadAllNotificationInProgress,
    TResult Function()? markReadAllNotificationSuccess,
    TResult Function(String error)? markReadAllNotificationFailure,
    TResult Function()? deleteNotificationByIdInProgress,
    TResult Function()? deleteNotificationByIdSuccess,
    TResult Function(String error)? deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (markReadNotificationFailure != null) {
      return markReadNotificationFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetNotificationsByUserIdInProgress value)
        getNotificationsByUserIdInProgress,
    required TResult Function(_GetNotificationsByUserIdSuccess value)
        getNotificationsByUserIdSuccess,
    required TResult Function(_GetNotificationsByUserIdFailure value)
        getNotificationsByUserIdFailure,
    required TResult Function(_MarkReadNotificationInProgress value)
        markReadNotificationInProgress,
    required TResult Function(_MarkReadNotificationSuccess value)
        markReadNotificationSuccess,
    required TResult Function(_MarkReadNotificationFailure value)
        markReadNotificationFailure,
    required TResult Function(_MarkReadAllNotificationInProgress value)
        markReadAllNotificationInProgress,
    required TResult Function(_MarkReadAllNotificationSuccess value)
        markReadAllNotificationSuccess,
    required TResult Function(_MarkReadAllNotificationFailure value)
        markReadAllNotificationFailure,
    required TResult Function(_DeleteNotificationByIdInProgress value)
        deleteNotificationByIdInProgress,
    required TResult Function(_DeleteNotificationByIdSuccess value)
        deleteNotificationByIdSuccess,
    required TResult Function(_DeleteNotificationByIdFailure value)
        deleteNotificationByIdFailure,
  }) {
    return markReadNotificationFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult? Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult? Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult? Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult? Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult? Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult? Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult? Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult? Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult? Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult? Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult? Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
  }) {
    return markReadNotificationFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (markReadNotificationFailure != null) {
      return markReadNotificationFailure(this);
    }
    return orElse();
  }
}

abstract class _MarkReadNotificationFailure implements NotificationState {
  const factory _MarkReadNotificationFailure({required final String error}) =
      _$MarkReadNotificationFailureImpl;

  String get error;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkReadNotificationFailureImplCopyWith<_$MarkReadNotificationFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkReadAllNotificationInProgressImplCopyWith<$Res> {
  factory _$$MarkReadAllNotificationInProgressImplCopyWith(
          _$MarkReadAllNotificationInProgressImpl value,
          $Res Function(_$MarkReadAllNotificationInProgressImpl) then) =
      __$$MarkReadAllNotificationInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkReadAllNotificationInProgressImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res,
        _$MarkReadAllNotificationInProgressImpl>
    implements _$$MarkReadAllNotificationInProgressImplCopyWith<$Res> {
  __$$MarkReadAllNotificationInProgressImplCopyWithImpl(
      _$MarkReadAllNotificationInProgressImpl _value,
      $Res Function(_$MarkReadAllNotificationInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MarkReadAllNotificationInProgressImpl
    implements _MarkReadAllNotificationInProgress {
  const _$MarkReadAllNotificationInProgressImpl();

  @override
  String toString() {
    return 'NotificationState.markReadAllNotificationInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkReadAllNotificationInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsByUserIdInProgress,
    required TResult Function(List<NotificationDto> notifications)
        getNotificationsByUserIdSuccess,
    required TResult Function(String error) getNotificationsByUserIdFailure,
    required TResult Function() markReadNotificationInProgress,
    required TResult Function(NotificationDto notification)
        markReadNotificationSuccess,
    required TResult Function(String error) markReadNotificationFailure,
    required TResult Function() markReadAllNotificationInProgress,
    required TResult Function() markReadAllNotificationSuccess,
    required TResult Function(String error) markReadAllNotificationFailure,
    required TResult Function() deleteNotificationByIdInProgress,
    required TResult Function() deleteNotificationByIdSuccess,
    required TResult Function(String error) deleteNotificationByIdFailure,
  }) {
    return markReadAllNotificationInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsByUserIdInProgress,
    TResult? Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult? Function(String error)? getNotificationsByUserIdFailure,
    TResult? Function()? markReadNotificationInProgress,
    TResult? Function(NotificationDto notification)?
        markReadNotificationSuccess,
    TResult? Function(String error)? markReadNotificationFailure,
    TResult? Function()? markReadAllNotificationInProgress,
    TResult? Function()? markReadAllNotificationSuccess,
    TResult? Function(String error)? markReadAllNotificationFailure,
    TResult? Function()? deleteNotificationByIdInProgress,
    TResult? Function()? deleteNotificationByIdSuccess,
    TResult? Function(String error)? deleteNotificationByIdFailure,
  }) {
    return markReadAllNotificationInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsByUserIdInProgress,
    TResult Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult Function(String error)? getNotificationsByUserIdFailure,
    TResult Function()? markReadNotificationInProgress,
    TResult Function(NotificationDto notification)? markReadNotificationSuccess,
    TResult Function(String error)? markReadNotificationFailure,
    TResult Function()? markReadAllNotificationInProgress,
    TResult Function()? markReadAllNotificationSuccess,
    TResult Function(String error)? markReadAllNotificationFailure,
    TResult Function()? deleteNotificationByIdInProgress,
    TResult Function()? deleteNotificationByIdSuccess,
    TResult Function(String error)? deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (markReadAllNotificationInProgress != null) {
      return markReadAllNotificationInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetNotificationsByUserIdInProgress value)
        getNotificationsByUserIdInProgress,
    required TResult Function(_GetNotificationsByUserIdSuccess value)
        getNotificationsByUserIdSuccess,
    required TResult Function(_GetNotificationsByUserIdFailure value)
        getNotificationsByUserIdFailure,
    required TResult Function(_MarkReadNotificationInProgress value)
        markReadNotificationInProgress,
    required TResult Function(_MarkReadNotificationSuccess value)
        markReadNotificationSuccess,
    required TResult Function(_MarkReadNotificationFailure value)
        markReadNotificationFailure,
    required TResult Function(_MarkReadAllNotificationInProgress value)
        markReadAllNotificationInProgress,
    required TResult Function(_MarkReadAllNotificationSuccess value)
        markReadAllNotificationSuccess,
    required TResult Function(_MarkReadAllNotificationFailure value)
        markReadAllNotificationFailure,
    required TResult Function(_DeleteNotificationByIdInProgress value)
        deleteNotificationByIdInProgress,
    required TResult Function(_DeleteNotificationByIdSuccess value)
        deleteNotificationByIdSuccess,
    required TResult Function(_DeleteNotificationByIdFailure value)
        deleteNotificationByIdFailure,
  }) {
    return markReadAllNotificationInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult? Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult? Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult? Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult? Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult? Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult? Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult? Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult? Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult? Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult? Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult? Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
  }) {
    return markReadAllNotificationInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (markReadAllNotificationInProgress != null) {
      return markReadAllNotificationInProgress(this);
    }
    return orElse();
  }
}

abstract class _MarkReadAllNotificationInProgress implements NotificationState {
  const factory _MarkReadAllNotificationInProgress() =
      _$MarkReadAllNotificationInProgressImpl;
}

/// @nodoc
abstract class _$$MarkReadAllNotificationSuccessImplCopyWith<$Res> {
  factory _$$MarkReadAllNotificationSuccessImplCopyWith(
          _$MarkReadAllNotificationSuccessImpl value,
          $Res Function(_$MarkReadAllNotificationSuccessImpl) then) =
      __$$MarkReadAllNotificationSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkReadAllNotificationSuccessImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res,
        _$MarkReadAllNotificationSuccessImpl>
    implements _$$MarkReadAllNotificationSuccessImplCopyWith<$Res> {
  __$$MarkReadAllNotificationSuccessImplCopyWithImpl(
      _$MarkReadAllNotificationSuccessImpl _value,
      $Res Function(_$MarkReadAllNotificationSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MarkReadAllNotificationSuccessImpl
    implements _MarkReadAllNotificationSuccess {
  const _$MarkReadAllNotificationSuccessImpl();

  @override
  String toString() {
    return 'NotificationState.markReadAllNotificationSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkReadAllNotificationSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsByUserIdInProgress,
    required TResult Function(List<NotificationDto> notifications)
        getNotificationsByUserIdSuccess,
    required TResult Function(String error) getNotificationsByUserIdFailure,
    required TResult Function() markReadNotificationInProgress,
    required TResult Function(NotificationDto notification)
        markReadNotificationSuccess,
    required TResult Function(String error) markReadNotificationFailure,
    required TResult Function() markReadAllNotificationInProgress,
    required TResult Function() markReadAllNotificationSuccess,
    required TResult Function(String error) markReadAllNotificationFailure,
    required TResult Function() deleteNotificationByIdInProgress,
    required TResult Function() deleteNotificationByIdSuccess,
    required TResult Function(String error) deleteNotificationByIdFailure,
  }) {
    return markReadAllNotificationSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsByUserIdInProgress,
    TResult? Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult? Function(String error)? getNotificationsByUserIdFailure,
    TResult? Function()? markReadNotificationInProgress,
    TResult? Function(NotificationDto notification)?
        markReadNotificationSuccess,
    TResult? Function(String error)? markReadNotificationFailure,
    TResult? Function()? markReadAllNotificationInProgress,
    TResult? Function()? markReadAllNotificationSuccess,
    TResult? Function(String error)? markReadAllNotificationFailure,
    TResult? Function()? deleteNotificationByIdInProgress,
    TResult? Function()? deleteNotificationByIdSuccess,
    TResult? Function(String error)? deleteNotificationByIdFailure,
  }) {
    return markReadAllNotificationSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsByUserIdInProgress,
    TResult Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult Function(String error)? getNotificationsByUserIdFailure,
    TResult Function()? markReadNotificationInProgress,
    TResult Function(NotificationDto notification)? markReadNotificationSuccess,
    TResult Function(String error)? markReadNotificationFailure,
    TResult Function()? markReadAllNotificationInProgress,
    TResult Function()? markReadAllNotificationSuccess,
    TResult Function(String error)? markReadAllNotificationFailure,
    TResult Function()? deleteNotificationByIdInProgress,
    TResult Function()? deleteNotificationByIdSuccess,
    TResult Function(String error)? deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (markReadAllNotificationSuccess != null) {
      return markReadAllNotificationSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetNotificationsByUserIdInProgress value)
        getNotificationsByUserIdInProgress,
    required TResult Function(_GetNotificationsByUserIdSuccess value)
        getNotificationsByUserIdSuccess,
    required TResult Function(_GetNotificationsByUserIdFailure value)
        getNotificationsByUserIdFailure,
    required TResult Function(_MarkReadNotificationInProgress value)
        markReadNotificationInProgress,
    required TResult Function(_MarkReadNotificationSuccess value)
        markReadNotificationSuccess,
    required TResult Function(_MarkReadNotificationFailure value)
        markReadNotificationFailure,
    required TResult Function(_MarkReadAllNotificationInProgress value)
        markReadAllNotificationInProgress,
    required TResult Function(_MarkReadAllNotificationSuccess value)
        markReadAllNotificationSuccess,
    required TResult Function(_MarkReadAllNotificationFailure value)
        markReadAllNotificationFailure,
    required TResult Function(_DeleteNotificationByIdInProgress value)
        deleteNotificationByIdInProgress,
    required TResult Function(_DeleteNotificationByIdSuccess value)
        deleteNotificationByIdSuccess,
    required TResult Function(_DeleteNotificationByIdFailure value)
        deleteNotificationByIdFailure,
  }) {
    return markReadAllNotificationSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult? Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult? Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult? Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult? Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult? Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult? Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult? Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult? Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult? Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult? Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult? Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
  }) {
    return markReadAllNotificationSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (markReadAllNotificationSuccess != null) {
      return markReadAllNotificationSuccess(this);
    }
    return orElse();
  }
}

abstract class _MarkReadAllNotificationSuccess implements NotificationState {
  const factory _MarkReadAllNotificationSuccess() =
      _$MarkReadAllNotificationSuccessImpl;
}

/// @nodoc
abstract class _$$MarkReadAllNotificationFailureImplCopyWith<$Res> {
  factory _$$MarkReadAllNotificationFailureImplCopyWith(
          _$MarkReadAllNotificationFailureImpl value,
          $Res Function(_$MarkReadAllNotificationFailureImpl) then) =
      __$$MarkReadAllNotificationFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$MarkReadAllNotificationFailureImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res,
        _$MarkReadAllNotificationFailureImpl>
    implements _$$MarkReadAllNotificationFailureImplCopyWith<$Res> {
  __$$MarkReadAllNotificationFailureImplCopyWithImpl(
      _$MarkReadAllNotificationFailureImpl _value,
      $Res Function(_$MarkReadAllNotificationFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$MarkReadAllNotificationFailureImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MarkReadAllNotificationFailureImpl
    implements _MarkReadAllNotificationFailure {
  const _$MarkReadAllNotificationFailureImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'NotificationState.markReadAllNotificationFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkReadAllNotificationFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkReadAllNotificationFailureImplCopyWith<
          _$MarkReadAllNotificationFailureImpl>
      get copyWith => __$$MarkReadAllNotificationFailureImplCopyWithImpl<
          _$MarkReadAllNotificationFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsByUserIdInProgress,
    required TResult Function(List<NotificationDto> notifications)
        getNotificationsByUserIdSuccess,
    required TResult Function(String error) getNotificationsByUserIdFailure,
    required TResult Function() markReadNotificationInProgress,
    required TResult Function(NotificationDto notification)
        markReadNotificationSuccess,
    required TResult Function(String error) markReadNotificationFailure,
    required TResult Function() markReadAllNotificationInProgress,
    required TResult Function() markReadAllNotificationSuccess,
    required TResult Function(String error) markReadAllNotificationFailure,
    required TResult Function() deleteNotificationByIdInProgress,
    required TResult Function() deleteNotificationByIdSuccess,
    required TResult Function(String error) deleteNotificationByIdFailure,
  }) {
    return markReadAllNotificationFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsByUserIdInProgress,
    TResult? Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult? Function(String error)? getNotificationsByUserIdFailure,
    TResult? Function()? markReadNotificationInProgress,
    TResult? Function(NotificationDto notification)?
        markReadNotificationSuccess,
    TResult? Function(String error)? markReadNotificationFailure,
    TResult? Function()? markReadAllNotificationInProgress,
    TResult? Function()? markReadAllNotificationSuccess,
    TResult? Function(String error)? markReadAllNotificationFailure,
    TResult? Function()? deleteNotificationByIdInProgress,
    TResult? Function()? deleteNotificationByIdSuccess,
    TResult? Function(String error)? deleteNotificationByIdFailure,
  }) {
    return markReadAllNotificationFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsByUserIdInProgress,
    TResult Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult Function(String error)? getNotificationsByUserIdFailure,
    TResult Function()? markReadNotificationInProgress,
    TResult Function(NotificationDto notification)? markReadNotificationSuccess,
    TResult Function(String error)? markReadNotificationFailure,
    TResult Function()? markReadAllNotificationInProgress,
    TResult Function()? markReadAllNotificationSuccess,
    TResult Function(String error)? markReadAllNotificationFailure,
    TResult Function()? deleteNotificationByIdInProgress,
    TResult Function()? deleteNotificationByIdSuccess,
    TResult Function(String error)? deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (markReadAllNotificationFailure != null) {
      return markReadAllNotificationFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetNotificationsByUserIdInProgress value)
        getNotificationsByUserIdInProgress,
    required TResult Function(_GetNotificationsByUserIdSuccess value)
        getNotificationsByUserIdSuccess,
    required TResult Function(_GetNotificationsByUserIdFailure value)
        getNotificationsByUserIdFailure,
    required TResult Function(_MarkReadNotificationInProgress value)
        markReadNotificationInProgress,
    required TResult Function(_MarkReadNotificationSuccess value)
        markReadNotificationSuccess,
    required TResult Function(_MarkReadNotificationFailure value)
        markReadNotificationFailure,
    required TResult Function(_MarkReadAllNotificationInProgress value)
        markReadAllNotificationInProgress,
    required TResult Function(_MarkReadAllNotificationSuccess value)
        markReadAllNotificationSuccess,
    required TResult Function(_MarkReadAllNotificationFailure value)
        markReadAllNotificationFailure,
    required TResult Function(_DeleteNotificationByIdInProgress value)
        deleteNotificationByIdInProgress,
    required TResult Function(_DeleteNotificationByIdSuccess value)
        deleteNotificationByIdSuccess,
    required TResult Function(_DeleteNotificationByIdFailure value)
        deleteNotificationByIdFailure,
  }) {
    return markReadAllNotificationFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult? Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult? Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult? Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult? Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult? Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult? Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult? Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult? Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult? Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult? Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult? Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
  }) {
    return markReadAllNotificationFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (markReadAllNotificationFailure != null) {
      return markReadAllNotificationFailure(this);
    }
    return orElse();
  }
}

abstract class _MarkReadAllNotificationFailure implements NotificationState {
  const factory _MarkReadAllNotificationFailure({required final String error}) =
      _$MarkReadAllNotificationFailureImpl;

  String get error;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkReadAllNotificationFailureImplCopyWith<
          _$MarkReadAllNotificationFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteNotificationByIdInProgressImplCopyWith<$Res> {
  factory _$$DeleteNotificationByIdInProgressImplCopyWith(
          _$DeleteNotificationByIdInProgressImpl value,
          $Res Function(_$DeleteNotificationByIdInProgressImpl) then) =
      __$$DeleteNotificationByIdInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteNotificationByIdInProgressImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res,
        _$DeleteNotificationByIdInProgressImpl>
    implements _$$DeleteNotificationByIdInProgressImplCopyWith<$Res> {
  __$$DeleteNotificationByIdInProgressImplCopyWithImpl(
      _$DeleteNotificationByIdInProgressImpl _value,
      $Res Function(_$DeleteNotificationByIdInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteNotificationByIdInProgressImpl
    implements _DeleteNotificationByIdInProgress {
  const _$DeleteNotificationByIdInProgressImpl();

  @override
  String toString() {
    return 'NotificationState.deleteNotificationByIdInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteNotificationByIdInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsByUserIdInProgress,
    required TResult Function(List<NotificationDto> notifications)
        getNotificationsByUserIdSuccess,
    required TResult Function(String error) getNotificationsByUserIdFailure,
    required TResult Function() markReadNotificationInProgress,
    required TResult Function(NotificationDto notification)
        markReadNotificationSuccess,
    required TResult Function(String error) markReadNotificationFailure,
    required TResult Function() markReadAllNotificationInProgress,
    required TResult Function() markReadAllNotificationSuccess,
    required TResult Function(String error) markReadAllNotificationFailure,
    required TResult Function() deleteNotificationByIdInProgress,
    required TResult Function() deleteNotificationByIdSuccess,
    required TResult Function(String error) deleteNotificationByIdFailure,
  }) {
    return deleteNotificationByIdInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsByUserIdInProgress,
    TResult? Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult? Function(String error)? getNotificationsByUserIdFailure,
    TResult? Function()? markReadNotificationInProgress,
    TResult? Function(NotificationDto notification)?
        markReadNotificationSuccess,
    TResult? Function(String error)? markReadNotificationFailure,
    TResult? Function()? markReadAllNotificationInProgress,
    TResult? Function()? markReadAllNotificationSuccess,
    TResult? Function(String error)? markReadAllNotificationFailure,
    TResult? Function()? deleteNotificationByIdInProgress,
    TResult? Function()? deleteNotificationByIdSuccess,
    TResult? Function(String error)? deleteNotificationByIdFailure,
  }) {
    return deleteNotificationByIdInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsByUserIdInProgress,
    TResult Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult Function(String error)? getNotificationsByUserIdFailure,
    TResult Function()? markReadNotificationInProgress,
    TResult Function(NotificationDto notification)? markReadNotificationSuccess,
    TResult Function(String error)? markReadNotificationFailure,
    TResult Function()? markReadAllNotificationInProgress,
    TResult Function()? markReadAllNotificationSuccess,
    TResult Function(String error)? markReadAllNotificationFailure,
    TResult Function()? deleteNotificationByIdInProgress,
    TResult Function()? deleteNotificationByIdSuccess,
    TResult Function(String error)? deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (deleteNotificationByIdInProgress != null) {
      return deleteNotificationByIdInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetNotificationsByUserIdInProgress value)
        getNotificationsByUserIdInProgress,
    required TResult Function(_GetNotificationsByUserIdSuccess value)
        getNotificationsByUserIdSuccess,
    required TResult Function(_GetNotificationsByUserIdFailure value)
        getNotificationsByUserIdFailure,
    required TResult Function(_MarkReadNotificationInProgress value)
        markReadNotificationInProgress,
    required TResult Function(_MarkReadNotificationSuccess value)
        markReadNotificationSuccess,
    required TResult Function(_MarkReadNotificationFailure value)
        markReadNotificationFailure,
    required TResult Function(_MarkReadAllNotificationInProgress value)
        markReadAllNotificationInProgress,
    required TResult Function(_MarkReadAllNotificationSuccess value)
        markReadAllNotificationSuccess,
    required TResult Function(_MarkReadAllNotificationFailure value)
        markReadAllNotificationFailure,
    required TResult Function(_DeleteNotificationByIdInProgress value)
        deleteNotificationByIdInProgress,
    required TResult Function(_DeleteNotificationByIdSuccess value)
        deleteNotificationByIdSuccess,
    required TResult Function(_DeleteNotificationByIdFailure value)
        deleteNotificationByIdFailure,
  }) {
    return deleteNotificationByIdInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult? Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult? Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult? Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult? Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult? Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult? Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult? Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult? Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult? Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult? Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult? Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
  }) {
    return deleteNotificationByIdInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (deleteNotificationByIdInProgress != null) {
      return deleteNotificationByIdInProgress(this);
    }
    return orElse();
  }
}

abstract class _DeleteNotificationByIdInProgress implements NotificationState {
  const factory _DeleteNotificationByIdInProgress() =
      _$DeleteNotificationByIdInProgressImpl;
}

/// @nodoc
abstract class _$$DeleteNotificationByIdSuccessImplCopyWith<$Res> {
  factory _$$DeleteNotificationByIdSuccessImplCopyWith(
          _$DeleteNotificationByIdSuccessImpl value,
          $Res Function(_$DeleteNotificationByIdSuccessImpl) then) =
      __$$DeleteNotificationByIdSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteNotificationByIdSuccessImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res,
        _$DeleteNotificationByIdSuccessImpl>
    implements _$$DeleteNotificationByIdSuccessImplCopyWith<$Res> {
  __$$DeleteNotificationByIdSuccessImplCopyWithImpl(
      _$DeleteNotificationByIdSuccessImpl _value,
      $Res Function(_$DeleteNotificationByIdSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteNotificationByIdSuccessImpl
    implements _DeleteNotificationByIdSuccess {
  const _$DeleteNotificationByIdSuccessImpl();

  @override
  String toString() {
    return 'NotificationState.deleteNotificationByIdSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteNotificationByIdSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsByUserIdInProgress,
    required TResult Function(List<NotificationDto> notifications)
        getNotificationsByUserIdSuccess,
    required TResult Function(String error) getNotificationsByUserIdFailure,
    required TResult Function() markReadNotificationInProgress,
    required TResult Function(NotificationDto notification)
        markReadNotificationSuccess,
    required TResult Function(String error) markReadNotificationFailure,
    required TResult Function() markReadAllNotificationInProgress,
    required TResult Function() markReadAllNotificationSuccess,
    required TResult Function(String error) markReadAllNotificationFailure,
    required TResult Function() deleteNotificationByIdInProgress,
    required TResult Function() deleteNotificationByIdSuccess,
    required TResult Function(String error) deleteNotificationByIdFailure,
  }) {
    return deleteNotificationByIdSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsByUserIdInProgress,
    TResult? Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult? Function(String error)? getNotificationsByUserIdFailure,
    TResult? Function()? markReadNotificationInProgress,
    TResult? Function(NotificationDto notification)?
        markReadNotificationSuccess,
    TResult? Function(String error)? markReadNotificationFailure,
    TResult? Function()? markReadAllNotificationInProgress,
    TResult? Function()? markReadAllNotificationSuccess,
    TResult? Function(String error)? markReadAllNotificationFailure,
    TResult? Function()? deleteNotificationByIdInProgress,
    TResult? Function()? deleteNotificationByIdSuccess,
    TResult? Function(String error)? deleteNotificationByIdFailure,
  }) {
    return deleteNotificationByIdSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsByUserIdInProgress,
    TResult Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult Function(String error)? getNotificationsByUserIdFailure,
    TResult Function()? markReadNotificationInProgress,
    TResult Function(NotificationDto notification)? markReadNotificationSuccess,
    TResult Function(String error)? markReadNotificationFailure,
    TResult Function()? markReadAllNotificationInProgress,
    TResult Function()? markReadAllNotificationSuccess,
    TResult Function(String error)? markReadAllNotificationFailure,
    TResult Function()? deleteNotificationByIdInProgress,
    TResult Function()? deleteNotificationByIdSuccess,
    TResult Function(String error)? deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (deleteNotificationByIdSuccess != null) {
      return deleteNotificationByIdSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetNotificationsByUserIdInProgress value)
        getNotificationsByUserIdInProgress,
    required TResult Function(_GetNotificationsByUserIdSuccess value)
        getNotificationsByUserIdSuccess,
    required TResult Function(_GetNotificationsByUserIdFailure value)
        getNotificationsByUserIdFailure,
    required TResult Function(_MarkReadNotificationInProgress value)
        markReadNotificationInProgress,
    required TResult Function(_MarkReadNotificationSuccess value)
        markReadNotificationSuccess,
    required TResult Function(_MarkReadNotificationFailure value)
        markReadNotificationFailure,
    required TResult Function(_MarkReadAllNotificationInProgress value)
        markReadAllNotificationInProgress,
    required TResult Function(_MarkReadAllNotificationSuccess value)
        markReadAllNotificationSuccess,
    required TResult Function(_MarkReadAllNotificationFailure value)
        markReadAllNotificationFailure,
    required TResult Function(_DeleteNotificationByIdInProgress value)
        deleteNotificationByIdInProgress,
    required TResult Function(_DeleteNotificationByIdSuccess value)
        deleteNotificationByIdSuccess,
    required TResult Function(_DeleteNotificationByIdFailure value)
        deleteNotificationByIdFailure,
  }) {
    return deleteNotificationByIdSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult? Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult? Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult? Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult? Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult? Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult? Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult? Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult? Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult? Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult? Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult? Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
  }) {
    return deleteNotificationByIdSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (deleteNotificationByIdSuccess != null) {
      return deleteNotificationByIdSuccess(this);
    }
    return orElse();
  }
}

abstract class _DeleteNotificationByIdSuccess implements NotificationState {
  const factory _DeleteNotificationByIdSuccess() =
      _$DeleteNotificationByIdSuccessImpl;
}

/// @nodoc
abstract class _$$DeleteNotificationByIdFailureImplCopyWith<$Res> {
  factory _$$DeleteNotificationByIdFailureImplCopyWith(
          _$DeleteNotificationByIdFailureImpl value,
          $Res Function(_$DeleteNotificationByIdFailureImpl) then) =
      __$$DeleteNotificationByIdFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$DeleteNotificationByIdFailureImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res,
        _$DeleteNotificationByIdFailureImpl>
    implements _$$DeleteNotificationByIdFailureImplCopyWith<$Res> {
  __$$DeleteNotificationByIdFailureImplCopyWithImpl(
      _$DeleteNotificationByIdFailureImpl _value,
      $Res Function(_$DeleteNotificationByIdFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$DeleteNotificationByIdFailureImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteNotificationByIdFailureImpl
    implements _DeleteNotificationByIdFailure {
  const _$DeleteNotificationByIdFailureImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'NotificationState.deleteNotificationByIdFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteNotificationByIdFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteNotificationByIdFailureImplCopyWith<
          _$DeleteNotificationByIdFailureImpl>
      get copyWith => __$$DeleteNotificationByIdFailureImplCopyWithImpl<
          _$DeleteNotificationByIdFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getNotificationsByUserIdInProgress,
    required TResult Function(List<NotificationDto> notifications)
        getNotificationsByUserIdSuccess,
    required TResult Function(String error) getNotificationsByUserIdFailure,
    required TResult Function() markReadNotificationInProgress,
    required TResult Function(NotificationDto notification)
        markReadNotificationSuccess,
    required TResult Function(String error) markReadNotificationFailure,
    required TResult Function() markReadAllNotificationInProgress,
    required TResult Function() markReadAllNotificationSuccess,
    required TResult Function(String error) markReadAllNotificationFailure,
    required TResult Function() deleteNotificationByIdInProgress,
    required TResult Function() deleteNotificationByIdSuccess,
    required TResult Function(String error) deleteNotificationByIdFailure,
  }) {
    return deleteNotificationByIdFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getNotificationsByUserIdInProgress,
    TResult? Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult? Function(String error)? getNotificationsByUserIdFailure,
    TResult? Function()? markReadNotificationInProgress,
    TResult? Function(NotificationDto notification)?
        markReadNotificationSuccess,
    TResult? Function(String error)? markReadNotificationFailure,
    TResult? Function()? markReadAllNotificationInProgress,
    TResult? Function()? markReadAllNotificationSuccess,
    TResult? Function(String error)? markReadAllNotificationFailure,
    TResult? Function()? deleteNotificationByIdInProgress,
    TResult? Function()? deleteNotificationByIdSuccess,
    TResult? Function(String error)? deleteNotificationByIdFailure,
  }) {
    return deleteNotificationByIdFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getNotificationsByUserIdInProgress,
    TResult Function(List<NotificationDto> notifications)?
        getNotificationsByUserIdSuccess,
    TResult Function(String error)? getNotificationsByUserIdFailure,
    TResult Function()? markReadNotificationInProgress,
    TResult Function(NotificationDto notification)? markReadNotificationSuccess,
    TResult Function(String error)? markReadNotificationFailure,
    TResult Function()? markReadAllNotificationInProgress,
    TResult Function()? markReadAllNotificationSuccess,
    TResult Function(String error)? markReadAllNotificationFailure,
    TResult Function()? deleteNotificationByIdInProgress,
    TResult Function()? deleteNotificationByIdSuccess,
    TResult Function(String error)? deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (deleteNotificationByIdFailure != null) {
      return deleteNotificationByIdFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GetNotificationsByUserIdInProgress value)
        getNotificationsByUserIdInProgress,
    required TResult Function(_GetNotificationsByUserIdSuccess value)
        getNotificationsByUserIdSuccess,
    required TResult Function(_GetNotificationsByUserIdFailure value)
        getNotificationsByUserIdFailure,
    required TResult Function(_MarkReadNotificationInProgress value)
        markReadNotificationInProgress,
    required TResult Function(_MarkReadNotificationSuccess value)
        markReadNotificationSuccess,
    required TResult Function(_MarkReadNotificationFailure value)
        markReadNotificationFailure,
    required TResult Function(_MarkReadAllNotificationInProgress value)
        markReadAllNotificationInProgress,
    required TResult Function(_MarkReadAllNotificationSuccess value)
        markReadAllNotificationSuccess,
    required TResult Function(_MarkReadAllNotificationFailure value)
        markReadAllNotificationFailure,
    required TResult Function(_DeleteNotificationByIdInProgress value)
        deleteNotificationByIdInProgress,
    required TResult Function(_DeleteNotificationByIdSuccess value)
        deleteNotificationByIdSuccess,
    required TResult Function(_DeleteNotificationByIdFailure value)
        deleteNotificationByIdFailure,
  }) {
    return deleteNotificationByIdFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult? Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult? Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult? Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult? Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult? Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult? Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult? Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult? Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult? Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult? Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult? Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
  }) {
    return deleteNotificationByIdFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GetNotificationsByUserIdInProgress value)?
        getNotificationsByUserIdInProgress,
    TResult Function(_GetNotificationsByUserIdSuccess value)?
        getNotificationsByUserIdSuccess,
    TResult Function(_GetNotificationsByUserIdFailure value)?
        getNotificationsByUserIdFailure,
    TResult Function(_MarkReadNotificationInProgress value)?
        markReadNotificationInProgress,
    TResult Function(_MarkReadNotificationSuccess value)?
        markReadNotificationSuccess,
    TResult Function(_MarkReadNotificationFailure value)?
        markReadNotificationFailure,
    TResult Function(_MarkReadAllNotificationInProgress value)?
        markReadAllNotificationInProgress,
    TResult Function(_MarkReadAllNotificationSuccess value)?
        markReadAllNotificationSuccess,
    TResult Function(_MarkReadAllNotificationFailure value)?
        markReadAllNotificationFailure,
    TResult Function(_DeleteNotificationByIdInProgress value)?
        deleteNotificationByIdInProgress,
    TResult Function(_DeleteNotificationByIdSuccess value)?
        deleteNotificationByIdSuccess,
    TResult Function(_DeleteNotificationByIdFailure value)?
        deleteNotificationByIdFailure,
    required TResult orElse(),
  }) {
    if (deleteNotificationByIdFailure != null) {
      return deleteNotificationByIdFailure(this);
    }
    return orElse();
  }
}

abstract class _DeleteNotificationByIdFailure implements NotificationState {
  const factory _DeleteNotificationByIdFailure({required final String error}) =
      _$DeleteNotificationByIdFailureImpl;

  String get error;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteNotificationByIdFailureImplCopyWith<
          _$DeleteNotificationByIdFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
