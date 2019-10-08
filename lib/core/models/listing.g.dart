// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Listing _$ListingFromJson(Map<String, dynamic> json) {
  return Listing(
    listingId: json['listingId'] as String,
    listingName: json['listingName'] as String,
    listingType: json['listingType'] == null
        ? null
        : ListingType.fromJson(json['listingType'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListingToJson(Listing instance) => <String, dynamic>{
      'listingId': instance.listingId,
      'listingName': instance.listingName,
      'listingType': instance.listingType,
    };
