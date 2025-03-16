import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:data_layer/model/dto/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_qr_code_cubit.freezed.dart';
part 'task_qr_code_state.dart';

class TaskQrCodeCubit extends Cubit<TaskQrCodeState> {
  DailyFoodUsageLogDto? dailyFoodUsageLogDto;
  HealthLogDto? healthLogDto;
  VaccineScheduleLogDto? vaccineScheduleLogDto;
  Map<String, Map<String, dynamic>>? taskData;
  TaskQrCodeCubit() : super(TaskQrCodeState.initial());

  void createFoodLog({
    required String taskId,
    required String cageId,
    required DailyFoodUsageLogDto foodLog,
  }) {
    log('[TASK_QR_CODE] Đang tạo log thức ăn...');
    emit(TaskQrCodeState.createFoodLogInProgress());
    try {
      dailyFoodUsageLogDto = foodLog;
      taskData = {
        'foodLog': {},
      };
      log('[TASK_QR_CODE] Tạo log thức ăn thành công!');
      emit(TaskQrCodeState.createFoodLogSuccess());
    } catch (e) {
      log('[TASK_QR_CODE] Lỗi khi tạo log thức ăn: $e');
      emit(TaskQrCodeState.createFoodLogFailure());
    }
  }

  void createHealthLog({required HealthLogDto healthLogDto}) {
    emit(TaskQrCodeState.createHealthLogInProgress());
    try {
      this.healthLogDto = healthLogDto;
      emit(TaskQrCodeState.createHealthLogSuccess());
    } catch (e) {
      emit(TaskQrCodeState.createHealthLogFailure());
    }
  }

  void createVaccineLog(
      {required VaccineScheduleLogDto vaccineScheduleLogDto}) {
    emit(TaskQrCodeState.createVaccineLogInProgress());
    try {
      this.vaccineScheduleLogDto = vaccineScheduleLogDto;
      emit(TaskQrCodeState.createVaccineLogSuccess());
    } catch (e) {
      emit(TaskQrCodeState.createVaccineLogFailure());
    }
  }
}
