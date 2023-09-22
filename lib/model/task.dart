// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import 'package:monitor_app/model/asset.dart';
import 'package:monitor_app/model/category_checklist_preventive.dart';
import 'package:monitor_app/model/employee.dart';
import 'package:monitor_app/model/master_asset.dart';
import 'package:monitor_app/model/master_checklist.dart';
import 'package:monitor_app/model/master_report_reg_torque.dart';
import 'package:monitor_app/model/report_reg_torque.dart';
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
  final List<Asset>? assets;
  final List<CategoryChecklistPreventive>? categoriesChecklist;
  final List<ReportRegTorque>? reportRegTorque;

  Task(
    this.id,
    this.type,
    this.site,
    this.verifierEmployee,
    this.createdDate,
    this.submitedDate,
    this.verifiedDate,
    this.status,
    this.masterAsset,
    this.masterChecklist,
    this.masterReportRegTorque,
    this.assets,
    this.categoriesChecklist,
    this.reportRegTorque,
  );

  Map<String, dynamic> toJson() => _$TaskToJson(this);
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
