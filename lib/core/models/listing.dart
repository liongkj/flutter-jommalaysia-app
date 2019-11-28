import 'package:jommalaysia/core/models/listing_images.dart';
import 'package:jommalaysia/core/models/listing_type.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'category_path.dart';
import 'merchant.dart';

part 'listing.g.dart';

const String controller = 'listings';

@JsonSerializable()
class Listing {
  Listing({
    this.listingId,
    this.merchant,
    this.listingName,
    this.description,
    this.tags,
    this.address,
    this.listingImages,
    this.listingType,
    this.category,
    // this.createdAt,
    // this.modifiedAt,
  });

  factory Listing.fromJson(Map<String, dynamic> json) =>
      _$ListingFromJson(json);

  String listingId;
  Merchant merchant;
  String listingName;
  String description;
  List<String> tags;
  ListingImages listingImages;
  Address address;
  ListingType listingType;
  CategoryPath category;
  // String createdAt;
  // String modifiedAt;

  Map<String, dynamic> toJson() => _$ListingToJson(this);
}
