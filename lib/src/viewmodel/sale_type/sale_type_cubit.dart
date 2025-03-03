import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_type_cubit.freezed.dart';
part 'sale_type_state.dart';

class SaleTypeCubit extends Cubit<SaleTypeState> {
  final SaleTypeRepository repository;
  SaleTypeCubit({required this.repository}) : super(SaleTypeState.initial());

  Future<void> getSaleTypeByName({required String saleTypeName}) async {
    emit(SaleTypeState.getByNameInProgress());
    try {
      log('[SALE_TYPE_CUBIT] Chuẩn bị lấy thông tin loại bán hàng');
      final result = await repository.getByName(saleTypeName: saleTypeName);
      List<SaleTypeDto> saleTypes = result.result.items;
      if (saleTypes.isEmpty) {
        log('[SALE_TYPE_CUBIT] Lấy thông tin loại bán hàng thất bại!');
        emit(SaleTypeState.getByNameFailure('no-sale-type-found'));
        return;
      }
      log('[SALE_TYPE_CUBIT] Lấy thông tin loại bán hàng thành công!');
      log('[SALE_TYPE_CUBIT] ${saleTypes.length} loại bán hàng được tìm thấy');
      for (var element in saleTypes) {
        log('[SALE_TYPE_CUBIT] ${element.toJson()}');
      }
      emit(SaleTypeState.getByNameSuccess(saleTypes: saleTypes));
    } catch (e) {
      emit(SaleTypeState.getByNameFailure(e.toString()));
    }
  }
}
