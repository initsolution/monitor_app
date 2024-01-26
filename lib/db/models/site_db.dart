import 'package:isar/isar.dart';

part 'site_db.g.dart';

@Collection(accessor: "sites")
@Name("sites")
class SiteDB {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  late String idSite;
  late String name;
  late String towerType;
  late int towerHeight;
  late String fabricator;
  String? tenants;
  late String region;
  late String province;
  String? address;
  String? longitude;
  String? latitude;
}
