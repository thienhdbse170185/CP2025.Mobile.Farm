import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
import 'package:data_layer/model/request/vaccine_schedule_log/vaccine_schedule_log_request.dart';
import 'package:data_layer/model/response/vaccine_schedule_log/vaccine_schedule_log_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vaccine_schedule_log_cubit.freezed.dart';
part 'vaccine_schedule_log_state.dart';

class VaccineScheduleLogCubit extends Cubit<VaccineScheduleLogState> {
  final VaccineScheduleLogRepository repository;
  VaccineScheduleLogCubit({required this.repository})
      : super(VaccineScheduleLogState.initial());

  Future<void> create({required VaccineScheduleLogRequest request}) async {
    emit(const VaccineScheduleLogState.createVaccineScheduleLogInProgress());
    try {
      log('[VACCINE_SCHEDULE_LOG_CUBIT] Đang tạo mới VaccineScheduleLog...');
      log('[VACCINE_SCHEDULE_LOG_CUBIT] req: ${request.toJson()}');
      final result = await repository.create(request);
      if (result) {
        emit(const VaccineScheduleLogState.createVaccineScheduleLogSuccess());
      } else {
        emit(const VaccineScheduleLogState.createVaccineScheduleLogFailure(
            'Failed to create vaccine schedule log'));
      }
    } catch (e) {
      emit(VaccineScheduleLogState.createVaccineScheduleLogFailure(
          e.toString()));
    }
  }

  Future<VaccineScheduleLogResponse> getVaccineScheduleLogByTaskId(
      String taskId) async {
    emit(const VaccineScheduleLogState
        .getVaccineScheduleLogByTaskIdInProgress());
    try {
      log('[VACCINE_SCHEDULE_LOG_CUBIT] Đang lấy thông tin VaccineScheduleLog...');
      log('[VACCINE_SCHEDULE_LOG_CUBIT] taskId: $taskId');
      final vaccineScheduleLog =
          await repository.getVaccineScheduleLogByTaskId(taskId);
      emit(
        VaccineScheduleLogState.getVaccineScheduleLogByTaskIdSuccess(
            vaccineScheduleLog.result),
      );
      return vaccineScheduleLog;
    } catch (e) {
      emit(VaccineScheduleLogState.getVaccineScheduleLogByTaskIdFailure(
          e.toString()));
      rethrow;
    }
  }
}
