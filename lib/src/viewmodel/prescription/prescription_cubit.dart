import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
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
      final prescription = await prescriptionRepository.getPrescriptionById(prescriptionId);
      emit(PrescriptionState.getPrescriptionSuccess(prescription));
    } catch (e) {
      emit(PrescriptionState.getPrescriptionFailure(e.toString()));
    }
  }
}
