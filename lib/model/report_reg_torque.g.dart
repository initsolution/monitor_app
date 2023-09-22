// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_reg_torque.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportRegTorque _$ReportRegTorqueFromJson(Map<String, dynamic> json) =>
    ReportRegTorque(
      id: json['id'] as int,
      towerSegment: json['towerSegment'] as String,
      elevasi: json['elevasi'] as int,
      boltSize: json['boltSize'] as String,
      minimumTorque: json['minimumTorque'] as int,
      qtyBolt: json['qtyBolt'] as int,
      remark: json['remark'] as String?,
    );

Map<String, dynamic> _$ReportRegTorqueToJson(ReportRegTorque instance) =>
    <String, dynamic>{
      'id': instance.id,
      'towerSegment': instance.towerSegment,
      'elevasi': instance.elevasi,
      'boltSize': instance.boltSize,
      'minimumTorque': instance.minimumTorque,
      'qtyBolt': instance.qtyBolt,
      'remark': instance.remark,
    };
