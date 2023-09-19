// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaskDBCollection on Isar {
  IsarCollection<TaskDB> get tasks => this.collection();
}

const TaskDBSchema = CollectionSchema(
  name: r'tasks',
  id: -1059002862309002494,
  properties: {
    r'createdDate': PropertySchema(
      id: 0,
      name: r'createdDate',
      type: IsarType.string,
    ),
    r'idTask': PropertySchema(
      id: 1,
      name: r'idTask',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 2,
      name: r'status',
      type: IsarType.string,
    ),
    r'submitedDate': PropertySchema(
      id: 3,
      name: r'submitedDate',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.string,
    ),
    r'verifiedDate': PropertySchema(
      id: 5,
      name: r'verifiedDate',
      type: IsarType.string,
    )
  },
  estimateSize: _taskDBEstimateSize,
  serialize: _taskDBSerialize,
  deserialize: _taskDBDeserialize,
  deserializeProp: _taskDBDeserializeProp,
  idName: r'id',
  indexes: {
    r'idTask': IndexSchema(
      id: -8834540920739767380,
      name: r'idTask',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'idTask',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'site': LinkSchema(
      id: 409231180248081242,
      name: r'site',
      target: r'sites',
      single: true,
    ),
    r'verifierEmployee': LinkSchema(
      id: -6372009146598541000,
      name: r'verifierEmployee',
      target: r'employees',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _taskDBGetId,
  getLinks: _taskDBGetLinks,
  attach: _taskDBAttach,
  version: '3.1.0+1',
);

int _taskDBEstimateSize(
  TaskDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.createdDate.length * 3;
  bytesCount += 3 + object.status.length * 3;
  {
    final value = object.submitedDate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.type.length * 3;
  {
    final value = object.verifiedDate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _taskDBSerialize(
  TaskDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.createdDate);
  writer.writeLong(offsets[1], object.idTask);
  writer.writeString(offsets[2], object.status);
  writer.writeString(offsets[3], object.submitedDate);
  writer.writeString(offsets[4], object.type);
  writer.writeString(offsets[5], object.verifiedDate);
}

TaskDB _taskDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaskDB();
  object.createdDate = reader.readString(offsets[0]);
  object.id = id;
  object.idTask = reader.readLong(offsets[1]);
  object.status = reader.readString(offsets[2]);
  object.submitedDate = reader.readStringOrNull(offsets[3]);
  object.type = reader.readString(offsets[4]);
  object.verifiedDate = reader.readStringOrNull(offsets[5]);
  return object;
}

P _taskDBDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taskDBGetId(TaskDB object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taskDBGetLinks(TaskDB object) {
  return [object.site, object.verifierEmployee];
}

void _taskDBAttach(IsarCollection<dynamic> col, Id id, TaskDB object) {
  object.id = id;
  object.site.attach(col, col.isar.collection<SiteDB>(), r'site', id);
  object.verifierEmployee
      .attach(col, col.isar.collection<EmployeeDB>(), r'verifierEmployee', id);
}

extension TaskDBByIndex on IsarCollection<TaskDB> {
  Future<TaskDB?> getByIdTask(int idTask) {
    return getByIndex(r'idTask', [idTask]);
  }

  TaskDB? getByIdTaskSync(int idTask) {
    return getByIndexSync(r'idTask', [idTask]);
  }

  Future<bool> deleteByIdTask(int idTask) {
    return deleteByIndex(r'idTask', [idTask]);
  }

  bool deleteByIdTaskSync(int idTask) {
    return deleteByIndexSync(r'idTask', [idTask]);
  }

  Future<List<TaskDB?>> getAllByIdTask(List<int> idTaskValues) {
    final values = idTaskValues.map((e) => [e]).toList();
    return getAllByIndex(r'idTask', values);
  }

  List<TaskDB?> getAllByIdTaskSync(List<int> idTaskValues) {
    final values = idTaskValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'idTask', values);
  }

  Future<int> deleteAllByIdTask(List<int> idTaskValues) {
    final values = idTaskValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'idTask', values);
  }

  int deleteAllByIdTaskSync(List<int> idTaskValues) {
    final values = idTaskValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'idTask', values);
  }

  Future<Id> putByIdTask(TaskDB object) {
    return putByIndex(r'idTask', object);
  }

  Id putByIdTaskSync(TaskDB object, {bool saveLinks = true}) {
    return putByIndexSync(r'idTask', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdTask(List<TaskDB> objects) {
    return putAllByIndex(r'idTask', objects);
  }

  List<Id> putAllByIdTaskSync(List<TaskDB> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'idTask', objects, saveLinks: saveLinks);
  }
}

extension TaskDBQueryWhereSort on QueryBuilder<TaskDB, TaskDB, QWhere> {
  QueryBuilder<TaskDB, TaskDB, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterWhere> anyIdTask() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idTask'),
      );
    });
  }
}

