import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:spotify/spotify.dart' as Spotify;

abstract class SpotifyService {
  Future<bool> authenticate();

  Stream<Spotify.Track> getStreamOfSavedTracks();

  Track convertToTrack(Spotify.Track track);

  String getToken();

  void authenticateWithToken(String token);
}
