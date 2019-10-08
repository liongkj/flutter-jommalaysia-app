import 'package:jommalaysia/core/models/listing.dart';
import 'package:jommalaysia/core/services/api_response_model.dart';

class ResponseDecoder {
  // If T is a List, K is the subtype of the list.

  static T fromJson<T, K>(dynamic json) {
    print("decode response");
    final dynamic data = ApiResponse.fromJson(json).data;
    if (data is Iterable) {
      return _fromJsonList<K>(data) as T;
    }
    if (T == Listing) {
      return Listing.fromJson(json) as T;
    }
    // } else if (T == UserDetails) {
    //   //   return UserDetails.fromJson(json) as T;
    //   // } else if (T == Message) {
    //   //   return Message.fromJson(json) as T;
    // } else {
    throw Exception("Unknown class");
  }

  static List<K> _fromJsonList<K>(List jsonList) {
    if (jsonList == null) {
      return null;
    }

    List<K> output = List();

    for (Map<String, dynamic> json in jsonList) {
      output.add(fromJson(json));
    }

    return output;
  }
}
