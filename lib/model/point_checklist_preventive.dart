// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import 'package:monitor_app/db/models/point_checklist_db.dart';

part 'point_checklist_preventive.g.dart';

@JsonSerializable()
class PointChecklistPreventive {
  final int id;
  String uraian;
  String? kriteria;
  String hasil;
  String? keterangan;
  final int orderIndex;
  bool isChecklist;

  PointChecklistPreventive({
    required this.id,
    required this.uraian,
    this.kriteria,
    required this.hasil,
    this.keterangan,
    required this.orderIndex,
    required this.isChecklist,
  });

  Map<String, dynamic> toJson() => _$PointChecklistPreventiveToJson(this);
  factory PointChecklistPreventive.fromJson(Map<String, dynamic> json) =>
      _$PointChecklistPreventiveFromJson(json);
  factory PointChecklistPreventive.fromPointChecklistDB(
          PointChecklistDB pointDB) =>
      PointChecklistPreventive(
        id: pointDB.id!,
        uraian: pointDB.uraian,
        hasil: pointDB.hasil,
        kriteria: pointDB.kriteria,
        keterangan: pointDB.keterangan,
        orderIndex: pointDB.orderIndex,
        isChecklist: pointDB.isChecklist,
      );

  @override
  String toString() {
    return 'PointChecklistPreventive(id: $id, uraian: $uraian, kriteria: $kriteria, hasil: $hasil, keterangan: $keterangan, orderIndex: $orderIndex)';
  }
}
