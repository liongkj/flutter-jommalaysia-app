import 'package:flutter/material.dart';
import 'package:jommalaysia/core/enums/viewstate.dart';
import 'package:jommalaysia/core/models/listing.dart';
import 'package:jommalaysia/core/providers/base_provider.dart';
import 'package:jommalaysia/core/services/listing_service.dart';

class ListingsProvider extends BaseProvider {
  ListingService _listingService;

  ListingsProvider({@required ListingService listingService})
      : _listingService = listingService;

  List<Listing> listings;

  Future<bool> fetchListings() async {
    setState(ViewState.Busy);
    listings = await _listingService.fetchListings<List<Listing>, Listing>();
    setState(ViewState.Idle);
    return true;
  }
}
