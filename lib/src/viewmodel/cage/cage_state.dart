part of 'cage_cubit.dart';

@freezed
class CageState with _$CageState {
  const factory CageState.initial() = _Initial;
  const factory CageState.loading() = _Loading;
  const factory CageState.loadAllInProgress() = _LoadAllInProgress;
  const factory CageState.loadByIdInProgress() = _LoadByIdInProgress;
  const factory CageState.loadAllSuccess(GetAllCageResponse response) =
      _LoadAllSuccess;
  const factory CageState.loadByIdSuccess(Cage cage) = _LoadByIdSuccess;
  const factory CageState.failure(String error) = _Failure;
  const factory CageState.loadAllFailure(String error) = _LoadAllFailure;
  const factory CageState.loadByIdFailure(String error) = _LoadByIdFailure;
  const factory CageState.loadByUserIdInProgress() = _LoadByUserIdInProgress;
  const factory CageState.loadByUserIdSuccess(List<Cage> response) =
      _LoadByUserIdSuccess;
  const factory CageState.loadByUserIdFailure(String error) =
      _LoadByUserIdFailure;
}
