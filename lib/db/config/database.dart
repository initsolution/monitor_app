import 'package:isar/isar.dart';
import 'package:monitor_app/db/models/assets_db.dart';
import 'package:monitor_app/db/models/category_point_checklist_db.dart';
import 'package:monitor_app/db/models/employee_db.dart';
import 'package:monitor_app/db/models/point_checklist_db.dart';
import 'package:monitor_app/db/models/report_reg_torque_db.dart';
import 'package:monitor_app/db/models/report_reg_verticality_db.dart';
import 'package:monitor_app/db/models/site_db.dart';
import 'package:monitor_app/db/models/task_db.dart';
import 'package:monitor_app/db/models/value_verticality_db.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;

late Isar isarDB;

Future<void> isarInit() async {
  final dir = await getApplicationSupportDirectory();
  if (Isar.instanceNames.isEmpty) {
    isarDB = await Isar.open(
      [
        TaskDBSchema,
        SiteDBSchema,
        EmployeeDBSchema,
        AssetsDBSchema,
        CategoryPointChecklistDBSchema,
        PointChecklistDBSchema,
        ReportRegTorqueDBSchema,
        ReportRegVerticalityDBSchema,
        ValueVerticalityDBSchema,
      ],
      directory: dir.path,
      inspector: !kReleaseMode,
    );
  }
}
