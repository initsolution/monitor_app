// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Account extends Equatable {
  final String nik;
  final String name;
  final String email;
  final String hp;
  final String role;
  final bool isActive;
  final bool isVendor;
  String? urlEsign;
  final String? instansi;
  Account({
    required this.nik,
    required this.name,
    required this.email,
    required this.hp,
    required this.role,
    required this.isActive,
    required this.isVendor,
    this.urlEsign,
    this.instansi,
  });

  Account copyWith({
    String? nik,
    String? name,
    String? email,
    String? hp,
    String? role,
    bool? isActive,
    bool? isVendor,
    String? urlEsign,
    String? instansi,
  }) {
    return Account(
      nik: nik ?? this.nik,
      name: name ?? this.name,
      email: email ?? this.email,
      hp: hp ?? this.hp,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
      isVendor: isVendor ?? this.isVendor,
      urlEsign: urlEsign ?? this.urlEsign,
      instansi: instansi ?? this.instansi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nik': nik,
      'name': name,
      'email': email,
      'hp': hp,
      'role': role,
      'isActive': isActive,
      'isVendor': isVendor,
      'urlEsign': urlEsign,
      'instansi': instansi,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    debugPrint(map.toString());
    return Account(
      nik: map['nik'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      hp: map['hp'] as String,
      role: map['role'] as String,
      isActive: map['isActive'] as bool,
      isVendor: map['isVendor'] as bool,
      urlEsign: map['urlEsign'] != null ? map['urlEsign'] as String : null,
      instansi: map['instansi'] != null ? map['instansi'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      nik,
      name,
      email,
      hp,
      role,
      isActive,
      isVendor,
      urlEsign,
      instansi,
    ];
  }
}
