// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_checklist_preventive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointChecklistPreventive _$PointChecklistPreventiveFromJson(
        Map<String, dynamic> json) =>
    PointChecklistPreventive(
      id: json['id'] as int,
      uraian: json['uraian'] as String,
      kriteria: json['kriteria'] as String?,
      hasil: json['hasil'] as String,
      keterangan: json['keterangan'] as String?,
      orderIndex: json['orderIndex'] as int,
    );

Map<String, dynamic> _$PointChecklistPreventiveToJson(
        PointChecklistPreventive instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uraian': instance.uraian,
      'kriteria': instance.kriteria,
      'hasil': instance.hasil,
      'keterangan': instance.keterangan,
      'orderIndex': instance.orderIndex,
    };
