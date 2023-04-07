// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.album_artist.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAlbumArtistCollection on Isar {
  IsarCollection<AlbumArtist> get albumArtists => this.collection();
}

const AlbumArtistSchema = CollectionSchema(
  name: r'AlbumArtist',
  id: 6175787697373704737,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _albumArtistEstimateSize,
  serialize: _albumArtistSerialize,
  deserialize: _albumArtistDeserialize,
  deserializeProp: _albumArtistDeserializeProp,
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
      id: -7306705583505203376,
      name: r'tracks',
      target: r'Track',
      single: false,
      linkName: r'albumArtist',
    )
  },
  embeddedSchemas: {},
  getId: _albumArtistGetId,
  getLinks: _albumArtistGetLinks,
  attach: _albumArtistAttach,
  version: '3.0.5',
);

int _albumArtistEstimateSize(
  final AlbumArtist object,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _albumArtistSerialize(
  final AlbumArtist object,
  final IsarWriter writer,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
}

AlbumArtist _albumArtistDeserialize(
  final Id id,
  final IsarReader reader,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  final object = AlbumArtist(
    name: reader.readString(offsets[0]),
  );
  return object;
}

P _albumArtistDeserializeProp<P>(
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

Id _albumArtistGetId(final AlbumArtist object) => object.id;

List<IsarLinkBase<dynamic>> _albumArtistGetLinks(final AlbumArtist object) =>
    [object.tracks];

void _albumArtistAttach(
    final IsarCollection<dynamic> col, final Id id, final AlbumArtist object) {
  object.tracks.attach(col, col.isar.collection<Track>(), r'tracks', id);
}

extension AlbumArtistByIndex on IsarCollection<AlbumArtist> {
  Future<AlbumArtist?> getByName(final String name) =>
      getByIndex(r'name', [name]);

  AlbumArtist? getByNameSync(final String name) =>
      getByIndexSync(r'name', [name]);

  Future<bool> deleteByName(final String name) =>
      deleteByIndex(r'name', [name]);

  bool deleteByNameSync(final String name) =>
      deleteByIndexSync(r'name', [name]);

  Future<List<AlbumArtist?>> getAllByName(final List<String> nameValues) {
    final values = nameValues.map((final e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<AlbumArtist?> getAllByNameSync(final List<String> nameValues) {
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

  Future<Id> putByName(final AlbumArtist object) => putByIndex(r'name', object);

  Id putByNameSync(final AlbumArtist object, {final bool saveLinks = true}) =>
      putByIndexSync(r'name', object, saveLinks: saveLinks);

  Future<List<Id>> putAllByName(final List<AlbumArtist> objects) =>
      putAllByIndex(r'name', objects);

  List<Id> putAllByNameSync(final List<AlbumArtist> objects,
          {final bool saveLinks = true}) =>
      putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
}

extension AlbumArtistQueryWhereSort
    on QueryBuilder<AlbumArtist, AlbumArtist, QWhere> {
  QueryBuilder<AlbumArtist, AlbumArtist, QAfterWhere> anyId() =>
      QueryBuilder.apply(this,
          (final query) => query.addWhereClause(const IdWhereClause.any()));
}

extension AlbumArtistQueryWhere
    on QueryBuilder<AlbumArtist, AlbumArtist, QWhereClause> {
  QueryBuilder<AlbumArtist, AlbumArtist, QAfterWhereClause> idEqualTo(
          final Id id) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(IdWhereClause.between(
                lower: id,
                upper: id,
              )));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterWhereClause> idGreaterThan(
          final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.greaterThan(lower: id, includeLower: include),
              ));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterWhereClause> idLessThan(
          final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.lessThan(upper: id, includeUpper: include),
              ));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterWhereClause> idBetween(
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

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterWhereClause> nameEqualTo(
          final String name) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(IndexWhereClause.equalTo(
                indexName: r'name',
                value: [name],
              )));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterWhereClause> nameNotEqualTo(
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

extension AlbumArtistQueryFilter
    on QueryBuilder<AlbumArtist, AlbumArtist, QFilterCondition> {
  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition> idEqualTo(
          final Id value) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'id',
                value: value,
              )));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition> nameContains(
          final String value,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.contains(
                property: r'name',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition> nameMatches(
          final String pattern,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.matches(
                property: r'name',
                wildcard: pattern,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition> nameIsEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'name',
                value: '',
              )));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition>
      nameIsNotEmpty() => QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                property: r'name',
                value: '',
              )));
}

extension AlbumArtistQueryObject
    on QueryBuilder<AlbumArtist, AlbumArtist, QFilterCondition> {}

extension AlbumArtistQueryLinks
    on QueryBuilder<AlbumArtist, AlbumArtist, QFilterCondition> {
  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition> tracks(
          final FilterQuery<Track> q) =>
      QueryBuilder.apply(this, (final query) => query.link(q, r'tracks'));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition>
      tracksLengthEqualTo(final int length) => QueryBuilder.apply(
          this,
          (final query) =>
              query.linkLength(r'tracks', length, true, length, true));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition>
      tracksIsEmpty() => QueryBuilder.apply(
          this, (final query) => query.linkLength(r'tracks', 0, true, 0, true));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition>
      tracksIsNotEmpty() => QueryBuilder.apply(this,
          (final query) => query.linkLength(r'tracks', 0, false, 999999, true));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition>
      tracksLengthLessThan(
    final int length, {
    final bool include = false,
  }) =>
          QueryBuilder.apply(
              this,
              (final query) =>
                  query.linkLength(r'tracks', 0, true, length, include));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition>
      tracksLengthGreaterThan(
    final int length, {
    final bool include = false,
  }) =>
          QueryBuilder.apply(
              this,
              (final query) =>
                  query.linkLength(r'tracks', length, include, 999999, true));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterFilterCondition>
      tracksLengthBetween(
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

extension AlbumArtistQuerySortBy
    on QueryBuilder<AlbumArtist, AlbumArtist, QSortBy> {
  QueryBuilder<AlbumArtist, AlbumArtist, QAfterSortBy> sortByName() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'name', Sort.asc));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterSortBy> sortByNameDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'name', Sort.desc));
}

extension AlbumArtistQuerySortThenBy
    on QueryBuilder<AlbumArtist, AlbumArtist, QSortThenBy> {
  QueryBuilder<AlbumArtist, AlbumArtist, QAfterSortBy> thenById() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'id', Sort.asc));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterSortBy> thenByIdDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'id', Sort.desc));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterSortBy> thenByName() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'name', Sort.asc));

  QueryBuilder<AlbumArtist, AlbumArtist, QAfterSortBy> thenByNameDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'name', Sort.desc));
}

extension AlbumArtistQueryWhereDistinct
    on QueryBuilder<AlbumArtist, AlbumArtist, QDistinct> {
  QueryBuilder<AlbumArtist, AlbumArtist, QDistinct> distinctByName(
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addDistinctBy(r'name', caseSensitive: caseSensitive));
}

extension AlbumArtistQueryProperty
    on QueryBuilder<AlbumArtist, AlbumArtist, QQueryProperty> {
  QueryBuilder<AlbumArtist, int, QQueryOperations> idProperty() =>
      QueryBuilder.apply(this, (final query) => query.addPropertyName(r'id'));

  QueryBuilder<AlbumArtist, String, QQueryOperations> nameProperty() =>
      QueryBuilder.apply(this, (final query) => query.addPropertyName(r'name'));
}
