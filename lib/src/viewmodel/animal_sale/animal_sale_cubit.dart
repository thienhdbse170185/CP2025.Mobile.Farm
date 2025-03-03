import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
import 'package:data_layer/model/request/animal_sale/animal_sale_request.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:smart_farm/src/core/constants/user_data_constant.dart';

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
    required String saleTypeId,
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
}
