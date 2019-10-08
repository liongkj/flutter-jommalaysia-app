import 'package:flutter/material.dart';
import 'package:jommalaysia/core/models/listing.dart';

class ListingDetailScreen extends StatelessWidget {
  final Listing listing;

  ListingDetailScreen({Key key, this.listing}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final listing = ModalRoute.of(context).settings.arguments as Listing;

    return Scaffold(
      appBar: AppBar(
        title: Text(listing.listingName),
      ),
      body: Center(
        child: Text(
          listing.listingId,
        ),
      ),
    );
  }
}
