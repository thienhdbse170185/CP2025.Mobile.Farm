import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
import 'package:data_layer/model/request/prescription/update_status_prescription_request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prescription_cubit.freezed.dart';
part 'prescription_state.dart';

class PrescriptionCubit extends Cubit<PrescriptionState> {
  final PrescriptionRepository prescriptionRepository;
  PrescriptionCubit({required this.prescriptionRepository})
      : super(PrescriptionState.initial());

  Future<void> getPrescription(String prescriptionId) async {
    emit(PrescriptionState.getPrescriptionLoading());
    try {
      final prescription =
          await prescriptionRepository.getPrescriptionById(prescriptionId);
      emit(PrescriptionState.getPrescriptionSuccess(prescription));
    } catch (e) {
      emit(PrescriptionState.getPrescriptionFailure(e.toString()));
    }
  }

  Future<void> updatePrescriptionStatus(
      {required String prescriptionId,
      required UpdateStatusPrescriptionRequest request}) async {
    emit(PrescriptionState.updatePrescriptionStatusInProgress());
    try {
      await prescriptionRepository.updatePrescriptionStatus(
          prescriptionId: prescriptionId, request: request);
      emit(PrescriptionState.updatePrescriptionStatusSuccess());
    } catch (e) {
      emit(PrescriptionState.updatePrescriptionStatusFailure(e.toString()));
    }
  }

  Future<void> checkPrescriptionLastSession(
      {required String prescriptionId}) async {
    emit(PrescriptionState.checkPrescriptionLastSessionInProgress());
    try {
      final isLastSession = await prescriptionRepository
          .checkPrescriptionLastSession(prescriptionId: prescriptionId);
      emit(
        PrescriptionState.checkPrescriptionLastSessionSuccess(
            isLastSession: isLastSession),
      );
    } catch (e) {
      emit(PrescriptionState.checkPrescriptionLastSessionFailure(e.toString()));
    }
  }

  Future<void> updateQuantityAnimalAfterTreatment({
    required String prescriptionId,
    required UpdateStatusPrescriptionRequest request,
  }) async {
    emit(PrescriptionState.updateQuantityAnimalAfterTreatmentInProgress());
    try {
      await prescriptionRepository.updatePrescriptionStatus(
        prescriptionId: prescriptionId,
        request: request,
      );
      emit(PrescriptionState.updateQuantityAnimalAfterTreatmentSuccess());
    } catch (e) {
      emit(PrescriptionState.updateQuantityAnimalAfterTreatmentFailure(
          e.toString()));
    }
  }
}
