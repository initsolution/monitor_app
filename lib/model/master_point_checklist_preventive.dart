// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'master_point_checklist_preventive.g.dart';

@JsonSerializable()
class MasterPointChecklistPreventive {
  final int id;
  final String uraian;
  final String kriteria;
  final bool isChecklist;

  MasterPointChecklistPreventive(
    this.id,
    this.uraian,
    this.kriteria,
    this.isChecklist,
  );

  Map<String, dynamic> toJson() => _$MasterPointChecklistPreventiveToJson(this);
  factory MasterPointChecklistPreventive.fromJson(Map<String, dynamic> json) =>
      _$MasterPointChecklistPreventiveFromJson(json);
}
