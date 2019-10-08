import 'dart:convert';

import 'package:http/http.dart' as http;
import 'api_response_decoder.dart';

/// The service responsible for networking requests
class ListingService {
  static const endpoint = 'https://jommalaysiaapi.azurewebsites.net/api/';

  var client = new http.Client();

  // Future<List<Listing>> fetchListings() async {
  Future<T> fetchListings<T, K>() async {
    // Get comments for post
    final jsonReponse = await client.get('$endpoint/listings');

    // Parse into List
    if (jsonReponse.statusCode == 200) {
      final jsonBody = json.decode(jsonReponse.body);
      return ResponseDecoder.fromJson<T, K>(jsonBody);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
