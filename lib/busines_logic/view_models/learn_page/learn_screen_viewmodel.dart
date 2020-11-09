import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';
import 'package:lyrics_guru/services/learn/learn_service.dart';
import 'package:lyrics_guru/services/service_locator.dart';

class LearnScreenViewModel extends ChangeNotifier {
  final LearnService _learnService = serviceLocator<LearnService>();

  Map<Word, String> _carousel = {};
  Map<Word, String> get carousel => _carousel;

  Map<Artist, int> _artistSpecific = {};
  Map<Artist, int> get artistSpecific => _artistSpecific;

  List<String> _chosenWords = [];
  List<String> get chosenWords => _chosenWords;

  void loadData() async {
    List<Word> carouselWords = await _learnService.getRandomWords(5);
    _carousel = prepareCarouselData(carouselWords);
    _artistSpecific = await _learnService.getArtistsForPreview(3);
    _chosenWords = (await _learnService.getSomeChosenWords(14))
        .map((w) => w.word)
        .toList();
    notifyListeners();
  }

  Map<Word, String> prepareCarouselData(List<Word> words) {
    final rng = Random();
    Map<Word, String> carouselData = Map();
    words.forEach((word) {
      final imgUrl = word.occurances[rng.nextInt(word.occurances.length)].album
          .artist.thumbnailUrl;
      carouselData[word] = imgUrl;
    });
    return carouselData;
  }
}
