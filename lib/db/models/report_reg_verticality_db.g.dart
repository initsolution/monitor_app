// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_reg_verticality_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReportRegVerticalityDBCollection on Isar {
  IsarCollection<ReportRegVerticalityDB> get report_verticality =>
      this.collection();
}

const ReportRegVerticalityDBSchema = CollectionSchema(
  name: r'report_verticality',
  id: 6306116960384190555,
  properties: {
    r'alatUkur': PropertySchema(
      id: 0,
      name: r'alatUkur',
      type: IsarType.string,
    ),
    r'horizontalityAb': PropertySchema(
      id: 1,
      name: r'horizontalityAb',
      type: IsarType.long,
    ),
    r'horizontalityBc': PropertySchema(
      id: 2,
      name: r'horizontalityBc',
      type: IsarType.long,
    ),
    r'horizontalityCd': PropertySchema(
      id: 3,
      name: r'horizontalityCd',
      type: IsarType.long,
    ),
    r'horizontalityDa': PropertySchema(
      id: 4,
      name: r'horizontalityDa',
      type: IsarType.long,
    ),
    r'theodolite1': PropertySchema(
      id: 5,
      name: r'theodolite1',
      type: IsarType.string,
    ),
    r'theodolite2': PropertySchema(
      id: 6,
      name: r'theodolite2',
      type: IsarType.string,
    ),
    r'toleransiKetegakan': PropertySchema(
      id: 7,
      name: r'toleransiKetegakan',
      type: IsarType.long,
    )
  },
  estimateSize: _reportRegVerticalityDBEstimateSize,
  serialize: _reportRegVerticalityDBSerialize,
  deserialize: _reportRegVerticalityDBDeserialize,
  deserializeProp: _reportRegVerticalityDBDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'valueVerticality': LinkSchema(
      id: -8553012056546847834,
      name: r'valueVerticality',
      target: r'value_verticality',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _reportRegVerticalityDBGetId,
  getLinks: _reportRegVerticalityDBGetLinks,
  attach: _reportRegVerticalityDBAttach,
  version: '3.1.0+1',
);

int _reportRegVerticalityDBEstimateSize(
  ReportRegVerticalityDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.alatUkur.length * 3;
  bytesCount += 3 + object.theodolite1.length * 3;
  bytesCount += 3 + object.theodolite2.length * 3;
  return bytesCount;
}

void _reportRegVerticalityDBSerialize(
  ReportRegVerticalityDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.alatUkur);
  writer.writeLong(offsets[1], object.horizontalityAb);
  writer.writeLong(offsets[2], object.horizontalityBc);
  writer.writeLong(offsets[3], object.horizontalityCd);
  writer.writeLong(offsets[4], object.horizontalityDa);
  writer.writeString(offsets[5], object.theodolite1);
  writer.writeString(offsets[6], object.theodolite2);
  writer.writeLong(offsets[7], object.toleransiKetegakan);
}

ReportRegVerticalityDB _reportRegVerticalityDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReportRegVerticalityDB(
    alatUkur: reader.readString(offsets[0]),
    horizontalityAb: reader.readLong(offsets[1]),
    horizontalityBc: reader.readLong(offsets[2]),
    horizontalityCd: reader.readLong(offsets[3]),
    horizontalityDa: reader.readLong(offsets[4]),
    id: id,
    theodolite1: reader.readString(offsets[5]),
    theodolite2: reader.readString(offsets[6]),
    toleransiKetegakan: reader.readLong(offsets[7]),
  );
  return object;
}

