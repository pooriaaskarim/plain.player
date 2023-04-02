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
  Genre object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.genre.length * 3;
  return bytesCount;
}

void _genreSerialize(
  Genre object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.genre);
}

Genre _genreDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Genre(
    genre: reader.readString(offsets[0]),
  );
  return object;
}

P _genreDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _genreGetId(Genre object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _genreGetLinks(Genre object) {
  return [object.tracks];
}

void _genreAttach(IsarCollection<dynamic> col, Id id, Genre object) {
  object.tracks.attach(col, col.isar.collection<Track>(), r'tracks', id);
}

extension GenreByIndex on IsarCollection<Genre> {
  Future<Genre?> getByGenre(String genre) {
    return getByIndex(r'genre', [genre]);
  }

  Genre? getByGenreSync(String genre) {
    return getByIndexSync(r'genre', [genre]);
  }

  Future<bool> deleteByGenre(String genre) {
    return deleteByIndex(r'genre', [genre]);
  }

  bool deleteByGenreSync(String genre) {
    return deleteByIndexSync(r'genre', [genre]);
  }

  Future<List<Genre?>> getAllByGenre(List<String> genreValues) {
    final values = genreValues.map((e) => [e]).toList();
    return getAllByIndex(r'genre', values);
  }

  List<Genre?> getAllByGenreSync(List<String> genreValues) {
    final values = genreValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'genre', values);
  }

  Future<int> deleteAllByGenre(List<String> genreValues) {
    final values = genreValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'genre', values);
  }

  int deleteAllByGenreSync(List<String> genreValues) {
    final values = genreValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'genre', values);
  }

  Future<Id> putByGenre(Genre object) {
    return putByIndex(r'genre', object);
  }

  Id putByGenreSync(Genre object, {bool saveLinks = true}) {
    return putByIndexSync(r'genre', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByGenre(List<Genre> objects) {
    return putAllByIndex(r'genre', objects);
  }

  List<Id> putAllByGenreSync(List<Genre> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'genre', objects, saveLinks: saveLinks);
  }
}

extension GenreQueryWhereSort on QueryBuilder<Genre, Genre, QWhere> {
  QueryBuilder<Genre, Genre, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GenreQueryWhere on QueryBuilder<Genre, Genre, QWhereClause> {
  QueryBuilder<Genre, Genre, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Genre, Genre, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Genre, Genre, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Genre, Genre, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Genre, Genre, QAfterWhereClause> idBetween(
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

  QueryBuilder<Genre, Genre, QAfterWhereClause> genreEqualTo(String genre) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'genre',
        value: [genre],
      ));
    });
  }

  QueryBuilder<Genre, Genre, QAfterWhereClause> genreNotEqualTo(String genre) {
    return QueryBuilder.apply(this, (query) {
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
}

extension GenreQueryFilter on QueryBuilder<Genre, Genre, QFilterCondition> {
  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'genre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'genre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genre',
        value: '',
      ));
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'genre',
        value: '',
      ));
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> idBetween(
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

extension GenreQueryObject on QueryBuilder<Genre, Genre, QFilterCondition> {}

extension GenreQueryLinks on QueryBuilder<Genre, Genre, QFilterCondition> {
  QueryBuilder<Genre, Genre, QAfterFilterCondition> tracks(
      FilterQuery<Track> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tracks');
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> tracksLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tracks', length, true, length, true);
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> tracksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tracks', 0, true, 0, true);
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> tracksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tracks', 0, false, 999999, true);
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> tracksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tracks', 0, true, length, include);
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> tracksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tracks', length, include, 999999, true);
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> tracksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'tracks', lower, includeLower, upper, includeUpper);
    });
  }
}

extension GenreQuerySortBy on QueryBuilder<Genre, Genre, QSortBy> {
  QueryBuilder<Genre, Genre, QAfterSortBy> sortByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<Genre, Genre, QAfterSortBy> sortByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }
}

extension GenreQuerySortThenBy on QueryBuilder<Genre, Genre, QSortThenBy> {
  QueryBuilder<Genre, Genre, QAfterSortBy> thenByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<Genre, Genre, QAfterSortBy> thenByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }

  QueryBuilder<Genre, Genre, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Genre, Genre, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension GenreQueryWhereDistinct on QueryBuilder<Genre, Genre, QDistinct> {
  QueryBuilder<Genre, Genre, QDistinct> distinctByGenre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genre', caseSensitive: caseSensitive);
    });
  }
}

extension GenreQueryProperty on QueryBuilder<Genre, Genre, QQueryProperty> {
  QueryBuilder<Genre, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Genre, String, QQueryOperations> genreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genre');
    });
  }
}
