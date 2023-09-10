// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Param extends Equatable {
  final String type;
  final String fabricator;
  final int towerHeight;
  const Param({
    required this.type,
    required this.fabricator,
    required this.towerHeight,
  });

  @override
  List<Object> get props => [type, fabricator, towerHeight];

  Param copyWith({
    String? type,
    String? fabricator,
    int? towerHeight,
  }) {
    return Param(
      type: type ?? this.type,
      fabricator: fabricator ?? this.fabricator,
      towerHeight: towerHeight ?? this.towerHeight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'fabricator': fabricator,
      'towerHeight': towerHeight,
    };
  }

  factory Param.fromMap(Map<String, dynamic> map) {
    return Param(
      type: map['type'] as String,
      fabricator: map['fabricator'] as String,
      towerHeight: map['towerHeight'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Param.fromJson(String source) =>
      Param.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
