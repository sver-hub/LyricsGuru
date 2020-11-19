import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/lyrics/lyrics_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/services/word/word_service.dart';
import 'package:lyrics_guru/ui/views/LibraryPage/found_words_screen.dart';

class AlbumsScreenViewModel extends ChangeNotifier {
  final _libraryService = serviceLocator<LibraryService>();
  final _wordService = serviceLocator<WordService>();
  final _lyricsService = serviceLocator<LyricsService>();

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
    _loadLyrics();
  }

  void _loadLyrics() async {
    for (final album in _albums) {
      _lyricsService.fetchAndSaveLyricsOfAlbum(album);
    }
  }

  void analyze(BuildContext context) async {
    final words = await _wordService.analyseByArtistId(_artist.id);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => FoundWordsScreen(
        words: words,
      ),
    ));
  }
}
