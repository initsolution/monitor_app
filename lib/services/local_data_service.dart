import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:monitor_app/db/config/database.dart';
import 'package:monitor_app/db/models/assets_db.dart';
import 'package:monitor_app/db/models/category_point_checklist_db.dart';
import 'package:monitor_app/db/models/employee_db.dart';
import 'package:monitor_app/db/models/point_checklist_db.dart';
import 'package:monitor_app/db/models/report_reg_torque_db.dart';
import 'package:monitor_app/db/models/report_reg_verticality_db.dart';
import 'package:monitor_app/db/models/site_db.dart';
import 'package:monitor_app/db/models/task_db.dart';
import 'package:monitor_app/db/models/value_verticality_db.dart';
import 'package:monitor_app/helpers/object_to_db_helper.dart';
import 'package:monitor_app/model/asset.dart';
import 'package:monitor_app/model/point_checklist_preventive.dart';
import 'package:monitor_app/model/report_reg_torque.dart';
import 'package:monitor_app/model/report_reg_verticality.dart';
import 'package:monitor_app/model/task.dart';

class LocalDataService {
  Future<Task?> getTaskById(int taskId) async {
    final taskDB =
        await isarDB.tasks.filter().idTaskEqualTo(taskId).findFirst();
    return taskDB != null ? Task.fromTaskDB(taskDB) : null;
  }

  Future<TaskDB?> getTaskDBById(int taskId) async {
    return await isarDB.tasks.filter().idTaskEqualTo(taskId).findFirst();
  }

  Future<List<Task>?> getAllTasks() async {
    final result = await isarDB.tasks.where().findAll();
    debugPrint(result.toString());
    if (result.isNotEmpty) {
      final tasks = result.map((task) => Task.fromTaskDB(task)).toList();
      return tasks;
    }
    return null;
  }

  Future<Task> createTask(Task task) async {
    var masterasset = task.masterAsset!.map((e) => e).toList()
      ..sort((a, b) => a.id.compareTo(b.id));
    final assetsDB = masterasset.mapIndexed((idx, masterAsset) {
          return AssetsDB(
            section: masterAsset.section,
            category: masterAsset.category,
            description: masterAsset.description,
            url: "-",
            orderIndex: idx,
          );
        }).toList();
    // var assetsDB;
    // if (task.status == STATUS_TODO) {
    //   assetsDB = task.masterAsset?.mapIndexed((idx, masterAsset) {
    //         return AssetsDB(
    //           section: masterAsset.section,
    //           category: masterAsset.category,
    //           description: masterAsset.description,
    //           url: "-",
    //           orderIndex: idx,
    //         );
    //       }).toList() ??
    //       [];
    // } else {
    //   assetsDB = task.asset?.mapIndexed((idx, assets) {
    //     print('assets id : ${assets.id}');
    //         return AssetsDB(
    //           section: assets.section,
    //           category: assets.category,
    //           description: assets.description,
    //           url: assets.url,
    //           orderIndex: idx,
    //         );
    //       }).toList() ??
    //       [];
    // }
    int index = 0;
    final categoryPointChecklistDB =
        task.masterChecklist?.map((masterChecklist) {
              final mChecklistDB = masterChecklist.mpointchecklistpreventive
                  .mapIndexed((idx, mpoint) => PointChecklistDB(
                        uraian: mpoint.uraian,
                        kriteria: mpoint.kriteria,
                        hasil: "NA",
                        orderIndex: idx,
                        isChecklist: mpoint.isChecklist,
                      ))
                  .toList();
              return CategoryPointChecklistDB(
                categoryName: masterChecklist.categoryName,
                orderIndex: index++,
              )..points.addAll(mChecklistDB);
            }).toList() ??
            [];

    index = 0;
    final reportRegTorqueDB = task.masterReportRegTorque
            ?.map((torque) =>
                getReportTorqueDBFromMasterReportTorque(torque, index++))
            .toList() ??
        [];

    final reportRegVerticalityDB = task.reportRegVerticality != null
        ? getReportRegVerticalityDBFromReportRegVerticality(
            task.reportRegVerticality!)
        : null;

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
      ..reportTorque.addAll(reportRegTorqueDB)
      ..reportVerticality.value = reportRegVerticalityDB;

    isarDB.writeTxnSync(() => isarDB.tasks.putSync(taskDB));
    return task;
  }

