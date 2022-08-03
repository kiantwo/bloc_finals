import 'package:bloc_finals_exam/models/task.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCubit extends Cubit<Task> with HydratedMixin {
  TaskCubit() : super(Task(title: '', description: ''));
  final List<Task> tasks = [];

  void addEditTask(Task task) {
    int index = tasks.indexWhere((element) => element.id == task.id);
    if (index == -1) {
      tasks.add(task);
    } else {
      tasks[index] = task;
    }
    emit(state.copyWith(
        id: task.id,
        title: task.title,
        description: task.description,
        isFavorite: task.isFavorite,
        isDone: task.isDone,
        isDeleted: task.isDeleted,
        createdAt: task.createdAt));
  }

  void addToFavorite(Task task) {
    int index = tasks.indexWhere((element) => element.id == task.id);
    tasks[index] = task;
    emit(state.copyWith(
        id: task.id,
        title: task.title,
        description: task.description,
        isFavorite: task.isFavorite,
        isDone: task.isDone,
        isDeleted: task.isDeleted,
        createdAt: task.createdAt));
  }

  void completeTask(Task task) {
    int index = tasks.indexWhere((element) => element.id == task.id);
    tasks[index] = task;
    emit(state.copyWith(
        id: task.id,
        title: task.title,
        description: task.description,
        isFavorite: task.isFavorite,
        isDone: task.isDone,
        isDeleted: task.isDeleted,
        createdAt: task.createdAt));
  }

  void deleteTask(Task task) {
    int index = tasks.indexWhere((element) => element.id == task.id);
    if (task.isDeleted!) {
      tasks[index] = task;
    } else {
      tasks.removeAt(index);
    }
    emit(state.copyWith(
        id: task.id,
        title: task.title,
        description: task.description,
        isFavorite: task.isFavorite,
        isDone: task.isDone,
        isDeleted: task.isDeleted,
        createdAt: task.createdAt));
  }

  void restoreTask(Task task) {
    int index = tasks.indexWhere((element) => element.id == task.id);
    tasks[index] = task;
    emit(state.copyWith(
        id: task.id,
        title: task.title,
        description: task.description,
        isFavorite: task.isFavorite,
        isDone: task.isDone,
        isDeleted: task.isDeleted,
        createdAt: task.createdAt));
  }

  @override
  Task? fromJson(Map<String, dynamic> json) {
    return Task.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(Task state) {
    return state.toMap();
  }
}
