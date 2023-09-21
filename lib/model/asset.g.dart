// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asset _$AssetFromJson(Map<String, dynamic> json) => Asset(
      id: json['id'] as int,
      section: json['section'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      createdDate: json['createdDate'] as String,
      lastModified: json['lastModified'] as String?,
      isPassed: json['isPassed'] as bool? ?? false,
      note: json['note'] as String?,
      orderIndex: json['orderIndex'] as int,
    );

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      'id': instance.id,
      'section': instance.section,
      'category': instance.category,
      'description': instance.description,
      'url': instance.url,
      'createdDate': instance.createdDate,
      'lastModified': instance.lastModified,
      'isPassed': instance.isPassed,
      'note': instance.note,
      'orderIndex': instance.orderIndex,
    };
