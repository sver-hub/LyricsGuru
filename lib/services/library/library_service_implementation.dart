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
    List<Artist> fromdb = await _artistRepository.getAll();
    return fromdb;
  }

  @override
  Future<List<Track>> getTracksByAlbumId(String albumId) async {
    List<Track> tracks = await _trackRepository.getAllByAlbumId(albumId);
    return tracks;
  }

  @override
  Future<bool> saveCompleteByTrack(Track track) async {
    bool result = await _artistRepository.save(track.album.artist);
    if (!result) return result;
    result = await _albumRepository.save(track.album);
    if (!result) return result;
    return await _trackRepository.save(track);
  }

  @override
  Future<bool> saveTrack(Track track) async {
    return await _trackRepository.save(track);
  }

  @override
  Future<Track> getTrackById(String trackId) async {
    return await _trackRepository.getById(trackId);
  }
}
