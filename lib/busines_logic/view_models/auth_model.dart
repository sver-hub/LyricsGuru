import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/user.dart';
import 'package:lyrics_guru/services/auth/auth_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/services/spotify/spotify_service.dart';

class AuthModel extends ChangeNotifier {
  AuthService _authService = serviceLocator<AuthService>();
  SpotifyService _spotifyService = serviceLocator<SpotifyService>();

  User _user;

  User get user => _user;

  void loadData() async {
    _user = await _authService.getUser();
    if (_user.token != null) {
      _spotifyService.authenticateWithToken(_user.token);
    }
    notifyListeners();
  }

  void authenticate() async {
    bool success = await _spotifyService.authenticate();
    print(success);
    if (success) {
      user.token = _spotifyService.getToken();
      await _authService.saveUser(_user);
    }
    notifyListeners();
  }
}
