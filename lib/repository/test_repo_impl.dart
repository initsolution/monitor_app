import 'dart:convert';

import 'package:monitor_app/model/task.dart';
import 'package:monitor_app/repository/app_repo.dart';
import 'package:monitor_app/utils/json_helper.dart';

class TestRepoImpl extends AppRepository {
  @override
  Future<List<Task>> getAllTasks() async {
    try {
      final result = (jsonDecode(await loadJsonData('todo.json')) as List)
          .map((e) => Task.fromMap(e))
          .toList();
      return result;
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<Task> getTaskById() {
    throw UnimplementedError();
  }
}
