import 'package:lyrics_guru/services/spotify/spotify_service.dart';
import 'package:spotify/models/track.dart';
import 'package:spotify/spotify.dart';

class SpotifyServiceImplementation extends SpotifyService {
  Spotify spotify = Spotify(
      clientId: '6835c2dadf634991b30d7052e3b43a4a',
      redirectUrl: 'lyrics-guru://callback',
      scopes: ['user-library-read']);

  @override
  Future<bool> authenticate() async {
    return await spotify.authenticate();
  }

  @override
  Future<List<SpotifyTrack>> getLibrary() {
    // TODO: implement getLibrary
    throw UnimplementedError();
  }

  @override
  String getToken() {
    return spotify.token;
  }
}
