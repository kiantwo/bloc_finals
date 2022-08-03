import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/task_cubit.dart';
import '../cubit/task_state.dart';
import '../models/task.dart';
import '../test_data.dart';
import '../widgets/tasks_list.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Task> tasksList = TestData.completedTasks;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
              label: BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  final completeTasks = state.tasks!
                      .where((element) => (element.isDone == true &&
                          element.isDeleted == false))
                      .toList();
                  return Text('${completeTasks.length} Tasks');
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              final completeTasks = state.tasks!
                  .where((element) =>
                      (element.isDone == true && element.isDeleted == false))
                  .toList();
              return TasksList(tasksList: completeTasks);
            },
          ),
        ],
      ),
    );
  }
}
