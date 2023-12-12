// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'master_report_reg_torque.g.dart';

@JsonSerializable()
class MasterReportRegTorque {
  final int id;
  final String fabricator;
  final int towerHeight;
  final String towerSegment;
  final int elevasi;
  final String boltSize;
  final int minimumTorque;
  final int qtyBolt;

  const MasterReportRegTorque({
    required this.id,
    required this.fabricator,
    required this.towerHeight,
    required this.towerSegment,
    required this.elevasi,
    required this.boltSize,
    required this.minimumTorque,
    required this.qtyBolt,
  });

  Map<String, dynamic> toJson() => _$MasterReportRegTorqueToJson(this);
  factory MasterReportRegTorque.fromJson(Map<String, dynamic> json) => _$MasterReportRegTorqueFromJson(json);

  @override
  String toString() {
    return 'MasterReportRegTorque(id: $id, fabricator: $fabricator, towerHeight: $towerHeight, towerSegment: $towerSegment, elevasi: $elevasi, boltSize: $boltSize, minimumTorque: $minimumTorque, qtyBolt: $qtyBolt)';
  }
}
