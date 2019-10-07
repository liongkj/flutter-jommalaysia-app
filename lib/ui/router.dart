import 'package:flutter/material.dart';
import 'package:jommalaysia/core/constants/app_constants.dart';
import '../ui/views/listing_detail_screen.dart';
import '../ui/views/listings_screen.dart';

class Router {
  static Route<dynamic> generateAndroidRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => ListingsScreen());
      case RoutePaths.LISTINGINFO:
        return MaterialPageRoute(builder: (_) => ListingDetailsScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
