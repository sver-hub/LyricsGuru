import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';
import 'package:lyrics_guru/services/learn/learn_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';

class WordListScreenViewModel extends ChangeNotifier {
  LearnService _learnService = serviceLocator<LearnService>();

  List<Word> _words = [];
  List<Word> get words => _words;

  void loadDataOfArtist(String artistName) async {
    _words = await _learnService.getWordsOfArtist(artistName);
    notifyListeners();
  }

  void loadDataOfChosen() async {
    _words = await _learnService.getChosenWords();
    notifyListeners();
  }
}
