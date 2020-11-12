import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/user.dart';
import 'package:lyrics_guru/services/auth/auth_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';

class AuthPageViewModel extends ChangeNotifier {
  AuthService _authService = serviceLocator<AuthService>();

  User _user;

  User get user => _user;

  void loadData() async {
    _user = await _authService.getUser();
    notifyListeners();
  }

  void setToken(String token) async {
    print('token: ' + token);
    _user.token = token;
    await _authService.saveUser(_user);
    notifyListeners();
  }
}
