import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';

abstract class LibraryService {
  Future<List<Artist>> getAllArtists();

  Future<List<Album>> getAlbumsByArtistId(String artistId);

  Future<List<Track>> getTracksByAlbumId(String albumId);

  Future<Track> getTrackById(String trackId);

  Future<bool> saveCompleteByTrack(Track track);

  Future<bool> saveTrack(Track track);
}
