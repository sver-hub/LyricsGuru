import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/db/repository/album_repository.dart';
import 'package:lyrics_guru/db/repository/artist_repository.dart';
import 'package:lyrics_guru/db/repository/repository_locator.dart';
import 'package:lyrics_guru/db/repository/track_repository.dart';
import 'package:lyrics_guru/services/library/library_service.dart';

class LibraryServiceImplementation extends LibraryService {
  ArtistRepository _artistRepository = repositoryLocator<ArtistRepository>();
  AlbumRepository _albumRepository = repositoryLocator<AlbumRepository>();
  TrackRepository _trackRepository = repositoryLocator<TrackRepository>();

  @override
  Future<List<Album>> getAlbumsByArtistId(String artistId) async {
    List<Album> albums = await _albumRepository.getAllByArtistId(artistId);
    return albums;
  }

  @override
  Future<List<Artist>> getAllArtists() async {
    int numOfArtists = await _artistRepository.getCount();
    if (numOfArtists == 0) {
      _fetchLibrary();
    }
    List<Artist> fromdb = await _artistRepository.getAll();
    return fromdb;
  }

  @override
  Future<List<Track>> getTracksByAlbumId(String albumId) async {
    List<Track> tracks = await _trackRepository.getAllByAlbumId(albumId);
    return tracks;
  }

  Future<bool> _fetchLibrary() async {}
}
