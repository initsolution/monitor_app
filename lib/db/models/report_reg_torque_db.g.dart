// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_reg_torque_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReportRegTorqueDBCollection on Isar {
  IsarCollection<ReportRegTorqueDB> get report_torque => this.collection();
}

const ReportRegTorqueDBSchema = CollectionSchema(
  name: r'report_torque',
  id: 4649387528901511059,
  properties: {
    r'boltSize': PropertySchema(
      id: 0,
      name: r'boltSize',
      type: IsarType.string,
    ),
    r'elevasi': PropertySchema(
      id: 1,
      name: r'elevasi',
      type: IsarType.long,
    ),
    r'minimumTorque': PropertySchema(
      id: 2,
      name: r'minimumTorque',
      type: IsarType.long,
    ),
    r'orderIndex': PropertySchema(
      id: 3,
      name: r'orderIndex',
      type: IsarType.long,
    ),
    r'qtyBolt': PropertySchema(
      id: 4,
      name: r'qtyBolt',
      type: IsarType.long,
    ),
    r'remark': PropertySchema(
      id: 5,
      name: r'remark',
      type: IsarType.string,
    ),
    r'towerSegment': PropertySchema(
      id: 6,
      name: r'towerSegment',
      type: IsarType.string,
    )
  },
  estimateSize: _reportRegTorqueDBEstimateSize,
  serialize: _reportRegTorqueDBSerialize,
  deserialize: _reportRegTorqueDBDeserialize,
  deserializeProp: _reportRegTorqueDBDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _reportRegTorqueDBGetId,
  getLinks: _reportRegTorqueDBGetLinks,
  attach: _reportRegTorqueDBAttach,
  version: '3.1.0+1',
);

int _reportRegTorqueDBEstimateSize(
  ReportRegTorqueDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.boltSize.length * 3;
  {
    final value = object.remark;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.towerSegment.length * 3;
  return bytesCount;
}

void _reportRegTorqueDBSerialize(
  ReportRegTorqueDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.boltSize);
  writer.writeLong(offsets[1], object.elevasi);
  writer.writeLong(offsets[2], object.minimumTorque);
  writer.writeLong(offsets[3], object.orderIndex);
  writer.writeLong(offsets[4], object.qtyBolt);
  writer.writeString(offsets[5], object.remark);
  writer.writeString(offsets[6], object.towerSegment);
}

ReportRegTorqueDB _reportRegTorqueDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReportRegTorqueDB(
    boltSize: reader.readString(offsets[0]),
    elevasi: reader.readLong(offsets[1]),
    id: id,
    minimumTorque: reader.readLong(offsets[2]),
    orderIndex: reader.readLongOrNull(offsets[3]),
    qtyBolt: reader.readLong(offsets[4]),
    remark: reader.readStringOrNull(offsets[5]),
    towerSegment: reader.readString(offsets[6]),
  );
  return object;
}

