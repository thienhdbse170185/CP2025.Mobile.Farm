import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/sale_type/sale_type_dto.dart';
import 'package:smart_farm/src/model/repository/sale_type/sale_type_repository.dart';

part 'sale_type_cubit.freezed.dart';
part 'sale_type_state.dart';

class SaleTypeCubit extends Cubit<SaleTypeState> {
  final SaleTypeRepository repository;
  SaleTypeCubit({required this.repository}) : super(SaleTypeState.initial());

  Future<void> getSaleTypeByName({required String saleTypeName}) async {
    emit(SaleTypeState.getByNameInProgress());
    try {
      log('[SALE_TYPE_CUBIT] Chuẩn bị lấy thông tin sale_type');
      final result = await repository.getByName(saleTypeName: saleTypeName);
      List<SaleTypeDto> saleTypes = result.result.items;
      if (saleTypes.isEmpty) {
        log('[SALE_TYPE_CUBIT] Lấy thông tin sale_type thất bại!');
        emit(SaleTypeState.getByNameFailure('no-sale-type-found'));
        return;
      }
      log('[SALE_TYPE_CUBIT] Lấy thông tin sale_type thành công!');
      log('[SALE_TYPE_CUBIT] ${saleTypes.length} sale_type được tìm thấy');
      for (var element in saleTypes) {
        log('[SALE_TYPE_CUBIT] ${element.toJson()}');
      }
      emit(SaleTypeState.getByNameSuccess(saleTypes: saleTypes));
    } catch (e) {
      emit(SaleTypeState.getByNameFailure(e.toString()));
    }
  }
}
