// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'value_verticality.g.dart';

@JsonSerializable()
class ValueVerticality {
  final int? id;
  late int theodoliteIndex;
  late int section;
  late String miringKe;
  late int value;

  ValueVerticality({
    this.id,
    required this.theodoliteIndex,
    required this.section,
    required this.miringKe,
    required this.value,
  });

  Map<String, dynamic> toJson() => _$ValueVerticalityToJson(this);
  factory ValueVerticality.fromJson(Map<String, dynamic> json) =>
      _$ValueVerticalityFromJson(json);
}
