// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import 'package:monitor_app/model/point_checklist_preventive.dart';

part 'category_checklist_preventive.g.dart';

@JsonSerializable()
class CategoryChecklistPreventive {
  final int id;
  final String categoryName;
  final String? keterangan;
  final List<PointChecklistPreventive>? points;

  CategoryChecklistPreventive({
    required this.id,
    required this.categoryName,
    this.keterangan,
    this.points,
  });

  Map<String, dynamic> toJson() => _$CategoryChecklistPreventiveToJson(this);
  factory CategoryChecklistPreventive.fromJson(Map<String, dynamic> json) =>
      _$CategoryChecklistPreventiveFromJson(json);
}
