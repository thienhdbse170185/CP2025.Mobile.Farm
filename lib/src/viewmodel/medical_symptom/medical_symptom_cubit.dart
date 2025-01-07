import 'package:bloc/bloc.dart';
import 'package:data_layer/model/dto/medical_symptom/medical_symptom.dart';
import 'package:data_layer/repository/medical_symptom/medical_symptom_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_farm/src/core/constants/user_data_constant.dart';

part 'medical_symptom_cubit.freezed.dart';
part 'medical_symptom_state.dart';

class MedicalSymptomCubit extends Cubit<MedicalSymptomState> {
  final MedicalSymptomRepository repository;
  MedicalSymptomCubit({required this.repository})
      : super(const MedicalSymptomState.initial());

  Future<void> getMedicalSymptomsByBatch(String? farmingBatchId) async {
    emit(const MedicalSymptomState.getMedicalSymptomsByBatchInProress());
    try {
      final box = await Hive.openBox(UserDataConstant.userBoxName);
      final userId = box.get(UserDataConstant.userIdKey);
      final medicalSymptoms =
          await repository.getSymptomsByBatch(userId, farmingBatchId);
      emit(MedicalSymptomState.getMedicalSymptomsByBatchSuccess(
          medicalSymptoms));
    } catch (e) {
      emit(MedicalSymptomState.getMedicalSymptomsByBatchFailure(e.toString()));
    }
  }
}
