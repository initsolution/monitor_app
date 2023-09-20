import 'package:isar/isar.dart';
import 'package:monitor_app/db/models/point_checklist_db.dart';

part 'category_point_checklist_db.g.dart';

@Collection(accessor: "category_point_checklist")
@Name("category_point_checklist")
class CategoryPointChecklistDB {
  Id id = Isar.autoIncrement;

  final String categoryName;
  final String? keterangan;
  final points = IsarLinks<PointChecklistDB>();

  CategoryPointChecklistDB({required this.categoryName, this.keterangan});
}
