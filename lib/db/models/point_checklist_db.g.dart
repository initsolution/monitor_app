// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_checklist_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPointChecklistDBCollection on Isar {
  IsarCollection<PointChecklistDB> get point_checklist => this.collection();
}

const PointChecklistDBSchema = CollectionSchema(
  name: r'point_checklist',
  id: -4644202896298936349,
  properties: {
    r'hasil': PropertySchema(
      id: 0,
      name: r'hasil',
      type: IsarType.string,
    ),
    r'isChecklist': PropertySchema(
      id: 1,
      name: r'isChecklist',
      type: IsarType.bool,
    ),
    r'keterangan': PropertySchema(
      id: 2,
      name: r'keterangan',
      type: IsarType.string,
    ),
    r'kriteria': PropertySchema(
      id: 3,
      name: r'kriteria',
      type: IsarType.string,
    ),
    r'orderIndex': PropertySchema(
      id: 4,
      name: r'orderIndex',
      type: IsarType.long,
    ),
    r'uraian': PropertySchema(
      id: 5,
      name: r'uraian',
      type: IsarType.string,
    )
  },
  estimateSize: _pointChecklistDBEstimateSize,
  serialize: _pointChecklistDBSerialize,
  deserialize: _pointChecklistDBDeserialize,
  deserializeProp: _pointChecklistDBDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _pointChecklistDBGetId,
  getLinks: _pointChecklistDBGetLinks,
  attach: _pointChecklistDBAttach,
  version: '3.1.0+1',
);

int _pointChecklistDBEstimateSize(
  PointChecklistDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.hasil.length * 3;
  {
    final value = object.keterangan;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.kriteria;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.uraian.length * 3;
  return bytesCount;
}

void _pointChecklistDBSerialize(
  PointChecklistDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.hasil);
  writer.writeBool(offsets[1], object.isChecklist);
  writer.writeString(offsets[2], object.keterangan);
  writer.writeString(offsets[3], object.kriteria);
  writer.writeLong(offsets[4], object.orderIndex);
  writer.writeString(offsets[5], object.uraian);
}

PointChecklistDB _pointChecklistDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PointChecklistDB(
    hasil: reader.readString(offsets[0]),
    id: id,
    isChecklist: reader.readBool(offsets[1]),
    keterangan: reader.readStringOrNull(offsets[2]),
    kriteria: reader.readStringOrNull(offsets[3]),
    orderIndex: reader.readLong(offsets[4]),
    uraian: reader.readString(offsets[5]),
  );
  return object;
}

P _pointChecklistDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pointChecklistDBGetId(PointChecklistDB object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _pointChecklistDBGetLinks(PointChecklistDB object) {
  return [];
}

void _pointChecklistDBAttach(
    IsarCollection<dynamic> col, Id id, PointChecklistDB object) {
  object.id = id;
}

extension PointChecklistDBQueryWhereSort
    on QueryBuilder<PointChecklistDB, PointChecklistDB, QWhere> {
  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PointChecklistDBQueryWhere
    on QueryBuilder<PointChecklistDB, PointChecklistDB, QWhereClause> {
  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PointChecklistDBQueryFilter
    on QueryBuilder<PointChecklistDB, PointChecklistDB, QFilterCondition> {
  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      hasilEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasil',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      hasilGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hasil',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      hasilLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hasil',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      hasilBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hasil',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      hasilStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hasil',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      hasilEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hasil',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      hasilContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hasil',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      hasilMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hasil',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      hasilIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasil',
        value: '',
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      hasilIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hasil',
        value: '',
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      isChecklistEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isChecklist',
        value: value,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      keteranganIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'keterangan',
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      keteranganIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'keterangan',
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      keteranganEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keterangan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      keteranganGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'keterangan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      keteranganLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'keterangan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      keteranganBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'keterangan',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      keteranganStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'keterangan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      keteranganEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'keterangan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      keteranganContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'keterangan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      keteranganMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'keterangan',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      keteranganIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keterangan',
        value: '',
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      keteranganIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'keterangan',
        value: '',
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      kriteriaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'kriteria',
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      kriteriaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'kriteria',
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      kriteriaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kriteria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      kriteriaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kriteria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      kriteriaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kriteria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      kriteriaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kriteria',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      kriteriaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'kriteria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      kriteriaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'kriteria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      kriteriaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'kriteria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      kriteriaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'kriteria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      kriteriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kriteria',
        value: '',
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      kriteriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'kriteria',
        value: '',
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      orderIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      orderIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      orderIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      orderIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      uraianEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uraian',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      uraianGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uraian',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      uraianLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uraian',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      uraianBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uraian',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      uraianStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uraian',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      uraianEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uraian',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      uraianContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uraian',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      uraianMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uraian',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      uraianIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uraian',
        value: '',
      ));
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterFilterCondition>
      uraianIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uraian',
        value: '',
      ));
    });
  }
}

