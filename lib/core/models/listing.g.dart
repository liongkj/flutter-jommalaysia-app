// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Listing _$ListingFromJson(Map<String, dynamic> json) {
  return Listing(
    listingId: json['listingId'] as String,
    merchant: json['merchant'] == null
        ? null
        : Merchant.fromJson(json['merchant'] as Map<String, dynamic>),
    listingName: json['listingName'] as String,
    description: json['description'] as String,
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    listingImages: json['listingImages'] == null
        ? null
        : ListingImages.fromJson(json['listingImages'] as Map<String, dynamic>),
    listingType: json['listingType'] == null
        ? null
        : ListingType.fromJson(json['listingType'] as Map<String, dynamic>),
    category: json['category'] == null
        ? null
        : CategoryPath.fromJson(json['category'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListingToJson(Listing instance) => <String, dynamic>{
      'listingId': instance.listingId,
      'merchant': instance.merchant,
      'listingName': instance.listingName,
      'description': instance.description,
      'tags': instance.tags,
      'listingImages': instance.listingImages,
      'address': instance.address,
      'listingType': instance.listingType,
      'category': instance.category,
    };
