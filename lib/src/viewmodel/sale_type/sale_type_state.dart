part of 'sale_type_cubit.dart';

@freezed
class SaleTypeState with _$SaleTypeState {
  const factory SaleTypeState.initial() = _Initial;

  const factory SaleTypeState.getByNameInProgress() = _GetByNameInProgress;
  const factory SaleTypeState.getByNameSuccess(
      {required List<SaleTypeDto> saleTypes}) = _GetByNameSuccess;
  const factory SaleTypeState.getByNameFailure(String error) =
      _GetByNameFailure;
}
