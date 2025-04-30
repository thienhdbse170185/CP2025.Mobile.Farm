import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_log_detail_dto.freezed.dart';
part 'sale_log_detail_dto.g.dart';

@freezed
class SaleLogDetailDto with _$SaleLogDetailDto {
  factory SaleLogDetailDto({
    required String growthStageId,
    required String growthStageName,
    required String saleDate,
    required int unitPrice,
    required int quantity,
    required double weight,
    required int total,
    required String staffId,
    required String staffName,
    required String saleTypeId,
    required String saleTypeName,
    required String logTime,
    required String note,
  }) = _SaleLogDetailDto;

  factory SaleLogDetailDto.fromJson(Map<String, dynamic> json) =>
      _$SaleLogDetailDtoFromJson(json);
}
