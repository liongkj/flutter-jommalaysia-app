import 'package:json_annotation/json_annotation.dart';

part 'merchant.g.dart';

@JsonSerializable()
class Merchant {
  Merchant({this.merchantId, this.companyName});

  factory Merchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantFromJson(json);

  String merchantId;
  String companyName;

  Map<String, dynamic> toJson() => _$MerchantToJson(this);
}
