import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/listing.dart';

/// The service responsible for networking requests
class ListingService {
  static const endpoint = 'https://jommalaysiaapi.azurewebsites.net/api/';

  var client = new http.Client();

  Future<List<Listing>> fetchListings() async {
    List<Listing> listings;

    // Get comments for post
    final response = await client.get('$endpoint/listings');

    // Parse into List
    if (response.statusCode == 200) {
      Iterable decoded = json.decode(response.body);
      listings = decoded.map((var x) => Listing.fromJson(x)).toList();
      return listings;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
