import 'package:flutter/material.dart';
import 'package:jommalaysia/core/models/listing.dart';

class ListingDetail extends StatelessWidget {
  ListingDetail({this.listing});

  final Listing listing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(listing.listingName),
      ),
    );
  }
}
