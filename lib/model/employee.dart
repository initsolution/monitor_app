// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee {
  final String nik;
  final String name;
  final String email;
  final String hp;
  final bool isVendor;
  final String? urlEsign;
  final String? instansi;

  Employee(
    this.nik,
    this.name,
    this.email,
    this.hp,
    this.isVendor,
    this.urlEsign,
    this.instansi,
  );

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
}
