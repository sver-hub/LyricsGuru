import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';

abstract class LibraryService {
  Future<List<Artist>> getAllArtists();

  Future<Artist> getArtistById(String artistId);

  Future<List<Album>> getAlbumsByArtistId(String artistId);

  Future<Album> getAlbumById(String albumId);

  Future<List<Track>> getTracksByAlbumId(String albumId);

  Future<Track> getTrackById(String trackId);

  Future<Track> getCompletedTrackById(String trackId);

  Future<bool> saveCompleteByTrack(Track track);

  Future<bool> saveTrack(Track track);

  Future<bool> saveArtist(Artist artist);

  Future<bool> saveAlbum(Album album);
}
