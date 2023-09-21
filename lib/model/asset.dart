import 'package:json_annotation/json_annotation.dart';

part 'asset.g.dart';

@JsonSerializable()
class Asset {
  final int id;
  final String section;
  final String category;
  final String description;
  final String url;
  final String createdDate;
  late String? lastModified;
  late bool isPassed;
  late String? note;
  late int orderIndex;

  Asset({
    required this.id,
    required this.section,
    required this.category,
    required this.description,
    required this.url,
    required this.createdDate,
    this.lastModified,
    this.isPassed = false,
    this.note,
    required this.orderIndex,
  });

  Map<String, dynamic> toJson() => _$AssetToJson(this);
  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}
