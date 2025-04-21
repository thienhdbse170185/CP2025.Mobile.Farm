import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/sale_type/sale_type_dto.dart';

part 'sale_type_by_name_response.freezed.dart';
part 'sale_type_by_name_response.g.dart';

@freezed
class SaleTypeByNameResponse with _$SaleTypeByNameResponse {
  const factory SaleTypeByNameResponse({
    required bool success,
    required SaleTypeByNameResult result,
  }) = _SaleTypeByNameResponse;

  factory SaleTypeByNameResponse.fromJson(Map<String, dynamic> json) =>
      _$SaleTypeByNameResponseFromJson(json);
}

@freezed
class SaleTypeByNameResult with _$SaleTypeByNameResult {
  const factory SaleTypeByNameResult({
    required List<SaleTypeDto> items,
    required int totalItems,
    required int totalPages,
    required int currentPage,
    required int pageSize,
    required bool hasNextPage,
    required bool hasPreviousPage,
  }) = _SaleTypeByNameResult;

  factory SaleTypeByNameResult.fromJson(Map<String, dynamic> json) =>
      _$SaleTypeByNameResultFromJson(json);
}
