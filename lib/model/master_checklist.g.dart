// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_checklist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterChecklist _$MasterChecklistFromJson(Map<String, dynamic> json) =>
    MasterChecklist(
      id: json['id'] as int,
      categoryName: json['categoryName'] as String,
      mpointchecklistpreventive:
          (json['mpointchecklistpreventive'] as List<dynamic>)
              .map((e) => MasterPointChecklistPreventive.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$MasterChecklistToJson(MasterChecklist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryName': instance.categoryName,
      'mpointchecklistpreventive': instance.mpointchecklistpreventive,
    };
