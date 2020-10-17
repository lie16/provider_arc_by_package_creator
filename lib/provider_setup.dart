import 'package:provider/provider.dart';

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
List<SingleChildCloneableWidget> independentServices = [];

// 3. dependentServices: These are classes/object that depend on previously
// registered services
List<SingleChildCloneableWidget> dependentServices = [];

// 4. uiConsumableProviders: These are values that you want to consume
// directly in the UI. You can add values here if you would have to
// introduce a property on most, if not all your models just to get the
// data out. In our case the user information. If we don't provide it
// here then all the models will have a user property on it. You could
// also just add it to the BaseModel, but I digress.
List<SingleChildCloneableWidget> uiConsumableProviders = [];
