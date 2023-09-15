// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterAsset _$MasterAssetFromJson(Map<String, dynamic> json) => MasterAsset(
      id: json['id'] as int,
      taskType: json['taskType'] as String,
      section: json['section'] as String,
      fabricator: json['fabricator'] as String,
      towerHeight: json['towerHeight'] as int,
      category: json['category'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$MasterAssetToJson(MasterAsset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskType': instance.taskType,
      'section': instance.section,
      'fabricator': instance.fabricator,
      'towerHeight': instance.towerHeight,
      'category': instance.category,
      'description': instance.description,
    };
