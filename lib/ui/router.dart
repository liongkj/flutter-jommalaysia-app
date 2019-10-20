import 'package:flutter/material.dart';
import 'package:jommalaysia/ui/screens/home/category_grid.dart';
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
