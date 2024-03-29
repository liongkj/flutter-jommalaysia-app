import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Address({
    this.add1,
    this.add2,
    this.city,
    this.state,
    this.postalCode,
    this.country,
  });

  String add1;
  String add2;
  String city;
  String state;
  String postalCode;
  String country;

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
