// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String get cageId => throw _privateConstructorUsedError;
  String get taskName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  int get priorityNum => throw _privateConstructorUsedError;
  String get dueDate => throw _privateConstructorUsedError;
  int get session => throw _privateConstructorUsedError;
  String? get completedAt => throw _privateConstructorUsedError;
  String? get cageAnimalName => throw _privateConstructorUsedError;
  bool? get isWarning => throw _privateConstructorUsedError;
  bool? get hasAnimalDesease => throw _privateConstructorUsedError;
  bool get isTreatmentTask => throw _privateConstructorUsedError;
  String? get prescriptionId => throw _privateConstructorUsedError;
  User get assignedToUser => throw _privateConstructorUsedError;
  TaskType get taskType => throw _privateConstructorUsedError;

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String id,
      String cageId,
      String taskName,
      String description,
      String status,
      String createdAt,
      int priorityNum,
      String dueDate,
      int session,
      String? completedAt,
      String? cageAnimalName,
      bool? isWarning,
      bool? hasAnimalDesease,
      bool isTreatmentTask,
      String? prescriptionId,
      User assignedToUser,
      TaskType taskType});

  $UserCopyWith<$Res> get assignedToUser;
  $TaskTypeCopyWith<$Res> get taskType;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cageId = null,
    Object? taskName = null,
    Object? description = null,
    Object? status = null,
    Object? createdAt = null,
    Object? priorityNum = null,
    Object? dueDate = null,
    Object? session = null,
    Object? completedAt = freezed,
    Object? cageAnimalName = freezed,
    Object? isWarning = freezed,
    Object? hasAnimalDesease = freezed,
    Object? isTreatmentTask = null,
    Object? prescriptionId = freezed,
    Object? assignedToUser = null,
    Object? taskType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cageId: null == cageId
          ? _value.cageId
          : cageId // ignore: cast_nullable_to_non_nullable
              as String,
      taskName: null == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      priorityNum: null == priorityNum
          ? _value.priorityNum
          : priorityNum // ignore: cast_nullable_to_non_nullable
              as int,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String,
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as int,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      cageAnimalName: freezed == cageAnimalName
          ? _value.cageAnimalName
          : cageAnimalName // ignore: cast_nullable_to_non_nullable
              as String?,
      isWarning: freezed == isWarning
          ? _value.isWarning
          : isWarning // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasAnimalDesease: freezed == hasAnimalDesease
          ? _value.hasAnimalDesease
          : hasAnimalDesease // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTreatmentTask: null == isTreatmentTask
          ? _value.isTreatmentTask
          : isTreatmentTask // ignore: cast_nullable_to_non_nullable
              as bool,
      prescriptionId: freezed == prescriptionId
          ? _value.prescriptionId
          : prescriptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedToUser: null == assignedToUser
          ? _value.assignedToUser
          : assignedToUser // ignore: cast_nullable_to_non_nullable
              as User,
      taskType: null == taskType
          ? _value.taskType
          : taskType // ignore: cast_nullable_to_non_nullable
              as TaskType,
    ) as $Val);
  }

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get assignedToUser {
    return $UserCopyWith<$Res>(_value.assignedToUser, (value) {
      return _then(_value.copyWith(assignedToUser: value) as $Val);
    });
  }

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskTypeCopyWith<$Res> get taskType {
    return $TaskTypeCopyWith<$Res>(_value.taskType, (value) {
      return _then(_value.copyWith(taskType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String cageId,
      String taskName,
      String description,
      String status,
      String createdAt,
      int priorityNum,
      String dueDate,
      int session,
      String? completedAt,
      String? cageAnimalName,
      bool? isWarning,
      bool? hasAnimalDesease,
      bool isTreatmentTask,
      String? prescriptionId,
      User assignedToUser,
      TaskType taskType});

  @override
  $UserCopyWith<$Res> get assignedToUser;
  @override
  $TaskTypeCopyWith<$Res> get taskType;
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cageId = null,
    Object? taskName = null,
    Object? description = null,
    Object? status = null,
    Object? createdAt = null,
    Object? priorityNum = null,
    Object? dueDate = null,
    Object? session = null,
    Object? completedAt = freezed,
    Object? cageAnimalName = freezed,
    Object? isWarning = freezed,
    Object? hasAnimalDesease = freezed,
    Object? isTreatmentTask = null,
    Object? prescriptionId = freezed,
    Object? assignedToUser = null,
    Object? taskType = null,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cageId: null == cageId
          ? _value.cageId
          : cageId // ignore: cast_nullable_to_non_nullable
              as String,
      taskName: null == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      priorityNum: null == priorityNum
          ? _value.priorityNum
          : priorityNum // ignore: cast_nullable_to_non_nullable
              as int,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String,
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as int,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      cageAnimalName: freezed == cageAnimalName
          ? _value.cageAnimalName
          : cageAnimalName // ignore: cast_nullable_to_non_nullable
              as String?,
      isWarning: freezed == isWarning
          ? _value.isWarning
          : isWarning // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasAnimalDesease: freezed == hasAnimalDesease
          ? _value.hasAnimalDesease
          : hasAnimalDesease // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTreatmentTask: null == isTreatmentTask
          ? _value.isTreatmentTask
          : isTreatmentTask // ignore: cast_nullable_to_non_nullable
              as bool,
      prescriptionId: freezed == prescriptionId
          ? _value.prescriptionId
          : prescriptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedToUser: null == assignedToUser
          ? _value.assignedToUser
          : assignedToUser // ignore: cast_nullable_to_non_nullable
              as User,
      taskType: null == taskType
          ? _value.taskType
          : taskType // ignore: cast_nullable_to_non_nullable
              as TaskType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl(
      {required this.id,
      required this.cageId,
      required this.taskName,
      required this.description,
      required this.status,
      required this.createdAt,
      required this.priorityNum,
      required this.dueDate,
      required this.session,
      this.completedAt,
      this.cageAnimalName,
      this.isWarning,
      this.hasAnimalDesease,
      required this.isTreatmentTask,
      required this.prescriptionId,
      required this.assignedToUser,
      required this.taskType});

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final String id;
  @override
  final String cageId;
  @override
  final String taskName;
  @override
  final String description;
  @override
  final String status;
  @override
  final String createdAt;
  @override
  final int priorityNum;
  @override
  final String dueDate;
  @override
  final int session;
  @override
  final String? completedAt;
  @override
  final String? cageAnimalName;
  @override
  final bool? isWarning;
  @override
  final bool? hasAnimalDesease;
  @override
  final bool isTreatmentTask;
  @override
  final String? prescriptionId;
  @override
  final User assignedToUser;
  @override
  final TaskType taskType;

  @override
  String toString() {
    return 'Task(id: $id, cageId: $cageId, taskName: $taskName, description: $description, status: $status, createdAt: $createdAt, priorityNum: $priorityNum, dueDate: $dueDate, session: $session, completedAt: $completedAt, cageAnimalName: $cageAnimalName, isWarning: $isWarning, hasAnimalDesease: $hasAnimalDesease, isTreatmentTask: $isTreatmentTask, prescriptionId: $prescriptionId, assignedToUser: $assignedToUser, taskType: $taskType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cageId, cageId) || other.cageId == cageId) &&
            (identical(other.taskName, taskName) ||
                other.taskName == taskName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.priorityNum, priorityNum) ||
                other.priorityNum == priorityNum) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.cageAnimalName, cageAnimalName) ||
                other.cageAnimalName == cageAnimalName) &&
            (identical(other.isWarning, isWarning) ||
                other.isWarning == isWarning) &&
            (identical(other.hasAnimalDesease, hasAnimalDesease) ||
                other.hasAnimalDesease == hasAnimalDesease) &&
            (identical(other.isTreatmentTask, isTreatmentTask) ||
                other.isTreatmentTask == isTreatmentTask) &&
            (identical(other.prescriptionId, prescriptionId) ||
                other.prescriptionId == prescriptionId) &&
            (identical(other.assignedToUser, assignedToUser) ||
                other.assignedToUser == assignedToUser) &&
            (identical(other.taskType, taskType) ||
                other.taskType == taskType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      cageId,
      taskName,
      description,
      status,
      createdAt,
      priorityNum,
      dueDate,
      session,
      completedAt,
      cageAnimalName,
      isWarning,
      hasAnimalDesease,
      isTreatmentTask,
      prescriptionId,
      assignedToUser,
      taskType);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {required final String id,
      required final String cageId,
      required final String taskName,
      required final String description,
      required final String status,
      required final String createdAt,
      required final int priorityNum,
      required final String dueDate,
      required final int session,
      final String? completedAt,
      final String? cageAnimalName,
      final bool? isWarning,
      final bool? hasAnimalDesease,
      required final bool isTreatmentTask,
      required final String? prescriptionId,
      required final User assignedToUser,
      required final TaskType taskType}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String get id;
  @override
  String get cageId;
  @override
  String get taskName;
  @override
  String get description;
  @override
  String get status;
  @override
  String get createdAt;
  @override
  int get priorityNum;
  @override
  String get dueDate;
  @override
  int get session;
  @override
  String? get completedAt;
  @override
  String? get cageAnimalName;
  @override
  bool? get isWarning;
  @override
  bool? get hasAnimalDesease;
  @override
  bool get isTreatmentTask;
  @override
  String? get prescriptionId;
  @override
  User get assignedToUser;
  @override
  TaskType get taskType;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
