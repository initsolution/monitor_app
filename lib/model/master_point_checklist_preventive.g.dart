// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_point_checklist_preventive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterPointChecklistPreventive _$MasterPointChecklistPreventiveFromJson(
        Map<String, dynamic> json) =>
    MasterPointChecklistPreventive(
      json['id'] as int,
      json['uraian'] as String,
      json['kriteria'] as String,
      json['isChecklist'] as bool,
    );

Map<String, dynamic> _$MasterPointChecklistPreventiveToJson(
        MasterPointChecklistPreventive instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uraian': instance.uraian,
      'kriteria': instance.kriteria,
      'isChecklist': instance.isChecklist,
    };