P _reportRegVerticalityDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _reportRegVerticalityDBGetId(ReportRegVerticalityDB object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _reportRegVerticalityDBGetLinks(
    ReportRegVerticalityDB object) {
  return [object.valueVerticality];
}

void _reportRegVerticalityDBAttach(
    IsarCollection<dynamic> col, Id id, ReportRegVerticalityDB object) {
  object.id = id;
  object.valueVerticality.attach(
      col, col.isar.collection<ValueVerticalityDB>(), r'valueVerticality', id);
}

extension ReportRegVerticalityDBQueryWhereSort
    on QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QWhere> {
  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReportRegVerticalityDBQueryWhere on QueryBuilder<
    ReportRegVerticalityDB, ReportRegVerticalityDB, QWhereClause> {
  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterWhereClause> idBetween(
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

extension ReportRegVerticalityDBQueryFilter on QueryBuilder<
    ReportRegVerticalityDB, ReportRegVerticalityDB, QFilterCondition> {
  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> alatUkurEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alatUkur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> alatUkurGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alatUkur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> alatUkurLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alatUkur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> alatUkurBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alatUkur',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> alatUkurStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alatUkur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> alatUkurEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alatUkur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
          QAfterFilterCondition>
      alatUkurContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alatUkur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
          QAfterFilterCondition>
      alatUkurMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alatUkur',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> alatUkurIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alatUkur',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> alatUkurIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alatUkur',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> horizontalityAbEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horizontalityAb',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> horizontalityAbGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horizontalityAb',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> horizontalityAbLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horizontalityAb',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> horizontalityAbBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horizontalityAb',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> horizontalityBcEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horizontalityBc',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> horizontalityBcGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horizontalityBc',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> horizontalityBcLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horizontalityBc',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> horizontalityBcBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horizontalityBc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> horizontalityCdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horizontalityCd',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> horizontalityCdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horizontalityCd',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> horizontalityCdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horizontalityCd',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> horizontalityCdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horizontalityCd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> horizontalityDaEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horizontalityDa',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> horizontalityDaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horizontalityDa',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> horizontalityDaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horizontalityDa',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> horizontalityDaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horizontalityDa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> theodolite1EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'theodolite1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> theodolite1GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'theodolite1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> theodolite1LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'theodolite1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> theodolite1Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'theodolite1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> theodolite1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'theodolite1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> theodolite1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'theodolite1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
          QAfterFilterCondition>
      theodolite1Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'theodolite1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
          QAfterFilterCondition>
      theodolite1Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'theodolite1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> theodolite1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'theodolite1',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> theodolite1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'theodolite1',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> theodolite2EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'theodolite2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> theodolite2GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'theodolite2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> theodolite2LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'theodolite2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> theodolite2Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'theodolite2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> theodolite2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'theodolite2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> theodolite2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'theodolite2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
          QAfterFilterCondition>
      theodolite2Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'theodolite2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
          QAfterFilterCondition>
      theodolite2Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'theodolite2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> theodolite2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'theodolite2',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> theodolite2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'theodolite2',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> toleransiKetegakanEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toleransiKetegakan',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> toleransiKetegakanGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toleransiKetegakan',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> toleransiKetegakanLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toleransiKetegakan',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> toleransiKetegakanBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toleransiKetegakan',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ReportRegVerticalityDBQueryObject on QueryBuilder<
    ReportRegVerticalityDB, ReportRegVerticalityDB, QFilterCondition> {}

extension ReportRegVerticalityDBQueryLinks on QueryBuilder<
    ReportRegVerticalityDB, ReportRegVerticalityDB, QFilterCondition> {
  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
          QAfterFilterCondition>
      valueVerticality(FilterQuery<ValueVerticalityDB> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'valueVerticality');
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> valueVerticalityLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'valueVerticality', length, true, length, true);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> valueVerticalityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'valueVerticality', 0, true, 0, true);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> valueVerticalityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'valueVerticality', 0, false, 999999, true);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> valueVerticalityLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'valueVerticality', 0, true, length, include);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> valueVerticalityLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'valueVerticality', length, include, 999999, true);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB,
      QAfterFilterCondition> valueVerticalityLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'valueVerticality', lower, includeLower, upper, includeUpper);
    });
  }
}

