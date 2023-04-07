// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.genre.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetGenreCollection on Isar {
  IsarCollection<Genre> get genres => this.collection();
}

const GenreSchema = CollectionSchema(
  name: r'Genre',
  id: -453881181692258612,
  properties: {
    r'genre': PropertySchema(
      id: 0,
      name: r'genre',
      type: IsarType.string,
    )
  },
  estimateSize: _genreEstimateSize,
  serialize: _genreSerialize,
  deserialize: _genreDeserialize,
  deserializeProp: _genreDeserializeProp,
  idName: r'id',
  indexes: {
    r'genre': IndexSchema(
      id: 7810252941268804523,
      name: r'genre',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'genre',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'tracks': LinkSchema(
      id: -5779539904730458237,
      name: r'tracks',
      target: r'Track',
      single: false,
      linkName: r'genre',
    )
  },
  embeddedSchemas: {},
  getId: _genreGetId,
  getLinks: _genreGetLinks,
  attach: _genreAttach,
  version: '3.0.5',
);

int _genreEstimateSize(
  final Genre object,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.genre.length * 3;
  return bytesCount;
}

void _genreSerialize(
  final Genre object,
  final IsarWriter writer,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.genre);
}

Genre _genreDeserialize(
  final Id id,
  final IsarReader reader,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  final object = Genre(
    genre: reader.readString(offsets[0]),
  );
  return object;
}

P _genreDeserializeProp<P>(
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

Id _genreGetId(final Genre object) => object.id;

List<IsarLinkBase<dynamic>> _genreGetLinks(final Genre object) =>
    [object.tracks];

void _genreAttach(
    final IsarCollection<dynamic> col, final Id id, final Genre object) {
  object.tracks.attach(col, col.isar.collection<Track>(), r'tracks', id);
}

extension GenreByIndex on IsarCollection<Genre> {
  Future<Genre?> getByGenre(final String genre) =>
      getByIndex(r'genre', [genre]);

  Genre? getByGenreSync(final String genre) =>
      getByIndexSync(r'genre', [genre]);

  Future<bool> deleteByGenre(final String genre) =>
      deleteByIndex(r'genre', [genre]);

  bool deleteByGenreSync(final String genre) =>
      deleteByIndexSync(r'genre', [genre]);

  Future<List<Genre?>> getAllByGenre(final List<String> genreValues) {
    final values = genreValues.map((final e) => [e]).toList();
    return getAllByIndex(r'genre', values);
  }

  List<Genre?> getAllByGenreSync(final List<String> genreValues) {
    final values = genreValues.map((final e) => [e]).toList();
    return getAllByIndexSync(r'genre', values);
  }

  Future<int> deleteAllByGenre(final List<String> genreValues) {
    final values = genreValues.map((final e) => [e]).toList();
    return deleteAllByIndex(r'genre', values);
  }

  int deleteAllByGenreSync(final List<String> genreValues) {
    final values = genreValues.map((final e) => [e]).toList();
    return deleteAllByIndexSync(r'genre', values);
  }

  Future<Id> putByGenre(final Genre object) => putByIndex(r'genre', object);

  Id putByGenreSync(final Genre object, {final bool saveLinks = true}) =>
      putByIndexSync(r'genre', object, saveLinks: saveLinks);

  Future<List<Id>> putAllByGenre(final List<Genre> objects) =>
      putAllByIndex(r'genre', objects);

  List<Id> putAllByGenreSync(final List<Genre> objects,
          {final bool saveLinks = true}) =>
      putAllByIndexSync(r'genre', objects, saveLinks: saveLinks);
}

extension GenreQueryWhereSort on QueryBuilder<Genre, Genre, QWhere> {
  QueryBuilder<Genre, Genre, QAfterWhere> anyId() => QueryBuilder.apply(
      this, (final query) => query.addWhereClause(const IdWhereClause.any()));
}

extension GenreQueryWhere on QueryBuilder<Genre, Genre, QWhereClause> {
  QueryBuilder<Genre, Genre, QAfterWhereClause> idEqualTo(final Id id) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(IdWhereClause.between(
                lower: id,
                upper: id,
              )));

  QueryBuilder<Genre, Genre, QAfterWhereClause> idNotEqualTo(final Id id) =>
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

  QueryBuilder<Genre, Genre, QAfterWhereClause> idGreaterThan(final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.greaterThan(lower: id, includeLower: include),
              ));

  QueryBuilder<Genre, Genre, QAfterWhereClause> idLessThan(final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.lessThan(upper: id, includeUpper: include),
              ));

  QueryBuilder<Genre, Genre, QAfterWhereClause> idBetween(
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

  QueryBuilder<Genre, Genre, QAfterWhereClause> genreEqualTo(
          final String genre) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(IndexWhereClause.equalTo(
                indexName: r'genre',
                value: [genre],
              )));

  QueryBuilder<Genre, Genre, QAfterWhereClause> genreNotEqualTo(
          final String genre) =>
      QueryBuilder.apply(this, (final query) {
        if (query.whereSort == Sort.asc) {
          return query
              .addWhereClause(IndexWhereClause.between(
                indexName: r'genre',
                lower: [],
                upper: [genre],
                includeUpper: false,
              ))
              .addWhereClause(IndexWhereClause.between(
                indexName: r'genre',
                lower: [genre],
                includeLower: false,
                upper: [],
              ));
        } else {
          return query
              .addWhereClause(IndexWhereClause.between(
                indexName: r'genre',
                lower: [genre],
                includeLower: false,
                upper: [],
              ))
              .addWhereClause(IndexWhereClause.between(
                indexName: r'genre',
                lower: [],
                upper: [genre],
                includeUpper: false,
              ));
        }
      });
}

