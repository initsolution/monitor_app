import 'package:monitor_app/model/task.dart';

abstract class AppRepository {
  Future<List<Task>> getAllTasks();
  Future<Task> getTaskById();
}
