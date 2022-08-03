import 'package:bloc_finals_exam/bloc/task_state.dart';
import 'package:bloc_finals_exam/models/task.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class CreateEditTask extends TaskEvent {
  final Task task;

  const CreateEditTask({required this.task});

  @override
  List<Object> get props => [task];
}

class AddToFavorite extends TaskEvent {
  final Task task;

  const AddToFavorite({required this.task});

  List<Object> get props => [task];
}

class CompleteTask extends TaskEvent {
  final Task task;

  const CompleteTask({required this.task});

  List<Object> get props => [task];
}

class DeleteTask extends TaskEvent {
  final Task task;

  const DeleteTask({required this.task});

  List<Object> get props => [task];
}

class RestoreTask extends TaskEvent {
  final Task task;

  const RestoreTask({required this.task});

  List<Object> get props => [task];
}

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc()
      : super(const TaskState(
          pendingTasks: [],
          completedTasks: [],
          removedTasks: [],
          favoriteTasks: [],
        )) {
    on<CreateEditTask>(addEditTask);
    on<AddToFavorite>(addToFavorite);
    on<CompleteTask>(completeTask);
    on<DeleteTask>(deleteTask);
    on<RestoreTask>(restoreTask);
  }

  void addEditTask(CreateEditTask event, Emitter<TaskState> emit) {
    int pendingIndex = state.pendingTasks!
        .indexWhere((element) => element.id == event.task.id);
    int completedIndex = state.completedTasks!
        .indexWhere((element) => element.id == event.task.id);
    int? favoriteIndex = state.favoriteTasks!
        .indexWhere((element) => element.id == event.task.id);

    emit(
      state.copyWith(
          pendingTasks: pendingIndex == -1
              ? (List.from(state.pendingTasks!)..add(event.task))
              : (List.from(state.pendingTasks!)
                ..removeAt(pendingIndex)
                ..insert(pendingIndex, event.task)),
          completedTasks: completedIndex != -1
              ? (List.from(state.completedTasks!)
                ..removeAt(completedIndex)
                ..insert(completedIndex, event.task))
              : state.completedTasks,
          favoriteTasks: favoriteIndex != -1
              ? (List.from(state.favoriteTasks!)
                ..removeAt(favoriteIndex)
                ..insert(favoriteIndex, event.task))
              : state.completedTasks,
          removedTasks: state.removedTasks),
    );
  }

  void addToFavorite(AddToFavorite event, Emitter<TaskState> emit) {
    // int index =
    //     state.tasks!.indexWhere((element) => element.id == event.task.id);
    // emit(state.copyWith(
    //   tasks: List.from(state.tasks!)
    //     ..removeAt(index)
    //     ..insert(index, event.task),
    // ));
  }

  void completeTask(CompleteTask event, Emitter<TaskState> emit) {
    // int index =
    //     state.tasks!.indexWhere((element) => element.id == event.task.id);
    // emit(state.copyWith(
    //   tasks: List.from(state.tasks!)
    //     ..removeAt(index)
    //     ..insert(index, event.task),
    // ));
  }

  void deleteTask(DeleteTask event, Emitter<TaskState> emit) {
    // int index =
    //     state.tasks!.indexWhere((element) => element.id == event.task.id);
    // if (event.task.isDeleted!) {
    //   emit(state.copyWith(
    //     tasks: List.from(state.tasks!)
    //       ..removeAt(index)
    //       ..insert(index, event.task),
    //   ));
    // } else {
    //   emit(state.copyWith(tasks: List.from(state.tasks!)..removeAt(index)));
    // }
  }

  void restoreTask(RestoreTask event, Emitter<TaskState> emit) {
    // int index =
    //     state.tasks!.indexWhere((element) => element.id == event.task.id);
    // emit(state.copyWith(
    //   tasks: List.from(state.tasks!)
    //     ..removeAt(index)
    //     ..insert(index, event.task),
    // ));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
