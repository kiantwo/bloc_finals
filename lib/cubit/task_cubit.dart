import 'package:bloc_finals_exam/models/task.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCubit extends Cubit<Task> {
  TaskCubit() : super(Task(title: '', description: ''));
  final List<Task> tasks = [];

  void addEditTask(Task task) {
    tasks.add(task);
    emit(state.copyWith(title: task.title, description: task.description));
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
