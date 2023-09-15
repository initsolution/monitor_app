// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      json['nik'] as String,
      json['name'] as String,
      json['email'] as String,
      json['hp'] as String,
      json['isVendor'] as bool,
      json['urlEsign'] as String?,
      json['instansi'] as String?,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'nik': instance.nik,
      'name': instance.name,
      'email': instance.email,
      'hp': instance.hp,
      'isVendor': instance.isVendor,
      'urlEsign': instance.urlEsign,
      'instansi': instance.instansi,
    };
