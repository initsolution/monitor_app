// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value_verticality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValueVerticality _$ValueVerticalityFromJson(Map<String, dynamic> json) =>
    ValueVerticality(
      id: json['id'] as int?,
      theodoliteIndex: json['theodoliteIndex'] as int,
      section: json['section'] as int,
      miringKe: json['miringKe'] as String,
      value: json['value'] as int,
    );

Map<String, dynamic> _$ValueVerticalityToJson(ValueVerticality instance) =>
    <String, dynamic>{
      'id': instance.id,
      'theodoliteIndex': instance.theodoliteIndex,
      'section': instance.section,
      'miringKe': instance.miringKe,
      'value': instance.value,
    };
