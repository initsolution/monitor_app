import 'package:equatable/equatable.dart';
import 'package:monitor_app/model/task.dart';

abstract class TaskState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;
  TaskLoaded({required this.tasks});

  @override
  List<Object?> get props => [tasks];
}

class TaskLoadedWithError extends TaskState {
  final String message;
  TaskLoadedWithError({required this.message});

  @override
  List<Object?> get props => [message];
}
