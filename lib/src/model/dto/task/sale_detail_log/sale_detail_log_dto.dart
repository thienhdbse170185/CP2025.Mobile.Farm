import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_detail_log_dto.freezed.dart';
part 'sale_detail_log_dto.g.dart';

@freezed
class SaleDetailLogDto with _$SaleDetailLogDto {
  factory SaleDetailLogDto({
    required String saleDate,
    required int quantity,
    required int unitPrice,
    required int total,
  }) = _SaleDetailLogDto;

  factory SaleDetailLogDto.fromJson(Map<String, dynamic> json) =>
      _$SaleDetailLogDtoFromJson(json);
}
