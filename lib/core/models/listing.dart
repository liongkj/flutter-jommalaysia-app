import 'package:jommalaysia/core/enums/listingtype.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'category.dart';
import 'merchant.dart';
part 'listing.g.dart';

const String controller = 'listings';

@JsonSerializable()
class Listing {
  String listingId;
  // Merchant merchant;
  String listingName;
  // String description;
  // List<String> tags;
  // Address address;
  // String status;
  // ListingType listingType;
  // Category category;
  // String createdAt;
  // String modifiedAt;

  Listing({
    this.listingId,
    // this.merchant,
    this.listingName,
    // this.description,
    // this.tags,
    // this.address,
    // this.status,
    // this.listingType,
    // this.category,
    // this.createdAt,
    // this.modifiedAt,
  });

  factory Listing.fromJson(Map<String, dynamic> json) =>
      _$ListingFromJson(json);

  Map<String, dynamic> toJson() => _$ListingToJson(this);
}
