// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingType _$ListingTypeFromJson(Map<String, dynamic> json) {
  return ListingType(
    name: _$enumDecodeNullable(_$ListingTypeEnumEnumMap, json['name']),
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$ListingTypeToJson(ListingType instance) =>
    <String, dynamic>{
      'name': _$ListingTypeEnumEnumMap[instance.name],
      'id': instance.id,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ListingTypeEnumEnumMap = {
  ListingTypeEnum.government: 'gover',
  ListingTypeEnum.local: 'local',
  ListingTypeEnum.event: 'event',
  ListingTypeEnum.civic: 'civic',
};