  Future<void> updateAsset(Asset asset) async {
    final assetDB = AssetsDB(
      id: asset.id,
      section: asset.section,
      category: asset.category,
      description: asset.description,
      url: asset.url,
      isPassed: asset.isPassed,
      note: asset.note,
      orderIndex: asset.orderIndex,
    );
    isarDB.writeTxnSync(() => isarDB.assets.putSync(assetDB));
  }

  Future<void> updateAssets(List<Asset> assets) async {
    List<AssetsDB> assetsDB = [];
    for (var element in assets) {
      final assetDB = AssetsDB(
        id: element.id,
        section: element.section,
        category: element.category,
        description: element.description,
        url: element.url,
        isPassed: element.isPassed,
        note: element.note,
        orderIndex: element.orderIndex,
      );

      assetsDB.add(assetDB);
    }
    isarDB.writeTxnSync(() => isarDB.assets.putAllSync(assetsDB));
  }

  Future<bool> createAssetTemuan(Asset asset) async {
    try {
      final assetDB = AssetsDB(
        section: asset.section,
        category: asset.category,
        description: asset.description,
        url: asset.url,
        isPassed: asset.isPassed,
        note: asset.note,
        orderIndex: asset.orderIndex,
      );
      isarDB.writeTxnSync(() => isarDB.assets.putSync(assetDB));
      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<List<Task>> createTasks(List<Task> tasks) async {
    // ignore: avoid_function_literals_in_foreach_calls
    tasks.forEach((task) async => await createTask(task));
    return tasks;
  }

  Future<void> deleteTask(int taskId) async {
    await isarDB
        .writeTxn(() async => await isarDB.tasks.deleteByIdTask(taskId));
  }

  Future<void> deleteSite(int id) async {
    await isarDB.writeTxn(() async => await isarDB.sites.delete(id));
  }

  Future<void> deleteEmployee(int id) async {
    await isarDB.writeTxn(() async => await isarDB.employees.delete(id));
  }

  Future<void> deleteAsset(int id) async {
    await isarDB.writeTxn(() async => await isarDB.assets.delete(id));
  }

  Future<void> deleteCategoryPointChecklist(int id) async {
    await isarDB
        .writeTxn(() async => await isarDB.category_point_checklist.delete(id));
  }

  Future<void> deletePointChecklist(int id) async {
    await isarDB.writeTxn(() async => await isarDB.point_checklist.delete(id));
  }

  Future<void> deleteReportTorque(int id) async {
    await isarDB.writeTxn(() async => await isarDB.report_torque.delete(id));
  }

  Future<void> deleteReportVerticality(int id) async {
    await isarDB
        .writeTxn(() async => await isarDB.report_verticality.delete(id));
  }

  Future<void> deleteValueVerticality(int id) async {
    await isarDB
        .writeTxn(() async => await isarDB.value_verticality.delete(id));
  }

  Future<bool> addAssetToTask(int taskId, Asset temuan) async {
    final taskDB =
        await isarDB.tasks.filter().idTaskEqualTo(taskId).findFirst();
    if (taskDB != null) {
      final assetDB = AssetsDB(
          section: temuan.section,
          category: temuan.category,
          description: temuan.description,
          url: temuan.url,
          orderIndex: temuan.orderIndex);

      await isarDB.writeTxn(() async {
        await isarDB.assets.put(assetDB);
        taskDB.assets.add(assetDB);
        await taskDB.assets.save();
      });
      return true;
    }
    return false;
  }

  Future<List<Asset>> getAllTemuanByTaskId(int taskId, String section) async {
    final taskDB =
        await isarDB.tasks.filter().idTaskEqualTo(taskId).findFirst();
    List<AssetsDB>? result = await taskDB?.assets
        .filter()
        .categoryEqualTo("TEMUAN", caseSensitive: false)
        .sectionEqualTo(section)
        .findAll();

    return result!.map((assetDB) => Asset.fromAssetDB(assetDB)).toList();
  }

  Future<void> updatePoinChecklist(
      PointChecklistPreventive pointChecklist) async {
    final pointChecklistDB = await isarDB.point_checklist
        .filter()
        .idEqualTo(pointChecklist.id)
        .findFirst();
    if (pointChecklistDB != null) {
      final pointChecklistDB2 = PointChecklistDB(
        id: pointChecklist.id,
        kriteria: pointChecklist.kriteria,
        keterangan: pointChecklist.keterangan,
        uraian: pointChecklist.uraian,
        hasil: pointChecklist.hasil,
        orderIndex: pointChecklist.orderIndex,
        isChecklist: pointChecklist.isChecklist,
      );
      isarDB.writeTxnSync(
          () => isarDB.point_checklist.putSync(pointChecklistDB2));
    }
  }

  Future<void> updateReportTorque(List<ReportRegTorque> report) async {
    List<ReportRegTorqueDB> reports = [];
    for (var r in report) {
      final rDB =
          await isarDB.report_torque.filter().idEqualTo(r.id).findFirst();

      if (rDB != null) {
        final rDB2 = ReportRegTorqueDB(
            id: rDB.id,
            towerSegment: rDB.towerSegment,
            elevasi: rDB.elevasi,
            boltSize: rDB.boltSize,
            minimumTorque: rDB.minimumTorque,
            qtyBolt: rDB.qtyBolt,
            remark: r.remark,
            orderIndex: r.orderIndex);
        debugPrint('ReportRegTorqueDB : ${rDB2.toString()}');
        reports.add(rDB2);
      }
    }
    isarDB.writeTxnSync(() => isarDB.report_torque.putAllSync(reports));
  }

  Future<void> saveReportVerticality(
      int taskId, ReportRegVerticality reportVerticality) async {
    final taskDB =
        await isarDB.tasks.filter().idTaskEqualTo(taskId).findFirst();
    if (taskDB != null) {
      if (reportVerticality.valueVerticality != null) {
        ReportRegVerticalityDB report = ReportRegVerticalityDB(
            id: reportVerticality.id,
            horizontalityAb: reportVerticality.horizontalityAb,
            horizontalityBc: reportVerticality.horizontalityBc,
            horizontalityCd: reportVerticality.horizontalityCd,
            horizontalityDa: reportVerticality.horizontalityDa,
            theodolite1: reportVerticality.theodolite1,
            theodolite2: reportVerticality.theodolite2,
            alatUkur: reportVerticality.alatUkur,
            toleransiKetegakan: reportVerticality.toleransiKetegakan);

        var listValueVerticalityDB =
            getListValueVerticalityDBFromListValueVerticality(
                reportVerticality.valueVerticality!);
        report.valueVerticality.addAll(listValueVerticalityDB);

        isarDB.writeTxnSync(() {
          isarDB.value_verticality.putAllSync(listValueVerticalityDB);
          isarDB.report_verticality.putSync(report);
          taskDB.reportVerticality.value = report;
          taskDB.reportVerticality.saveSync();
        });
      }
      // if (taskDB.reportVerticality.value != null) {
      //   debugPrint('sudah ada data');
      //   // UPDATE REPORT VERTICALITY
      //   ReportRegVerticalityDB report = ReportRegVerticalityDB(
      //       id: taskDB.reportVerticality.value!.id,
      //       horizontalityAb: reportVerticality.horizontalityAb,
      //       horizontalityBc: reportVerticality.horizontalityBc,
      //       horizontalityCd: reportVerticality.horizontalityCd,
      //       horizontalityDa: reportVerticality.horizontalityDa,
      //       theodolite1: reportVerticality.theodolite1,
      //       theodolite2: reportVerticality.theodolite2,
      //       alatUkur: reportVerticality.alatUkur,
      //       toleransiKetegakan: reportVerticality.toleransiKetegakan);

      //   // taskDB.reportVerticality.value.valueVerticality.
      // } else {
      //   // ADD REPORT VERTICALITY
      //   if (reportVerticality.valueVerticality != null) {
      //     ReportRegVerticalityDB report = ReportRegVerticalityDB(
      //         id: reportVerticality.id,
      //         horizontalityAb: reportVerticality.horizontalityAb,
      //         horizontalityBc: reportVerticality.horizontalityBc,
      //         horizontalityCd: reportVerticality.horizontalityCd,
      //         horizontalityDa: reportVerticality.horizontalityDa,
      //         theodolite1: reportVerticality.theodolite1,
      //         theodolite2: reportVerticality.theodolite2,
      //         alatUkur: reportVerticality.alatUkur,
      //         toleransiKetegakan: reportVerticality.toleransiKetegakan);

      //     var listValueVerticalityDB =
      //         getListValueVerticalityDBFromListValueVerticality(
      //             reportVerticality.valueVerticality!);
      //     report.valueVerticality.addAll(listValueVerticalityDB);

      //     isarDB.writeTxnSync(() {
      //       isarDB.value_verticality.putAllSync(listValueVerticalityDB);
      //       isarDB.report_verticality.putSync(report);
      //       taskDB.reportVerticality.value = report;
      //       taskDB.reportVerticality.saveSync();
      //     });
      //   }

      //   // taskDB.reportVerticality
      // }
    }
  }
}
