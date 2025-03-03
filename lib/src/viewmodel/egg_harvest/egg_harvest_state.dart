part of 'egg_harvest_cubit.dart';

@freezed
class EggHarvestState with _$EggHarvestState {
  const factory EggHarvestState.initial() = _Initial;

  const factory EggHarvestState.createEggHarvestLogInProgress() =
      _CreateEggHarvestLogInProgress;
  const factory EggHarvestState.createEggHarvestLogSuccess() =
      _CreateEggHarvestLogSuccess;
  const factory EggHarvestState.createEggHarvestLogFailure(String error) =
      _CreateEggHarvestLogFailure;

  const factory EggHarvestState.getEggHarvestLogsByTaskIdInProgress() =
      _GetEggHarvestLogsByTaskIdInProgress;
  const factory EggHarvestState.getEggHarvestLogsByTaskIdSuccess(
      EggHarvestDto eggHarvestDto) = _GetEggHarvestLogsByTaskIdSuccess;
  const factory EggHarvestState.getEggHarvestLogsByTaskIdFailure(String error) =
      _GetEggHarvestLogsByTaskIdFailure;
}
