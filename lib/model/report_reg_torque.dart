// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:monitor_app/db/models/report_reg_torque_db.dart';

part 'report_reg_torque.g.dart';

@JsonSerializable()
class ReportRegTorque {
  final int id;
  final String towerSegment;
  final int elevasi;
  final String boltSize;
  final int minimumTorque;
  final int qtyBolt;
  final String? remark;

  ReportRegTorque({
    required this.id,
    required this.towerSegment,
    required this.elevasi,
    required this.boltSize,
    required this.minimumTorque,
    required this.qtyBolt,
    this.remark,
  });

  Map<String, dynamic> toJson() => _$ReportRegTorqueToJson(this);
  factory ReportRegTorque.fromJson(Map<String, dynamic> json) =>
      _$ReportRegTorqueFromJson(json);
  factory ReportRegTorque.fromReportRegTorqueDB(ReportRegTorqueDB torque) =>
      ReportRegTorque(
          id: torque.id,
          towerSegment: torque.towerSegment,
          elevasi: torque.elevasi,
          boltSize: torque.boltSize,
          minimumTorque: torque.minimumTorque,
          qtyBolt: torque.qtyBolt);
}
