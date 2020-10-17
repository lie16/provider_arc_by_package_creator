import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc_by_package_creator/core/viemodels/login_view_models.dart';
import 'package:provider_arc_by_package_creator/ui/shared/app_colors.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>.value(
      value: LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => Scaffold(
            backgroundColor: backgroundColor,
            body: Center(child: Text('Login View'))),
      ),
    );
  }
}
