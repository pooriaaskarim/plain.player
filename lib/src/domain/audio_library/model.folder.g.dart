// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.folder.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetFolderCollection on Isar {
  IsarCollection<Folder> get folders => this.collection();
}

const FolderSchema = CollectionSchema(
  name: r'Folder',
  id: 6793289488482879694,
  properties: {
    r'path': PropertySchema(
      id: 0,
      name: r'path',
      type: IsarType.string,
    )
  },
  estimateSize: _folderEstimateSize,
  serialize: _folderSerialize,
  deserialize: _folderDeserialize,
  deserializeProp: _folderDeserializeProp,
  idName: r'id',
  indexes: {
    r'path': IndexSchema(
      id: 8756705481922369689,
      name: r'path',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'path',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _folderGetId,
  getLinks: _folderGetLinks,
  attach: _folderAttach,
  version: '3.0.5',
);

int _folderEstimateSize(
  final Folder object,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.path.length * 3;
  return bytesCount;
}

void _folderSerialize(
  final Folder object,
  final IsarWriter writer,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.path);
}

Folder _folderDeserialize(
  final Id id,
  final IsarReader reader,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  final object = Folder(
    path: reader.readString(offsets[0]),
  )..id = id;
  return object;
}

P _folderDeserializeProp<P>(
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

Id _folderGetId(final Folder object) => object.id;

List<IsarLinkBase<dynamic>> _folderGetLinks(final Folder object) => [];

void _folderAttach(
    final IsarCollection<dynamic> col, final Id id, final Folder object) {
  object.id = id;
}

extension FolderByIndex on IsarCollection<Folder> {
  Future<Folder?> getByPath(final String path) => getByIndex(r'path', [path]);

  Folder? getByPathSync(final String path) => getByIndexSync(r'path', [path]);

  Future<bool> deleteByPath(final String path) =>
      deleteByIndex(r'path', [path]);

  bool deleteByPathSync(final String path) =>
      deleteByIndexSync(r'path', [path]);

  Future<List<Folder?>> getAllByPath(final List<String> pathValues) {
    final values = pathValues.map((final e) => [e]).toList();
    return getAllByIndex(r'path', values);
  }

  List<Folder?> getAllByPathSync(final List<String> pathValues) {
    final values = pathValues.map((final e) => [e]).toList();
    return getAllByIndexSync(r'path', values);
  }

  Future<int> deleteAllByPath(final List<String> pathValues) {
    final values = pathValues.map((final e) => [e]).toList();
    return deleteAllByIndex(r'path', values);
  }

  int deleteAllByPathSync(final List<String> pathValues) {
    final values = pathValues.map((final e) => [e]).toList();
    return deleteAllByIndexSync(r'path', values);
  }

  Future<Id> putByPath(final Folder object) => putByIndex(r'path', object);

  Id putByPathSync(final Folder object, {final bool saveLinks = true}) =>
      putByIndexSync(r'path', object, saveLinks: saveLinks);

  Future<List<Id>> putAllByPath(final List<Folder> objects) =>
      putAllByIndex(r'path', objects);

  List<Id> putAllByPathSync(final List<Folder> objects,
          {final bool saveLinks = true}) =>
      putAllByIndexSync(r'path', objects, saveLinks: saveLinks);
}

extension FolderQueryWhereSort on QueryBuilder<Folder, Folder, QWhere> {
  QueryBuilder<Folder, Folder, QAfterWhere> anyId() => QueryBuilder.apply(
      this, (final query) => query.addWhereClause(const IdWhereClause.any()));
}

extension FolderQueryWhere on QueryBuilder<Folder, Folder, QWhereClause> {
  QueryBuilder<Folder, Folder, QAfterWhereClause> idEqualTo(final Id id) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(IdWhereClause.between(
                lower: id,
                upper: id,
              )));

  QueryBuilder<Folder, Folder, QAfterWhereClause> idNotEqualTo(final Id id) =>
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

  QueryBuilder<Folder, Folder, QAfterWhereClause> idGreaterThan(final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.greaterThan(lower: id, includeLower: include),
              ));

  QueryBuilder<Folder, Folder, QAfterWhereClause> idLessThan(final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.lessThan(upper: id, includeUpper: include),
              ));

  QueryBuilder<Folder, Folder, QAfterWhereClause> idBetween(
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

  QueryBuilder<Folder, Folder, QAfterWhereClause> pathEqualTo(
          final String path) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(IndexWhereClause.equalTo(
                indexName: r'path',
                value: [path],
              )));

  QueryBuilder<Folder, Folder, QAfterWhereClause> pathNotEqualTo(
          final String path) =>
      QueryBuilder.apply(this, (final query) {
        if (query.whereSort == Sort.asc) {
          return query
              .addWhereClause(IndexWhereClause.between(
                indexName: r'path',
                lower: [],
                upper: [path],
                includeUpper: false,
              ))
              .addWhereClause(IndexWhereClause.between(
                indexName: r'path',
                lower: [path],
                includeLower: false,
                upper: [],
              ));
        } else {
          return query
              .addWhereClause(IndexWhereClause.between(
                indexName: r'path',
                lower: [path],
                includeLower: false,
                upper: [],
              ))
              .addWhereClause(IndexWhereClause.between(
                indexName: r'path',
                lower: [],
                upper: [path],
                includeUpper: false,
              ));
        }
      });
}

