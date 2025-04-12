import 'package:bloc/bloc.dart';
import 'package:data_layer/model/dto/farming_batch/farming_batch_dto.dart';
import 'package:data_layer/repository/farming_batch/farming_batch_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
}
