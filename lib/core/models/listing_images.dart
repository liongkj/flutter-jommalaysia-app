import 'package:json_annotation/json_annotation.dart';

import 'image.dart';

part 'listing_images.g.dart';

@JsonSerializable()
class ListingImages {
  ListingImages({this.logo, this.coverPhoto, this.listingDetails});

  factory ListingImages.fromJson(Map<String, dynamic> json) =>
      _$ListingImagesFromJson(json);

  final Image logo;
  final Image coverPhoto;
  final List<Image> listingDetails;

  Map<String, dynamic> toJson() => _$ListingImagesToJson(this);
}
