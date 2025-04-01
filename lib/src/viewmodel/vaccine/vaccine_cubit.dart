import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vaccine_cubit.freezed.dart';
part 'vaccine_state.dart';

class VaccineCubit extends Cubit<VaccineState> {
  final VaccineRepository _vaccineRepository;
  VaccineCubit({required VaccineRepository vaccineRepository})
      : _vaccineRepository = vaccineRepository,
        super(const VaccineState.initial());

  Future<void> getVaccineById({required String id}) async {
    emit(const VaccineState.getVaccineByIdInProgress());
    try {
      final response = await _vaccineRepository.getVaccineById(id: id);
      emit(VaccineState.getVaccineByIdSuccess(response));
    } catch (e) {
      emit(VaccineState.getVaccineByIdFailure(e.toString()));
    }
  }
}
