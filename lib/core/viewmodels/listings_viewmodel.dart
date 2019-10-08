import 'package:flutter/material.dart';
import 'package:jommalaysia/core/enums/viewstate.dart';
import 'package:jommalaysia/core/models/listing.dart';
import 'package:jommalaysia/core/services/listing_service.dart';

class ListingsViewModel extends ChangeNotifier {
  ListingService _listingService;
  ViewState viewState;
  List<Listing> listings;

  ListingsViewModel({@required ListingService listingService}) {
    _listingService = listingService;
    print("view model run");
  }
  void setState(ViewState viewState) {
    viewState = viewState;
    notifyListeners();
  }

  Future<bool> fetchListings() async {
    setState(ViewState.Busy);
    listings = await _listingService.fetchListings<List<Listing>, Listing>();
    setState(ViewState.Idle);
    return true;
  }
}
