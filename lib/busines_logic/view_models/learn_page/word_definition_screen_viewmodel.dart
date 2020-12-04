import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';
import 'package:lyrics_guru/services/learn/learn_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';

class WordDefinitionScreenViewModel extends ChangeNotifier {
  LearnService _learnService = serviceLocator<LearnService>();

  Word _word = Word();
  Word get word => _word;

  void loadData(Word word) {
    _word = word;
    notifyListeners();
  }

  void toggleLearnt(bool newValue) {
    _word.learnt = newValue;
    notifyListeners();
  }

  void saveModel() {}
}
