import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_arc_by_package_creator/provider_setup.dart';
import 'package:provider_arc_by_package_creator/ui/router.dart';

import 'package:provider_arc_by_package_creator/core/constant/app_constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Inject provider to app
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Provider Architecture',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutePaths.Login,
        onGenerateRoute: Routers.generateRoute,
      ),
    );
  }
}
