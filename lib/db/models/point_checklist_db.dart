// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'point_checklist_db.g.dart';

@Collection(accessor: "point_checklist")
@Name("point_checklist")
class PointChecklistDB {
  Id id = Isar.autoIncrement;

  late String uraian;
  late String? kriteria;
  late String hasil;
  late String? keterangan;

  PointChecklistDB({
    required this.uraian,
    this.kriteria,
    required this.hasil,
    this.keterangan,
  });
}
