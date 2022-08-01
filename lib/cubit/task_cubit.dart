import 'package:bloc_finals_exam/cubit/task_state.dart';
import 'package:bloc_finals_exam/models/task.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState());

  void addEditTask(Task task) {
    state.tasks.add(task);
    emit(state);
  }

  // @override
  // Task? fromJson(Map<String, dynamic> json) {
  //   return Task.fromMap(json);
  // }
  //
  // @override
  // Map<String, dynamic>? toJson(Task state) {
  //   return state.toMap();
  // }
}
