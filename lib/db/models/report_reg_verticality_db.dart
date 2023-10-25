// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';
import 'package:monitor_app/db/models/value_verticality_db.dart';

part 'report_reg_verticality_db.g.dart';

@Collection(accessor: "report_verticality")
@Name("report_verticality")
class ReportRegVerticalityDB {
  Id? id = Isar.autoIncrement;
  late int horizontalityAb;
  late int horizontalityBc;
  late int horizontalityCd;
  late int horizontalityDa;
  late String theodolite1;
  late String theodolite2;
  late String alatUkur;
  late String toleransiKetegakan;
  final valueVerticality = IsarLinks<ValueVerticalityDB>();
  
  ReportRegVerticalityDB({
    this.id,
    required this.horizontalityAb,
    required this.horizontalityBc,
    required this.horizontalityCd,
    required this.horizontalityDa,
    required this.theodolite1,
    required this.theodolite2,
    required this.alatUkur,
    required this.toleransiKetegakan,
  });
}
