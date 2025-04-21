import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/task/sale_detail_log/sale_detail_log_dto.dart';

part 'sale_log_dto.freezed.dart';
part 'sale_log_dto.g.dart';

@freezed
class SaleLogDto with _$SaleLogDto {
  factory SaleLogDto({
    required String saleType,
    required int totalQuantity,
    required int totalRevenue,
    required int unitPriceAverage,
    required List<SaleDetailLogDto> logs,
  }) = _SaleLogDto;

  factory SaleLogDto.fromJson(Map<String, dynamic> json) =>
      _$SaleLogDtoFromJson(json);
}
