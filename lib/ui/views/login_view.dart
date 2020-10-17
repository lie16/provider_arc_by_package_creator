import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc_by_package_creator/core/constant/app_constant.dart';
import 'package:provider_arc_by_package_creator/core/viemodels/login_view_models.dart';
import 'package:provider_arc_by_package_creator/ui/shared/app_colors.dart';
import 'package:provider_arc_by_package_creator/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>.value(
      value: LoginViewModel(
          // Inject authentication service setup in the provider_setup
          authenticationService: Provider.of(context)),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => Scaffold(
            backgroundColor: backgroundColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LoginHeader(controller: _controller),
                model.busy
                    ? CircularProgressIndicator()
                    : FlatButton(
                        color: Colors.white,
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async {
                          var loginSuccess =
                              await model.login(_controller.text);
                          if (loginSuccess) {
                            Navigator.pushNamed(context, RoutePaths.Home);
                          }
                        },
                      )
              ],
            )),
      ),
    );
  }
}
