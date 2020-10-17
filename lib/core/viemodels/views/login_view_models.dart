import 'package:flutter/foundation.dart';
import 'package:provider_arc_by_package_creator/core/services/authentication_services.dart';

class LoginViewModel extends ChangeNotifier {
  AuthenticationService _authenticationService;

  LoginViewModel({@required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  Future<bool> login(String userIdText) async {
    setBusy(true);
    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);
    setBusy(false);
    return success;
  }

  // bellow code moved to base_model.dart
  // bool _busy = false;
  // bool get busy => _busy;

  // void setBusy(bool value) {
  //   _busy = value;
  //   notifyListeners();
  // }
}
