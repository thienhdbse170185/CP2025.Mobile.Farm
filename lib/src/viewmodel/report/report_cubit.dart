import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_farm/src/model/repository/report/report_repository.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  final ReportRepository reportRepository;
  ReportCubit({required this.reportRepository}) : super(ReportInitial());
}
