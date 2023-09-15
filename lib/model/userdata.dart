
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'userdata.g.dart';

@JsonSerializable()
class UserData {
  String username;
  String token;
  UserData(this.username, this.token);
}
