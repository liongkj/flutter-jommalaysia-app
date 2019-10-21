import 'package:flutter/material.dart';
import 'package:jommalaysia/core/providers/listings_provider.dart';
import 'package:jommalaysia/core/services/listing_service.dart';
import './core/providers/categories_provider.dart';

import 'package:jommalaysia/core/services/category_service.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

//These are classes/objects that do not depend on any other services to execute their logic
List<SingleChildCloneableWidget> independentServices = [
  Provider.value(
    value: CategoryService(),
  ),
  Provider.value(
    value: ListingService(),
  )
];

//These are classes/object that depend on previously registered services
List<SingleChildCloneableWidget> dependentServices = [
  ChangeNotifierProvider<CategoriesProvider>(
    builder: (context) => CategoriesProvider(
      categoryService: CategoryService(),
    ),
  ),
  ChangeNotifierProvider<ListingsProvider>(
    builder: (context) => ListingsProvider(
      listingService: ListingService(),
    ),
  ),
];

//These are values that you want to consume directly in the UI. You can add values here if you would have to introduce a property on most, if not all your models just to get the data out. In our case the user information. If we don't provide it here then all the models will have a user property on it. You could also just add it to the BaseModel, but I digress.
List<SingleChildCloneableWidget> uiConsumableProviders = [];
