import 'package:bloc_finals_exam/models/task.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCubit extends Cubit<Task> with HydratedMixin {
  TaskCubit() : super(Task(title: '', description: ''));

  @override
  Task? fromJson(Map<String, dynamic> json) {
    return Task.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(Task state) {
    return state.toMap();
  }
}
