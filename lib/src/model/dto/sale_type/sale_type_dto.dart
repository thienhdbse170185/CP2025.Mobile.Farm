import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_type_dto.freezed.dart';
part 'sale_type_dto.g.dart';

@freezed
class SaleTypeDto with _$SaleTypeDto {
  const factory SaleTypeDto({
    required String id,
    required String stageTypeName,
    required String description,
  }) = _SaleTypeDto;

  factory SaleTypeDto.fromJson(Map<String, dynamic> json) =>
      _$SaleTypeDtoFromJson(json);
}
