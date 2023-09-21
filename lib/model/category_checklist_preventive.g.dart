// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_checklist_preventive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryChecklistPreventive _$CategoryChecklistPreventiveFromJson(
        Map<String, dynamic> json) =>
    CategoryChecklistPreventive(
      id: json['id'] as int,
      categoryName: json['categoryName'] as String,
      keterangan: json['keterangan'] as String?,
      points: (json['points'] as List<dynamic>?)
          ?.map((e) =>
              PointChecklistPreventive.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderIndex: json['orderIndex'] as int,
    );

Map<String, dynamic> _$CategoryChecklistPreventiveToJson(
        CategoryChecklistPreventive instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryName': instance.categoryName,
      'keterangan': instance.keterangan,
      'points': instance.points,
      'orderIndex': instance.orderIndex,
    };
