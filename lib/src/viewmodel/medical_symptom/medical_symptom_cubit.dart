import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_farm/src/core/constants/user_data_constant.dart';

part 'medical_symptom_cubit.freezed.dart';
part 'medical_symptom_state.dart';

class MedicalSymptomCubit extends Cubit<MedicalSymptomState> {
  final MedicalSymptomRepository repository;
  final FarmingBatchRepository farmingBatchRepository;
  MedicalSymptomCubit(
      {required this.repository, required this.farmingBatchRepository})
      : super(const MedicalSymptomState.initial());

  Future<void> getMedicalSymptomsByBatch() async {
    emit(const MedicalSymptomState.getMedicalSymptomsByBatchInProress());
    try {
      final box = await Hive.openBox(UserDataConstant.userBoxName);
      final userId = box.get(UserDataConstant.userIdKey);
      final farmingBatches =
          await farmingBatchRepository.getFarmingBatchesByUserId(userId);
      List<MedicalSymptomDto> medicalSymptoms = [];

      for (var batch in farmingBatches) {
        final batchSymptoms = await repository.getSymptomsByBatch(
          userId,
          batch.id,
        );
        medicalSymptoms.addAll(batchSymptoms);
      }

      // Sort by createAt in descending order (newest first)
      medicalSymptoms.sort((a, b) => b.createAt.compareTo(a.createAt));

      emit(MedicalSymptomState.getMedicalSymptomsByBatchSuccess(
          medicalSymptoms));
    } catch (e) {
      emit(MedicalSymptomState.getMedicalSymptomsByBatchFailure(e.toString()));
    }
  }
}
