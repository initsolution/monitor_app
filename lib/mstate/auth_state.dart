// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:monitor_app/model/userdata.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthAuthorized extends AuthState {
  final UserData userdata;
  AuthAuthorized({required this.userdata});
  @override
  List<Object?> get props => [userdata];
}

class AuthUnauthorized extends AuthState {}

class AuthLoading extends AuthState {}

class AuthFailedWithError extends AuthState {
  final String message;
  AuthFailedWithError({required this.message});
  @override
  List<Object?> get props => [message];
}
