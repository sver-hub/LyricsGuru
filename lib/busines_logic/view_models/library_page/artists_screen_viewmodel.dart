import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/lyrics/lyrics_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/services/spotify/spotify_service.dart';
import 'package:sorted_list/sorted_list.dart';

class ArtistsScreenViewModel extends ChangeNotifier {
  final _libraryService = serviceLocator<LibraryService>();
  final _spotifyService = serviceLocator<SpotifyService>();
  final _lyricsService = serviceLocator<LyricsService>();

  final _artists = SortedList<Artist>(
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  List<Artist> get artists => _artists;

  void loadData() async {
    _artists.addAll(await _libraryService.getAllArtists());
    if (_artists.length == 0) fetchData();
    notifyListeners();
  }

  void fetchData() async {
    final stream = _spotifyService.getStreamOfSavedTracks();
    print('getting stream: ' + stream.toString());
    final albums = List<Album>();
    final tracks = List<Track>();

    await for (var spotifyTrack in stream) {
      print('spotifyTrack ' + spotifyTrack.name);
      final track = _spotifyService.convertToTrack(spotifyTrack);
      if (!_artists.contains(track.album.artist))
        _artists.add(track.album.artist);
      if (!albums.contains(track.album)) albums.add(track.album);
      tracks.add(track);
      notifyListeners();
    }
    for (final artist in _artists) {
      await _libraryService.saveArtist(artist);
    }
    for (final album in albums) {
      await _libraryService.saveAlbum(album);
    }
    for (final track in tracks) {
      await _libraryService.saveTrack(track);
    }
  }

  void fetchLyrics() async {
    for (final artist in _artists) {
      await _lyricsService.fetchAndSaveLyricsOfArtist(artist);
    }
  }
}
