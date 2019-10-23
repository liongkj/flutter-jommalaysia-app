import 'package:flutter/material.dart';
import 'package:jommalaysia/core/models/category.dart';
import 'package:jommalaysia/core/models/listing.dart';
import 'package:jommalaysia/core/services/listing_service.dart';

class ListingsProvider extends ChangeNotifier {
  ListingsProvider({@required ListingService listingService})
      : _listingService = listingService;

  ListingService _listingService;

  List<Listing> _listings;

  List<Listing> get listings => [..._listings];

  Future<void> fetchListings() async {
    _listings = await _listingService.fetchListings<List<Listing>, Listing>();
  }

  List<Listing> getCategoryListings(Category category) {
    return _listings
        .where((c) => c.category.category == category.categoryPath.category)
        .toList();
  }

  List<Listing> getSubcategoryListings(Category subcategory) {
    return _listings
        .where((c) => c.category == subcategory.categoryPath)
        .toList();
  }

  bool isComingSoon(subcategoryList) {
    return _listings.isEmpty;
  }
}
