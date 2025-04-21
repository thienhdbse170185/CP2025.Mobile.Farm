import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/dto/task/health_log/health_log_dto.dart';

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
