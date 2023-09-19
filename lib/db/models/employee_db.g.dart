// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEmployeeDBCollection on Isar {
  IsarCollection<EmployeeDB> get employees => this.collection();
}

const EmployeeDBSchema = CollectionSchema(
  name: r'employees',
  id: -8188326243110883921,
  properties: {
    r'email': PropertySchema(
      id: 0,
      name: r'email',
      type: IsarType.string,
    ),
    r'hp': PropertySchema(
      id: 1,
      name: r'hp',
      type: IsarType.string,
    ),
    r'instansi': PropertySchema(
      id: 2,
      name: r'instansi',
      type: IsarType.string,
    ),
    r'isVendor': PropertySchema(
      id: 3,
      name: r'isVendor',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'nik': PropertySchema(
      id: 5,
      name: r'nik',
      type: IsarType.string,
    ),
    r'urlEsign': PropertySchema(
      id: 6,
      name: r'urlEsign',
      type: IsarType.string,
    )
  },
  estimateSize: _employeeDBEstimateSize,
  serialize: _employeeDBSerialize,
  deserialize: _employeeDBDeserialize,
  deserializeProp: _employeeDBDeserializeProp,
  idName: r'id',
  indexes: {
    r'nik': IndexSchema(
      id: -2798383488431574380,
      name: r'nik',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'nik',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _employeeDBGetId,
  getLinks: _employeeDBGetLinks,
  attach: _employeeDBAttach,
  version: '3.1.0+1',
);

int _employeeDBEstimateSize(
  EmployeeDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.email.length * 3;
  {
    final value = object.hp;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.instansi;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.nik.length * 3;
  {
    final value = object.urlEsign;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _employeeDBSerialize(
  EmployeeDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.email);
  writer.writeString(offsets[1], object.hp);
  writer.writeString(offsets[2], object.instansi);
  writer.writeBool(offsets[3], object.isVendor);
  writer.writeString(offsets[4], object.name);
  writer.writeString(offsets[5], object.nik);
  writer.writeString(offsets[6], object.urlEsign);
}

EmployeeDB _employeeDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EmployeeDB();
  object.email = reader.readString(offsets[0]);
  object.hp = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.instansi = reader.readStringOrNull(offsets[2]);
  object.isVendor = reader.readBool(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.nik = reader.readString(offsets[5]);
  object.urlEsign = reader.readStringOrNull(offsets[6]);
  return object;
}

P _employeeDBDeserializeProp<P>(
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
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _employeeDBGetId(EmployeeDB object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _employeeDBGetLinks(EmployeeDB object) {
  return [];
}

void _employeeDBAttach(IsarCollection<dynamic> col, Id id, EmployeeDB object) {
  object.id = id;
}

extension EmployeeDBByIndex on IsarCollection<EmployeeDB> {
  Future<EmployeeDB?> getByNik(String nik) {
    return getByIndex(r'nik', [nik]);
  }

  EmployeeDB? getByNikSync(String nik) {
    return getByIndexSync(r'nik', [nik]);
  }

  Future<bool> deleteByNik(String nik) {
    return deleteByIndex(r'nik', [nik]);
  }

  bool deleteByNikSync(String nik) {
    return deleteByIndexSync(r'nik', [nik]);
  }

  Future<List<EmployeeDB?>> getAllByNik(List<String> nikValues) {
    final values = nikValues.map((e) => [e]).toList();
    return getAllByIndex(r'nik', values);
  }

  List<EmployeeDB?> getAllByNikSync(List<String> nikValues) {
    final values = nikValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'nik', values);
  }

  Future<int> deleteAllByNik(List<String> nikValues) {
    final values = nikValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'nik', values);
  }

  int deleteAllByNikSync(List<String> nikValues) {
    final values = nikValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'nik', values);
  }

  Future<Id> putByNik(EmployeeDB object) {
    return putByIndex(r'nik', object);
  }

  Id putByNikSync(EmployeeDB object, {bool saveLinks = true}) {
    return putByIndexSync(r'nik', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByNik(List<EmployeeDB> objects) {
    return putAllByIndex(r'nik', objects);
  }

  List<Id> putAllByNikSync(List<EmployeeDB> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'nik', objects, saveLinks: saveLinks);
  }
}

extension EmployeeDBQueryWhereSort
    on QueryBuilder<EmployeeDB, EmployeeDB, QWhere> {
  QueryBuilder<EmployeeDB, EmployeeDB, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EmployeeDBQueryWhere
    on QueryBuilder<EmployeeDB, EmployeeDB, QWhereClause> {
  QueryBuilder<EmployeeDB, EmployeeDB, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterWhereClause> idBetween(
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

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterWhereClause> nikEqualTo(
      String nik) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nik',
        value: [nik],
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterWhereClause> nikNotEqualTo(
      String nik) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nik',
              lower: [],
              upper: [nik],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nik',
              lower: [nik],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nik',
              lower: [nik],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nik',
              lower: [],
              upper: [nik],
              includeUpper: false,
            ));
      }
    });
  }
}

extension EmployeeDBQueryFilter
    on QueryBuilder<EmployeeDB, EmployeeDB, QFilterCondition> {
  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> emailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> emailGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> emailLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> emailBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> hpIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hp',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> hpIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hp',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> hpEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> hpGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> hpLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> hpBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> hpStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> hpEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> hpContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> hpMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> hpIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hp',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> hpIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hp',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> idBetween(
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

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> instansiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'instansi',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition>
      instansiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'instansi',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> instansiEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instansi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition>
      instansiGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'instansi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> instansiLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'instansi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> instansiBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'instansi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition>
      instansiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'instansi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> instansiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'instansi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> instansiContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'instansi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> instansiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'instansi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition>
      instansiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instansi',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition>
      instansiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'instansi',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> isVendorEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isVendor',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nikEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nikGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nikLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nikBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nik',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nikStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nikEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nikContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nikMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nik',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nikIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nik',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> nikIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nik',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> urlEsignIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'urlEsign',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition>
      urlEsignIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'urlEsign',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> urlEsignEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'urlEsign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition>
      urlEsignGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'urlEsign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> urlEsignLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'urlEsign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> urlEsignBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'urlEsign',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition>
      urlEsignStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'urlEsign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> urlEsignEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'urlEsign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> urlEsignContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'urlEsign',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition> urlEsignMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'urlEsign',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition>
      urlEsignIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'urlEsign',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterFilterCondition>
      urlEsignIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'urlEsign',
        value: '',
      ));
    });
  }
}

