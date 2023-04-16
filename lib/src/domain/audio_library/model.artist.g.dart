// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.artist.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetArtistCollection on Isar {
  IsarCollection<Artist> get artists => this.collection();
}

const ArtistSchema = CollectionSchema(
  name: r'Artist',
  id: 3750894727498641923,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _artistEstimateSize,
  serialize: _artistSerialize,
  deserialize: _artistDeserialize,
  deserializeProp: _artistDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'tracks': LinkSchema(
      id: -5243198222708503600,
      name: r'tracks',
      target: r'Track',
      single: false,
      linkName: r'artist',
    )
  },
  embeddedSchemas: {},
  getId: _artistGetId,
  getLinks: _artistGetLinks,
  attach: _artistAttach,
  version: '3.0.5',
);

int _artistEstimateSize(
  final Artist object,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _artistSerialize(
  final Artist object,
  final IsarWriter writer,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
}

Artist _artistDeserialize(
  final Id id,
  final IsarReader reader,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  final object = Artist(
    name: reader.readString(offsets[0]),
  )..id = id;
  return object;
}

P _artistDeserializeProp<P>(
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

Id _artistGetId(final Artist object) => object.id;

List<IsarLinkBase<dynamic>> _artistGetLinks(final Artist object) =>
    [object.tracks];

void _artistAttach(
    final IsarCollection<dynamic> col, final Id id, final Artist object) {
  object.id = id;
  object.tracks.attach(col, col.isar.collection<Track>(), r'tracks', id);
}

extension ArtistByIndex on IsarCollection<Artist> {
  Future<Artist?> getByName(final String name) => getByIndex(r'name', [name]);

  Artist? getByNameSync(final String name) => getByIndexSync(r'name', [name]);

  Future<bool> deleteByName(final String name) =>
      deleteByIndex(r'name', [name]);

  bool deleteByNameSync(final String name) =>
      deleteByIndexSync(r'name', [name]);

  Future<List<Artist?>> getAllByName(final List<String> nameValues) {
    final values = nameValues.map((final e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<Artist?> getAllByNameSync(final List<String> nameValues) {
    final values = nameValues.map((final e) => [e]).toList();
    return getAllByIndexSync(r'name', values);
  }

  Future<int> deleteAllByName(final List<String> nameValues) {
    final values = nameValues.map((final e) => [e]).toList();
    return deleteAllByIndex(r'name', values);
  }

  int deleteAllByNameSync(final List<String> nameValues) {
    final values = nameValues.map((final e) => [e]).toList();
    return deleteAllByIndexSync(r'name', values);
  }

  Future<Id> putByName(final Artist object) => putByIndex(r'name', object);

  Id putByNameSync(final Artist object, {final bool saveLinks = true}) =>
      putByIndexSync(r'name', object, saveLinks: saveLinks);

  Future<List<Id>> putAllByName(final List<Artist> objects) =>
      putAllByIndex(r'name', objects);

  List<Id> putAllByNameSync(final List<Artist> objects,
          {final bool saveLinks = true}) =>
      putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
}

extension ArtistQueryWhereSort on QueryBuilder<Artist, Artist, QWhere> {
  QueryBuilder<Artist, Artist, QAfterWhere> anyId() => QueryBuilder.apply(
      this, (final query) => query.addWhereClause(const IdWhereClause.any()));
}

extension ArtistQueryWhere on QueryBuilder<Artist, Artist, QWhereClause> {
  QueryBuilder<Artist, Artist, QAfterWhereClause> idEqualTo(final Id id) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(IdWhereClause.between(
                lower: id,
                upper: id,
              )));

  QueryBuilder<Artist, Artist, QAfterWhereClause> idNotEqualTo(final Id id) =>
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

  QueryBuilder<Artist, Artist, QAfterWhereClause> idGreaterThan(final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.greaterThan(lower: id, includeLower: include),
              ));

  QueryBuilder<Artist, Artist, QAfterWhereClause> idLessThan(final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.lessThan(upper: id, includeUpper: include),
              ));

  QueryBuilder<Artist, Artist, QAfterWhereClause> idBetween(
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

  QueryBuilder<Artist, Artist, QAfterWhereClause> nameEqualTo(
          final String name) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(IndexWhereClause.equalTo(
                indexName: r'name',
                value: [name],
              )));

  QueryBuilder<Artist, Artist, QAfterWhereClause> nameNotEqualTo(
          final String name) =>
      QueryBuilder.apply(this, (final query) {
        if (query.whereSort == Sort.asc) {
          return query
              .addWhereClause(IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ))
              .addWhereClause(IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ));
        } else {
          return query
              .addWhereClause(IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ))
              .addWhereClause(IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ));
        }
      });
}

