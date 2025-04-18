part of 'farming_batch_cubit.dart';

@freezed
class FarmingBatchState with _$FarmingBatchState {
  const factory FarmingBatchState.initial() = _Initial;
  const factory FarmingBatchState.getFarmingBatchByCageInProgress() =
      _GetFarmingBatchByCageInProgress;
  const factory FarmingBatchState.getFarmingBatchByCageSuccess(
      FarmingBatchDto farmingBatch) = _GetFarmingBatchByCageSuccess;
  const factory FarmingBatchState.getFarmingBatchByCageFailure(String message) =
      _GetFarmingBatchByCageFailure;

  const factory FarmingBatchState.createDeathReportInProgress() =
      _CreateDeathReportInProgress;
  const factory FarmingBatchState.createDeathReportSuccess() =
      _CreateDeathReportSuccess;
  const factory FarmingBatchState.createDeathReportFailure(String message) =
      _CreateDeathReportFailure;
}
