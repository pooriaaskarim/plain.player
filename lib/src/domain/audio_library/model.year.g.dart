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
  Year object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.year.length * 3;
  return bytesCount;
}

void _yearSerialize(
  Year object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.year);
}

Year _yearDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Year(
    year: reader.readString(offsets[0]),
  );
  return object;
}

P _yearDeserializeProp<P>(
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

Id _yearGetId(Year object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _yearGetLinks(Year object) {
  return [object.tracks];
}

void _yearAttach(IsarCollection<dynamic> col, Id id, Year object) {
  object.tracks.attach(col, col.isar.collection<Track>(), r'tracks', id);
}

extension YearByIndex on IsarCollection<Year> {
  Future<Year?> getByYear(String year) {
    return getByIndex(r'year', [year]);
  }

  Year? getByYearSync(String year) {
    return getByIndexSync(r'year', [year]);
  }

  Future<bool> deleteByYear(String year) {
    return deleteByIndex(r'year', [year]);
  }

  bool deleteByYearSync(String year) {
    return deleteByIndexSync(r'year', [year]);
  }

  Future<List<Year?>> getAllByYear(List<String> yearValues) {
    final values = yearValues.map((e) => [e]).toList();
    return getAllByIndex(r'year', values);
  }

  List<Year?> getAllByYearSync(List<String> yearValues) {
    final values = yearValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'year', values);
  }

  Future<int> deleteAllByYear(List<String> yearValues) {
    final values = yearValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'year', values);
  }

  int deleteAllByYearSync(List<String> yearValues) {
    final values = yearValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'year', values);
  }

  Future<Id> putByYear(Year object) {
    return putByIndex(r'year', object);
  }

  Id putByYearSync(Year object, {bool saveLinks = true}) {
    return putByIndexSync(r'year', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByYear(List<Year> objects) {
    return putAllByIndex(r'year', objects);
  }

  List<Id> putAllByYearSync(List<Year> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'year', objects, saveLinks: saveLinks);
  }
}

extension YearQueryWhereSort on QueryBuilder<Year, Year, QWhere> {
  QueryBuilder<Year, Year, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension YearQueryWhere on QueryBuilder<Year, Year, QWhereClause> {
  QueryBuilder<Year, Year, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Year, Year, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Year, Year, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Year, Year, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Year, Year, QAfterWhereClause> idBetween(
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

  QueryBuilder<Year, Year, QAfterWhereClause> yearEqualTo(String year) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'year',
        value: [year],
      ));
    });
  }

  QueryBuilder<Year, Year, QAfterWhereClause> yearNotEqualTo(String year) {
    return QueryBuilder.apply(this, (query) {
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
}

extension YearQueryFilter on QueryBuilder<Year, Year, QFilterCondition> {
  QueryBuilder<Year, Year, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Year, Year, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Year, Year, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Year, Year, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Year, Year, QAfterFilterCondition> yearEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Year, Year, QAfterFilterCondition> yearGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Year, Year, QAfterFilterCondition> yearLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Year, Year, QAfterFilterCondition> yearBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Year, Year, QAfterFilterCondition> yearStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Year, Year, QAfterFilterCondition> yearEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Year, Year, QAfterFilterCondition> yearContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Year, Year, QAfterFilterCondition> yearMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'year',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Year, Year, QAfterFilterCondition> yearIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: '',
      ));
    });
  }

  QueryBuilder<Year, Year, QAfterFilterCondition> yearIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'year',
        value: '',
      ));
    });
  }
}

extension YearQueryObject on QueryBuilder<Year, Year, QFilterCondition> {}

extension YearQueryLinks on QueryBuilder<Year, Year, QFilterCondition> {
  QueryBuilder<Year, Year, QAfterFilterCondition> tracks(FilterQuery<Track> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tracks');
    });
  }

  QueryBuilder<Year, Year, QAfterFilterCondition> tracksLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tracks', length, true, length, true);
    });
  }

  QueryBuilder<Year, Year, QAfterFilterCondition> tracksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tracks', 0, true, 0, true);
    });
  }

  QueryBuilder<Year, Year, QAfterFilterCondition> tracksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tracks', 0, false, 999999, true);
    });
  }

  QueryBuilder<Year, Year, QAfterFilterCondition> tracksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tracks', 0, true, length, include);
    });
  }

  QueryBuilder<Year, Year, QAfterFilterCondition> tracksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tracks', length, include, 999999, true);
    });
  }

  QueryBuilder<Year, Year, QAfterFilterCondition> tracksLengthBetween(
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

extension YearQuerySortBy on QueryBuilder<Year, Year, QSortBy> {
  QueryBuilder<Year, Year, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Year, Year, QAfterSortBy> sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension YearQuerySortThenBy on QueryBuilder<Year, Year, QSortThenBy> {
  QueryBuilder<Year, Year, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Year, Year, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Year, Year, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Year, Year, QAfterSortBy> thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension YearQueryWhereDistinct on QueryBuilder<Year, Year, QDistinct> {
  QueryBuilder<Year, Year, QDistinct> distinctByYear(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year', caseSensitive: caseSensitive);
    });
  }
}

extension YearQueryProperty on QueryBuilder<Year, Year, QQueryProperty> {
  QueryBuilder<Year, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Year, String, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}
