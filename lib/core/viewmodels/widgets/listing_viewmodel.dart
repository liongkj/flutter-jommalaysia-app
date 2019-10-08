import 'package:flutter/material.dart';
import 'package:jommalaysia/core/enums/viewstate.dart';
import 'package:jommalaysia/core/models/listing.dart';
import 'package:jommalaysia/core/services/listing_service.dart';
import 'package:jommalaysia/core/viewmodels/base_viewmodel.dart';

class ListingViewModel extends BaseViewmodel {
  ListingService _listingService;

  ListingViewModel({@required ListingService listingService})
      : _listingService = listingService;

  List<Listing> listings;

  Future<bool> fetchListings() async {
    setState(ViewState.Busy);
    listings = await _listingService.fetchListings<List<Listing>, Listing>();
    setState(ViewState.Idle);
    return true;
  }
}
