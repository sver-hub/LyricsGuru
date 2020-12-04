import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';

class WordListScreenViewModel extends ChangeNotifier {
  List<Word> _words = [];
  List<Word> get words => _words;

  void loadData(List<Word> words) {
    _words = words;
    notifyListeners();
  }
}
