import 'package:jommalaysia/core/services/listing_service.dart';
import 'package:jommalaysia/core/viewmodels/listings_viewmodel.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

//These are classes/objects that do not depend on any other services to execute their logic
List<SingleChildCloneableWidget> independentServices = [
  Provider.value(
    value: ListingService(),
  )
];

//These are classes/object that depend on previously registered services
List<SingleChildCloneableWidget> dependentServices = [
  // ProxyProvider<ListingService, ListingsViewModel>(
  //     builder: (context, listingService, listingViewModel) =>
  //         ListingsViewModel(listingService: listingService))
];

//These are values that you want to consume directly in the UI. You can add values here if you would have to introduce a property on most, if not all your models just to get the data out. In our case the user information. If we don't provide it here then all the models will have a user property on it. You could also just add it to the BaseModel, but I digress.
List<SingleChildCloneableWidget> uiConsumableProviders = [];
