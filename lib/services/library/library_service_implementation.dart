import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/db/repository/album_repository.dart';
import 'package:lyrics_guru/db/repository/artist_repository.dart';
import 'package:lyrics_guru/db/repository/repository_locator.dart';
import 'package:lyrics_guru/db/repository/track_repository.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/services/spotify/spotify_service.dart';

class LibraryServiceImplementation extends LibraryService {
  final _artistRepository = repositoryLocator<ArtistRepository>();
  final _albumRepository = repositoryLocator<AlbumRepository>();
  final _trackRepository = repositoryLocator<TrackRepository>();
  final _spotifyService = serviceLocator<SpotifyService>();

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

  @override
  Future<Album> getAlbumById(String albumId) async {
    return await _albumRepository.getById(albumId);
  }

  @override
  Future<Artist> getArtistById(String artistId) async {
    return await _artistRepository.getById(artistId);
  }

  @override
  Future<Track> getCompletedTrackById(String trackId) async {
    final track = await getTrackById(trackId);
    final album = await getAlbumById(track.albumId);
    final artist = await getArtistById(album.artistId);
    album.artist = artist;
    track.album = album;
    return track;
  }

  @override
  Future<bool> saveAlbum(Album album) async {
    return await _albumRepository.save(album);
  }

  @override
  Future<bool> saveArtist(Artist artist) async {
    return await _artistRepository.save(artist);
  }

  @override
  Future<void> fetchLibrary() async {
    final stream = _spotifyService.getStreamOfSavedTracks();
    print('getting stream: ' + stream.toString());
    final artists = List<Artist>();
    final albums = List<Album>();
    final tracks = List<Track>();

    await for (var spotifyTrack in stream) {
      print('spotifyTrack ' + spotifyTrack.name);
      final track = _spotifyService.convertToTrack(spotifyTrack);
      if (!artists.contains(track.album.artist))
        artists.add(track.album.artist);
      if (!albums.contains(track.album)) albums.add(track.album);
      tracks.add(track);
    }
    for (final artist in artists) {
      await saveArtist(artist);
    }
    for (final album in albums) {
      await saveAlbum(album);
    }
    for (final track in tracks) {
      await saveTrack(track);
    }
  }
}
