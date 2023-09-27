// ignore_for_file: depend_on_referenced_packages

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/controller/app_provider.dart';
import 'package:monitor_app/mstate/task_state.dart';

final taskControllerProvider =
    AutoDisposeNotifierProvider<TaskController, TaskState>(
  () {
    return TaskController();
  },
);

class TaskController extends AutoDisposeNotifier<TaskState> {
  // final DataRepository repository;
  // TaskController({required this.repository});

  @override
  TaskState build() {
    return TaskInitial();
  }

  getAllTasks(String email) async {
    state = TaskLoading();
    // cek jika online

    // jika T maka
    try {
      var queries = {
        "filter": "makerEmployee.email||eq||$email",
        "join": ["site", "makerEmployee", "verifierEmployee"],
      };
      // bandingkan tasks yang didapat dengan db local isar
      final tasks =
          await ref.read(restServiceProvider).getAllTaskByNIK(queries);

      for (var task in tasks) {
        debugPrint('rest task : (${task.id}) : ${task.verifierEmployee.nik}');
      }
      var localTasks = await ref.read(localdataServiceProvider).getAllTasks();
      if (localTasks == null) {
        for (var task in tasks) {
          debugPrint(' 0 create : (${task.id})');
          await ref.read(localdataServiceProvider).createTask(task);
        }
      } else {
        debugPrint('rest: (${tasks.length}) vs local : (${localTasks.length})');
        for (var task in tasks) {
          // debugPrint('${localTasks.contains(task)} #task${task.id}');
          debugPrint(
              '${localTasks.firstWhereOrNull((element) => element.id == task.id)}');
          if (localTasks.firstWhereOrNull((element) => element.id == task.id) ==
              null) {
            debugPrint('create : (${task.id})');
            await ref.read(localdataServiceProvider).createTask(task);
          }
          // if (!localTasks.contains(task)) {
          //   debugPrint('create : (${task.id})');
          //   await ref.read(localdataServiceProvider).createTask(task);
          // }
        }
        for (var task in localTasks) {
          if (tasks.firstWhereOrNull((element) => element.id == task.id) ==
              null) {
            await ref.read(localdataServiceProvider).deleteTask(task.id);
          }
          // if (!tasks.contains(task)) {
          //   await ref.read(localdataServiceProvider).deleteTask(task.id);
          // }
        }
      }
      localTasks = await ref.read(localdataServiceProvider).getAllTasks();
      for (var task in localTasks!) {
        debugPrint('local task : (${task.id})');
      }

      state = TaskLoaded(tasks: localTasks);
    } on Exception catch (e) {
      state = TaskLoadedWithError(message: e.toString());
    }
    //
  }
}
