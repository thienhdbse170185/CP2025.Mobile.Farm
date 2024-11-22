import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'farming_cycle_state.dart';

class FarmingCycleCubit extends Cubit<FarmingCycleState> {
  FarmingCycleCubit() : super(FarmingCycleInitial());
}
