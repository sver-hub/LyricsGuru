import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';

class FoundWordsScreenViewModel extends ChangeNotifier {
  List<Word> _words = [];
  List<Word> get words => _words;

  void loadData(List<Word> words) {
    _words = words..sort((a, b) => a.word.compareTo(b.word));
    notifyListeners();
  }

  void toggleLearnt(int index, bool val) {
    _words[index].learnt = !val;
    print(_words[index].learnt);
    notifyListeners();
  }
}
