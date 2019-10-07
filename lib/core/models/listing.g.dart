// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Listing _$ListingFromJson(Map<String, dynamic> json) {
  return Listing(
    id: json['id'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$ListingToJson(Listing instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'phone': instance.phone,
    };
