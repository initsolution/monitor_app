// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MasterReportRegTorque extends Equatable {
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

  MasterReportRegTorque copyWith({
    int? id,
    String? fabricator,
    int? towerHeight,
    String? towerSegment,
    int? elevasi,
    String? boltSize,
    int? minimumTorque,
    int? qtyBolt,
  }) {
    return MasterReportRegTorque(
      id: id ?? this.id,
      fabricator: fabricator ?? this.fabricator,
      towerHeight: towerHeight ?? this.towerHeight,
      towerSegment: towerSegment ?? this.towerSegment,
      elevasi: elevasi ?? this.elevasi,
      boltSize: boltSize ?? this.boltSize,
      minimumTorque: minimumTorque ?? this.minimumTorque,
      qtyBolt: qtyBolt ?? this.qtyBolt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fabricator': fabricator,
      'towerHeight': towerHeight,
      'towerSegment': towerSegment,
      'elevasi': elevasi,
      'boltSize': boltSize,
      'minimumTorque': minimumTorque,
      'qtyBolt': qtyBolt,
    };
  }

  factory MasterReportRegTorque.fromMap(Map<String, dynamic> map) {
    return MasterReportRegTorque(
      id: map['id'] as int,
      fabricator: map['fabricator'] as String,
      towerHeight: map['towerHeight'] as int,
      towerSegment: map['towerSegment'] as String,
      elevasi: map['elevasi'] as int,
      boltSize: map['boltSize'] as String,
      minimumTorque: map['minimumTorque'] as int,
      qtyBolt: map['qtyBolt'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MasterReportRegTorque.fromJson(String source) =>
      MasterReportRegTorque.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      fabricator,
      towerHeight,
      towerSegment,
      elevasi,
      boltSize,
      minimumTorque,
      qtyBolt,
    ];
  }
}
