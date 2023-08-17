import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/provider/task_state.dart';
import 'package:monitor_app/repository/app_repo.dart';
import 'package:monitor_app/repository/test_repo_impl.dart';

final taskNotifierProvider =
    AutoDisposeNotifierProvider<TaskNotifier, TaskState>(
  () {
    return TaskNotifier(repository: TestRepoImpl());
  },
);

class TaskNotifier extends AutoDisposeNotifier<TaskState> {
  final AppRepository repository;
  TaskNotifier({required this.repository});

  @override
  TaskState build() {
    return TaskInitial();
  }

  getAllTasks() async {
    state = TaskLoading();
    try {
      final tasks = await repository.getAllTasks();
      state = TaskLoaded(tasks: tasks);
    } on Exception catch (e) {
      state = TaskLoadedWithError(message: e.toString());
    }
  }
}
