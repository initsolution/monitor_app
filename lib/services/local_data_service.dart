import 'package:collection/collection.dart';
import 'package:isar/isar.dart';
import 'package:monitor_app/db/config/database.dart';
import 'package:monitor_app/db/models/assets_db.dart';
import 'package:monitor_app/db/models/category_point_checklist_db.dart';
import 'package:monitor_app/db/models/employee_db.dart';
import 'package:monitor_app/db/models/point_checklist_db.dart';
import 'package:monitor_app/db/models/site_db.dart';
import 'package:monitor_app/db/models/task_db.dart';
import 'package:monitor_app/model/asset.dart';
import 'package:monitor_app/model/category_checklist_preventive.dart';
import 'package:monitor_app/model/employee.dart';
import 'package:monitor_app/model/point_checklist_preventive.dart';
import 'package:monitor_app/model/site.dart';
import 'package:monitor_app/model/task.dart';

class LocalDataService {
  Future<List<Task>> getAllTasks() async {
    final result = await isarDB.tasks.where().findAll();
    final tasks = result
        .map((task) => Task(
            task.id,
            task.type,
            Site(
                task.site.value!.idSite,
                task.site.value!.name,
                task.site.value!.towerType,
                task.site.value!.towerHeight,
                task.site.value!.fabricator,
                task.site.value!.tenants,
                task.site.value!.region,
                task.site.value!.province,
                task.site.value!.address,
                task.site.value!.longitude,
                task.site.value!.latitude),
            Employee(
              task.verifierEmployee.value!.nik,
              task.verifierEmployee.value!.name,
              task.verifierEmployee.value!.email,
              task.verifierEmployee.value!.hp ?? '',
              task.verifierEmployee.value!.isVendor,
              task.verifierEmployee.value!.urlEsign,
              task.verifierEmployee.value!.instansi,
            ),
            task.createdDate,
            task.submitedDate,
            task.verifiedDate,
            task.status,
            null,
            null,
            null,
            task.assets
                .map((asset) => Asset(
                    section: asset.section,
                    id: asset.id,
                    category: asset.category,
                    description: asset.description,
                    url: asset.url,
                    createdDate: asset.createdDate,
                    orderIndex: asset.orderIndex))
                .toList()
              ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex)),
            task.categoriesChecklist.map((category) {
              final points = category.points
                  .map((pointDB) => PointChecklistPreventive(
                        id: pointDB.id,
                        uraian: pointDB.uraian,
                        hasil: pointDB.hasil,
                        kriteria: pointDB.kriteria,
                        orderIndex: pointDB.orderIndex,
                      ))
                  .toList()
                ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
              return CategoryChecklistPreventive(
                  id: category.id,
                  categoryName: category.categoryName,
                  points: points,
                  orderIndex: category.orderIndex);
            }).toList()
              ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex))
            //masterAsset,
            //masterChecklist,
            //masterReportRegTorque,
            ))
        .toList();
    return tasks;
  }

  Future<Task> createTask(Task task) async {
    final assets = task.masterAsset
            ?.mapIndexed(
              (idx, masterAsset) => AssetsDB(
                section: masterAsset.section,
                category: masterAsset.category,
                description: masterAsset.description,
                url: "-",
                createdDate: "-",
                orderIndex: idx,
              ),
            )
            .toList() ??
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

    final siteDB = SiteDB()
      ..idSite = task.site.id
      ..name = task.site.name
      ..towerType = task.site.towerType
      ..towerHeight = task.site.towerHeight
      ..fabricator = task.site.fabricator
      ..tenants = task.site.tenants
      ..region = task.site.region
      ..province = task.site.province
      ..address = task.site.address
      ..longitude = task.site.longitude
      ..latitude = task.site.latitude;
    final employeeDB = EmployeeDB()
      ..nik = task.verifierEmployee.nik
      ..name = task.verifierEmployee.name
      ..email = task.verifierEmployee.email
      ..hp = task.verifierEmployee.hp
      ..isVendor = task.verifierEmployee.isVendor
      ..urlEsign = task.verifierEmployee.urlEsign
      ..instansi = task.verifierEmployee.instansi;
    final taskDB = TaskDB()
      ..idTask = task.id
      ..type = task.type
      ..site.value = siteDB
      ..verifierEmployee.value = employeeDB
      ..createdDate = task.createdDate
      ..submitedDate = task.submitedDate
      ..verifiedDate = task.verifiedDate
      ..status = task.status
      ..assets.addAll(assets)
      ..categoriesChecklist.addAll(categoryPointChecklistDB);

    isarDB.writeTxnSync(() => isarDB.tasks.putSync(taskDB));
    return task;
  }

  Future<List<Task>> createTasks(List<Task> tasks) async {
    // ignore: avoid_function_literals_in_foreach_calls
    tasks.forEach((task) async => await createTask(task));
    return tasks;
  }
}