extension TaskDBQueryWhere on QueryBuilder<TaskDB, TaskDB, QWhereClause> {
  QueryBuilder<TaskDB, TaskDB, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<TaskDB, TaskDB, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterWhereClause> idBetween(
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

  QueryBuilder<TaskDB, TaskDB, QAfterWhereClause> idTaskEqualTo(int idTask) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idTask',
        value: [idTask],
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterWhereClause> idTaskNotEqualTo(int idTask) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idTask',
              lower: [],
              upper: [idTask],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idTask',
              lower: [idTask],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idTask',
              lower: [idTask],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idTask',
              lower: [],
              upper: [idTask],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterWhereClause> idTaskGreaterThan(
    int idTask, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idTask',
        lower: [idTask],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterWhereClause> idTaskLessThan(
    int idTask, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idTask',
        lower: [],
        upper: [idTask],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterWhereClause> idTaskBetween(
    int lowerIdTask,
    int upperIdTask, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idTask',
        lower: [lowerIdTask],
        includeLower: includeLower,
        upper: [upperIdTask],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TaskDBQueryFilter on QueryBuilder<TaskDB, TaskDB, QFilterCondition> {
  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> createdDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> createdDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> createdDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> createdDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> createdDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createdDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> createdDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createdDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> createdDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> createdDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> createdDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdDate',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> createdDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdDate',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> idTaskEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idTask',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> idTaskGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idTask',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> idTaskLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idTask',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> idTaskBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idTask',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> submitedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'submitedDate',
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> submitedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'submitedDate',
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> submitedDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'submitedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> submitedDateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'submitedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> submitedDateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'submitedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> submitedDateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'submitedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> submitedDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'submitedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> submitedDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'submitedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> submitedDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'submitedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> submitedDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'submitedDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> submitedDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'submitedDate',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> submitedDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'submitedDate',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> typeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> verifiedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'verifiedDate',
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> verifiedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'verifiedDate',
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> verifiedDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verifiedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> verifiedDateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'verifiedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> verifiedDateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'verifiedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> verifiedDateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'verifiedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> verifiedDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'verifiedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> verifiedDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'verifiedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> verifiedDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'verifiedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> verifiedDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'verifiedDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> verifiedDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verifiedDate',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> verifiedDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'verifiedDate',
        value: '',
      ));
    });
  }
}

extension TaskDBQueryObject on QueryBuilder<TaskDB, TaskDB, QFilterCondition> {}

extension TaskDBQueryLinks on QueryBuilder<TaskDB, TaskDB, QFilterCondition> {
  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> site(
      FilterQuery<SiteDB> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'site');
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> siteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'site', 0, true, 0, true);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> verifierEmployee(
      FilterQuery<EmployeeDB> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'verifierEmployee');
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterFilterCondition> verifierEmployeeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'verifierEmployee', 0, true, 0, true);
    });
  }
}

extension TaskDBQuerySortBy on QueryBuilder<TaskDB, TaskDB, QSortBy> {
  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> sortByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.asc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> sortByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.desc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> sortByIdTask() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTask', Sort.asc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> sortByIdTaskDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTask', Sort.desc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> sortBySubmitedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submitedDate', Sort.asc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> sortBySubmitedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submitedDate', Sort.desc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> sortByVerifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifiedDate', Sort.asc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> sortByVerifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifiedDate', Sort.desc);
    });
  }
}

extension TaskDBQuerySortThenBy on QueryBuilder<TaskDB, TaskDB, QSortThenBy> {
  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> thenByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.asc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> thenByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.desc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> thenByIdTask() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTask', Sort.asc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> thenByIdTaskDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idTask', Sort.desc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> thenBySubmitedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submitedDate', Sort.asc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> thenBySubmitedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submitedDate', Sort.desc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> thenByVerifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifiedDate', Sort.asc);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QAfterSortBy> thenByVerifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifiedDate', Sort.desc);
    });
  }
}

extension TaskDBQueryWhereDistinct on QueryBuilder<TaskDB, TaskDB, QDistinct> {
  QueryBuilder<TaskDB, TaskDB, QDistinct> distinctByCreatedDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QDistinct> distinctByIdTask() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idTask');
    });
  }

  QueryBuilder<TaskDB, TaskDB, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QDistinct> distinctBySubmitedDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'submitedDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskDB, TaskDB, QDistinct> distinctByVerifiedDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verifiedDate', caseSensitive: caseSensitive);
    });
  }
}

extension TaskDBQueryProperty on QueryBuilder<TaskDB, TaskDB, QQueryProperty> {
  QueryBuilder<TaskDB, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TaskDB, String, QQueryOperations> createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdDate');
    });
  }

  QueryBuilder<TaskDB, int, QQueryOperations> idTaskProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idTask');
    });
  }

  QueryBuilder<TaskDB, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<TaskDB, String?, QQueryOperations> submitedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'submitedDate');
    });
  }

  QueryBuilder<TaskDB, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<TaskDB, String?, QQueryOperations> verifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verifiedDate');
    });
  }
}
