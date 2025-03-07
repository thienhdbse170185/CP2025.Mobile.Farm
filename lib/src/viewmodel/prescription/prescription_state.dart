part of 'prescription_cubit.dart';

@freezed
class PrescriptionState with _$PrescriptionState {
  const factory PrescriptionState.initial() = _Initial;

  const factory PrescriptionState.getPrescriptionLoading() =
      _GetPrescriptionLoading;
  const factory PrescriptionState.getPrescriptionSuccess(
      PrescriptionDto prescription) = _GetPrescriptionSuccess;
  const factory PrescriptionState.getPrescriptionFailure(String message) =
      _GetPrescriptionFailure;

  const factory PrescriptionState.updatePrescriptionStatusInProgress() =
      _UpdatePrescriptionStatusInProgress;
  const factory PrescriptionState.updatePrescriptionStatusSuccess() =
      _UpdatePrescriptionStatusSuccess;
  const factory PrescriptionState.updatePrescriptionStatusFailure(
      String message) = _UpdatePrescriptionStatusFailure;

  const factory PrescriptionState.checkPrescriptionLastSessionInProgress() =
      _CheckPrescriptionLastSessionInProgress;
  const factory PrescriptionState.checkPrescriptionLastSessionSuccess({
    required bool isLastSession,
  }) = _CheckPrescriptionLastSessionSuccess;
  const factory PrescriptionState.checkPrescriptionLastSessionFailure(
      String message) = _CheckPrescriptionLastSessionFailure;

  const factory PrescriptionState.updateQuantityAnimalAfterTreatmentInProgress() =
      _UpdateQuantityAnimalAfterTreatmentInProgress;
  const factory PrescriptionState.updateQuantityAnimalAfterTreatmentSuccess() =
      _UpdateQuantityAnimalAfterTreatmentSuccess;
  const factory PrescriptionState.updateQuantityAnimalAfterTreatmentFailure(
      String message) = _UpdateQuantityAnimalAfterTreatmentFailure;
}
