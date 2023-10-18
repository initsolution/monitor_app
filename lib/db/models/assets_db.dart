import 'package:isar/isar.dart';
import 'package:monitor_app/db/models/task_db.dart';

part 'assets_db.g.dart';

@Collection(accessor: "assets")
@Name("assets")
class AssetsDB {
  Id? id = Isar.autoIncrement; // you can also use id = null to auto increment
  late String section;
  late String category;
  late String description;
  late String url;
  late String createdDate;
  late String? lastModified;
  late bool isPassed;
  late String? note;
  late int orderIndex;
  final task = IsarLink<TaskDB>();

  AssetsDB({
    this.id,
    required this.section,
    required this.category,
    required this.description,
    required this.url,
    required this.createdDate,
    this.lastModified,
    this.isPassed = false,
    this.note,
    required this.orderIndex,
  });
}
