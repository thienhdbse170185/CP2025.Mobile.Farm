import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'warehouse_state.dart';

class WarehouseCubit extends Cubit<WarehouseState> {
  WarehouseCubit() : super(WarehouseInitial());
}
