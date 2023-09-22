import 'package:isar/isar.dart';
import 'package:monitor_app/db/models/assets_db.dart';
import 'package:monitor_app/db/models/category_point_checklist_db.dart';
import 'package:monitor_app/db/models/employee_db.dart';
import 'package:monitor_app/db/models/report_reg_torque_db.dart';
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

  final assets = IsarLinks<AssetsDB>();
  final categoriesChecklist = IsarLinks<CategoryPointChecklistDB>();
  final reportTorque = IsarLinks<ReportRegTorqueDB>();
}
