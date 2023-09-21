// ignore_for_file: depend_on_referenced_packages

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
      final tasks =
          await ref.read(restServiceProvider).getAllTaskByNIK(queries);
      // bandingkan tasks yang didapat dengan db local isar

      for (var task in tasks) {
        await ref.read(localdataServiceProvider).createTask(task);
      }
      // tasks.map((task) async {
      //   print(task);
      //   return await ref.read(localdataServiceProvider).createTask(task);
      // });
      final localTasks = await ref.read(localdataServiceProvider).getAllTasks();
      state = TaskLoaded(tasks: localTasks);
    } on Exception catch (e) {
      state = TaskLoadedWithError(message: e.toString());
    }
    //
  }
}