extension EmployeeDBQueryObject
    on QueryBuilder<EmployeeDB, EmployeeDB, QFilterCondition> {}

extension EmployeeDBQueryLinks
    on QueryBuilder<EmployeeDB, EmployeeDB, QFilterCondition> {}

extension EmployeeDBQuerySortBy
    on QueryBuilder<EmployeeDB, EmployeeDB, QSortBy> {
  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> sortByHp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hp', Sort.asc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> sortByHpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hp', Sort.desc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> sortByInstansi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instansi', Sort.asc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> sortByInstansiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instansi', Sort.desc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> sortByIsVendor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVendor', Sort.asc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> sortByIsVendorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVendor', Sort.desc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> sortByNik() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nik', Sort.asc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> sortByNikDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nik', Sort.desc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> sortByUrlEsign() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlEsign', Sort.asc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> sortByUrlEsignDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlEsign', Sort.desc);
    });
  }
}

extension EmployeeDBQuerySortThenBy
    on QueryBuilder<EmployeeDB, EmployeeDB, QSortThenBy> {
  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> thenByHp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hp', Sort.asc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> thenByHpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hp', Sort.desc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> thenByInstansi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instansi', Sort.asc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> thenByInstansiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instansi', Sort.desc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> thenByIsVendor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVendor', Sort.asc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> thenByIsVendorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVendor', Sort.desc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> thenByNik() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nik', Sort.asc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> thenByNikDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nik', Sort.desc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> thenByUrlEsign() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlEsign', Sort.asc);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QAfterSortBy> thenByUrlEsignDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urlEsign', Sort.desc);
    });
  }
}

extension EmployeeDBQueryWhereDistinct
    on QueryBuilder<EmployeeDB, EmployeeDB, QDistinct> {
  QueryBuilder<EmployeeDB, EmployeeDB, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QDistinct> distinctByHp(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hp', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QDistinct> distinctByInstansi(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'instansi', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QDistinct> distinctByIsVendor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isVendor');
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QDistinct> distinctByNik(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nik', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeDB, EmployeeDB, QDistinct> distinctByUrlEsign(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'urlEsign', caseSensitive: caseSensitive);
    });
  }
}

extension EmployeeDBQueryProperty
    on QueryBuilder<EmployeeDB, EmployeeDB, QQueryProperty> {
  QueryBuilder<EmployeeDB, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EmployeeDB, String, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<EmployeeDB, String?, QQueryOperations> hpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hp');
    });
  }

  QueryBuilder<EmployeeDB, String?, QQueryOperations> instansiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instansi');
    });
  }

  QueryBuilder<EmployeeDB, bool, QQueryOperations> isVendorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isVendor');
    });
  }

  QueryBuilder<EmployeeDB, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<EmployeeDB, String, QQueryOperations> nikProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nik');
    });
  }

  QueryBuilder<EmployeeDB, String?, QQueryOperations> urlEsignProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'urlEsign');
    });
  }
}
