import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/services/spotify/spotify_service.dart';
import 'package:spotify/spotify.dart' as Spotify;

class SpotifyServiceImplementation extends SpotifyService {
  Spotify.Spotify spotify = Spotify.Spotify(
      clientId: '6835c2dadf634991b30d7052e3b43a4a',
      redirectUrl: 'lyrics-guru://callback',
      scopes: ['user-library-read']);

  @override
  Future<bool> authenticate() async {
    return await spotify.authenticate();
  }

  @override
  Stream<Spotify.Track> getStreamOfSavedTracks() {
    return spotify.api.me.tracks.all();
  }

  Track convertToTrack(Spotify.Track spotifyTrack) {
    final artist = _convertArtist(spotifyTrack.artists[0]);
    final album = _convertAlbum(spotifyTrack.album, artist);
    final track = _convertTrack(spotifyTrack, album);
    return track;
  }

  Album _convertAlbum(Spotify.Album spotifyAlbum, Artist artist) {
    final albumId = spotifyAlbum.id;
    final albumTitle = spotifyAlbum.name;
    final albumCoverUrl = spotifyAlbum.images[0].url;
    final releaseDate = spotifyAlbum.releaseDate;
    return Album(
      id: albumId,
      title: albumTitle,
      coverUrl: albumCoverUrl,
      artist: artist,
      releaseDate: releaseDate,
    );
  }

  Artist _convertArtist(Spotify.Artist spotifyArtist) {
    final artistId = spotifyArtist.id;
    final artistName = spotifyArtist.name;
    final artistThumbnailUrl = spotifyArtist.images[0].url;
    return Artist(
      id: artistId,
      name: artistName,
      thumbnailUrl: artistThumbnailUrl,
    );
  }

  Track _convertTrack(Spotify.Track spotifyTrack, Album album) {
    final trackId = spotifyTrack.id;
    final trackTitle = spotifyTrack.name;
    final trackNumber = spotifyTrack.trackNumber + 20 * spotifyTrack.discNumber;
    return Track(
      id: trackId,
      title: trackTitle,
      album: album,
      trackNumber: trackNumber,
    );
  }

  @override
  String getToken() {
    return spotify.token;
  }

  @override
  void authenticateWithToken(String token) {
    spotify.token = token;
  }
}