P _reportRegTorqueDBDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _reportRegTorqueDBGetId(ReportRegTorqueDB object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _reportRegTorqueDBGetLinks(
    ReportRegTorqueDB object) {
  return [];
}

void _reportRegTorqueDBAttach(
    IsarCollection<dynamic> col, Id id, ReportRegTorqueDB object) {
  object.id = id;
}

extension ReportRegTorqueDBQueryWhereSort
    on QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QWhere> {
  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReportRegTorqueDBQueryWhere
    on QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QWhereClause> {
  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterWhereClause>
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

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterWhereClause>
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

extension ReportRegTorqueDBQueryFilter
    on QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QFilterCondition> {
  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      boltSizeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'boltSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      boltSizeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'boltSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      boltSizeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'boltSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      boltSizeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'boltSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      boltSizeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'boltSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      boltSizeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'boltSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      boltSizeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'boltSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      boltSizeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'boltSize',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      boltSizeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'boltSize',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      boltSizeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'boltSize',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      elevasiEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elevasi',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      elevasiGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'elevasi',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      elevasiLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'elevasi',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      elevasiBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'elevasi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
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

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
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

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
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

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      minimumTorqueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minimumTorque',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      minimumTorqueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minimumTorque',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      minimumTorqueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minimumTorque',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      minimumTorqueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minimumTorque',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      orderIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'orderIndex',
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      orderIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'orderIndex',
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      orderIndexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      orderIndexGreaterThan(
    int? value, {
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

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      orderIndexLessThan(
    int? value, {
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

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      orderIndexBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      qtyBoltEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyBolt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      qtyBoltGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyBolt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      qtyBoltLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyBolt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      qtyBoltBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyBolt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      remarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      remarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      remarkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      remarkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      remarkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      remarkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remark',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      remarkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      remarkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      remarkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      remarkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remark',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      remarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      remarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      towerSegmentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'towerSegment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      towerSegmentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'towerSegment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      towerSegmentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'towerSegment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      towerSegmentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'towerSegment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      towerSegmentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'towerSegment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      towerSegmentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'towerSegment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      towerSegmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'towerSegment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      towerSegmentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'towerSegment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      towerSegmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'towerSegment',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterFilterCondition>
      towerSegmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'towerSegment',
        value: '',
      ));
    });
  }
}

extension ReportRegTorqueDBQueryObject
    on QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QFilterCondition> {}

extension ReportRegTorqueDBQueryLinks
    on QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QFilterCondition> {}

extension ReportRegTorqueDBQuerySortBy
    on QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QSortBy> {
  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      sortByBoltSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boltSize', Sort.asc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      sortByBoltSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boltSize', Sort.desc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      sortByElevasi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elevasi', Sort.asc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      sortByElevasiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elevasi', Sort.desc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      sortByMinimumTorque() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumTorque', Sort.asc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      sortByMinimumTorqueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumTorque', Sort.desc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      sortByOrderIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderIndex', Sort.asc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      sortByOrderIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderIndex', Sort.desc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      sortByQtyBolt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyBolt', Sort.asc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      sortByQtyBoltDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyBolt', Sort.desc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      sortByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      sortByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      sortByTowerSegment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'towerSegment', Sort.asc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      sortByTowerSegmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'towerSegment', Sort.desc);
    });
  }
}

extension ReportRegTorqueDBQuerySortThenBy
    on QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QSortThenBy> {
  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      thenByBoltSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boltSize', Sort.asc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      thenByBoltSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boltSize', Sort.desc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      thenByElevasi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elevasi', Sort.asc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      thenByElevasiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elevasi', Sort.desc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      thenByMinimumTorque() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumTorque', Sort.asc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      thenByMinimumTorqueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumTorque', Sort.desc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      thenByOrderIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderIndex', Sort.asc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      thenByOrderIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderIndex', Sort.desc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      thenByQtyBolt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyBolt', Sort.asc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      thenByQtyBoltDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyBolt', Sort.desc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      thenByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      thenByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      thenByTowerSegment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'towerSegment', Sort.asc);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QAfterSortBy>
      thenByTowerSegmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'towerSegment', Sort.desc);
    });
  }
}

extension ReportRegTorqueDBQueryWhereDistinct
    on QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QDistinct> {
  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QDistinct>
      distinctByBoltSize({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'boltSize', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QDistinct>
      distinctByElevasi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'elevasi');
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QDistinct>
      distinctByMinimumTorque() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minimumTorque');
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QDistinct>
      distinctByOrderIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderIndex');
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QDistinct>
      distinctByQtyBolt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyBolt');
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QDistinct>
      distinctByRemark({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remark', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QDistinct>
      distinctByTowerSegment({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'towerSegment', caseSensitive: caseSensitive);
    });
  }
}

extension ReportRegTorqueDBQueryProperty
    on QueryBuilder<ReportRegTorqueDB, ReportRegTorqueDB, QQueryProperty> {
  QueryBuilder<ReportRegTorqueDB, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReportRegTorqueDB, String, QQueryOperations> boltSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'boltSize');
    });
  }

  QueryBuilder<ReportRegTorqueDB, int, QQueryOperations> elevasiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'elevasi');
    });
  }

  QueryBuilder<ReportRegTorqueDB, int, QQueryOperations>
      minimumTorqueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minimumTorque');
    });
  }

  QueryBuilder<ReportRegTorqueDB, int?, QQueryOperations> orderIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderIndex');
    });
  }

  QueryBuilder<ReportRegTorqueDB, int, QQueryOperations> qtyBoltProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyBolt');
    });
  }

  QueryBuilder<ReportRegTorqueDB, String?, QQueryOperations> remarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remark');
    });
  }

  QueryBuilder<ReportRegTorqueDB, String, QQueryOperations>
      towerSegmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'towerSegment');
    });
  }
}
