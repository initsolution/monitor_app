// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'site.g.dart';

@JsonSerializable()
class Site {
  final String id;
  final String name;
  final String towerType;
  final int towerHeight;
  final String fabricator;
  final String? tenants;
  final String region;
  final String province;
  final String? address;
  final String? longitude;
  final String? latitude;

  Site(
    this.id,
    this.name,
    this.towerType,
    this.towerHeight,
    this.fabricator,
    this.tenants,
    this.region,
    this.province,
    this.address,
    this.longitude,
    this.latitude,
  );

  Map<String, dynamic> toJson() => _$SiteToJson(this);
  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
}