extension ReportRegVerticalityDBQuerySortBy
    on QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QSortBy> {
  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      sortByAlatUkur() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alatUkur', Sort.asc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      sortByAlatUkurDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alatUkur', Sort.desc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      sortByHorizontalityAb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horizontalityAb', Sort.asc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      sortByHorizontalityAbDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horizontalityAb', Sort.desc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      sortByHorizontalityBc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horizontalityBc', Sort.asc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      sortByHorizontalityBcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horizontalityBc', Sort.desc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      sortByHorizontalityCd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horizontalityCd', Sort.asc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      sortByHorizontalityCdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horizontalityCd', Sort.desc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      sortByHorizontalityDa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horizontalityDa', Sort.asc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      sortByHorizontalityDaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horizontalityDa', Sort.desc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      sortByTheodolite1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theodolite1', Sort.asc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      sortByTheodolite1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theodolite1', Sort.desc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      sortByTheodolite2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theodolite2', Sort.asc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      sortByTheodolite2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theodolite2', Sort.desc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      sortByToleransiKetegakan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toleransiKetegakan', Sort.asc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      sortByToleransiKetegakanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toleransiKetegakan', Sort.desc);
    });
  }
}

extension ReportRegVerticalityDBQuerySortThenBy on QueryBuilder<
    ReportRegVerticalityDB, ReportRegVerticalityDB, QSortThenBy> {
  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenByAlatUkur() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alatUkur', Sort.asc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenByAlatUkurDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alatUkur', Sort.desc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenByHorizontalityAb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horizontalityAb', Sort.asc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenByHorizontalityAbDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horizontalityAb', Sort.desc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenByHorizontalityBc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horizontalityBc', Sort.asc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenByHorizontalityBcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horizontalityBc', Sort.desc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenByHorizontalityCd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horizontalityCd', Sort.asc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenByHorizontalityCdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horizontalityCd', Sort.desc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenByHorizontalityDa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horizontalityDa', Sort.asc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenByHorizontalityDaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horizontalityDa', Sort.desc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenByTheodolite1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theodolite1', Sort.asc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenByTheodolite1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theodolite1', Sort.desc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenByTheodolite2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theodolite2', Sort.asc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenByTheodolite2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theodolite2', Sort.desc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenByToleransiKetegakan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toleransiKetegakan', Sort.asc);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QAfterSortBy>
      thenByToleransiKetegakanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toleransiKetegakan', Sort.desc);
    });
  }
}

extension ReportRegVerticalityDBQueryWhereDistinct
    on QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QDistinct> {
  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QDistinct>
      distinctByAlatUkur({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alatUkur', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QDistinct>
      distinctByHorizontalityAb() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horizontalityAb');
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QDistinct>
      distinctByHorizontalityBc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horizontalityBc');
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QDistinct>
      distinctByHorizontalityCd() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horizontalityCd');
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QDistinct>
      distinctByHorizontalityDa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horizontalityDa');
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QDistinct>
      distinctByTheodolite1({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'theodolite1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QDistinct>
      distinctByTheodolite2({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'theodolite2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReportRegVerticalityDB, ReportRegVerticalityDB, QDistinct>
      distinctByToleransiKetegakan() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toleransiKetegakan');
    });
  }
}

extension ReportRegVerticalityDBQueryProperty on QueryBuilder<
    ReportRegVerticalityDB, ReportRegVerticalityDB, QQueryProperty> {
  QueryBuilder<ReportRegVerticalityDB, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReportRegVerticalityDB, String, QQueryOperations>
      alatUkurProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alatUkur');
    });
  }

  QueryBuilder<ReportRegVerticalityDB, int, QQueryOperations>
      horizontalityAbProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horizontalityAb');
    });
  }

  QueryBuilder<ReportRegVerticalityDB, int, QQueryOperations>
      horizontalityBcProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horizontalityBc');
    });
  }

  QueryBuilder<ReportRegVerticalityDB, int, QQueryOperations>
      horizontalityCdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horizontalityCd');
    });
  }

  QueryBuilder<ReportRegVerticalityDB, int, QQueryOperations>
      horizontalityDaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horizontalityDa');
    });
  }

  QueryBuilder<ReportRegVerticalityDB, String, QQueryOperations>
      theodolite1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'theodolite1');
    });
  }

  QueryBuilder<ReportRegVerticalityDB, String, QQueryOperations>
      theodolite2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'theodolite2');
    });
  }

  QueryBuilder<ReportRegVerticalityDB, int, QQueryOperations>
      toleransiKetegakanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toleransiKetegakan');
    });
  }
}
