// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value_verticality_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetValueVerticalityDBCollection on Isar {
  IsarCollection<ValueVerticalityDB> get value_verticality => this.collection();
}

const ValueVerticalityDBSchema = CollectionSchema(
  name: r'value_verticality',
  id: 6035498643041231087,
  properties: {
    r'miringKe': PropertySchema(
      id: 0,
      name: r'miringKe',
      type: IsarType.string,
    ),
    r'section': PropertySchema(
      id: 1,
      name: r'section',
      type: IsarType.long,
    ),
    r'theodoliteIndex': PropertySchema(
      id: 2,
      name: r'theodoliteIndex',
      type: IsarType.long,
    ),
    r'value': PropertySchema(
      id: 3,
      name: r'value',
      type: IsarType.long,
    )
  },
  estimateSize: _valueVerticalityDBEstimateSize,
  serialize: _valueVerticalityDBSerialize,
  deserialize: _valueVerticalityDBDeserialize,
  deserializeProp: _valueVerticalityDBDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _valueVerticalityDBGetId,
  getLinks: _valueVerticalityDBGetLinks,
  attach: _valueVerticalityDBAttach,
  version: '3.1.0+1',
);

int _valueVerticalityDBEstimateSize(
  ValueVerticalityDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.miringKe.length * 3;
  return bytesCount;
}

void _valueVerticalityDBSerialize(
  ValueVerticalityDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.miringKe);
  writer.writeLong(offsets[1], object.section);
  writer.writeLong(offsets[2], object.theodoliteIndex);
  writer.writeLong(offsets[3], object.value);
}

ValueVerticalityDB _valueVerticalityDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ValueVerticalityDB(
    id: id,
    miringKe: reader.readString(offsets[0]),
    section: reader.readLong(offsets[1]),
    theodoliteIndex: reader.readLong(offsets[2]),
    value: reader.readLong(offsets[3]),
  );
  return object;
}

P _valueVerticalityDBDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _valueVerticalityDBGetId(ValueVerticalityDB object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _valueVerticalityDBGetLinks(
    ValueVerticalityDB object) {
  return [];
}

void _valueVerticalityDBAttach(
    IsarCollection<dynamic> col, Id id, ValueVerticalityDB object) {
  object.id = id;
}

extension ValueVerticalityDBQueryWhereSort
    on QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QWhere> {
  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ValueVerticalityDBQueryWhere
    on QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QWhereClause> {
  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterWhereClause>
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

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterWhereClause>
      idBetween(
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

extension ValueVerticalityDBQueryFilter
    on QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QFilterCondition> {
  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
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

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
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

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
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

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      miringKeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'miringKe',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      miringKeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'miringKe',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      miringKeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'miringKe',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      miringKeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'miringKe',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      miringKeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'miringKe',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      miringKeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'miringKe',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      miringKeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'miringKe',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      miringKeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'miringKe',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      miringKeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'miringKe',
        value: '',
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      miringKeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'miringKe',
        value: '',
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      sectionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'section',
        value: value,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      sectionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'section',
        value: value,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      sectionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'section',
        value: value,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      sectionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'section',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      theodoliteIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'theodoliteIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      theodoliteIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'theodoliteIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      theodoliteIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'theodoliteIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      theodoliteIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'theodoliteIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      valueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      valueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      valueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
      ));
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterFilterCondition>
      valueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ValueVerticalityDBQueryObject
    on QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QFilterCondition> {}

extension ValueVerticalityDBQueryLinks
    on QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QFilterCondition> {}

extension ValueVerticalityDBQuerySortBy
    on QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QSortBy> {
  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      sortByMiringKe() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miringKe', Sort.asc);
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      sortByMiringKeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miringKe', Sort.desc);
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      sortBySection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.asc);
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      sortBySectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.desc);
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      sortByTheodoliteIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theodoliteIndex', Sort.asc);
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      sortByTheodoliteIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theodoliteIndex', Sort.desc);
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension ValueVerticalityDBQuerySortThenBy
    on QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QSortThenBy> {
  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      thenByMiringKe() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miringKe', Sort.asc);
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      thenByMiringKeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miringKe', Sort.desc);
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      thenBySection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.asc);
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      thenBySectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.desc);
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      thenByTheodoliteIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theodoliteIndex', Sort.asc);
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      thenByTheodoliteIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'theodoliteIndex', Sort.desc);
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QAfterSortBy>
      thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension ValueVerticalityDBQueryWhereDistinct
    on QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QDistinct> {
  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QDistinct>
      distinctByMiringKe({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'miringKe', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QDistinct>
      distinctBySection() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'section');
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QDistinct>
      distinctByTheodoliteIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'theodoliteIndex');
    });
  }

  QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QDistinct>
      distinctByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'value');
    });
  }
}

extension ValueVerticalityDBQueryProperty
    on QueryBuilder<ValueVerticalityDB, ValueVerticalityDB, QQueryProperty> {
  QueryBuilder<ValueVerticalityDB, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ValueVerticalityDB, String, QQueryOperations>
      miringKeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'miringKe');
    });
  }

  QueryBuilder<ValueVerticalityDB, int, QQueryOperations> sectionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'section');
    });
  }

  QueryBuilder<ValueVerticalityDB, int, QQueryOperations>
      theodoliteIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'theodoliteIndex');
    });
  }

  QueryBuilder<ValueVerticalityDB, int, QQueryOperations> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'value');
    });
  }
}
