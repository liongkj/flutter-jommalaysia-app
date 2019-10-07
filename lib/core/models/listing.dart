import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listing.g.dart';

@JsonSerializable()
class Listing {
  const Listing(
      {@required this.id,
      @required this.name,
      @required this.type,
      @required this.phone});

  final String id;
  final String name;
  final String type;
  // final Address address;
  final String phone;
  // final Photo logo;
  // final List<String> tags;

  factory Listing.fromJson(Map<String, dynamic> json) =>
      _$ListingFromJson(json);

  Map<String, dynamic> toJson() => _$ListingToJson(this);
}
