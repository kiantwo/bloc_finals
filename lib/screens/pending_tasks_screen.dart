import 'package:bloc_finals_exam/bloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/task_state.dart';
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
              label: BlocBuilder<TaskBloc, TaskState>(
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
          BlocBuilder<TaskBloc, TaskState>(
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
