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
}
