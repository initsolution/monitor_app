// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'value_verticality_db.g.dart';

@Collection(accessor: "value_verticality")
@Name("value_verticality")
class ValueVerticalityDB {
  Id? id = Isar.autoIncrement;
  late int theodoliteIndex;
  late int section;
  late String miringKe;
  late int value;

  ValueVerticalityDB({
    this.id,
    required this.theodoliteIndex,
    required this.section,
    required this.miringKe,
    required this.value,
  });

  @override
  String toString() {
    return 'ValueVerticalityDB(id: $id, theodoliteIndex: $theodoliteIndex, section: $section, miringKe: $miringKe, value: $value)';
  }
}
