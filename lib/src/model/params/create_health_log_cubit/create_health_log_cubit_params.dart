import 'package:data_layer/data_layer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_health_log_cubit_params.freezed.dart';
part 'create_health_log_cubit_params.g.dart';

@freezed
class CreateHealthLogCubitParams with _$CreateHealthLogCubitParams {
  factory CreateHealthLogCubitParams({
    required String prescriptionId,
    required HealthLogDto log,
    required bool afterSymptomReport,
  }) = _CreateHealthLogCubitParams;

  factory CreateHealthLogCubitParams.fromJson(Map<String, dynamic> json) =>
      _$CreateHealthLogCubitParamsFromJson(json);
}
