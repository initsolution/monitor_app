// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import 'package:monitor_app/model/employee.dart';
import 'package:monitor_app/model/master_asset.dart';
import 'package:monitor_app/model/master_checklist.dart';
import 'package:monitor_app/model/master_report_reg_torque.dart';
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
  );

  Map<String, dynamic> toJson() => _$TaskToJson(this);
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
