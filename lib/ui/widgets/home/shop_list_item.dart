import 'package:flutter/material.dart';
import 'package:jommalaysia/core/models/listing.dart';

class ShopListItem extends StatelessWidget {
  ShopListItem({
    @required this.shop,
    @required this.onTap,
    @required this.comingSoon,
  });

  final bool comingSoon;
  final Listing shop;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(shop.listingName),
    );
  }
}