extension FolderQueryFilter on QueryBuilder<Folder, Folder, QFilterCondition> {
  QueryBuilder<Folder, Folder, QAfterFilterCondition> idEqualTo(
          final Id value) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'id',
                value: value,
              )));

  QueryBuilder<Folder, Folder, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Folder, Folder, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Folder, Folder, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Folder, Folder, QAfterFilterCondition> pathEqualTo(
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

  QueryBuilder<Folder, Folder, QAfterFilterCondition> pathGreaterThan(
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

  QueryBuilder<Folder, Folder, QAfterFilterCondition> pathLessThan(
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

  QueryBuilder<Folder, Folder, QAfterFilterCondition> pathBetween(
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

  QueryBuilder<Folder, Folder, QAfterFilterCondition> pathStartsWith(
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

  QueryBuilder<Folder, Folder, QAfterFilterCondition> pathEndsWith(
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

  QueryBuilder<Folder, Folder, QAfterFilterCondition> pathContains(
          final String value,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.contains(
                property: r'path',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Folder, Folder, QAfterFilterCondition> pathMatches(
          final String pattern,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.matches(
                property: r'path',
                wildcard: pattern,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<Folder, Folder, QAfterFilterCondition> pathIsEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'path',
                value: '',
              )));

  QueryBuilder<Folder, Folder, QAfterFilterCondition> pathIsNotEmpty() =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                property: r'path',
                value: '',
              )));
}

extension FolderQueryObject on QueryBuilder<Folder, Folder, QFilterCondition> {}

extension FolderQueryLinks on QueryBuilder<Folder, Folder, QFilterCondition> {}

extension FolderQuerySortBy on QueryBuilder<Folder, Folder, QSortBy> {
  QueryBuilder<Folder, Folder, QAfterSortBy> sortByPath() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'path', Sort.asc));

  QueryBuilder<Folder, Folder, QAfterSortBy> sortByPathDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'path', Sort.desc));
}

extension FolderQuerySortThenBy on QueryBuilder<Folder, Folder, QSortThenBy> {
  QueryBuilder<Folder, Folder, QAfterSortBy> thenById() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'id', Sort.asc));

  QueryBuilder<Folder, Folder, QAfterSortBy> thenByIdDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'id', Sort.desc));

  QueryBuilder<Folder, Folder, QAfterSortBy> thenByPath() => QueryBuilder.apply(
      this, (final query) => query.addSortBy(r'path', Sort.asc));

  QueryBuilder<Folder, Folder, QAfterSortBy> thenByPathDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'path', Sort.desc));
}

extension FolderQueryWhereDistinct on QueryBuilder<Folder, Folder, QDistinct> {
  QueryBuilder<Folder, Folder, QDistinct> distinctByPath(
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) =>
              query.addDistinctBy(r'path', caseSensitive: caseSensitive));
}

extension FolderQueryProperty on QueryBuilder<Folder, Folder, QQueryProperty> {
  QueryBuilder<Folder, int, QQueryOperations> idProperty() =>
      QueryBuilder.apply(this, (final query) => query.addPropertyName(r'id'));

  QueryBuilder<Folder, String, QQueryOperations> pathProperty() =>
      QueryBuilder.apply(this, (final query) => query.addPropertyName(r'path'));
}
