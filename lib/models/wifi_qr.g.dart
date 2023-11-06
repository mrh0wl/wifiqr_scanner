// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_qr.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWifiQRCollection on Isar {
  IsarCollection<WifiQR> get wifiQRs => this.collection();
}

const WifiQRSchema = CollectionSchema(
  name: r'WifiQR',
  id: 2538378859585384603,
  properties: {
    r'created_at': PropertySchema(
      id: 0,
      name: r'created_at',
      type: IsarType.dateTime,
    ),
    r'pass': PropertySchema(
      id: 1,
      name: r'pass',
      type: IsarType.string,
    ),
    r'security': PropertySchema(
      id: 2,
      name: r'security',
      type: IsarType.string,
    ),
    r'ssid': PropertySchema(
      id: 3,
      name: r'ssid',
      type: IsarType.string,
    )
  },
  estimateSize: _wifiQREstimateSize,
  serialize: _wifiQRSerialize,
  deserialize: _wifiQRDeserialize,
  deserializeProp: _wifiQRDeserializeProp,
  idName: r'id',
  indexes: {
    r'ssid': IndexSchema(
      id: -5224848043220286910,
      name: r'ssid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'ssid',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _wifiQRGetId,
  getLinks: _wifiQRGetLinks,
  attach: _wifiQRAttach,
  version: '3.1.0+1',
);

int _wifiQREstimateSize(
  WifiQR object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.pass;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.security.length * 3;
  bytesCount += 3 + object.ssid.length * 3;
  return bytesCount;
}

void _wifiQRSerialize(
  WifiQR object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.pass);
  writer.writeString(offsets[2], object.security);
  writer.writeString(offsets[3], object.ssid);
}

WifiQR _wifiQRDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WifiQR(
    pass: reader.readStringOrNull(offsets[1]),
    security: reader.readString(offsets[2]),
    ssid: reader.readString(offsets[3]),
  );
  return object;
}

P _wifiQRDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _wifiQRGetId(WifiQR object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _wifiQRGetLinks(WifiQR object) {
  return [];
}

void _wifiQRAttach(IsarCollection<dynamic> col, Id id, WifiQR object) {}

extension WifiQRQueryWhereSort on QueryBuilder<WifiQR, WifiQR, QWhere> {
  QueryBuilder<WifiQR, WifiQR, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterWhere> anySsid() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'ssid'),
      );
    });
  }
}

extension WifiQRQueryWhere on QueryBuilder<WifiQR, WifiQR, QWhereClause> {
  QueryBuilder<WifiQR, WifiQR, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<WifiQR, WifiQR, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterWhereClause> idBetween(
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

  QueryBuilder<WifiQR, WifiQR, QAfterWhereClause> ssidEqualTo(String ssid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ssid',
        value: [ssid],
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterWhereClause> ssidNotEqualTo(String ssid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ssid',
              lower: [],
              upper: [ssid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ssid',
              lower: [ssid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ssid',
              lower: [ssid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ssid',
              lower: [],
              upper: [ssid],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterWhereClause> ssidGreaterThan(
    String ssid, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'ssid',
        lower: [ssid],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterWhereClause> ssidLessThan(
    String ssid, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'ssid',
        lower: [],
        upper: [ssid],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterWhereClause> ssidBetween(
    String lowerSsid,
    String upperSsid, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'ssid',
        lower: [lowerSsid],
        includeLower: includeLower,
        upper: [upperSsid],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterWhereClause> ssidStartsWith(
      String SsidPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'ssid',
        lower: [SsidPrefix],
        upper: ['$SsidPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterWhereClause> ssidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ssid',
        value: [''],
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterWhereClause> ssidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'ssid',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'ssid',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'ssid',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'ssid',
              upper: [''],
            ));
      }
    });
  }
}

extension WifiQRQueryFilter on QueryBuilder<WifiQR, WifiQR, QFilterCondition> {
  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created_at',
        value: value,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'created_at',
        value: value,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'created_at',
        value: value,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'created_at',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> passIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pass',
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> passIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pass',
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> passEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> passGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> passLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> passBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pass',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> passStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> passEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> passContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> passMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pass',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> passIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pass',
        value: '',
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> passIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pass',
        value: '',
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> securityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'security',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> securityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'security',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> securityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'security',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> securityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'security',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> securityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'security',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> securityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'security',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> securityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'security',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> securityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'security',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> securityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'security',
        value: '',
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> securityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'security',
        value: '',
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> ssidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ssid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> ssidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ssid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> ssidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ssid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> ssidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ssid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> ssidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ssid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> ssidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ssid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> ssidContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ssid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> ssidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ssid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> ssidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ssid',
        value: '',
      ));
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterFilterCondition> ssidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ssid',
        value: '',
      ));
    });
  }
}

extension WifiQRQueryObject on QueryBuilder<WifiQR, WifiQR, QFilterCondition> {}

extension WifiQRQueryLinks on QueryBuilder<WifiQR, WifiQR, QFilterCondition> {}

extension WifiQRQuerySortBy on QueryBuilder<WifiQR, WifiQR, QSortBy> {
  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created_at', Sort.asc);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created_at', Sort.desc);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> sortByPass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pass', Sort.asc);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> sortByPassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pass', Sort.desc);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> sortBySecurity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'security', Sort.asc);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> sortBySecurityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'security', Sort.desc);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> sortBySsid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ssid', Sort.asc);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> sortBySsidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ssid', Sort.desc);
    });
  }
}

extension WifiQRQuerySortThenBy on QueryBuilder<WifiQR, WifiQR, QSortThenBy> {
  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created_at', Sort.asc);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created_at', Sort.desc);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> thenByPass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pass', Sort.asc);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> thenByPassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pass', Sort.desc);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> thenBySecurity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'security', Sort.asc);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> thenBySecurityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'security', Sort.desc);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> thenBySsid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ssid', Sort.asc);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QAfterSortBy> thenBySsidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ssid', Sort.desc);
    });
  }
}

extension WifiQRQueryWhereDistinct on QueryBuilder<WifiQR, WifiQR, QDistinct> {
  QueryBuilder<WifiQR, WifiQR, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'created_at');
    });
  }

  QueryBuilder<WifiQR, WifiQR, QDistinct> distinctByPass(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pass', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QDistinct> distinctBySecurity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'security', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WifiQR, WifiQR, QDistinct> distinctBySsid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ssid', caseSensitive: caseSensitive);
    });
  }
}

extension WifiQRQueryProperty on QueryBuilder<WifiQR, WifiQR, QQueryProperty> {
  QueryBuilder<WifiQR, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WifiQR, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'created_at');
    });
  }

  QueryBuilder<WifiQR, String?, QQueryOperations> passProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pass');
    });
  }

  QueryBuilder<WifiQR, String, QQueryOperations> securityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'security');
    });
  }

  QueryBuilder<WifiQR, String, QQueryOperations> ssidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ssid');
    });
  }
}
