import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc_by_package_creator/core/constant/app_constant.dart';
import 'package:provider_arc_by_package_creator/provider_setup.dart';
import 'package:provider_arc_by_package_creator/ui/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Inject provider to app
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Provider Arc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutePaths.Login,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
