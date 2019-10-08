// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Listing _$ListingFromJson(Map<String, dynamic> json) {
  return Listing(
    listingId: json['listingId'] as String,
    listingName: json['listingName'] as String,
  );
}

Map<String, dynamic> _$ListingToJson(Listing instance) => <String, dynamic>{
      'listingId': instance.listingId,
      'listingName': instance.listingName,
    };
