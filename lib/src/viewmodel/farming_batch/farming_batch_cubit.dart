import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/farming_batch/farming_batch_dto.dart';
import 'package:smart_farm/src/model/repository/farming_batch/farming_batch_repository.dart';

part 'farming_batch_cubit.freezed.dart';
part 'farming_batch_state.dart';

class FarmingBatchCubit extends Cubit<FarmingBatchState> {
  final FarmingBatchRepository repository;
  FarmingBatchCubit({required this.repository})
      : super(const FarmingBatchState.initial());

  Future<void> getFarmingBatchByCage(String cageId) async {
    emit(const FarmingBatchState.getFarmingBatchByCageInProgress());
    try {
      final farmingBatch = await repository.getFarmingBatchByCage(cageId);
      emit(FarmingBatchState.getFarmingBatchByCageSuccess(farmingBatch));
    } catch (e) {
      emit(FarmingBatchState.getFarmingBatchByCageFailure(e.toString()));
    }
  }

  Future<void> getFarmingBatchByCageDuedate(
      String cageId, String dueDateTask) async {
    emit(const FarmingBatchState.getFarmingBatchByCageInProgress());
    try {
      final farmingBatch =
          await repository.getFarmingBatchByCageDuedate(cageId, dueDateTask);
      emit(FarmingBatchState.getFarmingBatchByCageSuccess(farmingBatch));
    } catch (e) {
      emit(FarmingBatchState.getFarmingBatchByCageFailure(e.toString()));
    }
  }

  Future<void> createDeathReport(
      String batchId, String stageId, int deathAmount, String notes) async {
    emit(const FarmingBatchState.createDeathReportInProgress());
    try {
      final result = await repository.createDeathReport(
          batchId, stageId, deathAmount, notes);
      if (result) {
        emit(const FarmingBatchState.createDeathReportSuccess());
      } else {
        emit(const FarmingBatchState.createDeathReportFailure(
            'create-death-report-failed'));
      }
    } catch (e) {
      emit(FarmingBatchState.createDeathReportFailure(e.toString()));
    }
  }
}
