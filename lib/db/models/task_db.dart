import 'package:isar/isar.dart';

import 'package:monitor_app/db/models/employee_db.dart';
import 'package:monitor_app/db/models/site_db.dart';

part 'task_db.g.dart';

@Collection(accessor: "tasks")
@Name("tasks")
class TaskDB {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(unique: true, replace: true)
  late int idTask;
  late String type;
  final site = IsarLink<SiteDB>();
  final verifierEmployee = IsarLink<EmployeeDB>();
  late String createdDate;
  String? submitedDate;
  String? verifiedDate;
  late String status;
}
