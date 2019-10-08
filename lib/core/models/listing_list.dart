import 'listing.dart';

class ListingList {
  final List<Listing> listings;

  ListingList({this.listings});

  factory ListingList.fromJson(List<dynamic> parsedJson) {
    List<Listing> listings = new List<Listing>();
    listings = parsedJson.map((i) => Listing.fromJson(i)).toList();

    return new ListingList(
      listings: listings,
    );
  }
}
