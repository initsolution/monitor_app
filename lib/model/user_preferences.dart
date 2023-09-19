
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'user_preferences.g.dart';

@JsonSerializable()
class UserPreferences {
  String username;
  String token;
  UserPreferences(this.username, this.token);
}
