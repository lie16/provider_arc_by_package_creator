import 'package:flutter/material.dart';
import 'package:provider_arc_by_package_creator/core/constant/app_constant.dart';
import 'package:provider_arc_by_package_creator/ui/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutePaths.Login,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
