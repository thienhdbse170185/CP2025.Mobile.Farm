import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/cage_admin/cage_admin_dto.dart';

part 'get_all_cage_response.freezed.dart';
part 'get_all_cage_response.g.dart';

@freezed
class GetAllCageResponse with _$GetAllCageResponse {
  const factory GetAllCageResponse({required List<CageAdminDto> items}) =
      _GetAllCageResponse;

  factory GetAllCageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCageResponseFromJson(json);
}
