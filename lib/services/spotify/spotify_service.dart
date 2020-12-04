import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:spotify/spotify.dart' as Spotify;

abstract class SpotifyService {
  Future<String> authenticate();

  Stream<Spotify.Track> getStreamOfSavedTracks();

  Future<Spotify.User> getUserData();

  Track convertToTrack(Spotify.Track track);

  void authenticateWithToken(String token);
}
