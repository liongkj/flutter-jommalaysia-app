// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingImages _$ListingImagesFromJson(Map<String, dynamic> json) {
  return ListingImages(
    logo: json['logo'] == null
        ? null
        : Image.fromJson(json['logo'] as Map<String, dynamic>),
    coverPhoto: json['coverPhoto'] == null
        ? null
        : Image.fromJson(json['coverPhoto'] as Map<String, dynamic>),
    listingDetails: (json['listingDetails'] as List)
        ?.map(
            (e) => e == null ? null : Image.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListingImagesToJson(ListingImages instance) =>
    <String, dynamic>{
      'logo': instance.logo,
      'coverPhoto': instance.coverPhoto,
      'listingDetails': instance.listingDetails,
    };