extension PointChecklistDBQueryObject
    on QueryBuilder<PointChecklistDB, PointChecklistDB, QFilterCondition> {}

extension PointChecklistDBQueryLinks
    on QueryBuilder<PointChecklistDB, PointChecklistDB, QFilterCondition> {}

extension PointChecklistDBQuerySortBy
    on QueryBuilder<PointChecklistDB, PointChecklistDB, QSortBy> {
  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy> sortByHasil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasil', Sort.asc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      sortByHasilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasil', Sort.desc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      sortByIsChecklist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChecklist', Sort.asc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      sortByIsChecklistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChecklist', Sort.desc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      sortByKeterangan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keterangan', Sort.asc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      sortByKeteranganDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keterangan', Sort.desc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      sortByKriteria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kriteria', Sort.asc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      sortByKriteriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kriteria', Sort.desc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      sortByOrderIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderIndex', Sort.asc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      sortByOrderIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderIndex', Sort.desc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      sortByUraian() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uraian', Sort.asc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      sortByUraianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uraian', Sort.desc);
    });
  }
}

extension PointChecklistDBQuerySortThenBy
    on QueryBuilder<PointChecklistDB, PointChecklistDB, QSortThenBy> {
  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy> thenByHasil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasil', Sort.asc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      thenByHasilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasil', Sort.desc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      thenByIsChecklist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChecklist', Sort.asc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      thenByIsChecklistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChecklist', Sort.desc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      thenByKeterangan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keterangan', Sort.asc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      thenByKeteranganDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keterangan', Sort.desc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      thenByKriteria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kriteria', Sort.asc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      thenByKriteriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kriteria', Sort.desc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      thenByOrderIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderIndex', Sort.asc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      thenByOrderIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderIndex', Sort.desc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      thenByUraian() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uraian', Sort.asc);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QAfterSortBy>
      thenByUraianDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uraian', Sort.desc);
    });
  }
}

extension PointChecklistDBQueryWhereDistinct
    on QueryBuilder<PointChecklistDB, PointChecklistDB, QDistinct> {
  QueryBuilder<PointChecklistDB, PointChecklistDB, QDistinct> distinctByHasil(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasil', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QDistinct>
      distinctByIsChecklist() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isChecklist');
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QDistinct>
      distinctByKeterangan({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keterangan', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QDistinct>
      distinctByKriteria({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kriteria', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QDistinct>
      distinctByOrderIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderIndex');
    });
  }

  QueryBuilder<PointChecklistDB, PointChecklistDB, QDistinct> distinctByUraian(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uraian', caseSensitive: caseSensitive);
    });
  }
}

extension PointChecklistDBQueryProperty
    on QueryBuilder<PointChecklistDB, PointChecklistDB, QQueryProperty> {
  QueryBuilder<PointChecklistDB, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PointChecklistDB, String, QQueryOperations> hasilProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasil');
    });
  }

  QueryBuilder<PointChecklistDB, bool, QQueryOperations> isChecklistProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isChecklist');
    });
  }

  QueryBuilder<PointChecklistDB, String?, QQueryOperations>
      keteranganProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keterangan');
    });
  }

  QueryBuilder<PointChecklistDB, String?, QQueryOperations> kriteriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kriteria');
    });
  }

  QueryBuilder<PointChecklistDB, int, QQueryOperations> orderIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderIndex');
    });
  }

  QueryBuilder<PointChecklistDB, String, QQueryOperations> uraianProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uraian');
    });
  }
}
