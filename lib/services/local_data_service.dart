import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:monitor_app/db/config/database.dart';
import 'package:monitor_app/db/models/assets_db.dart';
import 'package:monitor_app/db/models/category_point_checklist_db.dart';
import 'package:monitor_app/db/models/point_checklist_db.dart';
import 'package:monitor_app/db/models/task_db.dart';
import 'package:monitor_app/helpers/object_to_db_helper.dart';
import 'package:monitor_app/model/asset.dart';
import 'package:monitor_app/model/task.dart';

class LocalDataService {
  Future<Task?> getTaskById(int taskId) async {
    final taskDB =
        await isarDB.tasks.filter().idTaskEqualTo(taskId).findFirst();
    return taskDB != null ? Task.fromTaskDB(taskDB) : null;
  }

  Future<List<Task>?> getAllTasks() async {
    final result = await isarDB.tasks.where().findAll();
    debugPrint(result.toString());
    if (result.isNotEmpty) {
      debugPrint("pass");
      final tasks = result.map((task) => Task.fromTaskDB(task)).toList();
      return tasks;
    }
    return null;
  }

  Future<Task> createTask(Task task) async {
    final assetsDB = task.masterAsset?.mapIndexed((idx, masterAsset) {
          return AssetsDB(
            section: masterAsset.section,
            category: masterAsset.category,
            description: masterAsset.description,
            url: "-",
            createdDate: "-",
            orderIndex: idx,
          );
        }).toList() ??
        [];

    int index = 0;
    final categoryPointChecklistDB =
        task.masterChecklist?.map((masterChecklist) {
              final mChecklistDB = masterChecklist.mpointchecklistpreventive
                  .mapIndexed((idx, mpoint) => PointChecklistDB(
                        uraian: mpoint.uraian,
                        kriteria: mpoint.kriteria,
                        hasil: "NA",
                        orderIndex: idx,
                      ))
                  .toList();
              return CategoryPointChecklistDB(
                categoryName: masterChecklist.categoryName,
                orderIndex: index++,
              )..points.addAll(mChecklistDB);
            }).toList() ??
            [];

    final reportRegTorqueDB = task.masterReportRegTorque
            ?.map((torque) => getReportTorqueDBFromMasterReportTorque(torque))
            .toList() ??
        [];

    final siteDB = getSiteDBFromSite(task.site);
    final employeeDB = getEmployeeDBFromEmployee(task.verifierEmployee);
    final taskDB = TaskDB()
      ..idTask = task.id
      ..type = task.type
      ..site.value = siteDB
      ..verifierEmployee.value = employeeDB
      ..createdDate = task.createdDate
      ..submitedDate = task.submitedDate
      ..verifiedDate = task.verifiedDate
      ..status = task.status
      ..assets.addAll(assetsDB)
      ..categoriesChecklist.addAll(categoryPointChecklistDB)
      ..reportTorque.addAll(reportRegTorqueDB);

    isarDB.writeTxnSync(() => isarDB.tasks.putSync(taskDB));
    return task;
  }

  Future<List<Task>> createTasks(List<Task> tasks) async {
    // ignore: avoid_function_literals_in_foreach_calls
    tasks.forEach((task) async => await createTask(task));
    return tasks;
  }

  Future<void> updateAsset(Asset asset, String url) async {
    final assetDB = AssetsDB(
      section: asset.section,
      category: asset.category,
      description: asset.description,
      url: url,
      createdDate: asset.createdDate,
      lastModified: asset.lastModified,
      isPassed: asset.isPassed,
      note: asset.note,
      orderIndex: asset.orderIndex,
    );
    isarDB.writeTxnSync(() => isarDB.assets.putSync(assetDB));
  }

  Future<void> deleteTask(int taskId) async {
    await isarDB
        .writeTxn(() async => await isarDB.tasks.deleteByIdTask(taskId));
  }
}
