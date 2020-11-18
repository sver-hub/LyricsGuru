import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/services/word/word_service.dart';

class AlbumsScreenViewModel extends ChangeNotifier {
  final _libraryService = serviceLocator<LibraryService>();
  final _wordService = serviceLocator<WordService>();

  List<Album> _albums = [];
  List<Album> get albums => _albums;

  Artist _artist;
  Artist get artist => _artist;

  bool _sortAsc = true;
  set sortAsc(bool val) => {if (val != _sortAsc) _albums = _albums.reversed};

  void loadData(Artist artist) async {
    _artist = artist;
    _albums = await _libraryService.getAlbumsByArtistId(_artist.id);
    _albums.forEach((album) {
      album.artist = _artist;
    });
    _albums.sort((a, b) => _sortAsc
        ? a.releaseDate.compareTo(b.releaseDate)
        : b.releaseDate.compareTo(a.releaseDate));
    notifyListeners();
  }

  void analyze() {
    _wordService.analyseByArtistId(_artist.id);
  }
}
