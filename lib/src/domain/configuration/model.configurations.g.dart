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
  final Configurations object,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _configurationsSerialize(
  final Configurations object,
  final IsarWriter writer,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {}
Configurations _configurationsDeserialize(
  final Id id,
  final IsarReader reader,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  final object = Configurations();
  return object;
}

P _configurationsDeserializeProp<P>(
  final IsarReader reader,
  final int propertyId,
  final int offset,
  final Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _configurationsGetId(final Configurations object) => object.id;

List<IsarLinkBase<dynamic>> _configurationsGetLinks(
        final Configurations object) =>
    [];

void _configurationsAttach(final IsarCollection<dynamic> col, final Id id,
    final Configurations object) {}

extension ConfigurationsQueryWhereSort
    on QueryBuilder<Configurations, Configurations, QWhere> {
  QueryBuilder<Configurations, Configurations, QAfterWhere> anyId() =>
      QueryBuilder.apply(this,
          (final query) => query.addWhereClause(const IdWhereClause.any()));
}

extension ConfigurationsQueryWhere
    on QueryBuilder<Configurations, Configurations, QWhereClause> {
  QueryBuilder<Configurations, Configurations, QAfterWhereClause> idEqualTo(
          final Id id) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(IdWhereClause.between(
                lower: id,
                upper: id,
              )));

  QueryBuilder<Configurations, Configurations, QAfterWhereClause> idNotEqualTo(
          final Id id) =>
      QueryBuilder.apply(this, (final query) {
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

  QueryBuilder<Configurations, Configurations, QAfterWhereClause> idGreaterThan(
          final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.greaterThan(lower: id, includeLower: include),
              ));

  QueryBuilder<Configurations, Configurations, QAfterWhereClause> idLessThan(
          final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.lessThan(upper: id, includeUpper: include),
              ));

  QueryBuilder<Configurations, Configurations, QAfterWhereClause> idBetween(
    final Id lowerId,
    final Id upperId, {
    final bool includeLower = true,
    final bool includeUpper = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(IdWhereClause.between(
                lower: lowerId,
                includeLower: includeLower,
                upper: upperId,
                includeUpper: includeUpper,
              )));
}

extension ConfigurationsQueryFilter
    on QueryBuilder<Configurations, Configurations, QFilterCondition> {
  QueryBuilder<Configurations, Configurations, QAfterFilterCondition> idEqualTo(
          final Id value) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'id',
                value: value,
              )));

  QueryBuilder<Configurations, Configurations,
      QAfterFilterCondition> idGreaterThan(
    final Id value, {
    final bool include = false,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                include: include,
                property: r'id',
                value: value,
              )));

  QueryBuilder<Configurations, Configurations,
      QAfterFilterCondition> idLessThan(
    final Id value, {
    final bool include = false,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.lessThan(
                include: include,
                property: r'id',
                value: value,
              )));

  QueryBuilder<Configurations, Configurations, QAfterFilterCondition> idBetween(
    final Id lower,
    final Id upper, {
    final bool includeLower = true,
    final bool includeUpper = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.between(
                property: r'id',
                lower: lower,
                includeLower: includeLower,
                upper: upper,
                includeUpper: includeUpper,
              )));
}

extension ConfigurationsQueryObject
    on QueryBuilder<Configurations, Configurations, QFilterCondition> {}

extension ConfigurationsQueryLinks
    on QueryBuilder<Configurations, Configurations, QFilterCondition> {}

extension ConfigurationsQuerySortBy
    on QueryBuilder<Configurations, Configurations, QSortBy> {}

extension ConfigurationsQuerySortThenBy
    on QueryBuilder<Configurations, Configurations, QSortThenBy> {
  QueryBuilder<Configurations, Configurations, QAfterSortBy> thenById() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'id', Sort.asc));

  QueryBuilder<Configurations, Configurations, QAfterSortBy> thenByIdDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'id', Sort.desc));
}

extension ConfigurationsQueryWhereDistinct
    on QueryBuilder<Configurations, Configurations, QDistinct> {}

extension ConfigurationsQueryProperty
    on QueryBuilder<Configurations, Configurations, QQueryProperty> {
  QueryBuilder<Configurations, int, QQueryOperations> idProperty() =>
      QueryBuilder.apply(this, (final query) => query.addPropertyName(r'id'));
}
