import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/vaccine_schedule/vaccine_schedule_dto.dart';
import 'package:smart_farm/src/model/repository/vaccine_schedule/vaccine_schedule_repository.dart';
import 'package:smart_farm/src/model/request/vaccine_schedule/vaccine_schedule_request.dart';

part 'vaccine_schedule_cubit.freezed.dart';
part 'vaccine_schedule_state.dart';

class VaccineScheduleCubit extends Cubit<VaccineScheduleState> {
  final VaccineScheduleRepository repository;
  VaccineScheduleCubit({required this.repository})
      : super(VaccineScheduleState.initial());

  Future<void> getVaccineScheduleByStageId({
    required String stageId,
    required DateTime? date,
    required String status,
  }) async {
    emit(const VaccineScheduleState.getVaccineScheduleByStageIdInProgress());
    try {
      log('[VACCINE_SCHEDULE_CUBIT] Đang lấy thông tin VaccineSchedule...');
      log('[VACCINE_SCHEDULE_CUBIT] req: stageId: $stageId, date: $date, status: $status');
      final request = VaccineScheduleRequest(
        stageId: stageId,
        date: date?.toIso8601String(),
        status: status,
      );
      final vaccineSchedule =
          await repository.getVaccineScheduleByStageId(request: request);
      emit(
        VaccineScheduleState.getVaccineScheduleByStageIdSuccess(
            vaccineSchedule.result),
      );
    } catch (e) {
      emit(VaccineScheduleState.getVaccineScheduleByStageIdFailure(
          e.toString()));
    }
  }

  Future<void> getVaccineScheduleById({required String id}) async {
    emit(const VaccineScheduleState.getVaccineScheduleByIdInProgress());
    try {
      log('[VACCINE_SCHEDULE_CUBIT] Đang lấy thông tin VaccineSchedule...');
      log('[VACCINE_SCHEDULE_CUBIT] id: $id');
      final vaccineSchedule = await repository.getVaccineScheduleById(id: id);
      emit(
        VaccineScheduleState.getVaccineScheduleByIdSuccess(
            vaccineSchedule.result),
      );
    } catch (e) {
      emit(VaccineScheduleState.getVaccineScheduleByIdFailure(e.toString()));
    }
  }
}
