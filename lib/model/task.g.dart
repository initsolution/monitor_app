// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      json['id'] as int,
      json['type'] as String,
      Site.fromJson(json['site'] as Map<String, dynamic>),
      Employee.fromJson(json['verifierEmployee'] as Map<String, dynamic>),
      json['createdDate'] as String,
      json['submitedDate'] as String?,
      json['verifiedDate'] as String?,
      json['status'] as String,
      (json['masterAsset'] as List<dynamic>?)
          ?.map((e) => MasterAsset.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['masterChecklist'] as List<dynamic>?)
          ?.map((e) => MasterChecklist.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['masterReportRegTorque'] as List<dynamic>?)
          ?.map(
              (e) => MasterReportRegTorque.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'site': instance.site,
      'verifierEmployee': instance.verifierEmployee,
      'createdDate': instance.createdDate,
      'submitedDate': instance.submitedDate,
      'verifiedDate': instance.verifiedDate,
      'status': instance.status,
      'masterAsset': instance.masterAsset,
      'masterChecklist': instance.masterChecklist,
      'masterReportRegTorque': instance.masterReportRegTorque,
    };
