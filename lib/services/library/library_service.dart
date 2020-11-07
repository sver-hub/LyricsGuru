import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';

abstract class LibraryService {
  Future<List<Artist>> getAllArtists();

  Future<List<Album>> getAlbumsOfArtist(String artistName);

  Future<List<Track>> getTracksOfAlbum(String albumTitle);

  Future<String> getLyricsOfTrack(String trackTitle);
}
