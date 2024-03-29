import 'package:flutter/material.dart';
import 'package:jommalaysia/core/models/category.dart';
import 'package:jommalaysia/ui/screens/home/category_row/category_grid.dart';
import 'package:jommalaysia/ui/screens/home/category_row/shop_list.dart';
import 'package:jommalaysia/ui/screens/home/category_row/subcategory_grid.dart';
import 'package:jommalaysia/ui/widgets/listing_detail.dart';
import '../core/constants/app_constants.dart';
import 'screens/home/home.dart';

class Router {
  static Route<dynamic> generateAndroidRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      // return MaterialPageRoute(builder: (_) => SearchViewScreen());
      case RoutePaths.categoryGrid:
        // var categories = settings.arguments as List<Category>;
        return MaterialPageRoute(
          builder: (_) => CategoryGrid(),
        );
      case RoutePaths.subcategoryGrid:
        Map<String, dynamic> args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => SubcategoryGrid(
            selected: args["selected"],
            subcategoryList: args["subcategoryList"],
          ),
        );
      case RoutePaths.listingListView:
        Map<String, dynamic> args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => ListingList(
            selected: args["selected"],
          ),
        );
      case RoutePaths.listingDetail:
        Map<String, dynamic> args = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => ListingDetail(
            listing: args["selected"],
          ),
        );
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
