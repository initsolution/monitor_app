// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Site _$SiteFromJson(Map<String, dynamic> json) => Site(
      json['id'] as String,
      json['name'] as String,
      json['towerType'] as String,
      json['towerHeight'] as int,
      json['fabricator'] as String,
      json['tenants'] as String?,
      json['region'] as String,
      json['province'] as String,
      json['address'] as String?,
      json['longitude'] as String?,
      json['latitude'] as String?,
    );

Map<String, dynamic> _$SiteToJson(Site instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'towerType': instance.towerType,
      'towerHeight': instance.towerHeight,
      'fabricator': instance.fabricator,
      'tenants': instance.tenants,
      'region': instance.region,
      'province': instance.province,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
