part of 'growth_stage_cubit.dart';

@freezed
class GrowthStageState with _$GrowthStageState {
  const factory GrowthStageState.initial() = _Initial;

  const factory GrowthStageState.getGrowthStageByCageIdInProgress() =
      _GetGrowthStageByCageIdInProgress;
  const factory GrowthStageState.getGrowthStageByCageIdSuccess(
      GrowthStageDto growthStage) = _GetGrowthStageByCadeIdSuccess;
  const factory GrowthStageState.getGrowthStageByCageIdFailure(String error) =
      _GetGrowthStageByCageIdFailure;

  const factory GrowthStageState.getRecommendedWeightByCageIdInProgress() =
      _GetRecommendedWeightByCageIdInProgress;
  const factory GrowthStageState.getRecommendedWeightByCageIdSuccess(
      double recommendedWeight) = _GetRecommendedWeightByCageIdSuccess;
  const factory GrowthStageState.getRecommendedWeightByCageIdFailure(
      String error) = _GetRecommendedWeightByCageIdFailure;
}
