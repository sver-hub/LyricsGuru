import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/services/spotify/spotify_service.dart';
import 'package:sorted_list/sorted_list.dart';

class ArtistsScreenViewModel extends ChangeNotifier {
  final LibraryService _libraryService = serviceLocator<LibraryService>();
  final SpotifyService _spotifyService = serviceLocator<SpotifyService>();

  List<Artist> _artists = SortedList<Artist>(
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  List<Artist> get artists => _artists;

  void loadData() async {
    _artists.addAll(await _libraryService.getAllArtists());
    if (_artists.length == 0) fetchData();
    notifyListeners();
  }

  void fetchData() async {
    var stream = _spotifyService.getStreamOfSavedTracks();
    print('getting stream: ' + stream.toString());
    await for (var spotifyTrack in stream) {
      print('spotifyTrack' + spotifyTrack.toString());
      Track track = _spotifyService.convertToTrack(spotifyTrack);
      await _libraryService.saveCompleteByTrack(track);
      if (!_artists.contains(track.album.artist))
        _artists.add(track.album.artist);
      notifyListeners();
    }
  }
}
