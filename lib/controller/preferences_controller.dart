import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monitor_app/constants/values.dart';
import 'package:monitor_app/model/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController extends StateNotifier<UserPreferences> {
  SharedPreferencesController() : super(UserPreferences('-', '-'));

  Future<void> loadAsync() async {
    final sharedPref = await SharedPreferences.getInstance();

    var username = sharedPref.getString(StorageKeys.username) ?? '';
    var token = sharedPref.getString(StorageKeys.token) ?? '';
    state = UserPreferences(username, token);
  }

  Future<void> setUserDataAsync({String? token, String? username}) async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(StorageKeys.token, token!);
    await sharedPref.setString(StorageKeys.username, username!);
    state = UserPreferences(username, token);
  }

  Future<void> clearUserDataAsync() async {
    final sharedPref = await SharedPreferences.getInstance();

    await sharedPref.remove(StorageKeys.username);
    await sharedPref.remove(StorageKeys.token);

    var username = '';
    var token = '';

    state = UserPreferences(username, token);
  }

  // bool isUserLoggedIn() {
  //   debugPrint(
  //       'isUserLogin : ${Provider((ref) => ref.watch(userDataProvider).username)}');
  //   return _username.isNotEmpty;
  // }
}

final preferencesControllerProvider = StateNotifierProvider<SharedPreferencesController, UserPreferences>(
    (ref) => SharedPreferencesController());
