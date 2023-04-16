// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.year.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetYearCollection on Isar {
  IsarCollection<Year> get years => this.collection();
}

const YearSchema = CollectionSchema(
  name: r'Year',
  id: 8541492288853816011,
  properties: {
    r'year': PropertySchema(
      id: 0,
      name: r'year',
      type: IsarType.string,
    )
  },
  estimateSize: _yearEstimateSize,
  serialize: _yearSerialize,
  deserialize: _yearDeserialize,
  deserializeProp: _yearDeserializeProp,
  idName: r'id',
  indexes: {
    r'year': IndexSchema(
      id: -875522826430421864,
      name: r'year',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'year',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'tracks': LinkSchema(
      id: 2934907906711140451,
      name: r'tracks',
      target: r'Track',
      single: false,
      linkName: r'year',
    )
  },
  embeddedSchemas: {},
  getId: _yearGetId,
  getLinks: _yearGetLinks,
  attach: _yearAttach,
  version: '3.0.5',
);

int _yearEstimateSize(
  final Year object,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.year.length * 3;
  return bytesCount;
}

void _yearSerialize(
  final Year object,
  final IsarWriter writer,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.year);
}

Year _yearDeserialize(
  final Id id,
  final IsarReader reader,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  final object = Year(
    year: reader.readString(offsets[0]),
  )..id = id;
  return object;
}

P _yearDeserializeProp<P>(
  final IsarReader reader,
  final int propertyId,
  final int offset,
  final Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _yearGetId(final Year object) => object.id;

List<IsarLinkBase<dynamic>> _yearGetLinks(final Year object) => [object.tracks];

void _yearAttach(
    final IsarCollection<dynamic> col, final Id id, final Year object) {
  object.id = id;
  object.tracks.attach(col, col.isar.collection<Track>(), r'tracks', id);
}

extension YearByIndex on IsarCollection<Year> {
  Future<Year?> getByYear(final String year) => getByIndex(r'year', [year]);

  Year? getByYearSync(final String year) => getByIndexSync(r'year', [year]);

  Future<bool> deleteByYear(final String year) =>
      deleteByIndex(r'year', [year]);

  bool deleteByYearSync(final String year) =>
      deleteByIndexSync(r'year', [year]);

  Future<List<Year?>> getAllByYear(final List<String> yearValues) {
    final values = yearValues.map((final e) => [e]).toList();
    return getAllByIndex(r'year', values);
  }

  List<Year?> getAllByYearSync(final List<String> yearValues) {
    final values = yearValues.map((final e) => [e]).toList();
    return getAllByIndexSync(r'year', values);
  }

  Future<int> deleteAllByYear(final List<String> yearValues) {
    final values = yearValues.map((final e) => [e]).toList();
    return deleteAllByIndex(r'year', values);
  }

  int deleteAllByYearSync(final List<String> yearValues) {
    final values = yearValues.map((final e) => [e]).toList();
    return deleteAllByIndexSync(r'year', values);
  }

  Future<Id> putByYear(final Year object) => putByIndex(r'year', object);

  Id putByYearSync(final Year object, {final bool saveLinks = true}) =>
      putByIndexSync(r'year', object, saveLinks: saveLinks);

  Future<List<Id>> putAllByYear(final List<Year> objects) =>
      putAllByIndex(r'year', objects);

  List<Id> putAllByYearSync(final List<Year> objects,
          {final bool saveLinks = true}) =>
      putAllByIndexSync(r'year', objects, saveLinks: saveLinks);
}

extension YearQueryWhereSort on QueryBuilder<Year, Year, QWhere> {
  QueryBuilder<Year, Year, QAfterWhere> anyId() => QueryBuilder.apply(
      this, (final query) => query.addWhereClause(const IdWhereClause.any()));
}

extension YearQueryWhere on QueryBuilder<Year, Year, QWhereClause> {
  QueryBuilder<Year, Year, QAfterWhereClause> idEqualTo(final Id id) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(IdWhereClause.between(
                lower: id,
                upper: id,
              )));

  QueryBuilder<Year, Year, QAfterWhereClause> idNotEqualTo(final Id id) =>
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

  QueryBuilder<Year, Year, QAfterWhereClause> idGreaterThan(final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.greaterThan(lower: id, includeLower: include),
              ));

  QueryBuilder<Year, Year, QAfterWhereClause> idLessThan(final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.lessThan(upper: id, includeUpper: include),
              ));

  QueryBuilder<Year, Year, QAfterWhereClause> idBetween(
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

  QueryBuilder<Year, Year, QAfterWhereClause> yearEqualTo(final String year) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(IndexWhereClause.equalTo(
                indexName: r'year',
                value: [year],
              )));

  QueryBuilder<Year, Year, QAfterWhereClause> yearNotEqualTo(
          final String year) =>
      QueryBuilder.apply(this, (final query) {
        if (query.whereSort == Sort.asc) {
          return query
              .addWhereClause(IndexWhereClause.between(
                indexName: r'year',
                lower: [],
                upper: [year],
                includeUpper: false,
              ))
              .addWhereClause(IndexWhereClause.between(
                indexName: r'year',
                lower: [year],
                includeLower: false,
                upper: [],
              ));
        } else {
          return query
              .addWhereClause(IndexWhereClause.between(
                indexName: r'year',
                lower: [year],
                includeLower: false,
                upper: [],
              ))
              .addWhereClause(IndexWhereClause.between(
                indexName: r'year',
                lower: [],
                upper: [year],
                includeUpper: false,
              ));
        }
      });
}

