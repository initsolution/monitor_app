// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'master_asset.g.dart';

@JsonSerializable()
class MasterAsset {
  final int id;
  final String taskType;
  final String section;
  final String fabricator;
  final int towerHeight;
  final String category;
  final String description;

  const MasterAsset({
    required this.id,
    required this.taskType,
    required this.section,
    required this.fabricator,
    required this.towerHeight,
    required this.category,
    required this.description,
  });

  Map<String, dynamic> toJson() => _$MasterAssetToJson(this);
  factory MasterAsset.fromJson(Map<String, dynamic> json) =>
      _$MasterAssetFromJson(json);
}
