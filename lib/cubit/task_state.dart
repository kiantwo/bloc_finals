import 'package:equatable/equatable.dart';

import '../models/task.dart';

class TaskState extends Equatable {
  final List<Task>? tasks;

  const TaskState({this.tasks});

  TaskState copyWith({List<Task>? tasks}) {
    return TaskState(tasks: tasks ?? this.tasks);
  }

  Map<String, dynamic> toMap() {
    return {'tasks': tasks!.map((task) => task.toMap()).toList()};
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      tasks: List.from(map['tasks'].map((task) => Task.fromMap(task))),
    );
  }

  @override
  List<Object?> get props => [tasks];
}
