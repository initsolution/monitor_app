// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import 'package:monitor_app/db/models/task_db.dart';
import 'package:monitor_app/model/asset.dart';
import 'package:monitor_app/model/category_checklist_preventive.dart';
import 'package:monitor_app/model/employee.dart';
import 'package:monitor_app/model/master_asset.dart';
import 'package:monitor_app/model/master_checklist.dart';
import 'package:monitor_app/model/master_report_reg_torque.dart';
import 'package:monitor_app/model/report_reg_torque.dart';
import 'package:monitor_app/model/report_reg_verticality.dart';
import 'package:monitor_app/model/site.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  final int id;
  final String type;
  final Site site;
  final Employee verifierEmployee;
  final String createdDate;
  final String? submitedDate;
  final String? verifiedDate;
  final String status;
  final List<MasterAsset>? masterAsset;
  final List<MasterChecklist>? masterChecklist;
  final List<MasterReportRegTorque>? masterReportRegTorque;
  late List<Asset>? assets;
  late List<CategoryChecklistPreventive>? categoriesChecklist;
  late List<ReportRegTorque>? reportRegTorque;
  late ReportRegVerticality? reportRegVerticality;

  Task({
    required this.id,
    required this.type,
    required this.site,
    required this.verifierEmployee,
    required this.createdDate,
    this.submitedDate,
    this.verifiedDate,
    required this.status,
    this.masterAsset,
    this.masterChecklist,
    this.masterReportRegTorque,
    this.assets,
    this.categoriesChecklist,
    this.reportRegTorque,
    this.reportRegVerticality,
  });

  Map<String, dynamic> toJson() => _$TaskToJson(this);
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  factory Task.fromTaskDB(TaskDB taskDB) => Task(
        id: taskDB.idTask,
        type: taskDB.type,
        site: Site(
            taskDB.site.value!.idSite,
            taskDB.site.value!.name,
            taskDB.site.value!.towerType,
            taskDB.site.value!.towerHeight,
            taskDB.site.value!.fabricator,
            taskDB.site.value!.tenants,
            taskDB.site.value!.region,
            taskDB.site.value!.province,
            taskDB.site.value!.address,
            taskDB.site.value!.longitude,
            taskDB.site.value!.latitude),
        verifierEmployee: Employee(
          taskDB.verifierEmployee.value!.nik,
          taskDB.verifierEmployee.value!.name,
          taskDB.verifierEmployee.value!.email,
          taskDB.verifierEmployee.value!.hp ?? '',
          taskDB.verifierEmployee.value!.isVendor,
          taskDB.verifierEmployee.value!.urlEsign,
          taskDB.verifierEmployee.value!.instansi,
        ),
        createdDate: taskDB.createdDate,
        submitedDate: taskDB.submitedDate,
        verifiedDate: taskDB.verifiedDate,
        status: taskDB.status,
        masterAsset: null,
        masterChecklist: null,
        masterReportRegTorque: null,
        assets: taskDB.assets.map((asset) => Asset.fromAssetDB(asset)).toList()
          ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex)),
        categoriesChecklist: taskDB.categoriesChecklist
            .map((category) =>
                CategoryChecklistPreventive.fromCategoryPointChecklistDB(
                    category))
            .toList()
          ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex)),
        reportRegTorque: taskDB.reportTorque
            .map((torque) => ReportRegTorque.fromReportRegTorqueDB(torque))
            .toList(),
        reportRegVerticality: taskDB.reportVerticality.value != null
            ? ReportRegVerticality.fromReportRegVerticalityDB(
                taskDB.reportVerticality.value!)
            : null,
      );
}
