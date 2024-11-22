import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
import 'package:meta/meta.dart';

part 'warehouse_state.dart';

class WarehouseCubit extends Cubit<WarehouseState> {
  final WarehouseRepository warehouseRepository;
  WarehouseCubit({required this.warehouseRepository})
      : super(WarehouseInitial());
}
