// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetSettingsCollection on Isar {
  IsarCollection<Settings> get settings => this.collection();
}

const SettingsSchema = CollectionSchema(
  name: r'Settings',
  id: -8656046621518759136,
  properties: {
    r'themeConfig': PropertySchema(
      id: 0,
      name: r'themeConfig',
      type: IsarType.object,
      target: r'ThemeConfig',
    )
  },
  estimateSize: _settingsEstimateSize,
  serialize: _settingsSerialize,
  deserialize: _settingsDeserialize,
  deserializeProp: _settingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ThemeConfig': ThemeConfigSchema},
  getId: _settingsGetId,
  getLinks: _settingsGetLinks,
  attach: _settingsAttach,
  version: '3.0.5',
);

int _settingsEstimateSize(
  final Settings object,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      ThemeConfigSchema.estimateSize(
          object.themeConfig, allOffsets[ThemeConfig]!, allOffsets);
  return bytesCount;
}

void _settingsSerialize(
  final Settings object,
  final IsarWriter writer,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<ThemeConfig>(
    offsets[0],
    allOffsets,
    ThemeConfigSchema.serialize,
    object.themeConfig,
  );
}

Settings _settingsDeserialize(
  final Id id,
  final IsarReader reader,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  final object = Settings(
    themeConfig: reader.readObjectOrNull<ThemeConfig>(
          offsets[0],
          ThemeConfigSchema.deserialize,
          allOffsets,
        ) ??
        ThemeConfig(),
  );
  return object;
}

P _settingsDeserializeProp<P>(
  final IsarReader reader,
  final int propertyId,
  final int offset,
  final Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<ThemeConfig>(
            offset,
            ThemeConfigSchema.deserialize,
            allOffsets,
          ) ??
          ThemeConfig()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _settingsGetId(final Settings object) => object.id;

List<IsarLinkBase<dynamic>> _settingsGetLinks(final Settings object) => [];

void _settingsAttach(
    final IsarCollection<dynamic> col, final Id id, final Settings object) {}

extension SettingsQueryWhereSort on QueryBuilder<Settings, Settings, QWhere> {
  QueryBuilder<Settings, Settings, QAfterWhere> anyId() => QueryBuilder.apply(
      this, (final query) => query.addWhereClause(const IdWhereClause.any()));
}

extension SettingsQueryWhere on QueryBuilder<Settings, Settings, QWhereClause> {
  QueryBuilder<Settings, Settings, QAfterWhereClause> idEqualTo(final Id id) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(IdWhereClause.between(
                lower: id,
                upper: id,
              )));

  QueryBuilder<Settings, Settings, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<Settings, Settings, QAfterWhereClause> idGreaterThan(final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.greaterThan(lower: id, includeLower: include),
              ));

  QueryBuilder<Settings, Settings, QAfterWhereClause> idLessThan(final Id id,
          {final bool include = false}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addWhereClause(
                IdWhereClause.lessThan(upper: id, includeUpper: include),
              ));

  QueryBuilder<Settings, Settings, QAfterWhereClause> idBetween(
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

extension SettingsQueryFilter
    on QueryBuilder<Settings, Settings, QFilterCondition> {
  QueryBuilder<Settings, Settings, QAfterFilterCondition> idEqualTo(
          final Id value) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'id',
                value: value,
              )));

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idBetween(
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

extension SettingsQueryObject
    on QueryBuilder<Settings, Settings, QFilterCondition> {
  QueryBuilder<Settings, Settings, QAfterFilterCondition> themeConfig(
          final FilterQuery<ThemeConfig> q) =>
      QueryBuilder.apply(
          this, (final query) => query.object(q, r'themeConfig'));
}

extension SettingsQueryLinks
    on QueryBuilder<Settings, Settings, QFilterCondition> {}

extension SettingsQuerySortBy on QueryBuilder<Settings, Settings, QSortBy> {}

extension SettingsQuerySortThenBy
    on QueryBuilder<Settings, Settings, QSortThenBy> {
  QueryBuilder<Settings, Settings, QAfterSortBy> thenById() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'id', Sort.asc));

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByIdDesc() =>
      QueryBuilder.apply(
          this, (final query) => query.addSortBy(r'id', Sort.desc));
}

extension SettingsQueryWhereDistinct
    on QueryBuilder<Settings, Settings, QDistinct> {}

extension SettingsQueryProperty
    on QueryBuilder<Settings, Settings, QQueryProperty> {
  QueryBuilder<Settings, int, QQueryOperations> idProperty() =>
      QueryBuilder.apply(this, (final query) => query.addPropertyName(r'id'));

  QueryBuilder<Settings, ThemeConfig, QQueryOperations> themeConfigProperty() =>
      QueryBuilder.apply(
          this, (final query) => query.addPropertyName(r'themeConfig'));
}
