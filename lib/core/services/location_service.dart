import 'dart:convert';

import 'package:http/http.dart' as http;
import 'api_response_decoder.dart';

/// The service responsible for networking requests
class LocationService {
  static const endpoint = '';

  var _client = new http.Client();

  Future fetchUserLocation() async {
    return 'N9';
  }

  Future fetchEnabledStates<T, K>() async {
    //   final jsonReponse = await _client.get('$endpoint/');

    //   if (jsonReponse.statusCode == 200) {
    //     final jsonBody = json.decode(jsonReponse.body);
    //     return ResponseDecoder.fromJson<T, K>(jsonBody);
    //   } else {
    //     throw Exception('Failed to load post');
    //   }
    // }

    //TODO fetch from firebase?
    List<String> states = new List<String>();
    states.add("N9");
    states.add("JHR");
    return states;
  }
}
