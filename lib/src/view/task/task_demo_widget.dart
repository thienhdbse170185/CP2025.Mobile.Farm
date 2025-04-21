import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_farm/src/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:smart_farm/src/model/entity/task/tash_type/task_type.dart';
import 'package:smart_farm/src/model/task/cage_filter.dart';
import 'package:smart_farm/src/view/search_delegate.dart';
import 'package:smart_farm/src/viewmodel/task/task_bloc.dart';

class TaskDemoWidget extends StatefulWidget {
  const TaskDemoWidget({super.key});

  @override
  State<TaskDemoWidget> createState() => _TaskDemoWidgetState();
}

class _TaskDemoWidgetState extends State<TaskDemoWidget> {
  @override
  void initState() {
    super.initState();
    context
        .read<TaskBloc>()
        .add(TaskEvent.getTasks('', '', '', '', DateTime.now(), null, 1, 20));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with search bar and avatar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.73,
                  child: GestureDetector(
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: SearchDelegateWidget(),
                      );
                    },
                    child: AbsorbPointer(
                      child: SearchBar(
                        hintText: 'Tìm kiếm công việc',
                        leading: Icon(Icons.search),
                        trailing: [Icon(Icons.mic)],
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                        elevation: WidgetStateProperty.all(0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Column(
                    children: [
                      Icon(Icons.calendar_month),
                      Text(
                        'Hôm nay',
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 24.0),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return state.maybeWhen(
                  getTasksInProgress: () {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  getTasksSuccess: (tasks, cageList, taskTypeList) =>
                      _buildBody(
                    tasks: tasks,
                    cageList: cageList,
                    taskTypeList: taskTypeList,
                  ),
                  getTasksFailure: (error) {
                    return Center(
                      child: Text(error),
                    );
                  },
                  orElse: () {
                    return Container(); // or any default widget
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody({
    required Map<String, List<TaskHaveCageName>> tasks,
    required List<CageFilter> cageList,
    required List<TaskType> taskTypeList,
  }) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read().add(
            TaskEvent.getTasks('', '', '', '', DateTime.now(), null, 1, 20));
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Buổi sáng',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(width: 16.0),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '2 công việc',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
