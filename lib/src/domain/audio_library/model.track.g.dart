// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.track.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTrackCollection on Isar {
  IsarCollection<Track> get tracks => this.collection();
}

const TrackSchema = CollectionSchema(
  name: r'Track',
  id: 6244076704169336260,
  properties: {
    r'lyrics': PropertySchema(
      id: 0,
      name: r'lyrics',
      type: IsarType.string,
    ),
    r'path': PropertySchema(
      id: 1,
      name: r'path',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 2,
      name: r'title',
      type: IsarType.string,
    ),
    r'trackNumber': PropertySchema(
      id: 3,
      name: r'trackNumber',
      type: IsarType.string,
    ),
    r'trackTotal': PropertySchema(
      id: 4,
      name: r'trackTotal',
      type: IsarType.string,
    )
  },
  estimateSize: _trackEstimateSize,
  serialize: _trackSerialize,
  deserialize: _trackDeserialize,
  deserializeProp: _trackDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'albumArtist': LinkSchema(
      id: 2041016560636448855,
      name: r'albumArtist',
      target: r'AlbumArtist',
      single: true,
    ),
    r'artist': LinkSchema(
      id: 2737886399584499617,
      name: r'artist',
      target: r'Artist',
      single: true,
    ),
    r'genre': LinkSchema(
      id: 911761353014061157,
      name: r'genre',
      target: r'Genre',
      single: true,
    ),
    r'album': LinkSchema(
      id: 8276322694237936812,
      name: r'album',
      target: r'Album',
      single: true,
    ),
    r'year': LinkSchema(
      id: -2231346027463090331,
      name: r'year',
      target: r'Year',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _trackGetId,
  getLinks: _trackGetLinks,
  attach: _trackAttach,
  version: '3.0.5',
);

int _trackEstimateSize(
  final Track object,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.lyrics;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.path.length * 3;
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.trackNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.trackTotal;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _trackSerialize(
  final Track object,
  final IsarWriter writer,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  writer
    ..writeString(offsets[0], object.lyrics)
    ..writeString(offsets[1], object.path)
    ..writeString(offsets[2], object.title)
    ..writeString(offsets[3], object.trackNumber)
    ..writeString(offsets[4], object.trackTotal);
}

Track _trackDeserialize(
  final Id id,
  final IsarReader reader,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  final object = Track(
    path: reader.readString(offsets[1]),
  )
    ..id = id
    ..lyrics = reader.readStringOrNull(offsets[0])
    ..title = reader.readStringOrNull(offsets[2])
    ..trackNumber = reader.readStringOrNull(offsets[3])
    ..trackTotal = reader.readStringOrNull(offsets[4]);
  return object;
}

P _trackDeserializeProp<P>(
  final IsarReader reader,
  final int propertyId,
  final int offset,
  final Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _trackGetId(final Track object) => object.id;

List<IsarLinkBase<dynamic>> _trackGetLinks(final Track object) => [
      object.albumArtist,
      object.artist,
      object.genre,
      object.album,
      object.year
    ];

void _trackAttach(
    final IsarCollection<dynamic> col, final Id id, final Track object) {
  object.id = id;
  object.albumArtist
      .attach(col, col.isar.collection<AlbumArtist>(), r'albumArtist', id);
  object.artist.attach(col, col.isar.collection<Artist>(), r'artist', id);
  object.genre.attach(col, col.isar.collection<Genre>(), r'genre', id);
  object.album.attach(col, col.isar.collection<Album>(), r'album', id);
  object.year.attach(col, col.isar.collection<Year>(), r'year', id);
}

extension TrackQueryWhereSort on QueryBuilder<Track, Track, QWhere> {
  QueryBuilder<Track, Track, QAfterWhere> anyId() => QueryBuilder.apply(
      this, (final query) => query.addWhereClause(const IdWhereClause.any()));
}

extension TrackQueryWhere on QueryBuilder<Track, Track, QWhereClause> {
  QueryBuilder<Track, Track, QAfterWhereClause> idEqualTo(final Id id) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(IdWhereClause.between(
                lower: id,
                upper: id,
              )));

  QueryBuilder<Track, Track, QAfterWhereClause> idNotEqualTo(final Id id) =>
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

  QueryBuilder<Track, Track, QAfterWhereClause> idGreaterThan(final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.greaterThan(lower: id, includeLower: include),
              ));

  QueryBuilder<Track, Track, QAfterWhereClause> idLessThan(final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.lessThan(upper: id, includeUpper: include),
              ));

  QueryBuilder<Track, Track, QAfterWhereClause> idBetween(
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

extension TrackQueryFilter on QueryBuilder<Track, Track, QFilterCondition> {
  QueryBuilder<Track, Track, QAfterFilterCondition> idEqualTo(final Id value) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'id',
                value: value,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Track, Track, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Track, Track, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Track, Track, QAfterFilterCondition> lyricsIsNull() =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addFilterCondition(const FilterCondition.isNull(
                property: r'lyrics',
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> lyricsIsNotNull() =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addFilterCondition(const FilterCondition.isNotNull(
                property: r'lyrics',
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> lyricsEqualTo(
    final String? value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'lyrics',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> lyricsGreaterThan(
    final String? value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                include: include,
                property: r'lyrics',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> lyricsLessThan(
    final String? value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.lessThan(
                include: include,
                property: r'lyrics',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> lyricsBetween(
    final String? lower,
    final String? upper, {
    final bool includeLower = true,
    final bool includeUpper = true,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.between(
                property: r'lyrics',
                lower: lower,
                includeLower: includeLower,
                upper: upper,
                includeUpper: includeUpper,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> lyricsStartsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.startsWith(
                property: r'lyrics',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> lyricsEndsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.endsWith(
                property: r'lyrics',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> lyricsContains(
          final String value,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.contains(
                property: r'lyrics',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> lyricsMatches(
          final String pattern,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.matches(
                property: r'lyrics',
                wildcard: pattern,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> lyricsIsEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'lyrics',
                value: '',
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> lyricsIsNotEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                property: r'lyrics',
                value: '',
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> pathEqualTo(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'path',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> pathGreaterThan(
    final String value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                include: include,
                property: r'path',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> pathLessThan(
    final String value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.lessThan(
                include: include,
                property: r'path',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> pathBetween(
    final String lower,
    final String upper, {
    final bool includeLower = true,
    final bool includeUpper = true,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.between(
                property: r'path',
                lower: lower,
                includeLower: includeLower,
                upper: upper,
                includeUpper: includeUpper,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> pathStartsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.startsWith(
                property: r'path',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> pathEndsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.endsWith(
                property: r'path',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> pathContains(
          final String value,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.contains(
                property: r'path',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> pathMatches(
          final String pattern,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.matches(
                property: r'path',
                wildcard: pattern,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> pathIsEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'path',
                value: '',
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> pathIsNotEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                property: r'path',
                value: '',
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> titleIsNull() =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addFilterCondition(const FilterCondition.isNull(
                property: r'title',
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> titleIsNotNull() =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addFilterCondition(const FilterCondition.isNotNull(
                property: r'title',
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> titleEqualTo(
    final String? value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'title',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> titleGreaterThan(
    final String? value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                include: include,
                property: r'title',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> titleLessThan(
    final String? value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.lessThan(
                include: include,
                property: r'title',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> titleBetween(
    final String? lower,
    final String? upper, {
    final bool includeLower = true,
    final bool includeUpper = true,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.between(
                property: r'title',
                lower: lower,
                includeLower: includeLower,
                upper: upper,
                includeUpper: includeUpper,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> titleStartsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.startsWith(
                property: r'title',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> titleEndsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.endsWith(
                property: r'title',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> titleContains(
          final String value,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.contains(
                property: r'title',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> titleMatches(
          final String pattern,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.matches(
                property: r'title',
                wildcard: pattern,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> titleIsEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'title',
                value: '',
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> titleIsNotEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                property: r'title',
                value: '',
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackNumberIsNull() =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addFilterCondition(const FilterCondition.isNull(
                property: r'trackNumber',
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackNumberIsNotNull() =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addFilterCondition(const FilterCondition.isNotNull(
                property: r'trackNumber',
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackNumberEqualTo(
    final String? value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'trackNumber',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackNumberGreaterThan(
    final String? value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                include: include,
                property: r'trackNumber',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackNumberLessThan(
    final String? value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.lessThan(
                include: include,
                property: r'trackNumber',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackNumberBetween(
    final String? lower,
    final String? upper, {
    final bool includeLower = true,
    final bool includeUpper = true,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.between(
                property: r'trackNumber',
                lower: lower,
                includeLower: includeLower,
                upper: upper,
                includeUpper: includeUpper,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackNumberStartsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.startsWith(
                property: r'trackNumber',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackNumberEndsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.endsWith(
                property: r'trackNumber',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackNumberContains(
          final String value,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.contains(
                property: r'trackNumber',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackNumberMatches(
          final String pattern,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.matches(
                property: r'trackNumber',
                wildcard: pattern,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackNumberIsEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'trackNumber',
                value: '',
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackNumberIsNotEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                property: r'trackNumber',
                value: '',
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackTotalIsNull() =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addFilterCondition(const FilterCondition.isNull(
                property: r'trackTotal',
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackTotalIsNotNull() =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addFilterCondition(const FilterCondition.isNotNull(
                property: r'trackTotal',
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackTotalEqualTo(
    final String? value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'trackTotal',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackTotalGreaterThan(
    final String? value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                include: include,
                property: r'trackTotal',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackTotalLessThan(
    final String? value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.lessThan(
                include: include,
                property: r'trackTotal',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackTotalBetween(
    final String? lower,
    final String? upper, {
    final bool includeLower = true,
    final bool includeUpper = true,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.between(
                property: r'trackTotal',
                lower: lower,
                includeLower: includeLower,
                upper: upper,
                includeUpper: includeUpper,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackTotalStartsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.startsWith(
                property: r'trackTotal',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackTotalEndsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.endsWith(
                property: r'trackTotal',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackTotalContains(
          final String value,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.contains(
                property: r'trackTotal',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackTotalMatches(
          final String pattern,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.matches(
                property: r'trackTotal',
                wildcard: pattern,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackTotalIsEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'trackTotal',
                value: '',
              )));

  QueryBuilder<Track, Track, QAfterFilterCondition> trackTotalIsNotEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                property: r'trackTotal',
                value: '',
              )));
}

extension TrackQueryObject on QueryBuilder<Track, Track, QFilterCondition> {}

extension TrackQueryLinks on QueryBuilder<Track, Track, QFilterCondition> {
  QueryBuilder<Track, Track, QAfterFilterCondition> albumArtist(
          final FilterQuery<AlbumArtist> q) =>
      QueryBuilder.apply(this, (final query) => query.link(q, r'albumArtist'));

  QueryBuilder<Track, Track, QAfterFilterCondition> albumArtistIsNull() =>
      QueryBuilder.apply(this,
          (final query) => query.linkLength(r'albumArtist', 0, true, 0, true));

  QueryBuilder<Track, Track, QAfterFilterCondition> artist(
          final FilterQuery<Artist> q) =>
      QueryBuilder.apply(this, (final query) => query.link(q, r'artist'));

  QueryBuilder<Track, Track, QAfterFilterCondition> artistIsNull() =>
      QueryBuilder.apply(
          this, (final query) => query.linkLength(r'artist', 0, true, 0, true));

  QueryBuilder<Track, Track, QAfterFilterCondition> genre(
          final FilterQuery<Genre> q) =>
      QueryBuilder.apply(this, (final query) => query.link(q, r'genre'));

  QueryBuilder<Track, Track, QAfterFilterCondition> genreIsNull() =>
      QueryBuilder.apply(
          this, (final query) => query.linkLength(r'genre', 0, true, 0, true));

  QueryBuilder<Track, Track, QAfterFilterCondition> album(
          final FilterQuery<Album> q) =>
      QueryBuilder.apply(this, (final query) => query.link(q, r'album'));

  QueryBuilder<Track, Track, QAfterFilterCondition> albumIsNull() =>
      QueryBuilder.apply(
          this, (final query) => query.linkLength(r'album', 0, true, 0, true));

  QueryBuilder<Track, Track, QAfterFilterCondition> year(
          final FilterQuery<Year> q) =>
      QueryBuilder.apply(this, (final query) => query.link(q, r'year'));

  QueryBuilder<Track, Track, QAfterFilterCondition> yearIsNull() =>
      QueryBuilder.apply(
          this, (final query) => query.linkLength(r'year', 0, true, 0, true));
}

extension TrackQuerySortBy on QueryBuilder<Track, Track, QSortBy> {
  QueryBuilder<Track, Track, QAfterSortBy> sortByLyrics() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'lyrics', Sort.asc));

  QueryBuilder<Track, Track, QAfterSortBy> sortByLyricsDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'lyrics', Sort.desc));

  QueryBuilder<Track, Track, QAfterSortBy> sortByPath() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'path', Sort.asc));

  QueryBuilder<Track, Track, QAfterSortBy> sortByPathDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'path', Sort.desc));

  QueryBuilder<Track, Track, QAfterSortBy> sortByTitle() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'title', Sort.asc));

  QueryBuilder<Track, Track, QAfterSortBy> sortByTitleDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'title', Sort.desc));

  QueryBuilder<Track, Track, QAfterSortBy> sortByTrackNumber() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'trackNumber', Sort.asc));

  QueryBuilder<Track, Track, QAfterSortBy> sortByTrackNumberDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'trackNumber', Sort.desc));

  QueryBuilder<Track, Track, QAfterSortBy> sortByTrackTotal() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'trackTotal', Sort.asc));

  QueryBuilder<Track, Track, QAfterSortBy> sortByTrackTotalDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'trackTotal', Sort.desc));
}

extension TrackQuerySortThenBy on QueryBuilder<Track, Track, QSortThenBy> {
  QueryBuilder<Track, Track, QAfterSortBy> thenById() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'id', Sort.asc));

  QueryBuilder<Track, Track, QAfterSortBy> thenByIdDesc() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'id', Sort.desc));

  QueryBuilder<Track, Track, QAfterSortBy> thenByLyrics() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'lyrics', Sort.asc));

  QueryBuilder<Track, Track, QAfterSortBy> thenByLyricsDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'lyrics', Sort.desc));

  QueryBuilder<Track, Track, QAfterSortBy> thenByPath() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'path', Sort.asc));

  QueryBuilder<Track, Track, QAfterSortBy> thenByPathDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'path', Sort.desc));

  QueryBuilder<Track, Track, QAfterSortBy> thenByTitle() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'title', Sort.asc));

  QueryBuilder<Track, Track, QAfterSortBy> thenByTitleDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'title', Sort.desc));

  QueryBuilder<Track, Track, QAfterSortBy> thenByTrackNumber() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'trackNumber', Sort.asc));

  QueryBuilder<Track, Track, QAfterSortBy> thenByTrackNumberDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'trackNumber', Sort.desc));

  QueryBuilder<Track, Track, QAfterSortBy> thenByTrackTotal() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'trackTotal', Sort.asc));

  QueryBuilder<Track, Track, QAfterSortBy> thenByTrackTotalDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'trackTotal', Sort.desc));
}

extension TrackQueryWhereDistinct on QueryBuilder<Track, Track, QDistinct> {
  QueryBuilder<Track, Track, QDistinct> distinctByLyrics(
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addDistinctBy(r'lyrics', caseSensitive: caseSensitive));

  QueryBuilder<Track, Track, QDistinct> distinctByPath(
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addDistinctBy(r'path', caseSensitive: caseSensitive));

  QueryBuilder<Track, Track, QDistinct> distinctByTitle(
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addDistinctBy(r'title', caseSensitive: caseSensitive));

  QueryBuilder<Track, Track, QDistinct> distinctByTrackNumber(
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addDistinctBy(r'trackNumber',
              caseSensitive: caseSensitive));

  QueryBuilder<Track, Track, QDistinct> distinctByTrackTotal(
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addDistinctBy(r'trackTotal', caseSensitive: caseSensitive));
}

extension TrackQueryProperty on QueryBuilder<Track, Track, QQueryProperty> {
  QueryBuilder<Track, int, QQueryOperations> idProperty() =>
      QueryBuilder.apply(this, (final query) => query.addPropertyName(r'id'));

  QueryBuilder<Track, String?, QQueryOperations> lyricsProperty() =>
      QueryBuilder.apply(
          this, (final query) => query.addPropertyName(r'lyrics'));

  QueryBuilder<Track, String, QQueryOperations> pathProperty() =>
      QueryBuilder.apply(this, (final query) => query.addPropertyName(r'path'));

  QueryBuilder<Track, String?, QQueryOperations> titleProperty() =>
      QueryBuilder.apply(
          this, (final query) => query.addPropertyName(r'title'));

  QueryBuilder<Track, String?, QQueryOperations> trackNumberProperty() =>
      QueryBuilder.apply(
          this, (final query) => query.addPropertyName(r'trackNumber'));

  QueryBuilder<Track, String?, QQueryOperations> trackTotalProperty() =>
      QueryBuilder.apply(
          this, (final query) => query.addPropertyName(r'trackTotal'));
}
