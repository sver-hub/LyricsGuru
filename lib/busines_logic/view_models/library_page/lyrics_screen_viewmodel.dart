import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/services/service_locator.dart';
import 'package:lyrics_guru/services/word/word_service.dart';
import 'package:lyrics_guru/ui/views/LibraryPage/found_words_screen.dart';

class LyricsScreenViewModel extends ChangeNotifier {
  final _wordService = serviceLocator<WordService>();
  Track _track;
  Track get track => _track;

  bool get analyzeEnabled => _track.lyrics != null;

  void loadData(Track track) {
    _track = track;
    notifyListeners();
  }

  void analyze(BuildContext context) async {
    final words = await _wordService.analyseLyrics(_track.lyrics, _track.id);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => FoundWordsScreen(
        words: words,
      ),
    ));
  }
}
