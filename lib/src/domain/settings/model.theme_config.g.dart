// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.theme_config.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const ThemeConfigSchema = Schema(
  name: r'ThemeConfig',
  id: 5264690155697542449,
  properties: {
    r'themeMode': PropertySchema(
      id: 0,
      name: r'themeMode',
      type: IsarType.string,
      enumMap: _ThemeConfigthemeModeEnumValueMap,
    )
  },
  estimateSize: _themeConfigEstimateSize,
  serialize: _themeConfigSerialize,
  deserialize: _themeConfigDeserialize,
  deserializeProp: _themeConfigDeserializeProp,
);

int _themeConfigEstimateSize(
  final ThemeConfig object,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.themeMode.name.length * 3;
  return bytesCount;
}

void _themeConfigSerialize(
  final ThemeConfig object,
  final IsarWriter writer,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.themeMode.name);
}

ThemeConfig _themeConfigDeserialize(
  final Id id,
  final IsarReader reader,
  final List<int> offsets,
  final Map<Type, List<int>> allOffsets,
) {
  final object = ThemeConfig(
    themeMode: _ThemeConfigthemeModeValueEnumMap[
            reader.readStringOrNull(offsets[0])] ??
        ThemeMode.light,
  );
  return object;
}

P _themeConfigDeserializeProp<P>(
  final IsarReader reader,
  final int propertyId,
  final int offset,
  final Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_ThemeConfigthemeModeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          ThemeMode.light) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ThemeConfigthemeModeEnumValueMap = {
  r'system': r'system',
  r'light': r'light',
  r'dark': r'dark',
};
const _ThemeConfigthemeModeValueEnumMap = {
  r'system': ThemeMode.system,
  r'light': ThemeMode.light,
  r'dark': ThemeMode.dark,
};

extension ThemeConfigQueryFilter
    on QueryBuilder<ThemeConfig, ThemeConfig, QFilterCondition> {
  QueryBuilder<ThemeConfig, ThemeConfig, QAfterFilterCondition>
      themeModeEqualTo(
    final ThemeMode value, {
    final bool caseSensitive = true,
  }) =>
          QueryBuilder.apply(
              this,
              (final query) => query.addFilterCondition(FilterCondition.equalTo(
                    property: r'themeMode',
                    value: value,
                    caseSensitive: caseSensitive,
                  )));

  QueryBuilder<ThemeConfig, ThemeConfig,
      QAfterFilterCondition> themeModeGreaterThan(
    final ThemeMode value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                include: include,
                property: r'themeMode',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<ThemeConfig, ThemeConfig,
      QAfterFilterCondition> themeModeLessThan(
    final ThemeMode value, {
    final bool include = false,
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.lessThan(
                include: include,
                property: r'themeMode',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<ThemeConfig, ThemeConfig, QAfterFilterCondition>
      themeModeBetween(
    final ThemeMode lower,
    final ThemeMode upper, {
    final bool includeLower = true,
    final bool includeUpper = true,
    final bool caseSensitive = true,
  }) =>
          QueryBuilder.apply(
              this,
              (final query) => query.addFilterCondition(FilterCondition.between(
                    property: r'themeMode',
                    lower: lower,
                    includeLower: includeLower,
                    upper: upper,
                    includeUpper: includeUpper,
                    caseSensitive: caseSensitive,
                  )));

  QueryBuilder<ThemeConfig, ThemeConfig,
      QAfterFilterCondition> themeModeStartsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.startsWith(
                property: r'themeMode',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<ThemeConfig, ThemeConfig,
      QAfterFilterCondition> themeModeEndsWith(
    final String value, {
    final bool caseSensitive = true,
  }) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.endsWith(
                property: r'themeMode',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<ThemeConfig, ThemeConfig,
      QAfterFilterCondition> themeModeContains(final String value,
          {final bool caseSensitive = true}) =>
      QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.contains(
                property: r'themeMode',
                value: value,
                caseSensitive: caseSensitive,
              )));

  QueryBuilder<ThemeConfig, ThemeConfig, QAfterFilterCondition>
      themeModeMatches(final String pattern,
              {final bool caseSensitive = true}) =>
          QueryBuilder.apply(
              this,
              (final query) => query.addFilterCondition(FilterCondition.matches(
                    property: r'themeMode',
                    wildcard: pattern,
                    caseSensitive: caseSensitive,
                  )));

  QueryBuilder<ThemeConfig, ThemeConfig, QAfterFilterCondition>
      themeModeIsEmpty() => QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.equalTo(
                property: r'themeMode',
                value: '',
              )));

  QueryBuilder<ThemeConfig, ThemeConfig, QAfterFilterCondition>
      themeModeIsNotEmpty() => QueryBuilder.apply(
          this,
          (final query) => query.addFilterCondition(FilterCondition.greaterThan(
                property: r'themeMode',
                value: '',
              )));
}

extension ThemeConfigQueryObject
    on QueryBuilder<ThemeConfig, ThemeConfig, QFilterCondition> {}
