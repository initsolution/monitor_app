import 'package:monitor_app/constants/values.dart';
import 'package:monitor_app/model/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPrefController {
  Future<UserPreferences> getUserData() async {
    final sharedPref = await SharedPreferences.getInstance();
    var email = sharedPref.getString(StorageKeys.username) ?? '';
    var token = sharedPref.getString(StorageKeys.token) ?? '';
    var esign = sharedPref.getString(StorageKeys.esign) ?? '';
    return UserPreferences(email, token, esign);
  }

  Future<void> setUserData(
      {String? username, String? token, String? esign}) async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(StorageKeys.token, token!);
    await sharedPref.setString(StorageKeys.username, username!);
    await sharedPref.setString(StorageKeys.esign, esign!);
  }

  Future<void> setEsignData(String esign) async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(StorageKeys.esign, esign);
  }

  Future<String> getEsignData() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(StorageKeys.esign) ?? '';
  }

  Future<void> clearUserData() async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.remove(StorageKeys.username);
    await sharedPref.remove(StorageKeys.token);
    await sharedPref.remove(StorageKeys.esign);
  }
}
