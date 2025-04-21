import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:smart_farm/src/core/constants/user_data_constant.dart';
import 'package:smart_farm/src/core/utils/time_util.dart';
import 'package:smart_farm/src/model/dto/sale_log_detail/sale_log_detail_dto.dart';
import 'package:smart_farm/src/model/dto/task/sale_detail_log/sale_detail_log_dto.dart';
import 'package:smart_farm/src/model/dto/task/sale_log/sale_log_dto.dart';
import 'package:smart_farm/src/model/repository/animal_sale/animal_sale_repository.dart';
import 'package:smart_farm/src/model/request/animal_sale/animal_sale_request.dart';

part 'animal_sale_cubit.freezed.dart';
part 'animal_sale_state.dart';

class AnimalSaleCubit extends Cubit<AnimalSaleState> {
  final AnimalSaleRepository repository;
  AnimalSaleCubit({required this.repository})
      : super(AnimalSaleState.initial());

  Future<void> createAnimalSale({
    required String growthStageId,
    required String saleDate,
    required int unitPrice,
    required int quantity,
    required double weight,
    required String saleTypeId,
    required String taskId,
  }) async {
    emit(AnimalSaleState.createAnimalSaleInProgress());
    try {
      log('[ANIMAL_SALE_CUBIT] Chuẩn bị tạo thông tin bán gia cầm');
      final userBox = await Hive.openBox(UserDataConstant.userBoxName);
      final userId = userBox.get(UserDataConstant.userIdKey);
      final request = AnimalSaleRequest(
        growthStageId: growthStageId,
        saleDate: saleDate,
        unitPrice: unitPrice,
        quantity: quantity,
        staffId: userId,
        saleTypeId: saleTypeId,
        taskId: taskId,
        weight: weight,
      );
      final result = await repository.create(request);
      if (result) {
        log('[ANIMAL_SALE_CUBIT] Tạo thông tin bán gia cầm thành công!');
        emit(AnimalSaleState.createAnimalSaleSuccess());
      } else {
        log('[ANIMAL_SALE_CUBIT] Tạo thông tin bán gia cầm thất bại!');
        emit(AnimalSaleState.createAnimalSaleFailure("create-failed"));
      }
    } catch (e) {
      emit(AnimalSaleState.createAnimalSaleFailure(e.toString()));
    }
  }

  Future<void> getSaleLogByGrowthStageId({
    required String growthStageId,
    required String saleType,
    required DateTime taskDate, // Ngày của công việc
    required int taskSession, // Buổi của công việc
  }) async {
    emit(AnimalSaleState.getSaleLogByGrowthStageIdInProgress());
    try {
      log('[ANIMAL_SALE_CUBIT] Chuẩn bị lấy thông tin bán gia cầm theo ID giai đoạn phát triển');
      List<SaleLogDto> result = await repository.getSaleLogByGrowthStageId(
        growthStageId: growthStageId,
      );
      log('[ANIMAL_SALE_CUBIT] Lấy thông tin bán gia cầm thành công!');
      SaleLogDto saleLog = result.firstWhere((log) => log.saleType == saleType);

      // Tìm SaleDetailLogDto thuộc buổi và ngày của công việc
      SaleDetailLogDto? matchingDetailLog;

      try {
        matchingDetailLog = saleLog.logs.firstWhere(
          (log) {
            final DateTime saleDate = DateTime.parse(log.saleDate);

            // Kiểm tra xem là cùng ngày không
            final bool isSameDay = saleDate.year == taskDate.year &&
                saleDate.month == taskDate.month &&
                saleDate.day == taskDate.day;

            // Lấy buổi của thời gian sale
            final int saleSession = TimeUtils.getSessionFromTime(saleDate);

            // Kiểm tra xem có thuộc cùng buổi không
            return isSameDay && (saleSession == taskSession);
          },
        );
      } catch (e) {
        // Không tìm thấy log nào thỏa mãn điều kiện
        matchingDetailLog = null;
      }

      // Emit state thành công với log tìm thấy hoặc null
      emit(AnimalSaleState.getSaleLogByGrowthStageIdSuccess(matchingDetailLog));
    } catch (e) {
      emit(AnimalSaleState.getSaleLogByGrowthStageIdFailure(e.toString()));
    }
  }

  Future<void> getSaleLogByTaskId({required String taskId}) async {
    emit(AnimalSaleState.getSaleLogByTaskIdInProgress());
    try {
      log('[ANIMAL_SALE_CUBIT] Chuẩn bị lấy thông tin bán gia cầm theo ID công việc');
      SaleLogDetailDto result =
          await repository.getSaleLogByTaskId(taskId: taskId);
      log('[ANIMAL_SALE_CUBIT] Lấy thông tin bán gia cầm thành công!');
      emit(AnimalSaleState.getSaleLogByTaskIdSuccess(result));
    } catch (e) {
      emit(AnimalSaleState.getSaleLogByTaskIdFailure(e.toString()));
    }
  }
}
