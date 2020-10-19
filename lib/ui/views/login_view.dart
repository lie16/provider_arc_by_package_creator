import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc_by_package_creator/core/constant/app_constant.dart';
import 'package:provider_arc_by_package_creator/core/viemodels/views/login_view_models.dart';
import 'package:provider_arc_by_package_creator/ui/views/base_widget.dart';
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
    // return ChangeNotifierProvider<LoginViewModel>.value(
    // value: LoginViewModel(
    // child: Consumer<LoginViewModel>(
    // bellow replacing commented code above
    return BaseWidget<LoginViewModel>(
      // Inject authentication service setup in the provider_setup
      // authenticationService: Provider.of(context)),
      model: LoginViewModel(authenticationService: Provider.of(context)),
      // pass the LogineHeader as a prebuilt-static child/dalam child = tidak rebuild
      child: LoginHeader(controller: _controller),
      builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              child,
              model.busy
                  ? CircularProgressIndicator()
                  : FlatButton(
                      color: Colors.white,
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        var loginSuccess = await model.login(_controller.text);
                        if (loginSuccess) {
                          Navigator.pushNamed(context, RoutePaths.Home);
                        }
                      },
                    )
            ],
          )),
    );
  }
}