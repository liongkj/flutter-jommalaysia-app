import 'package:flutter/material.dart';
import 'package:jommalaysia/core/models/listing.dart';
import '../core/constants/app_constants.dart';
import '../ui/views/listing_detail_screen.dart';
import '../ui/views/search_view_screen.dart';

class Router {
  static Route<dynamic> generateAndroidRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SearchViewScreen());
      case RoutePaths.LISTINGINFO:
        var listing = settings.arguments as Listing;
        return MaterialPageRoute(
            builder: (_) => ListingDetailScreen(
                  listing: listing,
                ));
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
