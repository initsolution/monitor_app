// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:monitor_app/model/auth_state.dart';
import 'package:monitor_app/repository/app_repo.dart';

class AuthNotifier extends Notifier<AuthState> {
  final AppRepository repository;
  AuthNotifier({required this.repository});

  @override
  AuthState build() {
    throw AutInitial();
  }

  login(String username, String password) async {
    state = AuthLoading();
    final httpResponse = await repository.login(username, password);
    state = AuthSuccess(response: httpResponse);
  }
}
