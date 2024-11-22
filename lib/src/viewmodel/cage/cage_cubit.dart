import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cage_state.dart';

class CageCubit extends Cubit<CageState> {
  CageCubit() : super(CageInitial());
}
