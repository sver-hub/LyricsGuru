import 'package:spotify/models/track.dart';

abstract class SpotifyService {
  Future<bool> authenticate();

  Future<List<SpotifyTrack>> getLibrary();

  String getToken();
}
