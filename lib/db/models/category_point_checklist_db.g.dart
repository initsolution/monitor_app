// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_point_checklist_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCategoryPointChecklistDBCollection on Isar {
  IsarCollection<CategoryPointChecklistDB> get category_point_checklist =>
      this.collection();
}

const CategoryPointChecklistDBSchema = CollectionSchema(
  name: r'category_point_checklist',
  id: 2157400024116030668,
  properties: {
    r'categoryName': PropertySchema(
      id: 0,
      name: r'categoryName',
      type: IsarType.string,
    ),
    r'keterangan': PropertySchema(
      id: 1,
      name: r'keterangan',
      type: IsarType.string,
    )
  },
  estimateSize: _categoryPointChecklistDBEstimateSize,
  serialize: _categoryPointChecklistDBSerialize,
  deserialize: _categoryPointChecklistDBDeserialize,
  deserializeProp: _categoryPointChecklistDBDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'points': LinkSchema(
      id: 9010815422969012521,
      name: r'points',
      target: r'point_checklist',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _categoryPointChecklistDBGetId,
  getLinks: _categoryPointChecklistDBGetLinks,
  attach: _categoryPointChecklistDBAttach,
  version: '3.1.0+1',
);

int _categoryPointChecklistDBEstimateSize(
  CategoryPointChecklistDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categoryName.length * 3;
  {
    final value = object.keterangan;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _categoryPointChecklistDBSerialize(
  CategoryPointChecklistDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.categoryName);
  writer.writeString(offsets[1], object.keterangan);
}

CategoryPointChecklistDB _categoryPointChecklistDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CategoryPointChecklistDB(
    categoryName: reader.readString(offsets[0]),
    keterangan: reader.readStringOrNull(offsets[1]),
  );
  object.id = id;
  return object;
}

P _categoryPointChecklistDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _categoryPointChecklistDBGetId(CategoryPointChecklistDB object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _categoryPointChecklistDBGetLinks(
    CategoryPointChecklistDB object) {
  return [object.points];
}

void _categoryPointChecklistDBAttach(
    IsarCollection<dynamic> col, Id id, CategoryPointChecklistDB object) {
  object.id = id;
  object.points
      .attach(col, col.isar.collection<PointChecklistDB>(), r'points', id);
}

extension CategoryPointChecklistDBQueryWhereSort on QueryBuilder<
    CategoryPointChecklistDB, CategoryPointChecklistDB, QWhere> {
  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CategoryPointChecklistDBQueryWhere on QueryBuilder<
    CategoryPointChecklistDB, CategoryPointChecklistDB, QWhereClause> {
  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
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

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
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

extension CategoryPointChecklistDBQueryFilter on QueryBuilder<
    CategoryPointChecklistDB, CategoryPointChecklistDB, QFilterCondition> {
  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> categoryNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> categoryNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> categoryNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> categoryNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> categoryNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> categoryNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
          QAfterFilterCondition>
      categoryNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
          QAfterFilterCondition>
      categoryNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoryName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> categoryNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> categoryNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
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

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> idLessThan(
    Id value, {
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

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> keteranganIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'keterangan',
      ));
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> keteranganIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'keterangan',
      ));
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> keteranganEqualTo(
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

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> keteranganGreaterThan(
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

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> keteranganLessThan(
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

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> keteranganBetween(
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

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> keteranganStartsWith(
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

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> keteranganEndsWith(
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

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
          QAfterFilterCondition>
      keteranganContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'keterangan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
          QAfterFilterCondition>
      keteranganMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'keterangan',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> keteranganIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keterangan',
        value: '',
      ));
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> keteranganIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'keterangan',
        value: '',
      ));
    });
  }
}

extension CategoryPointChecklistDBQueryObject on QueryBuilder<
    CategoryPointChecklistDB, CategoryPointChecklistDB, QFilterCondition> {}

extension CategoryPointChecklistDBQueryLinks on QueryBuilder<
    CategoryPointChecklistDB, CategoryPointChecklistDB, QFilterCondition> {
  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> points(FilterQuery<PointChecklistDB> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'points');
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> pointsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'points', length, true, length, true);
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> pointsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'points', 0, true, 0, true);
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> pointsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'points', 0, false, 999999, true);
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> pointsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'points', 0, true, length, include);
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> pointsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'points', length, include, 999999, true);
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB,
      QAfterFilterCondition> pointsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'points', lower, includeLower, upper, includeUpper);
    });
  }
}

extension CategoryPointChecklistDBQuerySortBy on QueryBuilder<
    CategoryPointChecklistDB, CategoryPointChecklistDB, QSortBy> {
  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB, QAfterSortBy>
      sortByCategoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryName', Sort.asc);
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB, QAfterSortBy>
      sortByCategoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryName', Sort.desc);
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB, QAfterSortBy>
      sortByKeterangan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keterangan', Sort.asc);
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB, QAfterSortBy>
      sortByKeteranganDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keterangan', Sort.desc);
    });
  }
}

extension CategoryPointChecklistDBQuerySortThenBy on QueryBuilder<
    CategoryPointChecklistDB, CategoryPointChecklistDB, QSortThenBy> {
  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB, QAfterSortBy>
      thenByCategoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryName', Sort.asc);
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB, QAfterSortBy>
      thenByCategoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryName', Sort.desc);
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB, QAfterSortBy>
      thenByKeterangan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keterangan', Sort.asc);
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB, QAfterSortBy>
      thenByKeteranganDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keterangan', Sort.desc);
    });
  }
}

extension CategoryPointChecklistDBQueryWhereDistinct on QueryBuilder<
    CategoryPointChecklistDB, CategoryPointChecklistDB, QDistinct> {
  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB, QDistinct>
      distinctByCategoryName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CategoryPointChecklistDB, CategoryPointChecklistDB, QDistinct>
      distinctByKeterangan({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keterangan', caseSensitive: caseSensitive);
    });
  }
}

extension CategoryPointChecklistDBQueryProperty on QueryBuilder<
    CategoryPointChecklistDB, CategoryPointChecklistDB, QQueryProperty> {
  QueryBuilder<CategoryPointChecklistDB, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CategoryPointChecklistDB, String, QQueryOperations>
      categoryNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryName');
    });
  }

  QueryBuilder<CategoryPointChecklistDB, String?, QQueryOperations>
      keteranganProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keterangan');
    });
  }
}
