import 'package:provider/provider.dart';
import 'package:provider_arc_by_package_creator/core/services/api.dart';
import 'package:provider_arc_by_package_creator/core/services/authentication_services.dart';

// You can only inject a service that has already been supplied as a Provider
// The order of registration matters!

// 1. providers: All the providers for the entire app (line 26 of this file)
List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

// 2. independentServices: These are classes/objects that do not depend on
// any other services to execute their logic
List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: Api())
];

// 3. dependentServices: These are classes/object that depend on previously
// registered services
List<SingleChildCloneableWidget> dependentServices = [
  //ProxyProvider allow to your to specify what type of Provider your new one 
  // depends on and provides it to you through the builder function
  // at this case We'll ask for the Api, and return type will be an AuthenticationService
  // format : ProxyProvider(depentOn, returnType)
  ProxyProvider<Api, AuthenticationService>(
    builder: (context, api, authenticationService) =>
        AuthenticationService(api: api),
  )
];

// 4. uiConsumableProviders: These are values that you want to consume
// directly in the UI. You can add values here if you would have to
// introduce a property on most, if not all your models just to get the
// data out. In our case the user information. If we don't provide it
// here then all the models will have a user property on it. You could
// also just add it to the BaseModel, but I digress.
List<SingleChildCloneableWidget> uiConsumableProviders = [];