// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.album.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAlbumCollection on Isar {
  IsarCollection<Album> get albums => this.collection();
}

const AlbumSchema = CollectionSchema(
  name: r'Album',
  id: -1355968412107120937,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _albumEstimateSize,
  serialize: _albumSerialize,
  deserialize: _albumDeserialize,
  deserializeProp: _albumDeserializeProp,
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
      id: 32410680133097647,
      name: r'tracks',
      target: r'Track',
      single: false,
      linkName: r'album',
    )
  },
  embeddedSchemas: {},
  getId: _albumGetId,
  getLinks: _albumGetLinks,
  attach: _albumAttach,
  version: '3.0.5',
);

int _albumEstimateSize(
  final Album object,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _albumSerialize(
  final Album object,
  final IsarWriter writer,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
}

Album _albumDeserialize(
  final Id id,
  final IsarReader reader,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  final object = Album(
    name: reader.readString(offsets[0]),
  );
  return object;
}

P _albumDeserializeProp<P>(
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

Id _albumGetId(final Album object) => object.id;

List<IsarLinkBase<dynamic>> _albumGetLinks(final Album object) =>
    [object.tracks];

void _albumAttach(
    final IsarCollection<dynamic> col, final Id id, final Album object) {
  object.tracks.attach(col, col.isar.collection<Track>(), r'tracks', id);
}

extension AlbumByIndex on IsarCollection<Album> {
  Future<Album?> getByName(final String name) => getByIndex(r'name', [name]);

  Album? getByNameSync(final String name) => getByIndexSync(r'name', [name]);

  Future<bool> deleteByName(final String name) =>
      deleteByIndex(r'name', [name]);

  bool deleteByNameSync(final String name) =>
      deleteByIndexSync(r'name', [name]);

  Future<List<Album?>> getAllByName(final List<String> nameValues) {
    final values = nameValues.map((final e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<Album?> getAllByNameSync(final List<String> nameValues) {
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

  Future<Id> putByName(final Album object) => putByIndex(r'name', object);

  Id putByNameSync(final Album object, {final bool saveLinks = true}) =>
      putByIndexSync(r'name', object, saveLinks: saveLinks);

  Future<List<Id>> putAllByName(final List<Album> objects) =>
      putAllByIndex(r'name', objects);

  List<Id> putAllByNameSync(final List<Album> objects,
          {final bool saveLinks = true}) =>
      putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
}

extension AlbumQueryWhereSort on QueryBuilder<Album, Album, QWhere> {
  QueryBuilder<Album, Album, QAfterWhere> anyId() => QueryBuilder.apply(
      this, (final query) => query.addWhereClause(const IdWhereClause.any()));
}

extension AlbumQueryWhere on QueryBuilder<Album, Album, QWhereClause> {
  QueryBuilder<Album, Album, QAfterWhereClause> idEqualTo(final Id id) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(IdWhereClause.between(
                lower: id,
                upper: id,
              )));

  QueryBuilder<Album, Album, QAfterWhereClause> idNotEqualTo(final Id id) =>
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

  QueryBuilder<Album, Album, QAfterWhereClause> idGreaterThan(final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.greaterThan(lower: id, includeLower: include),
              ));

  QueryBuilder<Album, Album, QAfterWhereClause> idLessThan(final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.lessThan(upper: id, includeUpper: include),
              ));

  QueryBuilder<Album, Album, QAfterWhereClause> idBetween(
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

  QueryBuilder<Album, Album, QAfterWhereClause> nameEqualTo(
          final String name) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(IndexWhereClause.equalTo(
                indexName: r'name',
                value: [name],
              )));

  QueryBuilder<Album, Album, QAfterWhereClause> nameNotEqualTo(
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

extension AlbumQueryFilter on QueryBuilder<Album, Album, QFilterCondition> {
  QueryBuilder<Album, Album, QAfterFilterCondition> idEqualTo(final Id value) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'id',
                value: value,
              )));

  QueryBuilder<Album, Album, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Album, Album, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Album, Album, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Album, Album, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Album, Album, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Album, Album, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Album, Album, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Album, Album, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Album, Album, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Album, Album, QAfterFilterCondition> nameContains(
          final String value,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.contains(
                property: r'name',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Album, Album, QAfterFilterCondition> nameMatches(
          final String pattern,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.matches(
                property: r'name',
                wildcard: pattern,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Album, Album, QAfterFilterCondition> nameIsEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'name',
                value: '',
              )));

  QueryBuilder<Album, Album, QAfterFilterCondition> nameIsNotEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                property: r'name',
                value: '',
              )));
}

extension AlbumQueryObject on QueryBuilder<Album, Album, QFilterCondition> {}

extension AlbumQueryLinks on QueryBuilder<Album, Album, QFilterCondition> {
  QueryBuilder<Album, Album, QAfterFilterCondition> tracks(
          final FilterQuery<Track> q) =>
      QueryBuilder.apply(this, (final query) => query.link(q, r'tracks'));

  QueryBuilder<Album, Album, QAfterFilterCondition> tracksLengthEqualTo(
          final int length) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.linkLength(r'tracks', length, true, length, true));

  QueryBuilder<Album, Album, QAfterFilterCondition> tracksIsEmpty() =>
      QueryBuilder.apply(
          this, (final query) => query.linkLength(r'tracks', 0, true, 0, true));

  QueryBuilder<Album, Album, QAfterFilterCondition> tracksIsNotEmpty() =>
      QueryBuilder.apply(this,
          (final query) => query.linkLength(r'tracks', 0, false, 999999, true));

  QueryBuilder<Album, Album, QAfterFilterCondition> tracksLengthLessThan(
    final int length, {
    final bool include = false,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.linkLength(r'tracks', 0, true, length, include));

  QueryBuilder<Album, Album, QAfterFilterCondition> tracksLengthGreaterThan(
    final int length, {
    final bool include = false,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.linkLength(r'tracks', length, include, 999999, true));

  QueryBuilder<Album, Album, QAfterFilterCondition> tracksLengthBetween(
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

extension AlbumQuerySortBy on QueryBuilder<Album, Album, QSortBy> {
  QueryBuilder<Album, Album, QAfterSortBy> sortByName() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'name', Sort.asc));

  QueryBuilder<Album, Album, QAfterSortBy> sortByNameDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'name', Sort.desc));
}

extension AlbumQuerySortThenBy on QueryBuilder<Album, Album, QSortThenBy> {
  QueryBuilder<Album, Album, QAfterSortBy> thenById() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'id', Sort.asc));

  QueryBuilder<Album, Album, QAfterSortBy> thenByIdDesc() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'id', Sort.desc));

  QueryBuilder<Album, Album, QAfterSortBy> thenByName() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'name', Sort.asc));

  QueryBuilder<Album, Album, QAfterSortBy> thenByNameDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'name', Sort.desc));
}

extension AlbumQueryWhereDistinct on QueryBuilder<Album, Album, QDistinct> {
  QueryBuilder<Album, Album, QDistinct> distinctByName(
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addDistinctBy(r'name', caseSensitive: caseSensitive));
}

extension AlbumQueryProperty on QueryBuilder<Album, Album, QQueryProperty> {
  QueryBuilder<Album, int, QQueryOperations> idProperty() =>
      QueryBuilder.apply(this, (final query) => query.addPropertyName(r'id'));

  QueryBuilder<Album, String, QQueryOperations> nameProperty() =>
      QueryBuilder.apply(this, (final query) => query.addPropertyName(r'name'));
}
