import 'package:flutter/material.dart';
import 'package:jommalaysia/util/restaurants.dart';

class ListingLogoThumbnail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
        child: Image(
          fit: BoxFit.fill,
          image: AssetImage(restaurants[0]["img"]),
        ),
      ),
    );
  }
}
