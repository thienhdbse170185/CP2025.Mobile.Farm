import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_farm/src/model/request/vaccine_schedule_log/vaccine_schedule_log_request.dart';

part 'create_vaccine_log_cubit_params.freezed.dart';
part 'create_vaccine_log_cubit_params.g.dart';

@freezed
class CreateVaccineLogCubitParams with _$CreateVaccineLogCubitParams {
  factory CreateVaccineLogCubitParams({
    required VaccineScheduleLogRequest vaccineScheduleLogRequest,
    required bool afterSymptomReport,
  }) = _CreateVaccineLogCubitParams;

  factory CreateVaccineLogCubitParams.fromJson(Map<String, dynamic> json) =>
      _$CreateVaccineLogCubitParamsFromJson(json);
}
