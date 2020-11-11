import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';

class TracksScreenViewModel extends ChangeNotifier {
  LibraryService _libraryService = serviceLocator<LibraryService>();

  List<Track> _tracks = [];
  List<Track> get tracks => _tracks;

  Album _album;
  Album get album => _album;

  void loadData(Album album) async {
    _album = album;
    _tracks = await _libraryService.getTracksByAlbumId(_album.id);
    _tracks.forEach((track) {
      track.album = _album;
    });
    notifyListeners();
  }
}
