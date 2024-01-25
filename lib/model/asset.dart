// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:monitor_app/db/models/assets_db.dart';

part 'asset.g.dart';

@JsonSerializable()
class Asset {
  final int? id;
  final String section;
  final String category;
  late String description;
  late String url;
  late bool isPassed;
  late String? note;
  late int orderIndex;

  Asset({
    this.id,
    required this.section,
    required this.category,
    required this.description,
    required this.url,
    this.isPassed = false,
    this.note,
    required this.orderIndex,
  });

  get length => null;

  Map<String, dynamic> toJson() => _$AssetToJson(this);
  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  factory Asset.fromAssetDB(AssetsDB assetDB) => Asset(
      section: assetDB.section,
      id: assetDB.id!,
      category: assetDB.category,
      description: assetDB.description,
      url: assetDB.url,
      orderIndex: assetDB.orderIndex);
}
