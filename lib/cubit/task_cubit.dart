import 'package:bloc_finals_exam/cubit/task_state.dart';
import 'package:bloc_finals_exam/models/task.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState(tasks: []));

  void addEditTask(Task task) {
    int index = state.tasks!.indexWhere((element) => element.id == task.id);
    if (index == -1) {
      emit(state.copyWith(
        tasks: List.from(state.tasks!)..add(task),
      ));
    } else {
      emit(state.copyWith(
        tasks: List.from(state.tasks!)
          ..removeAt(index)
          ..insert(index, task),
      ));
    }
  }

  void addToFavorite(Task task) {
    int index = state.tasks!.indexWhere((element) => element.id == task.id);
    emit(state.copyWith(
      tasks: List.from(state.tasks!)
        ..removeAt(index)
        ..insert(index, task),
    ));
  }

  void completeTask(Task task) {
    int index = state.tasks!.indexWhere((element) => element.id == task.id);
    emit(state.copyWith(
      tasks: List.from(state.tasks!)
        ..removeAt(index)
        ..insert(index, task),
    ));
  }

  void deleteTask(Task task) {
    int index = state.tasks!.indexWhere((element) => element.id == task.id);
    if (task.isDeleted!) {
      emit(state.copyWith(
        tasks: List.from(state.tasks!)
          ..removeAt(index)
          ..insert(index, task),
      ));
    } else {
      emit(state.copyWith(tasks: List.from(state.tasks!)..removeAt(index)));
    }
  }

  void restoreTask(Task task) {
    int index = state.tasks!.indexWhere((element) => element.id == task.id);
    emit(state.copyWith(
      tasks: List.from(state.tasks!)
        ..removeAt(index)
        ..insert(index, task),
    ));
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
