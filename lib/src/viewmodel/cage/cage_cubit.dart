import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
import 'package:data_layer/model/entity/cage/cage.dart';
import 'package:data_layer/model/response/cage/get_all/get_all_cage_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:smart_farm/src/core/constants/user_data_constant.dart';

part 'cage_cubit.freezed.dart';
part 'cage_state.dart';

class CageCubit extends Cubit<CageState> {
  final CageRepository cageRepository;
  CageCubit({required this.cageRepository}) : super(const CageState.initial());

  Future<void> getAllCages() async {
    emit(const CageState.loading());
    try {
      final cages = await cageRepository.getAllCages();
      emit(CageState.loadAllSuccess(cages));
    } catch (e) {
      emit(CageState.failure(e.toString()));
    }
  }

  Future<void> getCageById(String id) async {
    emit(const CageState.loadByIdInProgress());
    try {
      final cage = await cageRepository.getCageById(id);
      emit(CageState.loadByIdSuccess(cage));
    } catch (e) {
      emit(CageState.loadByIdFailure(e.toString()));
    }
  }

  Future<void> getCagesByUserId() async {
    emit(const CageState.loadByUserIdInProgress());
    try {
      final userBox = await Hive.openBox(UserDataConstant.userBoxName);
      final userId = userBox.get(UserDataConstant.userIdKey);
      final cages = await cageRepository.getCagesByUserId(userId);
      emit(CageState.loadByUserIdSuccess(cages));
    } catch (e) {
      emit(CageState.loadByUserIdFailure(e.toString()));
    }
  }
}
