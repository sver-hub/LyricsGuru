import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/user.dart';
import 'package:lyrics_guru/db/repository/repository_locator.dart';
import 'package:lyrics_guru/db/repository/user_repository.dart';
import 'package:lyrics_guru/services/auth/auth_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/services/spotify/spotify_service.dart';

class AuthModel extends ChangeNotifier {
  final _authService = serviceLocator<AuthService>();
  final _spotifyService = serviceLocator<SpotifyService>();
  final _userRepository = repositoryLocator<UserRepository>();

  User _user;

  User get user => _user;

  void loadData() async {
    _user = await _authService.getUser();
    if (_user.refreshToken != null) {
      _spotifyService.authenticateWithToken(_user.refreshToken);
    }
    notifyListeners();
  }

  void authenticate() async {
    final token = await _spotifyService.authenticate();
    print(token);
    if (token != null) {
      final spotifyUser = await _spotifyService.getUserData();
      final user = User(
        name: spotifyUser.displayName,
        imageUrl: spotifyUser.images[0].url,
        refreshToken: token,
      );

      final isSaved = await _userRepository.save(user);
      if (!isSaved) throw Exception('auth');
      _user = user;
    }
    notifyListeners();
  }
}
