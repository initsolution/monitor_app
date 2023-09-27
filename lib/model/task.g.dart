// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: json['id'] as int,
      type: json['type'] as String,
      site: Site.fromJson(json['site'] as Map<String, dynamic>),
      verifierEmployee:
          Employee.fromJson(json['verifierEmployee'] as Map<String, dynamic>),
      createdDate: json['createdDate'] as String,
      submitedDate: json['submitedDate'] as String?,
      verifiedDate: json['verifiedDate'] as String?,
      status: json['status'] as String,
      masterAsset: (json['masterAsset'] as List<dynamic>?)
          ?.map((e) => MasterAsset.fromJson(e as Map<String, dynamic>))
          .toList(),
      masterChecklist: (json['masterChecklist'] as List<dynamic>?)
          ?.map((e) => MasterChecklist.fromJson(e as Map<String, dynamic>))
          .toList(),
      masterReportRegTorque: (json['masterReportRegTorque'] as List<dynamic>?)
          ?.map(
              (e) => MasterReportRegTorque.fromJson(e as Map<String, dynamic>))
          .toList(),
      assets: (json['assets'] as List<dynamic>?)
          ?.map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoriesChecklist: (json['categoriesChecklist'] as List<dynamic>?)
          ?.map((e) =>
              CategoryChecklistPreventive.fromJson(e as Map<String, dynamic>))
          .toList(),
      reportRegTorque: (json['reportRegTorque'] as List<dynamic>?)
          ?.map((e) => ReportRegTorque.fromJson(e as Map<String, dynamic>))
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
      'assets': instance.assets,
      'categoriesChecklist': instance.categoriesChecklist,
      'reportRegTorque': instance.reportRegTorque,
    };
