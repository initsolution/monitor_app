// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AutInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final Response response;
  AuthSuccess({required this.response});
  @override
  List<Object?> get props => [response];
}
