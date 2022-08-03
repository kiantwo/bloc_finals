import 'package:bloc_finals_exam/app_themes.dart';
import 'package:bloc_finals_exam/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/task_bloc.dart';
import '../cubit/task_state.dart';
import '../cubit/theme_state.dart';
import '../models/task.dart';
import '../screens/recycle_bin_screen.dart';
import '../screens/tabs_screen.dart';
import '../test_data.dart';

class TasksDrawer extends StatelessWidget {
  const TasksDrawer({Key? key}) : super(key: key);

  _switchToDarkTheme(BuildContext context, bool isDarkTheme) {
    context.read<ThemeCubit>().toggleTheme(isDarkTheme);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.folder_special),
              title: const Text('My Tasks'),
              trailing: BlocBuilder<TaskBloc, TaskState>(
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
                    '${pendingTasks.length} | ${completedTasks.length}',
                  );
                },
              ),
              onTap: () => Navigator.pushReplacementNamed(
                context,
                TabsScreen.path,
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Recycle Bin'),
              trailing: BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  final removedTasks = state.tasks!
                      .where((element) => (element.isDeleted == true))
                      .toList();
                  return Text('${removedTasks.length}');
                },
              ),
              onTap: () => Navigator.pushReplacementNamed(
                context,
                RecycleBinScreen.path,
              ),
            ),
            const Divider(),
            const Expanded(child: SizedBox()),
            BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
              return ListTile(
                leading: Switch(
                  value: state.isDarkTheme!,
                  onChanged: (newValue) =>
                      _switchToDarkTheme(context, newValue),
                ),
                title: const Text('Switch to Dark Theme'),
                onTap: () => _switchToDarkTheme(context, !state.isDarkTheme!),
              );
            }),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
