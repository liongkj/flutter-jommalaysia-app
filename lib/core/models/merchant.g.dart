// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Merchant _$MerchantFromJson(Map<String, dynamic> json) {
  return Merchant(
    merchantId: json['merchantId'] as String,
    companyName: json['companyName'] as String,
  );
}

Map<String, dynamic> _$MerchantToJson(Merchant instance) => <String, dynamic>{
      'merchantId': instance.merchantId,
      'companyName': instance.companyName,
    };
