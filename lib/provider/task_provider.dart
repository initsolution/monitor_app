// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/mstate/task_state.dart';
import 'package:monitor_app/repository/data_repo.dart';
import 'package:dio/dio.dart';

final taskNotifierProvider =
    AutoDisposeNotifierProvider<TaskNotifier, TaskState>(
  () {
    return TaskNotifier(repository: DataRepository(Dio()));
  },
);

class TaskNotifier extends AutoDisposeNotifier<TaskState> {
  final DataRepository repository;
  TaskNotifier({required this.repository});

  @override
  TaskState build() {
    return TaskInitial();
  }

  getAllTasks(String email) async {
    state = TaskLoading();
    try {
      var queries = {
        "filter":"makerEmployee.email||eq||$email",
        "join" : ["site", "makerEmployee", "verifierEmployee"],
      };
      final tasks = await repository.getAllTaskByNIK(queries);
      state = TaskLoaded(tasks: tasks);
    } on Exception catch (e) {
      state = TaskLoadedWithError(message: e.toString());
    }
  }
}
