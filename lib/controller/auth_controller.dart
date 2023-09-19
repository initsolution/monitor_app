// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:monitor_app/constants/values.dart';
import 'package:monitor_app/controller/app_provider.dart';
import 'package:monitor_app/model/user_preferences.dart';

import 'package:monitor_app/mstate/auth_state.dart';
import 'package:monitor_app/controller/preferences_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final sharedPref = await SharedPreferences.getInstance();

    var username = sharedPref.getString(StorageKeys.username) ?? '';
    var token = sharedPref.getString(StorageKeys.token) ?? '';

    if (username != '' && token != '') {
      state = AuthAuthorized(userdata: UserPreferences(username, token));
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
      var message = httpResponse.response.data['message'];
      Map<String, dynamic> decodedToken =
          JwtDecoder.decode(message)['employee'];
      String email = decodedToken['email'];

      await ref.read(preferencesControllerProvider.notifier).setUserDataAsync(
            username: email,
            token: message,
          );
      state = AuthAuthorized(userdata: UserPreferences(email, message));
    } else {
      state =
          AuthFailedWithError(message: httpResponse.response.data['message']);
    }

    // state = AuthHttpResponse(response: httpResponse);
  }
}
