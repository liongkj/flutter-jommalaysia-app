import 'package:json_annotation/json_annotation.dart';

import '../enums/listing_type.dart';

part 'listing_type.g.dart';

@JsonSerializable()
class ListingType {
  ListingType({this.name});

  factory ListingType.fromJson(Map<String, dynamic> json) =>
      _$ListingTypeFromJson(json);

  final ListingTypeEnum name;

  Map<String, dynamic> toJson() => _$ListingTypeToJson(this);
}
