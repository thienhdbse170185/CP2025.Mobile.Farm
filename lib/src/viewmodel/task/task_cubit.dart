import 'package:bloc/bloc.dart';
import 'package:data_layer/repository/repository_interface.dart';
import 'package:meta/meta.dart';
import 'package:smart_farm/src/viewmodel/crud_cubit_interface.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState>
    implements ICrudCubit<Map<String, dynamic>> {
  final IRepository repository;
  TaskCubit({required this.repository}) : super(TaskInitial());

  @override
  void fetchItems() async {
    emit(TaskLoading());
    try {
      // final tasks = await repository.getAll();
      final tasks = [];
      await Future.delayed(const Duration(seconds: 2));
      emit(TaskSuccess(tasks));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  @override
  void addItem(Map<String, dynamic> task) async {
    emit(TaskLoading());
    await Future.delayed(const Duration(milliseconds: 100)); // Add this line
    try {
      await repository.insert(task);
      fetchItems();
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  @override
  void updateItem(Map<String, dynamic> task) async {
    emit(TaskLoading());
    await Future.delayed(const Duration(milliseconds: 100)); // Add this line
    try {
      await repository.update(task);
      fetchItems();
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  @override
  void deleteItem(String id) async {
    emit(TaskLoading());
    await Future.delayed(const Duration(milliseconds: 100)); // Add this line
    try {
      await repository.delete(id);
      fetchItems();
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }
}
