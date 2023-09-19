import 'package:isar/isar.dart';

part 'employee_db.g.dart';

@Collection(accessor: "employees")
@Name("employees")
class EmployeeDB {
  Id? id;
  @Index(unique: true, replace: true)
  late String nik;
  late String name;
  late String email;
  late String? hp;
  late bool isVendor;
  String? urlEsign;
  String? instansi;
}