extension YearQueryFilter on QueryBuilder<Year, Year, QFilterCondition> {
  QueryBuilder<Year, Year, QAfterFilterCondition> idEqualTo(final Id value) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'id',
                value: value,
              )));

  QueryBuilder<Year, Year, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Year, Year, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Year, Year, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Year, Year, QAfterFilterCondition> yearEqualTo(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'year',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Year, Year, QAfterFilterCondition> yearGreaterThan(
    final String value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                include: include,
                property: r'year',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Year, Year, QAfterFilterCondition> yearLessThan(
    final String value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.lessThan(
                include: include,
                property: r'year',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Year, Year, QAfterFilterCondition> yearBetween(
    final String lower,
    final String upper, {
    final bool includeLower = true,
    final bool includeUpper = true,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.between(
                property: r'year',
                lower: lower,
                includeLower: includeLower,
                upper: upper,
                includeUpper: includeUpper,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Year, Year, QAfterFilterCondition> yearStartsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.startsWith(
                property: r'year',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Year, Year, QAfterFilterCondition> yearEndsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.endsWith(
                property: r'year',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Year, Year, QAfterFilterCondition> yearContains(
          final String value,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.contains(
                property: r'year',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Year, Year, QAfterFilterCondition> yearMatches(
          final String pattern,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.matches(
                property: r'year',
                wildcard: pattern,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Year, Year, QAfterFilterCondition> yearIsEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'year',
                value: '',
              )));

  QueryBuilder<Year, Year, QAfterFilterCondition> yearIsNotEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                property: r'year',
                value: '',
              )));
}

extension YearQueryObject on QueryBuilder<Year, Year, QFilterCondition> {}

extension YearQueryLinks on QueryBuilder<Year, Year, QFilterCondition> {
  QueryBuilder<Year, Year, QAfterFilterCondition> tracks(
          final FilterQuery<Track> q) =>
      QueryBuilder.apply(this, (final query) => query.link(q, r'tracks'));

  QueryBuilder<Year, Year, QAfterFilterCondition> tracksLengthEqualTo(
          final int length) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.linkLength(r'tracks', length, true, length, true));

  QueryBuilder<Year, Year, QAfterFilterCondition> tracksIsEmpty() =>
      QueryBuilder.apply(
          this, (final query) => query.linkLength(r'tracks', 0, true, 0, true));

  QueryBuilder<Year, Year, QAfterFilterCondition> tracksIsNotEmpty() =>
      QueryBuilder.apply(this,
          (final query) => query.linkLength(r'tracks', 0, false, 999999, true));

  QueryBuilder<Year, Year, QAfterFilterCondition> tracksLengthLessThan(
    final int length, {
    final bool include = false,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.linkLength(r'tracks', 0, true, length, include));

  QueryBuilder<Year, Year, QAfterFilterCondition> tracksLengthGreaterThan(
    final int length, {
    final bool include = false,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.linkLength(r'tracks', length, include, 999999, true));

  QueryBuilder<Year, Year, QAfterFilterCondition> tracksLengthBetween(
    final int lower,
    final int upper, {
    final bool includeLower = true,
    final bool includeUpper = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.linkLength(
              r'tracks', lower, includeLower, upper, includeUpper));
}

extension YearQuerySortBy on QueryBuilder<Year, Year, QSortBy> {
  QueryBuilder<Year, Year, QAfterSortBy> sortByYear() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'year', Sort.asc));

  QueryBuilder<Year, Year, QAfterSortBy> sortByYearDesc() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'year', Sort.desc));
}

extension YearQuerySortThenBy on QueryBuilder<Year, Year, QSortThenBy> {
  QueryBuilder<Year, Year, QAfterSortBy> thenById() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'id', Sort.asc));

  QueryBuilder<Year, Year, QAfterSortBy> thenByIdDesc() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'id', Sort.desc));

  QueryBuilder<Year, Year, QAfterSortBy> thenByYear() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'year', Sort.asc));

  QueryBuilder<Year, Year, QAfterSortBy> thenByYearDesc() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'year', Sort.desc));
}

extension YearQueryWhereDistinct on QueryBuilder<Year, Year, QDistinct> {
  QueryBuilder<Year, Year, QDistinct> distinctByYear(
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addDistinctBy(r'year', caseSensitive: caseSensitive));
}

extension YearQueryProperty on QueryBuilder<Year, Year, QQueryProperty> {
  QueryBuilder<Year, int, QQueryOperations> idProperty() =>
      QueryBuilder.apply(this, (final query) => query.addPropertyName(r'id'));

  QueryBuilder<Year, String, QQueryOperations> yearProperty() =>
      QueryBuilder.apply(this, (final query) => query.addPropertyName(r'year'));
}
