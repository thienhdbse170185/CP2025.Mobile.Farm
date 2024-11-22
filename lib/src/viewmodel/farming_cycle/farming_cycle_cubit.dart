import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
import 'package:meta/meta.dart';

part 'farming_cycle_state.dart';

class FarmingCycleCubit extends Cubit<FarmingCycleState> {
  final FarmingCycleRepository farmingCycleRepository;
  FarmingCycleCubit({required this.farmingCycleRepository})
      : super(FarmingCycleInitial());
}
