import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:data_layer/model/dto/growth_stage/growth_stage_dto.dart';
import 'package:data_layer/model/request/growth_stage/update_weight/update_weight_request.dart';
import 'package:data_layer/repository/growth_stage/growth_stage_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'growth_stage_cubit.freezed.dart';
part 'growth_stage_state.dart';

class GrowthStageCubit extends Cubit<GrowthStageState> {
  final GrowthStageRepository growthStageRepository;
  GrowthStageCubit({required this.growthStageRepository})
      : super(const GrowthStageState.initial());

  Future<void> getGrowthStageByCageId(String cageId) async {
    emit(const GrowthStageState.getGrowthStageByCageIdInProgress());
    try {
      final growthStage =
          await growthStageRepository.getGrowthStageByCageId(cageId);
      log('[GROWTH_STAGE_CUBIT] Lấy thông tin growthStage thành công!}');
      log('Response: : ${growthStage.toJson()}');
      emit(GrowthStageState.getGrowthStageByCageIdSuccess(growthStage));
    } catch (e) {
      emit(GrowthStageState.getGrowthStageByCageIdFailure(e.toString()));
    }
  }

  Future<void> getRecommendedWeightByCageId(String cageId) async {
    emit(const GrowthStageState.getRecommendedWeightByCageIdInProgress());
    try {
      final growthStage =
          await growthStageRepository.getGrowthStageByCageId(cageId);
      double recommendedWeight =
          growthStage.recommendedWeightPerSession * (growthStage.quantity ?? 0);
      List<int> weightList = [
        (recommendedWeight - 10).toInt(),
        (recommendedWeight - 5).toInt(),
        recommendedWeight.toInt(),
        (recommendedWeight + 5).toInt(),
        (recommendedWeight + 10).toInt()
      ];

      emit(GrowthStageState.getRecommendedWeightByCageIdSuccess(
          recommendedWeight, weightList));
    } catch (e) {
      emit(GrowthStageState.getRecommendedWeightByCageIdFailure(e.toString()));
    }
  }

  Future<bool> updateWeight({required UpdateWeightRequest request}) async {
    emit(const GrowthStageState.updateWeightInProgress());
    try {
      log('[GROWTH_STAGE_CUBIT] Chuẩn bị cập nhật cân nặng cho growthStageId: ${request.growthStageId}');
      log('Request: ${request.toJson()}');
      final result = await growthStageRepository.updateWeight(request: request);
      emit(GrowthStageState.updateWeightSuccess(result));
      return result;
    } catch (e) {
      emit(GrowthStageState.updateWeightFailure(e.toString()));
      return false;
    }
  }
}
