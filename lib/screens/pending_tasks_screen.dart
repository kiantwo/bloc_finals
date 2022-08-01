import 'package:bloc_finals_exam/cubit/task_cubit.dart';
import 'package:bloc_finals_exam/cubit/task_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  return Text(
                    '${state.tasks.length} Pending | ${state.tasks.length} Completed',
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          TasksList(tasksList: TestData.pendingTasks),
        ],
      ),
    );
  }
}
