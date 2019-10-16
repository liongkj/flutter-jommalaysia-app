import 'package:flutter/material.dart';
import 'package:jommalaysia/core/enums/viewstate.dart';
import 'package:jommalaysia/core/models/listing.dart';
import 'package:jommalaysia/core/providers/base_provider.dart';
import 'package:jommalaysia/core/services/listing_service.dart';

class ListingsProvider extends BaseProvider {
  ListingsProvider({@required ListingService listingService})
      : _listingService = listingService;

  ListingService _listingService;

  List<Listing> listings;

  Future<bool> fetchListings() async {
    setState(ViewState.busy);
    listings = await _listingService.fetchListings<List<Listing>, Listing>();
    setState(ViewState.idle);
    return true;
  }
}
