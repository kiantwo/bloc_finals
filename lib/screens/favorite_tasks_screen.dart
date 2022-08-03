import 'package:bloc_finals_exam/cubit/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/task_state.dart';
import '../models/task.dart';
import '../test_data.dart';
import '../widgets/tasks_list.dart';

class FavoriteTasksScreen extends StatelessWidget {
  const FavoriteTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<Task> tasksList = TestData.favoriteTasks;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
              label: BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  final favoriteTasks = state.tasks!
                      .where((element) => (element.isFavorite == true &&
                          element.isDeleted == false))
                      .toList();
                  return Text('${favoriteTasks.length} Tasks');
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              final tasks = state.tasks!
                  .where((element) => (element.isFavorite == true &&
                      element.isDeleted == false))
                  .toList();
              return TasksList(tasksList: tasks);
            },
          ),
        ],
      ),
    );
  }
}
