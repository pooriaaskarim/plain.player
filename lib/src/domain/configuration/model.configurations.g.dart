// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.configurations.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetConfigurationsCollection on Isar {
  IsarCollection<Configurations> get configurations => this.collection();
}

const ConfigurationsSchema = CollectionSchema(
  name: r'Configurations',
  id: -5187627997376188390,
  properties: {},
  estimateSize: _configurationsEstimateSize,
  serialize: _configurationsSerialize,
  deserialize: _configurationsDeserialize,
  deserializeProp: _configurationsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _configurationsGetId,
  getLinks: _configurationsGetLinks,
  attach: _configurationsAttach,
  version: '3.0.5',
);

int _configurationsEstimateSize(
  Configurations object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _configurationsSerialize(
  Configurations object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
Configurations _configurationsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Configurations();
  return object;
}

P _configurationsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _configurationsGetId(Configurations object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _configurationsGetLinks(Configurations object) {
  return [];
}

void _configurationsAttach(
    IsarCollection<dynamic> col, Id id, Configurations object) {}

extension ConfigurationsQueryWhereSort
    on QueryBuilder<Configurations, Configurations, QWhere> {
  QueryBuilder<Configurations, Configurations, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ConfigurationsQueryWhere
    on QueryBuilder<Configurations, Configurations, QWhereClause> {
  QueryBuilder<Configurations, Configurations, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Configurations, Configurations, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<Configurations, Configurations, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Configurations, Configurations, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Configurations, Configurations, QAfterWhereClause> idBetween(
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

extension ConfigurationsQueryFilter
    on QueryBuilder<Configurations, Configurations, QFilterCondition> {
  QueryBuilder<Configurations, Configurations, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Configurations, Configurations, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<Configurations, Configurations, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<Configurations, Configurations, QAfterFilterCondition> idBetween(
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
}

extension ConfigurationsQueryObject
    on QueryBuilder<Configurations, Configurations, QFilterCondition> {}

extension ConfigurationsQueryLinks
    on QueryBuilder<Configurations, Configurations, QFilterCondition> {}

extension ConfigurationsQuerySortBy
    on QueryBuilder<Configurations, Configurations, QSortBy> {}

extension ConfigurationsQuerySortThenBy
    on QueryBuilder<Configurations, Configurations, QSortThenBy> {
  QueryBuilder<Configurations, Configurations, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Configurations, Configurations, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension ConfigurationsQueryWhereDistinct
    on QueryBuilder<Configurations, Configurations, QDistinct> {}

extension ConfigurationsQueryProperty
    on QueryBuilder<Configurations, Configurations, QQueryProperty> {
  QueryBuilder<Configurations, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
