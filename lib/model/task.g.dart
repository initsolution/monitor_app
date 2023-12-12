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
      created_at: json['created_at'] as String,
      dueDate: json['dueDate'] as String?,
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
      asset: (json['asset'] as List<dynamic>?)
          ?.map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoriesChecklist: (json['categorychecklistprev'] as List<dynamic>?)
          ?.map((e) =>
              CategoryChecklistPreventive.fromJson(e as Map<String, dynamic>))
          .toList(),
      reportRegTorque: (json['reportRegulerTorque'] as List<dynamic>?)
          ?.map((e) => ReportRegTorque.fromJson(e as Map<String, dynamic>))
          .toList(),
      reportRegVerticality: json['reportRegulerVerticality'] == null
          ? null
          : ReportRegVerticality.fromJson(
              json['reportRegulerVerticality'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'site': instance.site,
      'verifierEmployee': instance.verifierEmployee,
      'created_at': instance.created_at,
      'dueDate': instance.dueDate,
      'submitedDate': instance.submitedDate,
      'verifiedDate': instance.verifiedDate,
      'status': instance.status,
      'masterAsset': instance.masterAsset,
      'masterChecklist': instance.masterChecklist,
      'masterReportRegTorque': instance.masterReportRegTorque,
      'asset': instance.asset,
      'categorychecklistprev': instance.categoriesChecklist,
      'reportRegulerTorque': instance.reportRegTorque,
      'reportRegulerVerticality': instance.reportRegVerticality,
    };
