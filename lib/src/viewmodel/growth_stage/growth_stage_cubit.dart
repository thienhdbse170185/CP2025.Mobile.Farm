import 'package:bloc/bloc.dart';
import 'package:data_layer/model/dto/growth_stage/growth_stage_dto.dart';
import 'package:data_layer/repository/growth_stage/growth_stage_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'growth_stage_cubit.freezed.dart';
part 'growth_stage_state.dart';

class GrowthStageCubit extends Cubit<GrowthStageState> {
  final GrowthStageRepository growthStageRepository;
  GrowthStageCubit({required this.growthStageRepository})
      : super(GrowthStageState.initial());

  Future<void> getGrowthStageByCageId(String cageId) async {
    emit(GrowthStageState.getGrowthStageByCageIdInProgress());
    try {
      final growthStage =
          await growthStageRepository.getGrowthStageByCageId(cageId);
      emit(GrowthStageState.getGrowthStageByCageIdSuccess(growthStage));
    } catch (e) {
      emit(GrowthStageState.getGrowthStageByCageIdFailure(e.toString()));
    }
  }

  Future<void> getRecommendedWeightByCageId(String cageId) async {
    emit(GrowthStageState.getRecommendedWeightByCageIdInProgress());
    try {
      final growthStage =
          await growthStageRepository.getGrowthStageByCageId(cageId);
      emit(GrowthStageState.getRecommendedWeightByCageIdSuccess(
          growthStage.recommendedWeightPerSession));
    } catch (e) {
      emit(GrowthStageState.getRecommendedWeightByCageIdFailure(e.toString()));
    }
  }
}
