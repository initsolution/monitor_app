// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:monitor_app/controller/app_provider.dart';
import 'package:monitor_app/model/user_preferences.dart';
import 'package:dio/dio.dart';
import 'package:monitor_app/mstate/auth_state.dart';

final authControllerProvider = NotifierProvider<AuthController, AuthState>(
  () => AuthController(),
);

class AuthController extends Notifier<AuthState> {
  // late AuthRepository repository;
  // AuthController() {
  //   repository = ref.read(AuthRepository(Dio()));
  // }

  @override
  AuthState build() {
    throw AuthInitial();
  }

  Future<void> appStarted() async {
    state = AuthLoading();
    UserPreferences pref =
        await ref.read(preferenceManagerProvider).getUserData();
    var email = pref.username;
    var token = pref.token;
    var esign = pref.esign;
    if (email != '' && token != '') {
      state = AuthAuthorized(userdata: UserPreferences(email, token, esign));
    } else {
      state = AuthUnauthorized();
    }
  }

  void login(String username, String password) async {
    state = AuthLoading();
    Map<String, dynamic> body = {"email": username, "password": password};
    final httpResponse = await ref.read(authRepoProvider).login(body);
    debugPrint('${httpResponse.response.data['statusCode']}');
    if (httpResponse.response.data['statusCode'] == HttpStatus.accepted) {
      var token = httpResponse.response.data['message'];
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token)['employee'];
      String email = decodedToken['email'];
      String esign = decodedToken['urlEsign'] ?? '';
      await ref
          .read(preferenceManagerProvider)
          .setUserData(username: email, token: token, esign: esign);
      state = AuthAuthorized(userdata: UserPreferences(email, token, esign));
    } else {
      state =
          AuthFailedWithError(message: httpResponse.response.data['message']);
    }
  }

  void resetPassword(String email) async {
    state = AuthLoading();
    try {
      final httpResponse =
          await ref.read(authRepoProvider).resetPassword(email);
      debugPrint(httpResponse.response.data.toString());
      if (httpResponse.response.data['statusCode'] == HttpStatus.accepted) {
        var message = httpResponse.response.data['message'];
        state = ResetPasswordSuccess(message: message);
      } else {
        var message = httpResponse.response.data['message'];
        state = ResetPasswordFailedWithError(message: message);
      }
    } on DioException catch (e) {
      var message = e.response?.data['message'];
      state = ResetPasswordFailedWithError(message: message);
    }
  }
}
