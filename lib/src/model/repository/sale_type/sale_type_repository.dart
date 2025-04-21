import 'package:smart_farm/src/model/repository/sale_type/sale_type_api_client.dart';
import 'package:smart_farm/src/model/response/sale_type/sale_type_by_name_response.dart';

class SaleTypeRepository {
  final SaleTypeApiClient _saleTypeApiClient;
  const SaleTypeRepository({required SaleTypeApiClient saleTypeApiClient})
      : _saleTypeApiClient = saleTypeApiClient;

  Future<SaleTypeByNameResponse> getByName(
      {required String saleTypeName}) async {
    try {
      return await _saleTypeApiClient.getByName(saleTypeName: saleTypeName);
    } catch (e) {
      rethrow;
    }
  }
}
