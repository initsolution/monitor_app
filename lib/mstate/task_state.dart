import 'package:equatable/equatable.dart';
import 'package:monitor_app/model/task.dart';

abstract class TaskState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TasksLoaded extends TaskState {
  final List<Task> tasks;
  TasksLoaded({required this.tasks});

  @override
  List<Object?> get props => [tasks];
}

class TaskLoaded extends TaskState {
  final Task task;
  TaskLoaded({required this.task});

  @override
  List<Object?> get props => [task];
}

class TaskLoadedWithError extends TaskState {
  final String message;
  TaskLoadedWithError({required this.message});

  @override
  List<Object?> get props => [message];
}
