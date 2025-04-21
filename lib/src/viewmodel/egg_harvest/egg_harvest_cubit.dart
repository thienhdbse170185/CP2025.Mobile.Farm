import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/egg_harvest/egg_harvest_dto.dart';
import 'package:smart_farm/src/model/repository/egg_harvest/egg_harvest_repository.dart';
import 'package:smart_farm/src/model/request/egg_harvest/egg_harvest_request.dart';

part 'egg_harvest_cubit.freezed.dart';
part 'egg_harvest_state.dart';

class EggHarvestCubit extends Cubit<EggHarvestState> {
  final EggHarvestRepository repository;
  EggHarvestCubit({required this.repository})
      : super(EggHarvestState.initial());

  Future<void> createEggHarvest({required EggHarvestRequest request}) async {
    emit(const EggHarvestState.createEggHarvestLogInProgress());
    try {
      final result = await repository.create(request: request);
      if (result) {
        emit(const EggHarvestState.createEggHarvestLogSuccess());
      } else {
        emit(const EggHarvestState.createEggHarvestLogFailure(
            'create-egg-harvest-failure'));
      }
    } catch (e) {
      emit(EggHarvestState.createEggHarvestLogFailure(e.toString()));
    }
  }

  Future<void> getEggHarvestByTaskId({required String taskId}) async {
    emit(const EggHarvestState.getEggHarvestLogsByTaskIdInProgress());
    try {
      final response = await repository.getByTaskId(taskId: taskId);
      final eggHarvest = response.result.first;
      emit(EggHarvestState.getEggHarvestLogsByTaskIdSuccess(eggHarvest));
    } catch (e) {
      emit(EggHarvestState.getEggHarvestLogsByTaskIdFailure(e.toString()));
    }
  }
}
