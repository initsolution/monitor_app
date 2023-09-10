// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MasterAsset extends Equatable {
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

  MasterAsset copyWith({
    int? id,
    String? taskType,
    String? section,
    String? fabricator,
    int? towerHeight,
    String? category,
    String? description,
  }) {
    return MasterAsset(
      id: id ?? this.id,
      taskType: taskType ?? this.taskType,
      section: section ?? this.section,
      fabricator: fabricator ?? this.fabricator,
      towerHeight: towerHeight ?? this.towerHeight,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'taskType': taskType,
      'section': section,
      'fabricator': fabricator,
      'towerHeight': towerHeight,
      'category': category,
      'description': description,
    };
  }

  factory MasterAsset.fromMap(Map<String, dynamic> map) {
    return MasterAsset(
      id: map['id'] as int,
      taskType: map['taskType'] as String,
      section: map['section'] as String,
      fabricator: map['fabricator'] as String,
      towerHeight: map['towerHeight'] as int,
      category: map['category'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MasterAsset.fromJson(String source) =>
      MasterAsset.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      taskType,
      section,
      fabricator,
      towerHeight,
      category,
      description,
    ];
  }
}
