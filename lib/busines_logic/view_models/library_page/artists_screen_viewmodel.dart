import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/view_models/status_model.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/lyrics/lyrics_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:sorted_list/sorted_list.dart';

class ArtistsScreenViewModel extends ChangeNotifier {
  final _libraryService = serviceLocator<LibraryService>();
  final _lyricsService = serviceLocator<LyricsService>();

  final _artists = SortedList<Artist>(
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  List<Artist> get artists => _artists;

  StatusModel status;

  void loadData() async {
    _artists.addAll(await _libraryService.getAllArtists());
    notifyListeners();
  }

  void setStatus(StatusModel status) {
    this.status = status;
    this.status.libraryReady = true;
    this.status.fetchingLibrary = false;
    loadData();
  }

  void fetchData() async {
    status.libraryReady = false;
    status.fetchingLibrary = true;
    await _libraryService.fetchLibrary();
    status.libraryReady = true;
    status.fetchingLibrary = false;
    notifyListeners();
  }

  void fetchLyrics() async {
    for (final artist in _artists) {
      await _lyricsService.fetchAndSaveLyricsOfArtist(artist);
    }
  }
}
