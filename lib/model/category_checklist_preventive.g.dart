// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_checklist_preventive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryChecklistPreventive _$CategoryChecklistPreventiveFromJson(
        Map<String, dynamic> json) =>
    CategoryChecklistPreventive(
      id: json['id'] as int,
      categoryName: json['nama'] as String,
      keterangan: json['keterangan'] as String?,
      points: (json['pointChecklistPreventive'] as List<dynamic>?)
          ?.map((e) =>
              PointChecklistPreventive.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderIndex: json['orderIndex'] as int,
    );

Map<String, dynamic> _$CategoryChecklistPreventiveToJson(
        CategoryChecklistPreventive instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.categoryName,
      'keterangan': instance.keterangan,
      'pointChecklistPreventive': instance.points,
      'orderIndex': instance.orderIndex,
    };
