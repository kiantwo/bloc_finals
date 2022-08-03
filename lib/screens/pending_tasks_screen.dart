import 'package:bloc_finals_exam/cubit/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/task_state.dart';
import '../models/task.dart';
import '../test_data.dart';
import '../widgets/tasks_list.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
              label: BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  final pendingTasks = state.tasks!
                      .where((element) => (element.isDone == false &&
                          element.isDeleted == false))
                      .toList();
                  final completedTasks = state.tasks!
                      .where((element) => (element.isDone == true &&
                          element.isDeleted == false))
                      .toList();
                  return Text(
                    '${pendingTasks.length} Pending | ${completedTasks.length} Completed',
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              final pendingTasks = state.tasks!
                  .where((element) =>
                      (element.isDone == false && element.isDeleted == false))
                  .toList();
              return TasksList(tasksList: pendingTasks);
            },
          ),
        ],
      ),
    );
  }
}
