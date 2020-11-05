import 'dart:async';

import 'package:provider_arc_by_package_creator/core/models/user.dart';
import 'package:provider_arc_by_package_creator/core/services/api.dart';

class AuthenticationService {
  final Api _api;

  AuthenticationService({Api api}) : _api = api;

  StreamController<User> _userController = StreamController<User>();

  Stream<User> get user => _userController.stream;

  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);
    print('fetchedUser = ' + fetchedUser.toString());
    print('fetchedUser = ' + fetchedUser.id.toString());
    print('fetchedUser = ' + fetchedUser.name);
    print('fetchedUser = ' + fetchedUser.username);
    var hasUser = fetchedUser != null;
    if (hasUser) {
      _userController.add(fetchedUser);
    }
    print('hasUser = ' + hasUser.toString());
    return hasUser;
  }
}
