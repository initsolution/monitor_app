// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'report_reg_torque_db.g.dart';

@Collection(accessor: "report_torque")
@Name("report_torque")
class ReportRegTorqueDB {
  Id? id = Isar.autoIncrement;
  late String towerSegment;
  late int elevasi;
  late String boltSize;
  late int minimumTorque;
  late int qtyBolt;
  late String? remark;

  ReportRegTorqueDB({
    this.id,
    required this.towerSegment,
    required this.elevasi,
    required this.boltSize,
    required this.minimumTorque,
    required this.qtyBolt,
    this.remark,
  });

  @override
  String toString() {
    return 'ReportRegTorqueDB(id: $id, towerSegment: $towerSegment, elevasi: $elevasi, boltSize: $boltSize, minimumTorque: $minimumTorque, qtyBolt: $qtyBolt, remark: $remark)';
  }
}
