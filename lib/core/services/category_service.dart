import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jommalaysia/core/constants/app_constants.dart';
import 'api_response_decoder.dart';

class CategoryService {
  static const endpoint = API.endpoint + "/categories";

  var _client = http.Client();

  Future<T> fetchCategories<T, K>() async {
    final jsonReponse = await _client.get('$endpoint');
    print("calling category api");
    // Parse into List
    if (jsonReponse.statusCode == 200) {
      final jsonBody = json.decode(jsonReponse.body);
      return ResponseDecoder.fromJson<T, K>(jsonBody);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load categories');
    }
  }
}
