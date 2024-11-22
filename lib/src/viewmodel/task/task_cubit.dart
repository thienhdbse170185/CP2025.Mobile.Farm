import 'package:bloc/bloc.dart';
import 'package:data_layer/data_layer.dart';
import 'package:meta/meta.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository taskRepository;
  TaskCubit({required this.taskRepository}) : super(TaskInitial());
}
