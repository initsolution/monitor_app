// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:monitor_app/db/models/report_reg_verticality_db.dart';

import 'package:monitor_app/model/value_verticality.dart';

part 'report_reg_verticality.g.dart';

@JsonSerializable()
class ReportRegVerticality {
  final int? id;
  late int horizontalityAb;
  late int horizontalityBc;
  late int horizontalityCd;
  late int horizontalityDa;
  late String theodolite1;
  late String theodolite2;
  late String alatUkur;
  late int toleransiKetegakan;
  final List<ValueVerticality>? valueVerticality;

  ReportRegVerticality({
    this.id,
    required this.horizontalityAb,
    required this.horizontalityBc,
    required this.horizontalityCd,
    required this.horizontalityDa,
    required this.theodolite1,
    required this.theodolite2,
    required this.alatUkur,
    required this.toleransiKetegakan,
    this.valueVerticality,
  });

  Map<String, dynamic> toJson() => _$ReportRegVerticalityToJson(this);
  factory ReportRegVerticality.fromJson(Map<String, dynamic> json) =>
      _$ReportRegVerticalityFromJson(json);

  factory ReportRegVerticality.fromReportRegVerticalityDB(
      ReportRegVerticalityDB verticality) {
    List<ValueVerticality> valueVerts = verticality.valueVerticality
        .map((value) => ValueVerticality(
              id: value.id,
              theodoliteIndex: value.theodoliteIndex,
              section: value.section,
              miringKe: value.miringKe,
              value: value.value,
            ))
        .toList();
        debugPrint('tolerasni ketegakan menara : ${verticality.toleransiKetegakan}');
    return ReportRegVerticality(
        id: verticality.id,
        horizontalityAb: verticality.horizontalityAb,
        horizontalityBc: verticality.horizontalityBc,
        horizontalityCd: verticality.horizontalityCd,
        horizontalityDa: verticality.horizontalityDa,
        theodolite1: verticality.theodolite1,
        theodolite2: verticality.theodolite2,
        alatUkur: verticality.alatUkur,
        toleransiKetegakan: verticality.toleransiKetegakan,
        valueVerticality: valueVerts);
  }
  // ReportRegTorque(
  //     id: torque.id!,
  //     towerSegment: torque.towerSegment,
  //     elevasi: torque.elevasi,
  //     boltSize: torque.boltSize,
  //     minimumTorque: torque.minimumTorque,
  //     qtyBolt: torque.qtyBolt,
  //     remark: torque.remark);
}
