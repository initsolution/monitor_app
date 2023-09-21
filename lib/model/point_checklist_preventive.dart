// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'point_checklist_preventive.g.dart';

@JsonSerializable()
class PointChecklistPreventive {
  final int id;
  final String uraian;
  final String? kriteria;
  final String hasil;
  final String? keterangan;
  final int orderIndex;

  PointChecklistPreventive({
    required this.id,
    required this.uraian,
    this.kriteria,
    required this.hasil,
    this.keterangan,
    required this.orderIndex,
  });
  
  Map<String, dynamic> toJson() => _$PointChecklistPreventiveToJson(this);
  factory PointChecklistPreventive.fromJson(Map<String, dynamic> json) => _$PointChecklistPreventiveFromJson(json);
}
