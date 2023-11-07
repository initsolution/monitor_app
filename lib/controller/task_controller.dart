// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:monitor_app/controller/app_provider.dart';
import 'package:monitor_app/model/asset.dart';
import 'package:monitor_app/model/category_checklist_preventive.dart';
import 'package:monitor_app/model/point_checklist_preventive.dart';
import 'package:monitor_app/model/report_reg_torque.dart';
import 'package:monitor_app/model/report_reg_verticality.dart';
import 'package:monitor_app/model/task.dart';
import 'package:monitor_app/mstate/task_state.dart';

import '../constants/constants.dart';
import 'asset_controller.dart';

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
    List<Task> reviewTask = [];
    // cek jika online

    // jika T maka
    try {
      var queries = {
        "filter": "makerEmployee.email||eq||$email",
        "join": [
          "site",
          "makerEmployee",
          "verifierEmployee",
          "categorychecklistprev",
          "categorychecklistprev.pointChecklistPreventive",
          "reportRegulerTorque",
          "reportRegulerVerticality",
          "reportRegulerVerticality.valueVerticality"
        ],
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
          if (task.status == STATUS_TODO) {
            await ref.read(localdataServiceProvider).createTask(task);
          } else {
            reviewTask.add(task);
          }
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
            if (task.status == STATUS_TODO) {
              await ref.read(localdataServiceProvider).createTask(task);
            } else {
              reviewTask.add(task);
            }
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
      localTasks ??= [];
      localTasks = List.from(localTasks)..addAll(reviewTask);
      for (var task in localTasks) {
        debugPrint('local task : (${task.id})');
      }

      state = TasksLoaded(tasks: localTasks);
    } on Exception catch (e) {
      state = TaskLoadedWithError(message: e.toString());
    }
    //
  }

  uploadTaskByTaskId(int taskId, token) async {
    state = TaskLoading();
    var task = await ref.read(localdataServiceProvider).getTaskById(taskId);
    //UPLOAD ASSET
    var assets = task?.asset;
    for (var asset in assets!) {
      if (asset.url != "-") {
        var file = File(asset.url);
        ref.read(assetUrlProvider.notifier).state = file.path.split("/").last;
        await ref
            .read(assetControllerProvider.notifier)
            .uploadAsset(taskId, asset, token);
      }
    }

    //update checklist
    if (task?.type == "Preventive") {
      //REPORT PREVENTIVE
      var categoriesChecklist = task?.categoriesChecklist;
      var data =
          CategoryChecklistPreventiveToBulk(taskId, categoriesChecklist!);
      var respon = await ref
          .read(restServiceProvider)
          .createPointChecklistPreventive(data);
      debugPrint('respon Preventive : ${respon.response.statusCode}');
    } else if (task?.type == "Reguler") {
      //REPORT REGULER TORQUE
      var reportRegTorque = task?.reportRegTorque;
      var reportRegTorqueData = ReportRegTorqueToBulk(taskId, reportRegTorque!);
      var responTorque = await ref
          .read(restServiceProvider)
          .createReportRegTorque(reportRegTorqueData);
      debugPrint('responTorque : ${responTorque.response.statusCode}');
      if (responTorque.response.statusCode != 201) {
        //gagall
        // debugPrint('gagal');
      }

      //REPORT REGULER VERTICALITY
      var reportRegVerticality = task?.reportRegVerticality;
      var data = ReportRegVerticalityToBulk(taskId, reportRegVerticality!);
      var responReg =
          await ref.read(restServiceProvider).createReportRegVerticality(data);
      debugPrint('responn Reguler : ${responReg.response.statusCode}');
    }

    //update TASK
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    task?.submitedDate = formattedDate;
    task?.status = STATUS_REVIEW;
    var updateTask = {
      "id": task!.id,
      "status": task.status,
      "submitedDate": task.submitedDate
    };
    var responTask = await ref
        .read(restServiceProvider)
        .updateTaskByTaskId(taskId, updateTask);
    debugPrint('respon Task : ${responTask.response.statusCode}');

    //delete localtask
    await ref.read(localdataServiceProvider).deleteTask(taskId);
    state = TaskDataChangeSuccess();
  }

  updateAssetLocalTask(Asset asset) async {
    state = TaskLoading();
    debugPrint('asset : ${asset.toString()}');
    await ref.read(localdataServiceProvider).updateAsset(asset);
    var localTasks = await ref.read(localdataServiceProvider).getAllTasks();
    state = TasksLoaded(tasks: localTasks!);
  }

  updateAssetsLocalTask(List<Asset> assets) async {
    state = TaskLoading();
    await ref.read(localdataServiceProvider).updateAssets(assets);
    var localTasks = await ref.read(localdataServiceProvider).getAllTasks();
    state = TasksLoaded(tasks: localTasks!);
  }

  getTaskById(int taskId) async {
    state = TaskLoading();
    var task = await ref.read(localdataServiceProvider).getTaskById(taskId);
    state = TasksLoaded(tasks: [task!]);
  }

  updatePointChecklist(PointChecklistPreventive pointChecklist) async {
    debugPrint('updatePointChecklist : ${pointChecklist.toString()}');
    await ref
        .read(localdataServiceProvider)
        .updatePoinChecklist(pointChecklist);
  }

  updateReportTorque(List<ReportRegTorque> report) async {
    for (var element in report) {
      debugPrint('updateReportTorque : ${element.toString()}');
    }

    await ref.read(localdataServiceProvider).updateReportTorque(report);
  }

  saveReportVerticality(int taskId, ReportRegVerticality report) async {
    await ref
        .read(localdataServiceProvider)
        .saveReportVerticality(taskId, report);
  }

  CategoryChecklistPreventiveToBulk(
      int idTask, List<CategoryChecklistPreventive> categoryChecklist) {
    var data = [];
    for (var element in categoryChecklist) {
      var value = {
        "nama": element.categoryName,
        "keterangan": element.keterangan,
        "orderIndex": element.orderIndex,
        "task": {"id": idTask},
        "pointChecklistPreventives":
            element.points!.map((e) => e.toJson()).toList()
      };
      data.add(value);
    }
    var bulk = {"bulk": data};
    // debugPrint('bulk : $bulk');
    return bulk;
  }

  ReportRegVerticalityToBulk(
      int idTask, ReportRegVerticality reportRegVerticality) {
    var data = {
      "horizontalityAb": reportRegVerticality.horizontalityAb,
      "horizontalityBc": reportRegVerticality.horizontalityBc,
      "horizontalityCd": reportRegVerticality.horizontalityCd,
      "horizontalityDa": reportRegVerticality.horizontalityDa,
      "theodolite1": reportRegVerticality.theodolite1,
      "theodolite2": reportRegVerticality.theodolite2,
      "alatUkur": reportRegVerticality.alatUkur,
      "toleransiKetegakan": reportRegVerticality.toleransiKetegakan,
      "task": {"id": idTask},
      "valueVerticalities":
          reportRegVerticality.valueVerticality!.map((e) => e.toJson()).toList()
    };
    return data;
  }

  ReportRegTorqueToBulk(int idTask, List<ReportRegTorque> reportRegTorque) {
    var data = [];
    for (var element in reportRegTorque) {
      var value = {
        "towerSegment": element.towerSegment,
        "elevasi": element.elevasi,
        "boltSize": element.boltSize,
        "minimumTorque": element.minimumTorque,
        "qtyBolt": element.qtyBolt,
        "remark": element.remark,
        "orderIndex" : element.orderIndex,
        "task": {"id": idTask},
      };
      data.add(value);
    }
    var bulk = {"bulk": data};
    // debugPrint('bulk : $bulk');
    return bulk;
  }
}
