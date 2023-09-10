// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MasterPointChecklistPreventive extends Equatable {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String categoryName;
  final List<PointChecklistPreventive> mpointchecklistpreventive;

  const MasterPointChecklistPreventive({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryName,
    required this.mpointchecklistpreventive,
  });

  MasterPointChecklistPreventive copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? categoryName,
    List<PointChecklistPreventive>? mpointchecklistpreventive,
  }) {
    return MasterPointChecklistPreventive(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      categoryName: categoryName ?? this.categoryName,
      mpointchecklistpreventive:
          mpointchecklistpreventive ?? this.mpointchecklistpreventive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'categoryName': categoryName,
      'mpointchecklistpreventive':
          mpointchecklistpreventive.map((x) => x.toMap()).toList(),
    };
  }

  factory MasterPointChecklistPreventive.fromMap(Map<String, dynamic> map) {
    return MasterPointChecklistPreventive(
      id: map['id'] as int,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
      categoryName: map['categoryName'] as String,
      mpointchecklistpreventive: List<PointChecklistPreventive>.from(
        map['mpointchecklistpreventive'].map<PointChecklistPreventive>(
          (x) => PointChecklistPreventive.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MasterPointChecklistPreventive.fromJson(String source) =>
      MasterPointChecklistPreventive.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      createdAt,
      updatedAt,
      categoryName,
      mpointchecklistpreventive,
    ];
  }
}

class PointChecklistPreventive extends Equatable {
  final int id;
  final String uraian;
  final String kriteria;
  
  const PointChecklistPreventive({
    required this.id,
    required this.uraian,
    required this.kriteria,
  });

  PointChecklistPreventive copyWith({
    int? id,
    String? uraian,
    String? kriteria,
  }) {
    return PointChecklistPreventive(
      id: id ?? this.id,
      uraian: uraian ?? this.uraian,
      kriteria: kriteria ?? this.kriteria,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uraian': uraian,
      'kriteria': kriteria,
    };
  }

  factory PointChecklistPreventive.fromMap(Map<String, dynamic> map) {
    return PointChecklistPreventive(
      id: map['id'] as int,
      uraian: map['uraian'] as String,
      kriteria: map['kriteria'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PointChecklistPreventive.fromJson(String source) =>
      PointChecklistPreventive.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, uraian, kriteria];
}
