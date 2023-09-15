// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import 'package:monitor_app/model/master_point_checklist_preventive.dart';

part 'master_checklist.g.dart';

@JsonSerializable()
class MasterChecklist {
  final int id;
  final String categoryName;
  final List<MasterPointChecklistPreventive> mpointchecklistpreventive;
  
  MasterChecklist({
    required this.id,
    required this.categoryName,
    required this.mpointchecklistpreventive,
  });

  Map<String, dynamic> toJson() => _$MasterChecklistToJson(this);
  factory MasterChecklist.fromJson(Map<String, dynamic> json) =>
      _$MasterChecklistFromJson(json);
}
