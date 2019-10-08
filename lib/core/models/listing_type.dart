import '../enums/listing_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listing_type.g.dart';

@JsonSerializable()
class ListingType {
  final ListingTypeEnum listingType;
  final int id;

  ListingType({this.listingType, this.id});

  factory ListingType.fromJson(Map<String, dynamic> json) =>
      _$ListingTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ListingTypeToJson(this);
}
