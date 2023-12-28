// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
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
import 'package:dio/dio.dart';

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

  getAllTasks(
      {required String email,
      required DateTimeRange dateTimeRange,
      String? status,
      required String token}) async {
    state = TaskLoading();

    var filters = [
      "makerEmployee.email||eq||$email",
      "created_at||gte||${DateFormat('yyyy-MM-dd').format(dateTimeRange.start)}",
      "created_at||lte||${DateFormat('yyyy-MM-dd').format(dateTimeRange.end.add(const Duration(days: 1)))}",
    ];
    if (status != null) {
      if (status.toLowerCase() != "all") {
        filters.add("status||eq||${status.toLowerCase()}");
      }
    }
    try {
      var queries = {
        "filter": filters,
        "sort": "created_at,ASC",
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
      // debugPrint(filters.toString());
      // bandingkan tasks yang didapat dengan db local isar
      final tasks =
          await ref.read(restServiceProvider).getAllTaskByNIK(queries, token);

      // for (var task in tasks) {
      //   debugPrint('rest task : (${task.id}) : ${task.verifierEmployee.nik}');
      // }
      state = TaskLoaded(tasks: tasks);

      // var localTasks = await ref.read(localdataServiceProvider).getAllTasks();
      // if (localTasks == null) {
      //   for (var task in tasks) {
      //     debugPrint(' 0 create : (${task.id})');
      //     if (task.status == STATUS_TODO) {
      //       await ref.read(localdataServiceProvider).createTask(task);
      //     } else {
      //       reviewTask.add(task);
      //     }
      //   }
      // } else {
      //   debugPrint('rest: (${tasks.length}) vs local : (${localTasks.length})');
      //   for (var task in tasks) {
      //     // debugPrint('${localTasks.contains(task)} #task${task.id}');
      //     debugPrint(
      //         '${localTasks.firstWhereOrNull((element) => element.id == task.id)}');
      //     if (localTasks.firstWhereOrNull((element) => element.id == task.id) ==
      //         null) {
      //       debugPrint('create : (${task.id})');
      //       if (task.status == STATUS_TODO) {
      //         await ref.read(localdataServiceProvider).createTask(task);
      //       } else {
      //         reviewTask.add(task);
      //       }
      //     }
      //   }
      //   for (var task in localTasks) {
      //     if (tasks.firstWhereOrNull((element) => element.id == task.id) ==
      //         null) {
      //       await ref.read(localdataServiceProvider).deleteTask(task.id);
      //     }
      //   }
      // }
      // localTasks = await ref.read(localdataServiceProvider).getAllTasks();
      // localTasks ??= [];
      // localTasks = List.from(localTasks)..addAll(reviewTask);
      // for (var task in localTasks) {
      //   debugPrint('local task : (${task.id})');
      // }

      // state = TasksLoaded(tasks: localTasks);
    } on Exception catch (e) {
      state = TaskLoadedWithError(message: e.toString());
    }
    //
  }

  isTaskFoundInLocal({required Task task}) async {
    var result = await ref.read(localdataServiceProvider).getTaskById(task.id);
    if (result == null) {
      await ref.read(localdataServiceProvider).createTask(task);
      result = await ref.read(localdataServiceProvider).getTaskById(task.id);
    }
    state = PrepareTaskSuccess(task: result!);
  }

  sortTaskByRest({required Task task}) async {
    if (task.asset != null) {
      task.asset!.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    }
    if (task.categoriesChecklist != null) {
      task.categoriesChecklist!
          .sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    }
    if (task.categoriesChecklist != null) {
      task.categoriesChecklist
          ?.forEach((categories) => categories.points?.sort((a, b) {
                return a.orderIndex.compareTo(b.orderIndex);
              }));
    }
    if (task.reportRegTorque != null) {
      task.reportRegTorque?.sort((a, b) => a.id.compareTo(b.id));
    }
    if (task.reportRegVerticality != null) {
      task.reportRegVerticality?.valueVerticality?.sort((a, b) {
        if (a.theodoliteIndex != b.theodoliteIndex) {
          return a.theodoliteIndex.compareTo(b.theodoliteIndex);
        } else {
          return a.section.compareTo(b.section);
        }
      });
    }
    state = PrepareTaskSuccess(task: task);
  }

  uploadTaskByTaskId({required int taskId, required String token}) async {
    try {
      await ref.read(restServiceProvider).cancelUpload(taskId, token);
    } on DioException catch (error) {
      debugPrint('error $error');
    }
    
    var task = await ref.read(localdataServiceProvider).getTaskById(taskId);
    var status = _checkAllResourcesComplete(task);
    if (status["message"] == "complete") {
      // debugPrint('proses uploading');
      state = TaskLoading();
      var localTask =
          await ref.read(localdataServiceProvider).getTaskDBById(taskId);
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
            categoryChecklistPreventiveToBulk(taskId, categoriesChecklist!);
        var respon = await ref
            .read(restServiceProvider)
            .createPointChecklistPreventive(data, token);
        debugPrint('respon Preventive : ${respon.response.statusCode}');
      } else if (task?.type == "Reguler") {
        //REPORT REGULER TORQUE
        var reportRegTorque = task?.reportRegTorque;
        var reportRegTorqueData =
            reportRegTorqueToBulk(taskId, reportRegTorque!);
        var responTorque = await ref
            .read(restServiceProvider)
            .createReportRegTorque(reportRegTorqueData, token);
        debugPrint('responTorque : ${responTorque.response.statusCode}');
        if (responTorque.response.statusCode != 201) {
          //gagall
          // debugPrint('gagal');
        }

        //REPORT REGULER VERTICALITY
        var reportRegVerticality = task?.reportRegVerticality;
        var data = reportRegVerticalityToBulk(taskId, reportRegVerticality!);
        var responReg = await ref
            .read(restServiceProvider)
            .createReportRegVerticality(data, token);
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
          .updateTaskByTaskId(taskId, updateTask, token);
      debugPrint('respon Task : ${responTask.response.statusCode}');

      //delete localtask
      await ref
          .read(localdataServiceProvider)
          .deleteSite(localTask!.site.value!.id);
      await ref
          .read(localdataServiceProvider)
          .deleteEmployee(localTask.verifierEmployee.value!.id!);
      for (var e in localTask.assets) {
        await ref.read(localdataServiceProvider).deleteAsset(e.id!);
      }
      if (localTask.type == "Reguler") {
        for (var e in localTask.reportTorque) {
          await ref.read(localdataServiceProvider).deleteReportTorque(e.id!);
        }
        for (var e in localTask.reportVerticality.value!.valueVerticality) {
          await ref
              .read(localdataServiceProvider)
              .deleteValueVerticality(e.id!);
        }
        await ref
            .read(localdataServiceProvider)
            .deleteReportVerticality(localTask.reportVerticality.value!.id!);
      } else if (localTask.type == "Preventive") {
        for (var e in localTask.categoriesChecklist) {
          var points = e.points;
          for (var p in points) {
            await ref
                .read(localdataServiceProvider)
                .deletePointChecklist(p.id!);
          }
          await ref
              .read(localdataServiceProvider)
              .deleteCategoryPointChecklist(e.id);
        }
      }

      await ref.read(localdataServiceProvider).deleteTask(taskId);
      state = TaskDataChangeSuccess();
    } else {
      // debugPrint('failed');
      // debugPrint(status["title"]);
      state = TaskDataNotComplete(
          title: status["title"],
          message: status["message"],
          type: status["type"]);
    }
  }

  updateAssetLocalTask(Asset asset) async {
    // state = TaskLoading();
    debugPrint('asset : ${asset.toString()}');
    await ref.read(localdataServiceProvider).updateAsset(asset);
    // var localTasks = await ref.read(localdataServiceProvider).getAllTasks();
    // state = TaskLoaded(tasks: localTasks!);
  }

  // updateAssetsLocalTask(List<Asset> assets) async {
  //   state = TaskLoading();
  //   await ref.read(localdataServiceProvider).updateAssets(assets);
  //   var localTasks = await ref.read(localdataServiceProvider).getAllTasks();
  //   state = TaskLoaded(tasks: localTasks!);
  // }

  getTaskById(int taskId) async {
    state = TaskLoading();
    var task = await ref.read(localdataServiceProvider).getTaskById(taskId);
    state = TaskLoaded(tasks: [task!]);
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

  categoryChecklistPreventiveToBulk(
      int idTask, List<CategoryChecklistPreventive> categoryChecklist) {
    var data = [];
    for (var element in categoryChecklist) {
      var value = {
        "nama": element.categoryName,
        "keterangan": element.keterangan,
        "orderIndex": element.orderIndex,
        "task": {"id": idTask},
        "pointChecklistPreventives": element.points!.map((e) {
          debugPrint(' point : ${e.uraian}');
          return e.toJson();
        }).toList()
      };
      data.add(value);
      debugPrint('jumlah point : ${element.points?.length}');
    }
    var bulk = {"bulk": data};
    // debugPrint('bulk : $bulk');
    return bulk;
  }

  reportRegVerticalityToBulk(
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

  reportRegTorqueToBulk(int idTask, List<ReportRegTorque> reportRegTorque) {
    var data = [];
    for (var element in reportRegTorque) {
      var value = {
        "towerSegment": element.towerSegment,
        "elevasi": element.elevasi,
        "boltSize": element.boltSize,
        "minimumTorque": element.minimumTorque,
        "qtyBolt": element.qtyBolt,
        "remark": element.remark,
        "orderIndex": element.orderIndex,
        "task": {"id": idTask},
      };
      data.add(value);
    }
    var bulk = {"bulk": data};
    // debugPrint('bulk : $bulk');
    return bulk;
  }

  filterStatus(String status, List<Task> tasks) {
    state = TaskLoading();
    if (status == 'All') {
      state = TaskLoaded(tasks: tasks);
    } else {
      List<Task> searchTask = tasks
          .where((task) => task.status.toLowerCase() == (status.toLowerCase()))
          .toList();
      state = TaskLoaded(tasks: searchTask);
    }
  }

  dynamic _checkAllResourcesComplete(Task? task) {
    // String status = "complete";
    var status = {"title": "Informasi", "message": "complete", "type": "asset"};
    if (task != null) {
      if (task.type == "Preventive") {
        // task.categoriesChecklist?.map((item) => item.points?.map((poin) => poin.hasil));
        for (var asset in task.asset!) {
          if (asset.url == "-") {
            // status["title"] = "Information";
            // status["message"] = asset.category + ";" + asset.description;
            // status["type"] = "asset";
            if (asset.category != "TEMUAN") {
              return status = {
                "title": "Informasi",
                "message": "${asset.category};${asset.description}",
                "type": "asset"
              };
            }
          } else {
            var isFileExists = File(asset.url).existsSync();
            if (!isFileExists) {
              // status["title"] = "Image Not Exist";
              // status["message"] = asset.category + ";" + asset.description;
              // status["type"] = "asset";
              return status = {
                "title": "File Gambar Tidak Ada",
                "message": "${asset.category};${asset.description}",
                "type": "asset"
              };
            }
          }
        }
      } else if (task.type == "Reguler") {
        //reguler verticality
        // horizontality harus isi 4
        // theodeolite 1 dan 2 harus diisi
        // bolt torque harus diisi
        for (var asset in task.asset!) {
          if (asset.url == "-") {
            // status["title"] = "Information";
            // status["message"] = asset.category + ";" + asset.description;
            // status["type"] = "asset";
            if (asset.category != "TEMUAN") {
              return status = {
                "title": "Informasi",
                "message": "${asset.category};${asset.description}",
                "type": "asset"
              };
            }
          } else {
            var isFileExists = File(asset.url).existsSync();
            if (!isFileExists) {
              // status["title"] = "Image Not Exist";
              // status["message"] = asset.category + ";" + asset.description;
              // status["type"] = "asset";
              return status = {
                "title": "File Gambar Tidak Ada",
                "message": "${asset.category};${asset.description}",
                "type": "asset"
              };
            }
          }
        }

        for (var e in task.reportRegTorque!) {
          debugPrint('ez : ${e.remark}');
          if (e.remark == null || e.remark!.isEmpty) {
            // debugPrint('towerSegment : ${e.towerSegment}');
            // status["title"] = "Information";
            // status["message"] = e.towerSegment + ";" + "nul";
            // status["type"] = "torque";
            return status = {
              "title": "Informasi",
              "message": "${e.towerSegment};",
              "type": "torque"
            };
          }
        }

        var report = task.reportRegVerticality;
        if (report?.horizontalityAb == null) {
          return status = {
            "title": "Informasi",
            "message": "horizontality pondasi AB;",
            "type": "horizontality"
          };
        }
        if (report?.horizontalityBc == null) {
          return status = {
            "title": "Informasi",
            "message": "horizontality pondasi BC;",
            "type": "horizontality"
          };
        }
        if (report?.horizontalityCd == null) {
          return status = {
            "title": "Informasi",
            "message": "horizontality pondasi CD;",
            "type": "horizontality"
          };
        }
        if (report?.horizontalityDa == null) {
          return status = {
            "title": "Informasi",
            "message": "horizontality pondasi DA;",
            "type": "horizontality"
          };
        }

        debugPrint("theodolite1 ${report?.theodolite1}");
        if (report?.theodolite1 == null) {
          return status = {
            "title": "Informasi",
            "message": "Theodolite1 Kosong;",
            "type": "theodolite"
          };
        }

        debugPrint("theodolite2 ${report?.theodolite2}");
        if (report?.theodolite2 == null) {
          return status = {
            "title": "Informasi",
            "message": "Theodolite2 Kosong;",
            "type": "theodolite"
          };
        }
      }
    }

    return status;
  }
}
