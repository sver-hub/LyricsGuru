import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/services/library/library_service.dart';
import 'package:lyrics_guru/services/lyrics/lyrics_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/services/word/word_service.dart';
import 'package:lyrics_guru/ui/views/LibraryPage/found_words_screen.dart';

class TracksScreenViewModel extends ChangeNotifier {
  final _libraryService = serviceLocator<LibraryService>();
  final _lyricsService = serviceLocator<LyricsService>();
  final _wordService = serviceLocator<WordService>();

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
    _tracks.sort((a, b) => a.trackNumber.compareTo(b.trackNumber));
    notifyListeners();
    //_loadLyrics();
  }

  void _loadLyrics() async {
    for (final track in _tracks) {
      if (track.lyrics == null) {
        final lyrics = await _lyricsService.getLyricsOfTrack(track);
        track.lyrics = lyrics;
        final isSaved = await _libraryService.saveTrack(track);
        print(track.title + ' ' + isSaved.toString());
      }
    }
  }

  void analyze(BuildContext context) async {
    final words = await _wordService.analyseByAlbumId(_album.id);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => FoundWordsScreen(
        words: words,
      ),
    ));
  }
}
