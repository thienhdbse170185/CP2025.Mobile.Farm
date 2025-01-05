import 'package:bloc/bloc.dart';
import 'package:data_layer/model/dto/farming_batch/farming_batch_dto.dart';
import 'package:data_layer/repository/farming_batch/farming_batch_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'farming_batch_cubit.freezed.dart';
part 'farming_batch_state.dart';

class FarmingBatchCubit extends Cubit<FarmingBatchState> {
  final FarmingBatchRepository repository;
  FarmingBatchCubit({required this.repository})
      : super(FarmingBatchState.initial());

  Future<void> getFarmingBatchByCage(String cageId) async {
    emit(FarmingBatchState.getFarmingBatchByCageInProgress());
    try {
      final farmingBatch = await repository.getFarmingBatchByCage(cageId);
      emit(FarmingBatchState.getFarmingBatchByCageSuccess(farmingBatch));
    } catch (e) {
      emit(FarmingBatchState.getFarmingBatchByCageFailure(e.toString()));
    }
  }
}
