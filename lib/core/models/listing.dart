import 'package:flutter/material.dart';

class Listing {
  final String id;
  final String name;
  final String type;
  // final Address address;
  final String phone;
  // final Photo logo;
  // final List<String> tags;

  const Listing(
      {@required this.id,
      @required this.name,
      @required this.type,
      @required this.phone});
}
