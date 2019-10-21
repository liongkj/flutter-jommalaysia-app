import 'package:flutter/material.dart';
import 'package:jommalaysia/core/enums/viewstate.dart';
import 'package:jommalaysia/core/models/category.dart';
import 'package:jommalaysia/core/models/listing.dart';
import 'package:jommalaysia/core/providers/base_provider.dart';
import 'package:jommalaysia/core/services/listing_service.dart';

class ListingsProvider extends BaseProvider {
  ListingsProvider({@required ListingService listingService})
      : _listingService = listingService;

  ListingService _listingService;

  List<Listing> _listings;

  List<Listing> get listings => [..._listings];

  Future<bool> fetchListings(Category category) async {
    setState(ViewState.busy);
    _listings =
        await _listingService.fetchListings<List<Listing>, Listing>(category);
    setState(ViewState.idle);
    return true;
  }

  List<Listing> getListings(Category subcategory) {
    return _listings.where((c) => c.category == subcategory);
  }

  bool isComingSoon(subcategoryList) {
    return _listings.isEmpty;
  }
}
