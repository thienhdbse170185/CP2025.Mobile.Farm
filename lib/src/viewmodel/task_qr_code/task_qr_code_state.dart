part of 'task_qr_code_cubit.dart';

@freezed
class TaskQrCodeState with _$TaskQrCodeState {
  const factory TaskQrCodeState.initial() = _Initial;

  const factory TaskQrCodeState.createFoodLogInProgress() =
      _CreateFoodLogInProgress;
  const factory TaskQrCodeState.createFoodLogSuccess() = _CreateFoodLogSuccess;
  const factory TaskQrCodeState.createFoodLogFailure() = _CreateFoodLogFailure;

  const factory TaskQrCodeState.createHealthLogInProgress() =
      _CreateHealthLogInProgress;
  const factory TaskQrCodeState.createHealthLogSuccess() =
      _CreateHealthLogSuccess;
  const factory TaskQrCodeState.createHealthLogFailure() =
      _CreateHealthLogFailure;

  const factory TaskQrCodeState.createVaccineLogInProgress() =
      _CreateVaccineLogInProgress;
  const factory TaskQrCodeState.createVaccineLogSuccess() =
      _CreateVaccineLogSuccess;
  const factory TaskQrCodeState.createVaccineLogFailure() =
      _CreateVaccineLogFailure;

  const factory TaskQrCodeState.createSellAnimalLogInProgress() =
      _CreateSellAnimalLogInProgress;
  const factory TaskQrCodeState.createSellAnimalLogSuccess() =
      _CreateSellAnimalLogSuccess;
  const factory TaskQrCodeState.createSellAnimalLogFailure() =
      _CreateSellAnimalLogFailure;

  const factory TaskQrCodeState.createWeighingLogInProgress() =
      _CreateWeighingLogInProgress;
  const factory TaskQrCodeState.createWeighingLogSuccess() =
      _CreateWeighingLogSuccess;
  const factory TaskQrCodeState.createWeighingLogFailure() =
      _CreateWeighingLogFailure;

  const factory TaskQrCodeState.createEggHarvestLogInProgress() =
      _CreateEggHarvestLogInProgress;
  const factory TaskQrCodeState.createEggHarvestLogSuccess() =
      _CreateEggHarvestLogSuccess;
  const factory TaskQrCodeState.createEggHarvestLogFailure() =
      _CreateEggHarvestLogFailure;

  const factory TaskQrCodeState.createSellEggLogInProgress() =
      _CreateSellEggLogInProgress;
  const factory TaskQrCodeState.createSellEggLogSuccess() =
      _CreateSellEggLogSuccess;
  const factory TaskQrCodeState.createSellEggLogFailure() =
      _CreateSellEggLogFailure;
}
