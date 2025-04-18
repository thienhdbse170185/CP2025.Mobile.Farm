import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_sale_log_cubit_params.freezed.dart';
part 'create_sale_log_cubit_params.g.dart';

@freezed
class CreateSaleLogCubitParams with _$CreateSaleLogCubitParams {
  factory CreateSaleLogCubitParams({
    required String growthStageId,
    required String saleDate,
    required int unitPrice,
    required int quantity,
    required double weight,
    required String saleTypeId,
    required String taskId,
  }) = _CreateSaleLogCubitParams;

  factory CreateSaleLogCubitParams.fromJson(Map<String, dynamic> json) =>
      _$CreateSaleLogCubitParamsFromJson(json);
}
