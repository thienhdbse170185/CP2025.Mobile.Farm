import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
import 'package:meta/meta.dart';

part 'cage_state.dart';

class CageCubit extends Cubit<CageState> {
  final CageRepository cageRepository;
  CageCubit({required this.cageRepository}) : super(CageInitial());
}