extension GenreQueryFilter on QueryBuilder<Genre, Genre, QFilterCondition> {
  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreEqualTo(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'genre',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreGreaterThan(
    final String value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                include: include,
                property: r'genre',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreLessThan(
    final String value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.lessThan(
                include: include,
                property: r'genre',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreBetween(
    final String lower,
    final String upper, {
    final bool includeLower = true,
    final bool includeUpper = true,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.between(
                property: r'genre',
                lower: lower,
                includeLower: includeLower,
                upper: upper,
                includeUpper: includeUpper,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreStartsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.startsWith(
                property: r'genre',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreEndsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.endsWith(
                property: r'genre',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreContains(
          final String value,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.contains(
                property: r'genre',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreMatches(
          final String pattern,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.matches(
                property: r'genre',
                wildcard: pattern,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreIsEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'genre',
                value: '',
              )));

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreIsNotEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                property: r'genre',
                value: '',
              )));

  QueryBuilder<Genre, Genre, QAfterFilterCondition> idEqualTo(final Id value) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'id',
                value: value,
              )));

  QueryBuilder<Genre, Genre, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> idBetween(
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

extension GenreQueryObject on QueryBuilder<Genre, Genre, QFilterCondition> {}

extension GenreQueryLinks on QueryBuilder<Genre, Genre, QFilterCondition> {
  QueryBuilder<Genre, Genre, QAfterFilterCondition> tracks(
          final FilterQuery<Track> q) =>
      QueryBuilder.apply(this, (final query) => query.link(q, r'tracks'));

  QueryBuilder<Genre, Genre, QAfterFilterCondition> tracksLengthEqualTo(
          final int length) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.linkLength(r'tracks', length, true, length, true));

  QueryBuilder<Genre, Genre, QAfterFilterCondition> tracksIsEmpty() =>
      QueryBuilder.apply(
          this, (final query) => query.linkLength(r'tracks', 0, true, 0, true));

  QueryBuilder<Genre, Genre, QAfterFilterCondition> tracksIsNotEmpty() =>
      QueryBuilder.apply(this,
          (final query) => query.linkLength(r'tracks', 0, false, 999999, true));

  QueryBuilder<Genre, Genre, QAfterFilterCondition> tracksLengthLessThan(
    final int length, {
    final bool include = false,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.linkLength(r'tracks', 0, true, length, include));

  QueryBuilder<Genre, Genre, QAfterFilterCondition> tracksLengthGreaterThan(
    final int length, {
    final bool include = false,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.linkLength(r'tracks', length, include, 999999, true));

  QueryBuilder<Genre, Genre, QAfterFilterCondition> tracksLengthBetween(
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

extension GenreQuerySortBy on QueryBuilder<Genre, Genre, QSortBy> {
  QueryBuilder<Genre, Genre, QAfterSortBy> sortByGenre() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'genre', Sort.asc));

  QueryBuilder<Genre, Genre, QAfterSortBy> sortByGenreDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'genre', Sort.desc));
}

extension GenreQuerySortThenBy on QueryBuilder<Genre, Genre, QSortThenBy> {
  QueryBuilder<Genre, Genre, QAfterSortBy> thenByGenre() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'genre', Sort.asc));

  QueryBuilder<Genre, Genre, QAfterSortBy> thenByGenreDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'genre', Sort.desc));

  QueryBuilder<Genre, Genre, QAfterSortBy> thenById() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'id', Sort.asc));

  QueryBuilder<Genre, Genre, QAfterSortBy> thenByIdDesc() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'id', Sort.desc));
}

extension GenreQueryWhereDistinct on QueryBuilder<Genre, Genre, QDistinct> {
  QueryBuilder<Genre, Genre, QDistinct> distinctByGenre(
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addDistinctBy(r'genre', caseSensitive: caseSensitive));
}

extension GenreQueryProperty on QueryBuilder<Genre, Genre, QQueryProperty> {
  QueryBuilder<Genre, int, QQueryOperations> idProperty() =>
      QueryBuilder.apply(this, (final query) => query.addPropertyName(r'id'));

  QueryBuilder<Genre, String, QQueryOperations> genreProperty() =>
      QueryBuilder.apply(
          this, (final query) => query.addPropertyName(r'genre'));
}