extension ArtistQueryFilter on QueryBuilder<Artist, Artist, QFilterCondition> {
  QueryBuilder<Artist, Artist, QAfterFilterCondition> idEqualTo(
          final Id value) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'id',
                value: value,
              )));

  QueryBuilder<Artist, Artist, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Artist, Artist, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Artist, Artist, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Artist, Artist, QAfterFilterCondition> nameEqualTo(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'name',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Artist, Artist, QAfterFilterCondition> nameGreaterThan(
    final String value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                include: include,
                property: r'name',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Artist, Artist, QAfterFilterCondition> nameLessThan(
    final String value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.lessThan(
                include: include,
                property: r'name',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Artist, Artist, QAfterFilterCondition> nameBetween(
    final String lower,
    final String upper, {
    final bool includeLower = true,
    final bool includeUpper = true,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.between(
                property: r'name',
                lower: lower,
                includeLower: includeLower,
                upper: upper,
                includeUpper: includeUpper,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Artist, Artist, QAfterFilterCondition> nameStartsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.startsWith(
                property: r'name',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Artist, Artist, QAfterFilterCondition> nameEndsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.endsWith(
                property: r'name',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Artist, Artist, QAfterFilterCondition> nameContains(
          final String value,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.contains(
                property: r'name',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Artist, Artist, QAfterFilterCondition> nameMatches(
          final String pattern,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.matches(
                property: r'name',
                wildcard: pattern,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Artist, Artist, QAfterFilterCondition> nameIsEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'name',
                value: '',
              )));

  QueryBuilder<Artist, Artist, QAfterFilterCondition> nameIsNotEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                property: r'name',
                value: '',
              )));
}

extension ArtistQueryObject on QueryBuilder<Artist, Artist, QFilterCondition> {}

extension ArtistQueryLinks on QueryBuilder<Artist, Artist, QFilterCondition> {
  QueryBuilder<Artist, Artist, QAfterFilterCondition> tracks(
          final FilterQuery<Track> q) =>
      QueryBuilder.apply(this, (final query) => query.link(q, r'tracks'));

  QueryBuilder<Artist, Artist, QAfterFilterCondition> tracksLengthEqualTo(
          final int length) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.linkLength(r'tracks', length, true, length, true));

  QueryBuilder<Artist, Artist, QAfterFilterCondition> tracksIsEmpty() =>
      QueryBuilder.apply(
          this, (final query) => query.linkLength(r'tracks', 0, true, 0, true));

  QueryBuilder<Artist, Artist, QAfterFilterCondition> tracksIsNotEmpty() =>
      QueryBuilder.apply(this,
          (final query) => query.linkLength(r'tracks', 0, false, 999999, true));

  QueryBuilder<Artist, Artist, QAfterFilterCondition> tracksLengthLessThan(
    final int length, {
    final bool include = false,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.linkLength(r'tracks', 0, true, length, include));

  QueryBuilder<Artist, Artist, QAfterFilterCondition> tracksLengthGreaterThan(
    final int length, {
    final bool include = false,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.linkLength(r'tracks', length, include, 999999, true));

  QueryBuilder<Artist, Artist, QAfterFilterCondition> tracksLengthBetween(
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

extension ArtistQuerySortBy on QueryBuilder<Artist, Artist, QSortBy> {
  QueryBuilder<Artist, Artist, QAfterSortBy> sortByName() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'name', Sort.asc));

  QueryBuilder<Artist, Artist, QAfterSortBy> sortByNameDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'name', Sort.desc));
}

extension ArtistQuerySortThenBy on QueryBuilder<Artist, Artist, QSortThenBy> {
  QueryBuilder<Artist, Artist, QAfterSortBy> thenById() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'id', Sort.asc));

  QueryBuilder<Artist, Artist, QAfterSortBy> thenByIdDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'id', Sort.desc));

  QueryBuilder<Artist, Artist, QAfterSortBy> thenByName() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'name', Sort.asc));

  QueryBuilder<Artist, Artist, QAfterSortBy> thenByNameDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'name', Sort.desc));
}

extension ArtistQueryWhereDistinct on QueryBuilder<Artist, Artist, QDistinct> {
  QueryBuilder<Artist, Artist, QDistinct> distinctByName(
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addDistinctBy(r'name', caseSensitive: caseSensitive));
}

extension ArtistQueryProperty on QueryBuilder<Artist, Artist, QQueryProperty> {
  QueryBuilder<Artist, int, QQueryOperations> idProperty() =>
      QueryBuilder.apply(this, (final query) => query.addPropertyName(r'id'));

  QueryBuilder<Artist, String, QQueryOperations> nameProperty() =>
      QueryBuilder.apply(this, (final query) => query.addPropertyName(r'name'));
}
